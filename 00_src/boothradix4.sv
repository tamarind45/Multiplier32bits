module boothradix4 ( 
  input  wire [2:0] i_b,
  output wire       o_p2, o_n2, o_n1, o_p1, o_negc
);

// ============================================================================
// Radix-4 Modified Booth Encoder (One-Hot Output)
// Digit formula: d_k = -2*i_b[2] + i_b[1] + i_b[0]
//
//  i_b[2] i_b[1] i_b[0] | d_k | Action | p1 n1 p2 n2 | negc | Note
// ----------------------+-----+--------+-------------+------+-----------------
//    0      0      0    |  0  |   0    |  0  0  0  0 |  0   | String of 0s
//    0      0      1    | +1  |  +a    |  1  0  0  0 |  0   | End of 1s
//    0      1      0    | +1  |  +a    |  1  0  0  0 |  0   | Isolated 1
//    0      1      1    | +2  | +2a    |  0  0  1  0 |  0   | End of 1s (x2)
//    1      0      0    | -2  | -2a    |  0  0  0  1 |  1   | Start of 1s (x2)
//    1      0      1    | -1  |  -a    |  0  1  0  0 |  1   | End + Start of 1s
//    1      1      0    | -1  |  -a    |  0  1  0  0 |  1   | Start of 1s
//    1      1      1    |  0  |   0    |  0  0  0  0 |  0   | String of 1s
// ============================================================================

	assign o_p1   = ~i_b[2] &  (i_b[1] ^ i_b[0]);
  assign o_n1   =  i_b[2] &  (i_b[1] ^ i_b[0]);
  assign o_p2   = ~i_b[2] &   i_b[1] &  i_b[0];
  assign o_n2   =  i_b[2] &  ~i_b[1] & ~i_b[0];
  assign o_negc =  i_b[2] & ~(i_b[1] &  i_b[0]);

endmodule