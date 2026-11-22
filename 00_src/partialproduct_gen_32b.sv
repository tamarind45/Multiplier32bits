module partialproduct_gen_32b (
  input  logic [ 31:0] i_a,
  input  logic [ 15:0] i_p1,
  input  logic [ 15:0] i_n1,
  input  logic [ 15:0] i_p2,
  input  logic [ 15:0] i_n2,
  input  logic [ 15:0] i_negc,
  output logic [527:0] o_pp,
  output logic [ 15:0] o_cy
);

//==========================================MODULE============================================================//

  partialproduct u_pp_00 (.i_a(i_a), .i_p1(i_p1[ 0]), .i_n1(i_n1[ 0]), .i_p2(i_p2[ 0]), .i_n2(i_n2[ 0]), .i_negc(i_negc[ 0]), .o_pp(o_pp[ 32:  0]), .o_cy(o_cy[ 0]));
  partialproduct u_pp_01 (.i_a(i_a), .i_p1(i_p1[ 1]), .i_n1(i_n1[ 1]), .i_p2(i_p2[ 1]), .i_n2(i_n2[ 1]), .i_negc(i_negc[ 1]), .o_pp(o_pp[ 65: 33]), .o_cy(o_cy[ 1]));
  partialproduct u_pp_02 (.i_a(i_a), .i_p1(i_p1[ 2]), .i_n1(i_n1[ 2]), .i_p2(i_p2[ 2]), .i_n2(i_n2[ 2]), .i_negc(i_negc[ 2]), .o_pp(o_pp[ 98: 66]), .o_cy(o_cy[ 2]));
  partialproduct u_pp_03 (.i_a(i_a), .i_p1(i_p1[ 3]), .i_n1(i_n1[ 3]), .i_p2(i_p2[ 3]), .i_n2(i_n2[ 3]), .i_negc(i_negc[ 3]), .o_pp(o_pp[131: 99]), .o_cy(o_cy[ 3]));
  partialproduct u_pp_04 (.i_a(i_a), .i_p1(i_p1[ 4]), .i_n1(i_n1[ 4]), .i_p2(i_p2[ 4]), .i_n2(i_n2[ 4]), .i_negc(i_negc[ 4]), .o_pp(o_pp[164:132]), .o_cy(o_cy[ 4]));
  partialproduct u_pp_05 (.i_a(i_a), .i_p1(i_p1[ 5]), .i_n1(i_n1[ 5]), .i_p2(i_p2[ 5]), .i_n2(i_n2[ 5]), .i_negc(i_negc[ 5]), .o_pp(o_pp[197:165]), .o_cy(o_cy[ 5]));
  partialproduct u_pp_06 (.i_a(i_a), .i_p1(i_p1[ 6]), .i_n1(i_n1[ 6]), .i_p2(i_p2[ 6]), .i_n2(i_n2[ 6]), .i_negc(i_negc[ 6]), .o_pp(o_pp[230:198]), .o_cy(o_cy[ 6]));
  partialproduct u_pp_07 (.i_a(i_a), .i_p1(i_p1[ 7]), .i_n1(i_n1[ 7]), .i_p2(i_p2[ 7]), .i_n2(i_n2[ 7]), .i_negc(i_negc[ 7]), .o_pp(o_pp[263:231]), .o_cy(o_cy[ 7]));
  partialproduct u_pp_08 (.i_a(i_a), .i_p1(i_p1[ 8]), .i_n1(i_n1[ 8]), .i_p2(i_p2[ 8]), .i_n2(i_n2[ 8]), .i_negc(i_negc[ 8]), .o_pp(o_pp[296:264]), .o_cy(o_cy[ 8]));
  partialproduct u_pp_09 (.i_a(i_a), .i_p1(i_p1[ 9]), .i_n1(i_n1[ 9]), .i_p2(i_p2[ 9]), .i_n2(i_n2[ 9]), .i_negc(i_negc[ 9]), .o_pp(o_pp[329:297]), .o_cy(o_cy[ 9]));
  partialproduct u_pp_10 (.i_a(i_a), .i_p1(i_p1[10]), .i_n1(i_n1[10]), .i_p2(i_p2[10]), .i_n2(i_n2[10]), .i_negc(i_negc[10]), .o_pp(o_pp[362:330]), .o_cy(o_cy[10]));
  partialproduct u_pp_11 (.i_a(i_a), .i_p1(i_p1[11]), .i_n1(i_n1[11]), .i_p2(i_p2[11]), .i_n2(i_n2[11]), .i_negc(i_negc[11]), .o_pp(o_pp[395:363]), .o_cy(o_cy[11]));
  partialproduct u_pp_12 (.i_a(i_a), .i_p1(i_p1[12]), .i_n1(i_n1[12]), .i_p2(i_p2[12]), .i_n2(i_n2[12]), .i_negc(i_negc[12]), .o_pp(o_pp[428:396]), .o_cy(o_cy[12]));
  partialproduct u_pp_13 (.i_a(i_a), .i_p1(i_p1[13]), .i_n1(i_n1[13]), .i_p2(i_p2[13]), .i_n2(i_n2[13]), .i_negc(i_negc[13]), .o_pp(o_pp[461:429]), .o_cy(o_cy[13]));
  partialproduct u_pp_14 (.i_a(i_a), .i_p1(i_p1[14]), .i_n1(i_n1[14]), .i_p2(i_p2[14]), .i_n2(i_n2[14]), .i_negc(i_negc[14]), .o_pp(o_pp[494:462]), .o_cy(o_cy[14]));
  partialproduct u_pp_15 (.i_a(i_a), .i_p1(i_p1[15]), .i_n1(i_n1[15]), .i_p2(i_p2[15]), .i_n2(i_n2[15]), .i_negc(i_negc[15]), .o_pp(o_pp[527:495]), .o_cy(o_cy[15]));

//============================================================================================================//

endmodule