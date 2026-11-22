# 32-bit Signed Booth Radix-4 Multiplier

**Author:** Nguyen Tuan Dung  
**Subject:** Computer Architecture  
**University:** Ho Chi Minh University of Technology - VNUHCM  
**Semester:** HK261  
**Instructor:** Chau Tran Vinh Lam

A fully combinational 32 x 32 -> 64-bit **signed** multiplier written in
SystemVerilog. It uses modified Booth radix-4 recoding, a Dadda compression
tree and a Brent-Kung parallel-prefix adder.

## Interface

| Port | Direction | Width | Description |
|---|---|---|---|
| `i_a` | input | 32 | multiplicand, two's complement |
| `i_b` | input | 32 | multiplier, two's complement |
| `o_product` | output | 64 | `i_a * i_b`, two's complement |

No clock, no reset, no control signals: the output is valid after the
combinational delay.

## Architecture

```
 i_b ──► Booth encoders (16x) ──┐
                                ├──► Partial products (16 rows x 33 bit + 16 half adders)
 i_a ───────────────────────────┘                │
                                                 ▼
                                       Sign extension (inverted sign bit + constant K)
                                                 │   559 bits in 62 columns
                                                 ▼
                                       Dadda tree (6 stages)
                                                 │   two 62-bit vectors S, C
                                                 ▼
                                       Brent-Kung adder (62 bit)  ──► prod[61:0]
 i_a, i_b ──► MSB bypass ───────────────────────────────────────► prod[63:62]
```

1. **Booth radix-4 recoding:** 16 identical encoders turn each 3 bits of `i_b`
   into a digit in {-2, -1, 0, +1, +2}, as one-hot signals `p1, n1, p2, n2` plus `negc`.
2. **Partial products:** each digit selects 0, +-a or +-2a with an AND-OR gate.
   Negative rows are bit-inverted; the "+1" (`negc`) is added to the lowest bit
   with a half adder.
3. **Sign extension:** instead of extending every row, each row keeps only its
   inverted sign bit and a constant `K` is added in the high columns.
4. **Dadda tree:** compresses 559 bits (max column height 17) to two bits per
   column in 6 stages, using 435 full adders and 30 half adders.
5. **Brent-Kung adder:** adds the two 62-bit vectors (modulo 2^62) with 10 levels
   of prefix cells.
6. **MSB bypass:** bits 63 and 62 are computed directly from the inputs
   (`neg = product < 0`, plus a correction for (-2^31) * (-2^31) = 2^62).

## Repository Structure

```
.
├── 00_src/   RTL
├── 01_tb/    testbench
└── README.md
```

| File | Description |
|---|---|
| `multiplier32b.sv` | Top module |
| `boothradix4.sv` | Single Booth radix-4 encoder (3 bit -> one-hot digit + `negc`) |
| `booth_enc_32b.sv` | 16 encoders for `i_b` |
| `partialproduct.sv` | One partial-product row (33 bit) with the lowest-bit half adder |
| `partialproduct_gen_32b.sv` | 16 partial-product rows |
| `signextension_32b.sv` | Sign-extension trick (inverted sign bits + constant `K`) |
| `daddatree_32b.sv` | Dadda compression tree (435 FA, 30 HA) |
| `halfadder.sv`, `fulladder.sv` | Basic cells |
| `greycell.sv`, `blackcell.sv` | Prefix cells |
| `brentkung_62b.sv` | 62-bit Brent-Kung adder |
| `msb_bypass.sv` | Computes the two most significant product bits |
| `tb_multiplier32b.sv` | Self-checking testbench |

## Verification

The testbench compares `o_product` against `$signed(a) * $signed(b)` and prints
`[PASS]` or `[FAIL]` at the end. It runs 849,985 cases in seven groups:

| Group | Cases | Content |
|---|---|---|
| 1 | 256 | every pair of 16 edge values (0, +-1, +-2, -2^31, 2^31-1, ...) |
| 2 | 6,561 | exhaustive for operands in [-40, 40] |
| 3 | 4,096 | single-bit operands and their complements |
| 4 | 17,952 | runs of consecutive ones in `b` (every length and position) |
| 5 | 5,120 | every 3-bit Booth pattern at every digit position |
| 6 | 16,000 | random pairs in all four sign quadrants |
| 7 | 800,000 | random full-range, sparse and dense operands, both operand orders |

Result: **0 errors**. Exhaustive checking of all 2^64 input pairs is not
feasible; the test set targets the structure of the design instead.

## Simulation

Simulated with Synopsys VCS:

```
vcs -sverilog -full64 00_src/*.sv 01_tb/tb_multiplier32b.sv -o simv
./simv
```

Optional run-time arguments: `+N=<n>` sets the number of random iterations in
group 7 (default 200000, four cases per iteration), and `+SEED=<s>` sets the
random seed.

## Notes

- The design is purely combinational; timing, area and power have not been
  evaluated yet.
- A theory report (Booth radix-4, partial products, sign extension, Dadda tree,
  Brent-Kung adder, MSB bypass) accompanies this design.