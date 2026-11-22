`timescale 1ns/1ps

module tb_multiplier32b;

//====================================DECLARATION==============================================================//

  logic        [31:0] a;
  logic        [31:0] b;
  wire         [63:0] p;

  logic signed [31:0] sa;
  logic signed [31:0] sb;
  logic signed [63:0] ea;
  logic signed [63:0] eb;
  logic signed [63:0] expected;

  // Danh sách test: tạo trước, chạy sau trong một vòng lặp duy nhất
  logic [31:0] qa [$];
  logic [31:0] qb [$];
  integer      sec_end  [$];   // chỉ số kết thúc của từng nhóm test
  string       sec_name [$];

  integer n;
  integer s;
  integer total;
  integer errors;
  integer sec_errors;
  integer sec_start;
  integer n_random;
  integer seed;

  // Hằng số biên
  localparam logic [31:0] MIN_NEG = 32'h8000_0000;
  localparam logic [31:0] MAX_POS = 32'h7FFF_FFFF;

//============================================================================================================//

//==========================================MODULE============================================================//

  multiplier32b dut (.i_a(a), .i_b(b), .o_product(p));

//============================================================================================================//

//====================================TASKS===================================================================//

  // Thêm một cặp (x, y) vào danh sách test
  task push(input logic [31:0] x, input logic [31:0] y);
    begin
      qa.push_back(x);
      qb.push_back(y);
    end
  endtask

  // Thêm cả hai thứ tự để kiểm tra tính giao hoán
  task push_both(input logic [31:0] x, input logic [31:0] y);
    begin
      push(x, y);
      push(y, x);
    end
  endtask

  // Đánh dấu hết một nhóm test
  task mark(input string name);
    begin
      sec_end.push_back(qa.size());
      sec_name.push_back(name);
    end
  endtask

  // Số ngẫu nhiên có độ dày bit khác nhau: 0 = bất kỳ, 1 = thưa, 2 = dày
  function automatic logic [31:0] rnd(input integer kind);
    logic [31:0] r;
    begin
      r = $urandom;
      case (kind)
        1:       rnd = r & $urandom & $urandom;
        2:       rnd = r | $urandom | $urandom;
        default: rnd = r;
      endcase
    end
  endfunction

//============================================================================================================//

//====================================TEST SEQUENCE===========================================================//

  integer i, j, k, len, start;
  logic [31:0] t;
  logic [31:0] edge_val [0:15];

  initial begin
    total    = 0;
    errors   = 0;
    seed     = 1;
    n_random = 200000;
    if ($value$plusargs("N=%d", n_random)) ;
    if ($value$plusargs("SEED=%d", seed))  ;
    t = $urandom(seed);

    // Danh sách giá trị biên
    edge_val[ 0] = 32'h0000_0000;
    edge_val[ 1] = 32'h0000_0001;
    edge_val[ 2] = 32'hFFFF_FFFF;   // -1
    edge_val[ 3] = 32'h0000_0002;
    edge_val[ 4] = 32'hFFFF_FFFE;   // -2
    edge_val[ 5] = MAX_POS;
    edge_val[ 6] = MIN_NEG;
    edge_val[ 7] = 32'h8000_0001;
    edge_val[ 8] = 32'h4000_0000;
    edge_val[ 9] = 32'hC000_0000;
    edge_val[10] = 32'h5555_5555;
    edge_val[11] = 32'hAAAA_AAAA;
    edge_val[12] = 32'h0000_FFFF;
    edge_val[13] = 32'hFFFF_0000;
    edge_val[14] = 32'h7FFF_FFFE;
    edge_val[15] = 32'h8000_0002;

    // ---- 1. Mọi cặp giá trị biên
    for (i = 0; i < 16; i = i + 1)
      for (j = 0; j < 16; j = j + 1)
        push(edge_val[i], edge_val[j]);
    mark("1. edge x edge");

    // ---- 2. Các giá trị nhỏ, vét cạn trong [-40, 40]
    for (i = -40; i <= 40; i = i + 1)
      for (j = -40; j <= 40; j = j + 1)
        push(i, j);
    mark("2. small [-40,40] x [-40,40]");

    // ---- 3. Một bit duy nhất (lũy thừa của 2) và bù của nó, mọi cặp vị trí
    for (i = 0; i < 32; i = i + 1)
      for (j = 0; j < 32; j = j + 1) begin
        push(32'd1 << i,    32'd1 << j);
        push(~(32'd1 << i), 32'd1 << j);
        push(32'd1 << i,    ~(32'd1 << j));
        push(~(32'd1 << i), ~(32'd1 << j));
      end
    mark("3. single-bit / inverted");

    // ---- 4. Dãy bit 1 liên tiếp (mọi độ dài, mọi vị trí) trong b
    for (len = 1; len <= 32; len = len + 1)
      for (start = 0; start + len <= 32; start = start + 1) begin
        t = (len == 32) ? 32'hFFFF_FFFF : (((32'd1 << len) - 32'd1) << start);
        for (k = 0; k < 16; k = k + 1) begin
          push(edge_val[k], t);
          push(edge_val[k], ~t);
        end
        push(rnd(0), t);
        push(rnd(0), ~t);
      end
    mark("4. runs of ones in b");

    // ---- 5. Phủ mọi tổ hợp 3 bit {b[2k+1], b[2k], b[2k-1]} của bộ mã hóa Booth ở từng chữ số k
    //         (với k = 0 thì b[-1] luôn bằng 0 nên chỉ có 4 tổ hợp hợp lệ: j[0] = 0)
    for (k = 0; k < 16; k = k + 1)
      for (j = 0; j < 8; j = j + 1)
        for (i = 0; i < 40; i = i + 1) begin
          t = rnd(0);
          t[2*k+1] = j[2];
          t[2*k]   = j[1];
          if (k > 0) t[2*k-1] = j[0];
          push((i < 16) ? edge_val[i] : rnd(0), t);
        end
    mark("5. Booth digit coverage");

    // ---- 6. Bốn góc phần tư dấu, ngẫu nhiên: (+,+) (+,-) (-,+) (-,-)
    for (i = 0; i < 4000; i = i + 1) begin
      push({1'b0, rnd(0) & 32'h7FFF_FFFF}, {1'b0, rnd(0) & 32'h7FFF_FFFF});
      push({1'b0, rnd(0) & 32'h7FFF_FFFF}, {1'b1, rnd(0) | 32'h8000_0000});
      push({1'b1, rnd(0) | 32'h8000_0000}, {1'b0, rnd(0) & 32'h7FFF_FFFF});
      push({1'b1, rnd(0) | 32'h8000_0000}, {1'b1, rnd(0) | 32'h8000_0000});
    end
    mark("6. sign quadrants");

    // ---- 7. Ngẫu nhiên toàn dải, thưa và dày bit, cả hai thứ tự
    for (i = 0; i < n_random; i = i + 1) begin
      push_both(rnd(0), rnd(0));
      if (i % 4 == 0) push_both(rnd(1), rnd(1));
      if (i % 4 == 1) push_both(rnd(2), rnd(2));
      if (i % 4 == 2) push_both(rnd(1), rnd(2));
      if (i % 4 == 3) push_both(rnd(0), rnd(1));
    end
    mark("7. random");

    // ---- Chạy toàn bộ danh sách test
    s          = 0;
    sec_errors = 0;
    sec_start  = 0;
    for (n = 0; n < qa.size(); n = n + 1) begin
      a = qa[n];
      b = qb[n];
      #1;
      sa       = a;
      sb       = b;
      ea       = sa;
      eb       = sb;
      expected = ea * eb;
      if (p !== expected) begin
        errors     = errors + 1;
        sec_errors = sec_errors + 1;
        if (errors <= 20)
          $display("[FAIL] a=%h (%0d)  b=%h (%0d)  got=%h  expected=%h", a, sa, b, sb, p, expected);
      end
      if (n + 1 == sec_end[s]) begin
        $display("[INFO] %-32s cases=%0d errors=%0d", sec_name[s], n + 1 - sec_start, sec_errors);
        sec_errors = 0;
        sec_start  = n + 1;
        s = s + 1;
      end
    end
    total = qa.size();

    $display("--------------------------------------------------------------------");
    if (errors == 0) $display("[PASS] multiplier32b: %0d cases, 0 errors", total);
    else             $display("[FAIL] multiplier32b: %0d cases, %0d errors", total, errors);
    $display("--------------------------------------------------------------------");
    $finish;
  end

//============================================================================================================//
// [INFO] 1. edge x edge                   cases=256 errors=0
// [INFO] 2. small [-40,40] x [-40,40]     cases=6561 errors=0
// [INFO] 3. single-bit / inverted         cases=4096 errors=0
// [INFO] 4. runs of ones in b             cases=17952 errors=0
// [INFO] 5. Booth digit coverage          cases=5120 errors=0
// [INFO] 6. sign quadrants                cases=16000 errors=0
// [INFO] 7. random                        cases=800000 errors=0
// --------------------------------------------------------------------
// [PASS] multiplier32b: 849985 cases, 0 errors
// --------------------------------------------------------------------
endmodule