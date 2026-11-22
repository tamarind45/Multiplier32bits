module blackcell (
  input  logic i_g_hi,
  input  logic i_p_hi,
  input  logic i_g_lo,
  input  logic i_p_lo,
  output logic o_g,
  output logic o_p
);

//====================================COMBINATIONAL LOGIC=====================================================//

  assign o_g = i_g_hi | (i_p_hi & i_g_lo);
  assign o_p = i_p_hi & i_p_lo;

//============================================================================================================//

endmodule