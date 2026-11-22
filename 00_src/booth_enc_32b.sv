module booth_enc_32b (
  input  wire [31:0] i_b,
  output wire [15:0] o_p1,
  output wire [15:0] o_n1,
  output wire [15:0] o_p2,
  output wire [15:0] o_n2,
  output wire [15:0] o_negc
);

//====================================DECLARATION==============================================================//

  wire [32:0] b_temp;

//============================================================================================================//

//====================================COMBINATIONAL LOGIC=====================================================//

  assign b_temp = {i_b, 1'b0}; // Thêm bit giả b[-1] = 0 ở vị trí thấp nhất

//============================================================================================================//

//==========================================MODULE============================================================//

  boothradix4 u_booth_00 (.i_b(b_temp[ 2: 0]), .o_p2(o_p2[ 0]), .o_n2(o_n2[ 0]), .o_n1(o_n1[ 0]), .o_p1(o_p1[ 0]), .o_negc(o_negc[ 0]));
  boothradix4 u_booth_01 (.i_b(b_temp[ 4: 2]), .o_p2(o_p2[ 1]), .o_n2(o_n2[ 1]), .o_n1(o_n1[ 1]), .o_p1(o_p1[ 1]), .o_negc(o_negc[ 1]));
  boothradix4 u_booth_02 (.i_b(b_temp[ 6: 4]), .o_p2(o_p2[ 2]), .o_n2(o_n2[ 2]), .o_n1(o_n1[ 2]), .o_p1(o_p1[ 2]), .o_negc(o_negc[ 2]));
  boothradix4 u_booth_03 (.i_b(b_temp[ 8: 6]), .o_p2(o_p2[ 3]), .o_n2(o_n2[ 3]), .o_n1(o_n1[ 3]), .o_p1(o_p1[ 3]), .o_negc(o_negc[ 3]));
  boothradix4 u_booth_04 (.i_b(b_temp[10: 8]), .o_p2(o_p2[ 4]), .o_n2(o_n2[ 4]), .o_n1(o_n1[ 4]), .o_p1(o_p1[ 4]), .o_negc(o_negc[ 4]));
  boothradix4 u_booth_05 (.i_b(b_temp[12:10]), .o_p2(o_p2[ 5]), .o_n2(o_n2[ 5]), .o_n1(o_n1[ 5]), .o_p1(o_p1[ 5]), .o_negc(o_negc[ 5]));
  boothradix4 u_booth_06 (.i_b(b_temp[14:12]), .o_p2(o_p2[ 6]), .o_n2(o_n2[ 6]), .o_n1(o_n1[ 6]), .o_p1(o_p1[ 6]), .o_negc(o_negc[ 6]));
  boothradix4 u_booth_07 (.i_b(b_temp[16:14]), .o_p2(o_p2[ 7]), .o_n2(o_n2[ 7]), .o_n1(o_n1[ 7]), .o_p1(o_p1[ 7]), .o_negc(o_negc[ 7]));
  boothradix4 u_booth_08 (.i_b(b_temp[18:16]), .o_p2(o_p2[ 8]), .o_n2(o_n2[ 8]), .o_n1(o_n1[ 8]), .o_p1(o_p1[ 8]), .o_negc(o_negc[ 8]));
  boothradix4 u_booth_09 (.i_b(b_temp[20:18]), .o_p2(o_p2[ 9]), .o_n2(o_n2[ 9]), .o_n1(o_n1[ 9]), .o_p1(o_p1[ 9]), .o_negc(o_negc[ 9]));
  boothradix4 u_booth_10 (.i_b(b_temp[22:20]), .o_p2(o_p2[10]), .o_n2(o_n2[10]), .o_n1(o_n1[10]), .o_p1(o_p1[10]), .o_negc(o_negc[10]));
  boothradix4 u_booth_11 (.i_b(b_temp[24:22]), .o_p2(o_p2[11]), .o_n2(o_n2[11]), .o_n1(o_n1[11]), .o_p1(o_p1[11]), .o_negc(o_negc[11]));
  boothradix4 u_booth_12 (.i_b(b_temp[26:24]), .o_p2(o_p2[12]), .o_n2(o_n2[12]), .o_n1(o_n1[12]), .o_p1(o_p1[12]), .o_negc(o_negc[12]));
  boothradix4 u_booth_13 (.i_b(b_temp[28:26]), .o_p2(o_p2[13]), .o_n2(o_n2[13]), .o_n1(o_n1[13]), .o_p1(o_p1[13]), .o_negc(o_negc[13]));
  boothradix4 u_booth_14 (.i_b(b_temp[30:28]), .o_p2(o_p2[14]), .o_n2(o_n2[14]), .o_n1(o_n1[14]), .o_p1(o_p1[14]), .o_negc(o_negc[14]));
  boothradix4 u_booth_15 (.i_b(b_temp[32:30]), .o_p2(o_p2[15]), .o_n2(o_n2[15]), .o_n1(o_n1[15]), .o_p1(o_p1[15]), .o_negc(o_negc[15]));

//============================================================================================================//

endmodule