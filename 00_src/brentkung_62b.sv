module brentkung_62b (
  input  logic [61:0] i_a,
  input  logic [61:0] i_b,
  output logic [61:0] o_sum,
  output logic        o_cout
);

//====================================DECLARATION==============================================================//

  logic [61:0] p;
  logic [61:0] g;
  logic [51:0] g_bc;
  logic [51:0] p_bc;
  logic [60:0] g_gc;

//============================================================================================================//

//====================================COMBINATIONAL LOGIC=====================================================//

  assign p         = i_a ^ i_b;
  assign g         = i_a & i_b;
  assign o_sum[0]  = p[0];
  assign o_sum[ 1] = p[ 1] ^ g[ 0];
  assign o_sum[ 2] = p[ 2] ^ g_gc[ 0];
  assign o_sum[ 3] = p[ 3] ^ g_gc[31];
  assign o_sum[ 4] = p[ 4] ^ g_gc[ 1];
  assign o_sum[ 5] = p[ 5] ^ g_gc[32];
  assign o_sum[ 6] = p[ 6] ^ g_gc[16];
  assign o_sum[ 7] = p[ 7] ^ g_gc[33];
  assign o_sum[ 8] = p[ 8] ^ g_gc[ 2];
  assign o_sum[ 9] = p[ 9] ^ g_gc[34];
  assign o_sum[10] = p[10] ^ g_gc[17];
  assign o_sum[11] = p[11] ^ g_gc[35];
  assign o_sum[12] = p[12] ^ g_gc[ 9];
  assign o_sum[13] = p[13] ^ g_gc[36];
  assign o_sum[14] = p[14] ^ g_gc[18];
  assign o_sum[15] = p[15] ^ g_gc[37];
  assign o_sum[16] = p[16] ^ g_gc[ 3];
  assign o_sum[17] = p[17] ^ g_gc[38];
  assign o_sum[18] = p[18] ^ g_gc[19];
  assign o_sum[19] = p[19] ^ g_gc[39];
  assign o_sum[20] = p[20] ^ g_gc[10];
  assign o_sum[21] = p[21] ^ g_gc[40];
  assign o_sum[22] = p[22] ^ g_gc[20];
  assign o_sum[23] = p[23] ^ g_gc[41];
  assign o_sum[24] = p[24] ^ g_gc[ 6];
  assign o_sum[25] = p[25] ^ g_gc[42];
  assign o_sum[26] = p[26] ^ g_gc[21];
  assign o_sum[27] = p[27] ^ g_gc[43];
  assign o_sum[28] = p[28] ^ g_gc[11];
  assign o_sum[29] = p[29] ^ g_gc[44];
  assign o_sum[30] = p[30] ^ g_gc[22];
  assign o_sum[31] = p[31] ^ g_gc[45];
  assign o_sum[32] = p[32] ^ g_gc[ 4];
  assign o_sum[33] = p[33] ^ g_gc[46];
  assign o_sum[34] = p[34] ^ g_gc[23];
  assign o_sum[35] = p[35] ^ g_gc[47];
  assign o_sum[36] = p[36] ^ g_gc[12];
  assign o_sum[37] = p[37] ^ g_gc[48];
  assign o_sum[38] = p[38] ^ g_gc[24];
  assign o_sum[39] = p[39] ^ g_gc[49];
  assign o_sum[40] = p[40] ^ g_gc[ 7];
  assign o_sum[41] = p[41] ^ g_gc[50];
  assign o_sum[42] = p[42] ^ g_gc[25];
  assign o_sum[43] = p[43] ^ g_gc[51];
  assign o_sum[44] = p[44] ^ g_gc[13];
  assign o_sum[45] = p[45] ^ g_gc[52];
  assign o_sum[46] = p[46] ^ g_gc[26];
  assign o_sum[47] = p[47] ^ g_gc[53];
  assign o_sum[48] = p[48] ^ g_gc[ 5];
  assign o_sum[49] = p[49] ^ g_gc[54];
  assign o_sum[50] = p[50] ^ g_gc[27];
  assign o_sum[51] = p[51] ^ g_gc[55];
  assign o_sum[52] = p[52] ^ g_gc[14];
  assign o_sum[53] = p[53] ^ g_gc[56];
  assign o_sum[54] = p[54] ^ g_gc[28];
  assign o_sum[55] = p[55] ^ g_gc[57];
  assign o_sum[56] = p[56] ^ g_gc[ 8];
  assign o_sum[57] = p[57] ^ g_gc[58];
  assign o_sum[58] = p[58] ^ g_gc[29];
  assign o_sum[59] = p[59] ^ g_gc[59];
  assign o_sum[60] = p[60] ^ g_gc[15];
  assign o_sum[61] = p[61] ^ g_gc[60];
  assign o_cout    = g_gc[30];

//============================================================================================================//

//==========================================MODULE============================================================//

  // --- Up-sweep step 1 ---
  greycell  u_gc_00 (.i_g_hi(g[ 1]), .i_p_hi(p[ 1]), .i_g_lo(g[ 0]), .o_g(g_gc[ 0]));
  blackcell u_bc_00 (.i_g_hi(g[ 3]), .i_p_hi(p[ 3]), .i_g_lo(g[ 2]), .i_p_lo(p[ 2]), .o_g(g_bc[ 0]), .o_p(p_bc[ 0]));
  blackcell u_bc_01 (.i_g_hi(g[ 5]), .i_p_hi(p[ 5]), .i_g_lo(g[ 4]), .i_p_lo(p[ 4]), .o_g(g_bc[ 1]), .o_p(p_bc[ 1]));
  blackcell u_bc_02 (.i_g_hi(g[ 7]), .i_p_hi(p[ 7]), .i_g_lo(g[ 6]), .i_p_lo(p[ 6]), .o_g(g_bc[ 2]), .o_p(p_bc[ 2]));
  blackcell u_bc_03 (.i_g_hi(g[ 9]), .i_p_hi(p[ 9]), .i_g_lo(g[ 8]), .i_p_lo(p[ 8]), .o_g(g_bc[ 3]), .o_p(p_bc[ 3]));
  blackcell u_bc_04 (.i_g_hi(g[11]), .i_p_hi(p[11]), .i_g_lo(g[10]), .i_p_lo(p[10]), .o_g(g_bc[ 4]), .o_p(p_bc[ 4]));
  blackcell u_bc_05 (.i_g_hi(g[13]), .i_p_hi(p[13]), .i_g_lo(g[12]), .i_p_lo(p[12]), .o_g(g_bc[ 5]), .o_p(p_bc[ 5]));
  blackcell u_bc_06 (.i_g_hi(g[15]), .i_p_hi(p[15]), .i_g_lo(g[14]), .i_p_lo(p[14]), .o_g(g_bc[ 6]), .o_p(p_bc[ 6]));
  blackcell u_bc_07 (.i_g_hi(g[17]), .i_p_hi(p[17]), .i_g_lo(g[16]), .i_p_lo(p[16]), .o_g(g_bc[ 7]), .o_p(p_bc[ 7]));
  blackcell u_bc_08 (.i_g_hi(g[19]), .i_p_hi(p[19]), .i_g_lo(g[18]), .i_p_lo(p[18]), .o_g(g_bc[ 8]), .o_p(p_bc[ 8]));
  blackcell u_bc_09 (.i_g_hi(g[21]), .i_p_hi(p[21]), .i_g_lo(g[20]), .i_p_lo(p[20]), .o_g(g_bc[ 9]), .o_p(p_bc[ 9]));
  blackcell u_bc_10 (.i_g_hi(g[23]), .i_p_hi(p[23]), .i_g_lo(g[22]), .i_p_lo(p[22]), .o_g(g_bc[10]), .o_p(p_bc[10]));
  blackcell u_bc_11 (.i_g_hi(g[25]), .i_p_hi(p[25]), .i_g_lo(g[24]), .i_p_lo(p[24]), .o_g(g_bc[11]), .o_p(p_bc[11]));
  blackcell u_bc_12 (.i_g_hi(g[27]), .i_p_hi(p[27]), .i_g_lo(g[26]), .i_p_lo(p[26]), .o_g(g_bc[12]), .o_p(p_bc[12]));
  blackcell u_bc_13 (.i_g_hi(g[29]), .i_p_hi(p[29]), .i_g_lo(g[28]), .i_p_lo(p[28]), .o_g(g_bc[13]), .o_p(p_bc[13]));
  blackcell u_bc_14 (.i_g_hi(g[31]), .i_p_hi(p[31]), .i_g_lo(g[30]), .i_p_lo(p[30]), .o_g(g_bc[14]), .o_p(p_bc[14]));
  blackcell u_bc_15 (.i_g_hi(g[33]), .i_p_hi(p[33]), .i_g_lo(g[32]), .i_p_lo(p[32]), .o_g(g_bc[15]), .o_p(p_bc[15]));
  blackcell u_bc_16 (.i_g_hi(g[35]), .i_p_hi(p[35]), .i_g_lo(g[34]), .i_p_lo(p[34]), .o_g(g_bc[16]), .o_p(p_bc[16]));
  blackcell u_bc_17 (.i_g_hi(g[37]), .i_p_hi(p[37]), .i_g_lo(g[36]), .i_p_lo(p[36]), .o_g(g_bc[17]), .o_p(p_bc[17]));
  blackcell u_bc_18 (.i_g_hi(g[39]), .i_p_hi(p[39]), .i_g_lo(g[38]), .i_p_lo(p[38]), .o_g(g_bc[18]), .o_p(p_bc[18]));
  blackcell u_bc_19 (.i_g_hi(g[41]), .i_p_hi(p[41]), .i_g_lo(g[40]), .i_p_lo(p[40]), .o_g(g_bc[19]), .o_p(p_bc[19]));
  blackcell u_bc_20 (.i_g_hi(g[43]), .i_p_hi(p[43]), .i_g_lo(g[42]), .i_p_lo(p[42]), .o_g(g_bc[20]), .o_p(p_bc[20]));
  blackcell u_bc_21 (.i_g_hi(g[45]), .i_p_hi(p[45]), .i_g_lo(g[44]), .i_p_lo(p[44]), .o_g(g_bc[21]), .o_p(p_bc[21]));
  blackcell u_bc_22 (.i_g_hi(g[47]), .i_p_hi(p[47]), .i_g_lo(g[46]), .i_p_lo(p[46]), .o_g(g_bc[22]), .o_p(p_bc[22]));
  blackcell u_bc_23 (.i_g_hi(g[49]), .i_p_hi(p[49]), .i_g_lo(g[48]), .i_p_lo(p[48]), .o_g(g_bc[23]), .o_p(p_bc[23]));
  blackcell u_bc_24 (.i_g_hi(g[51]), .i_p_hi(p[51]), .i_g_lo(g[50]), .i_p_lo(p[50]), .o_g(g_bc[24]), .o_p(p_bc[24]));
  blackcell u_bc_25 (.i_g_hi(g[53]), .i_p_hi(p[53]), .i_g_lo(g[52]), .i_p_lo(p[52]), .o_g(g_bc[25]), .o_p(p_bc[25]));
  blackcell u_bc_26 (.i_g_hi(g[55]), .i_p_hi(p[55]), .i_g_lo(g[54]), .i_p_lo(p[54]), .o_g(g_bc[26]), .o_p(p_bc[26]));
  blackcell u_bc_27 (.i_g_hi(g[57]), .i_p_hi(p[57]), .i_g_lo(g[56]), .i_p_lo(p[56]), .o_g(g_bc[27]), .o_p(p_bc[27]));
  blackcell u_bc_28 (.i_g_hi(g[59]), .i_p_hi(p[59]), .i_g_lo(g[58]), .i_p_lo(p[58]), .o_g(g_bc[28]), .o_p(p_bc[28]));
  blackcell u_bc_29 (.i_g_hi(g[61]), .i_p_hi(p[61]), .i_g_lo(g[60]), .i_p_lo(p[60]), .o_g(g_bc[29]), .o_p(p_bc[29]));

  // --- Up-sweep step 2 ---
  greycell  u_gc_01 (.i_g_hi(g_bc[ 0]), .i_p_hi(p_bc[ 0]), .i_g_lo(g_gc[ 0]), .o_g(g_gc[ 1]));
  blackcell u_bc_30 (.i_g_hi(g_bc[ 2]), .i_p_hi(p_bc[ 2]), .i_g_lo(g_bc[ 1]), .i_p_lo(p_bc[ 1]), .o_g(g_bc[30]), .o_p(p_bc[30]));
  blackcell u_bc_31 (.i_g_hi(g_bc[ 4]), .i_p_hi(p_bc[ 4]), .i_g_lo(g_bc[ 3]), .i_p_lo(p_bc[ 3]), .o_g(g_bc[31]), .o_p(p_bc[31]));
  blackcell u_bc_32 (.i_g_hi(g_bc[ 6]), .i_p_hi(p_bc[ 6]), .i_g_lo(g_bc[ 5]), .i_p_lo(p_bc[ 5]), .o_g(g_bc[32]), .o_p(p_bc[32]));
  blackcell u_bc_33 (.i_g_hi(g_bc[ 8]), .i_p_hi(p_bc[ 8]), .i_g_lo(g_bc[ 7]), .i_p_lo(p_bc[ 7]), .o_g(g_bc[33]), .o_p(p_bc[33]));
  blackcell u_bc_34 (.i_g_hi(g_bc[10]), .i_p_hi(p_bc[10]), .i_g_lo(g_bc[ 9]), .i_p_lo(p_bc[ 9]), .o_g(g_bc[34]), .o_p(p_bc[34]));
  blackcell u_bc_35 (.i_g_hi(g_bc[12]), .i_p_hi(p_bc[12]), .i_g_lo(g_bc[11]), .i_p_lo(p_bc[11]), .o_g(g_bc[35]), .o_p(p_bc[35]));
  blackcell u_bc_36 (.i_g_hi(g_bc[14]), .i_p_hi(p_bc[14]), .i_g_lo(g_bc[13]), .i_p_lo(p_bc[13]), .o_g(g_bc[36]), .o_p(p_bc[36]));
  blackcell u_bc_37 (.i_g_hi(g_bc[16]), .i_p_hi(p_bc[16]), .i_g_lo(g_bc[15]), .i_p_lo(p_bc[15]), .o_g(g_bc[37]), .o_p(p_bc[37]));
  blackcell u_bc_38 (.i_g_hi(g_bc[18]), .i_p_hi(p_bc[18]), .i_g_lo(g_bc[17]), .i_p_lo(p_bc[17]), .o_g(g_bc[38]), .o_p(p_bc[38]));
  blackcell u_bc_39 (.i_g_hi(g_bc[20]), .i_p_hi(p_bc[20]), .i_g_lo(g_bc[19]), .i_p_lo(p_bc[19]), .o_g(g_bc[39]), .o_p(p_bc[39]));
  blackcell u_bc_40 (.i_g_hi(g_bc[22]), .i_p_hi(p_bc[22]), .i_g_lo(g_bc[21]), .i_p_lo(p_bc[21]), .o_g(g_bc[40]), .o_p(p_bc[40]));
  blackcell u_bc_41 (.i_g_hi(g_bc[24]), .i_p_hi(p_bc[24]), .i_g_lo(g_bc[23]), .i_p_lo(p_bc[23]), .o_g(g_bc[41]), .o_p(p_bc[41]));
  blackcell u_bc_42 (.i_g_hi(g_bc[26]), .i_p_hi(p_bc[26]), .i_g_lo(g_bc[25]), .i_p_lo(p_bc[25]), .o_g(g_bc[42]), .o_p(p_bc[42]));
  blackcell u_bc_43 (.i_g_hi(g_bc[28]), .i_p_hi(p_bc[28]), .i_g_lo(g_bc[27]), .i_p_lo(p_bc[27]), .o_g(g_bc[43]), .o_p(p_bc[43]));

  // --- Up-sweep step 4 ---
  greycell  u_gc_02 (.i_g_hi(g_bc[30]), .i_p_hi(p_bc[30]), .i_g_lo(g_gc[ 1]), .o_g(g_gc[ 2]));
  blackcell u_bc_44 (.i_g_hi(g_bc[32]), .i_p_hi(p_bc[32]), .i_g_lo(g_bc[31]), .i_p_lo(p_bc[31]), .o_g(g_bc[44]), .o_p(p_bc[44]));
  blackcell u_bc_45 (.i_g_hi(g_bc[34]), .i_p_hi(p_bc[34]), .i_g_lo(g_bc[33]), .i_p_lo(p_bc[33]), .o_g(g_bc[45]), .o_p(p_bc[45]));
  blackcell u_bc_46 (.i_g_hi(g_bc[36]), .i_p_hi(p_bc[36]), .i_g_lo(g_bc[35]), .i_p_lo(p_bc[35]), .o_g(g_bc[46]), .o_p(p_bc[46]));
  blackcell u_bc_47 (.i_g_hi(g_bc[38]), .i_p_hi(p_bc[38]), .i_g_lo(g_bc[37]), .i_p_lo(p_bc[37]), .o_g(g_bc[47]), .o_p(p_bc[47]));
  blackcell u_bc_48 (.i_g_hi(g_bc[40]), .i_p_hi(p_bc[40]), .i_g_lo(g_bc[39]), .i_p_lo(p_bc[39]), .o_g(g_bc[48]), .o_p(p_bc[48]));
  blackcell u_bc_49 (.i_g_hi(g_bc[42]), .i_p_hi(p_bc[42]), .i_g_lo(g_bc[41]), .i_p_lo(p_bc[41]), .o_g(g_bc[49]), .o_p(p_bc[49]));

  // --- Up-sweep step 8 ---
  greycell  u_gc_03 (.i_g_hi(g_bc[44]), .i_p_hi(p_bc[44]), .i_g_lo(g_gc[ 2]), .o_g(g_gc[ 3]));
  blackcell u_bc_50 (.i_g_hi(g_bc[46]), .i_p_hi(p_bc[46]), .i_g_lo(g_bc[45]), .i_p_lo(p_bc[45]), .o_g(g_bc[50]), .o_p(p_bc[50]));
  blackcell u_bc_51 (.i_g_hi(g_bc[48]), .i_p_hi(p_bc[48]), .i_g_lo(g_bc[47]), .i_p_lo(p_bc[47]), .o_g(g_bc[51]), .o_p(p_bc[51]));

  // --- Up-sweep step 16 ---
  greycell  u_gc_04 (.i_g_hi(g_bc[50]), .i_p_hi(p_bc[50]), .i_g_lo(g_gc[ 3]), .o_g(g_gc[ 4]));

  // --- Down-sweep step 16 ---
  greycell  u_gc_05 (.i_g_hi(g_bc[51]), .i_p_hi(p_bc[51]), .i_g_lo(g_gc[ 4]), .o_g(g_gc[ 5]));

  // --- Down-sweep step 8 ---
  greycell  u_gc_06 (.i_g_hi(g_bc[45]), .i_p_hi(p_bc[45]), .i_g_lo(g_gc[ 3]), .o_g(g_gc[ 6]));
  greycell  u_gc_07 (.i_g_hi(g_bc[47]), .i_p_hi(p_bc[47]), .i_g_lo(g_gc[ 4]), .o_g(g_gc[ 7]));
  greycell  u_gc_08 (.i_g_hi(g_bc[49]), .i_p_hi(p_bc[49]), .i_g_lo(g_gc[ 5]), .o_g(g_gc[ 8]));

  // --- Down-sweep step 4 ---
  greycell  u_gc_09 (.i_g_hi(g_bc[31]), .i_p_hi(p_bc[31]), .i_g_lo(g_gc[ 2]), .o_g(g_gc[ 9]));
  greycell  u_gc_10 (.i_g_hi(g_bc[33]), .i_p_hi(p_bc[33]), .i_g_lo(g_gc[ 3]), .o_g(g_gc[10]));
  greycell  u_gc_11 (.i_g_hi(g_bc[35]), .i_p_hi(p_bc[35]), .i_g_lo(g_gc[ 6]), .o_g(g_gc[11]));
  greycell  u_gc_12 (.i_g_hi(g_bc[37]), .i_p_hi(p_bc[37]), .i_g_lo(g_gc[ 4]), .o_g(g_gc[12]));
  greycell  u_gc_13 (.i_g_hi(g_bc[39]), .i_p_hi(p_bc[39]), .i_g_lo(g_gc[ 7]), .o_g(g_gc[13]));
  greycell  u_gc_14 (.i_g_hi(g_bc[41]), .i_p_hi(p_bc[41]), .i_g_lo(g_gc[ 5]), .o_g(g_gc[14]));
  greycell  u_gc_15 (.i_g_hi(g_bc[43]), .i_p_hi(p_bc[43]), .i_g_lo(g_gc[ 8]), .o_g(g_gc[15]));

  // --- Down-sweep step 2 ---
  greycell  u_gc_16 (.i_g_hi(g_bc[ 1]), .i_p_hi(p_bc[ 1]), .i_g_lo(g_gc[ 1]), .o_g(g_gc[16]));
  greycell  u_gc_17 (.i_g_hi(g_bc[ 3]), .i_p_hi(p_bc[ 3]), .i_g_lo(g_gc[ 2]), .o_g(g_gc[17]));
  greycell  u_gc_18 (.i_g_hi(g_bc[ 5]), .i_p_hi(p_bc[ 5]), .i_g_lo(g_gc[ 9]), .o_g(g_gc[18]));
  greycell  u_gc_19 (.i_g_hi(g_bc[ 7]), .i_p_hi(p_bc[ 7]), .i_g_lo(g_gc[ 3]), .o_g(g_gc[19]));
  greycell  u_gc_20 (.i_g_hi(g_bc[ 9]), .i_p_hi(p_bc[ 9]), .i_g_lo(g_gc[10]), .o_g(g_gc[20]));
  greycell  u_gc_21 (.i_g_hi(g_bc[11]), .i_p_hi(p_bc[11]), .i_g_lo(g_gc[ 6]), .o_g(g_gc[21]));
  greycell  u_gc_22 (.i_g_hi(g_bc[13]), .i_p_hi(p_bc[13]), .i_g_lo(g_gc[11]), .o_g(g_gc[22]));
  greycell  u_gc_23 (.i_g_hi(g_bc[15]), .i_p_hi(p_bc[15]), .i_g_lo(g_gc[ 4]), .o_g(g_gc[23]));
  greycell  u_gc_24 (.i_g_hi(g_bc[17]), .i_p_hi(p_bc[17]), .i_g_lo(g_gc[12]), .o_g(g_gc[24]));
  greycell  u_gc_25 (.i_g_hi(g_bc[19]), .i_p_hi(p_bc[19]), .i_g_lo(g_gc[ 7]), .o_g(g_gc[25]));
  greycell  u_gc_26 (.i_g_hi(g_bc[21]), .i_p_hi(p_bc[21]), .i_g_lo(g_gc[13]), .o_g(g_gc[26]));
  greycell  u_gc_27 (.i_g_hi(g_bc[23]), .i_p_hi(p_bc[23]), .i_g_lo(g_gc[ 5]), .o_g(g_gc[27]));
  greycell  u_gc_28 (.i_g_hi(g_bc[25]), .i_p_hi(p_bc[25]), .i_g_lo(g_gc[14]), .o_g(g_gc[28]));
  greycell  u_gc_29 (.i_g_hi(g_bc[27]), .i_p_hi(p_bc[27]), .i_g_lo(g_gc[ 8]), .o_g(g_gc[29]));
  greycell  u_gc_30 (.i_g_hi(g_bc[29]), .i_p_hi(p_bc[29]), .i_g_lo(g_gc[15]), .o_g(g_gc[30]));

  // --- Down-sweep step 1 ---
  greycell  u_gc_31 (.i_g_hi(g[ 2]), .i_p_hi(p[ 2]), .i_g_lo(g_gc[ 0]), .o_g(g_gc[31]));
  greycell  u_gc_32 (.i_g_hi(g[ 4]), .i_p_hi(p[ 4]), .i_g_lo(g_gc[ 1]), .o_g(g_gc[32]));
  greycell  u_gc_33 (.i_g_hi(g[ 6]), .i_p_hi(p[ 6]), .i_g_lo(g_gc[16]), .o_g(g_gc[33]));
  greycell  u_gc_34 (.i_g_hi(g[ 8]), .i_p_hi(p[ 8]), .i_g_lo(g_gc[ 2]), .o_g(g_gc[34]));
  greycell  u_gc_35 (.i_g_hi(g[10]), .i_p_hi(p[10]), .i_g_lo(g_gc[17]), .o_g(g_gc[35]));
  greycell  u_gc_36 (.i_g_hi(g[12]), .i_p_hi(p[12]), .i_g_lo(g_gc[ 9]), .o_g(g_gc[36]));
  greycell  u_gc_37 (.i_g_hi(g[14]), .i_p_hi(p[14]), .i_g_lo(g_gc[18]), .o_g(g_gc[37]));
  greycell  u_gc_38 (.i_g_hi(g[16]), .i_p_hi(p[16]), .i_g_lo(g_gc[ 3]), .o_g(g_gc[38]));
  greycell  u_gc_39 (.i_g_hi(g[18]), .i_p_hi(p[18]), .i_g_lo(g_gc[19]), .o_g(g_gc[39]));
  greycell  u_gc_40 (.i_g_hi(g[20]), .i_p_hi(p[20]), .i_g_lo(g_gc[10]), .o_g(g_gc[40]));
  greycell  u_gc_41 (.i_g_hi(g[22]), .i_p_hi(p[22]), .i_g_lo(g_gc[20]), .o_g(g_gc[41]));
  greycell  u_gc_42 (.i_g_hi(g[24]), .i_p_hi(p[24]), .i_g_lo(g_gc[ 6]), .o_g(g_gc[42]));
  greycell  u_gc_43 (.i_g_hi(g[26]), .i_p_hi(p[26]), .i_g_lo(g_gc[21]), .o_g(g_gc[43]));
  greycell  u_gc_44 (.i_g_hi(g[28]), .i_p_hi(p[28]), .i_g_lo(g_gc[11]), .o_g(g_gc[44]));
  greycell  u_gc_45 (.i_g_hi(g[30]), .i_p_hi(p[30]), .i_g_lo(g_gc[22]), .o_g(g_gc[45]));
  greycell  u_gc_46 (.i_g_hi(g[32]), .i_p_hi(p[32]), .i_g_lo(g_gc[ 4]), .o_g(g_gc[46]));
  greycell  u_gc_47 (.i_g_hi(g[34]), .i_p_hi(p[34]), .i_g_lo(g_gc[23]), .o_g(g_gc[47]));
  greycell  u_gc_48 (.i_g_hi(g[36]), .i_p_hi(p[36]), .i_g_lo(g_gc[12]), .o_g(g_gc[48]));
  greycell  u_gc_49 (.i_g_hi(g[38]), .i_p_hi(p[38]), .i_g_lo(g_gc[24]), .o_g(g_gc[49]));
  greycell  u_gc_50 (.i_g_hi(g[40]), .i_p_hi(p[40]), .i_g_lo(g_gc[ 7]), .o_g(g_gc[50]));
  greycell  u_gc_51 (.i_g_hi(g[42]), .i_p_hi(p[42]), .i_g_lo(g_gc[25]), .o_g(g_gc[51]));
  greycell  u_gc_52 (.i_g_hi(g[44]), .i_p_hi(p[44]), .i_g_lo(g_gc[13]), .o_g(g_gc[52]));
  greycell  u_gc_53 (.i_g_hi(g[46]), .i_p_hi(p[46]), .i_g_lo(g_gc[26]), .o_g(g_gc[53]));
  greycell  u_gc_54 (.i_g_hi(g[48]), .i_p_hi(p[48]), .i_g_lo(g_gc[ 5]), .o_g(g_gc[54]));
  greycell  u_gc_55 (.i_g_hi(g[50]), .i_p_hi(p[50]), .i_g_lo(g_gc[27]), .o_g(g_gc[55]));
  greycell  u_gc_56 (.i_g_hi(g[52]), .i_p_hi(p[52]), .i_g_lo(g_gc[14]), .o_g(g_gc[56]));
  greycell  u_gc_57 (.i_g_hi(g[54]), .i_p_hi(p[54]), .i_g_lo(g_gc[28]), .o_g(g_gc[57]));
  greycell  u_gc_58 (.i_g_hi(g[56]), .i_p_hi(p[56]), .i_g_lo(g_gc[ 8]), .o_g(g_gc[58]));
  greycell  u_gc_59 (.i_g_hi(g[58]), .i_p_hi(p[58]), .i_g_lo(g_gc[29]), .o_g(g_gc[59]));
  greycell  u_gc_60 (.i_g_hi(g[60]), .i_p_hi(p[60]), .i_g_lo(g_gc[15]), .o_g(g_gc[60]));

//============================================================================================================//

endmodule