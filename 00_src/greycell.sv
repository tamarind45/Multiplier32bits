module greycell (
  input  logic i_g_hi,
  input  logic i_p_hi,
  input  logic i_g_lo,
  output logic o_g
);

//====================================COMBINATIONAL LOGIC=====================================================//

  assign o_g = i_g_hi | (i_p_hi & i_g_lo);

//============================================================================================================//

endmodule