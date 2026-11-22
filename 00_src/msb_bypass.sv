module msb_bypass (
  input  logic [31:0] i_a,
  input  logic [31:0] i_b,
  output logic [ 1:0] o_msb
);

//====================================DECLARATION==============================================================//

  logic a_nonzero;
  logic b_nonzero;
  logic is_min_neg;
  logic sign_true;

//============================================================================================================//

//====================================COMBINATIONAL LOGIC=====================================================//

  assign a_nonzero  = |i_a;
  assign b_nonzero  = |i_b;
  assign is_min_neg = (i_a == 32'h8000_0000) & (i_b == 32'h8000_0000);
  assign sign_true  = a_nonzero & b_nonzero & (i_a[31] ^ i_b[31]);
  assign o_msb[0]   = is_min_neg | sign_true;
  assign o_msb[1]   = sign_true;

//============================================================================================================//

endmodule