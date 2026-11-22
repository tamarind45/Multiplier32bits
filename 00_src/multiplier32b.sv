module multiplier32b (
  input  logic [31:0] i_a,
  input  logic [31:0] i_b,
  output logic [63:0] o_product
);

//====================================DECLARATION==============================================================//

  // Booth Encoder outputs
  logic [ 15:0] p1;
  logic [ 15:0] n1;
  logic [ 15:0] p2;
  logic [ 15:0] n2;
  logic [ 15:0] negc;

  // Partial Product Generator outputs
  logic [527:0] pp_raw;
  logic [ 15:0] cy;

  // Sign Extension outputs
  logic [494:0] pp_ext;
  logic [ 31:0] pp15_ext;
  logic [ 15:0] k_const;

  // Dadda Reduction Tree outputs
  logic [ 61:0] dadda_sum;
  logic [ 61:0] dadda_carry;

  // Brent-Kung 62-bit Adder outputs
  logic [ 61:0] prod_lo;
  logic         cout_61;

  // MSB Bypass outputs
  logic [  1:0] prod_hi;

//============================================================================================================//

//====================================COMBINATIONAL LOGIC=====================================================//

  assign o_product = {prod_hi, prod_lo};

//============================================================================================================//

//==========================================MODULE============================================================//

  booth_enc_32b          u_booth_enc (.i_b(i_b), .o_p1(p1), .o_n1(n1), .o_p2(p2), .o_n2(n2), .o_negc(negc));
  partialproduct_gen_32b u_pp_gen    (.i_a(i_a), .i_p1(p1), .i_n1(n1), .i_p2(p2), .i_n2(n2), .i_negc(negc), .o_pp(pp_raw), .o_cy(cy));
  signextension_32b      u_sign_ext  (.i_pp(pp_raw), .o_pp(pp_ext), .o_pp15(pp15_ext), .o_k_const(k_const));
  daddatree_32b          u_dadda     (.i_pp(pp_ext), .i_pp15(pp15_ext), .i_cy(cy), .i_k_const(k_const), .o_sum(dadda_sum), .o_carry(dadda_carry));
  brentkung_62b          u_bk_adder  (.i_a(dadda_sum), .i_b(dadda_carry), .o_sum(prod_lo), .o_cout(cout_61));
  msb_bypass             u_msb_byp   (.i_a(i_a), .i_b(i_b), .o_msb(prod_hi));

//============================================================================================================//

endmodule