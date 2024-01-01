`timescale 1 ns / 1 ns

`include "defines.vh"
import FHE_ALU_PKG::*;

module BitCompose #(
		parameter WIDTH       = logN-logE, // 16 - 3 = 13
		parameter MID_WIDTH   = logE,      // 3
		parameter LEFT_BARREL = 0
	)
  (	
   input  logic [WIDTH:0]              base,
   input  logic [logE-1:0]             barrel,
   input  logic [WIDTH-MID_WIDTH-1:0]  in, // 10
   input  logic [MID_WIDTH-1:0]        mid, // 3
   output logic [WIDTH-1:0]            out // 13
  );

  logic         [MID_WIDTH-1:0]        mid_barreled;
  always_comb begin
    mid_barreled = mid;
    if(LEFT_BARREL) begin
      if (barrel == 1) mid_barreled = {mid[MID_WIDTH-2:0],mid[MID_WIDTH-1]};
      if (barrel == 2) mid_barreled = {mid[MID_WIDTH-3:0],mid[MID_WIDTH-1:MID_WIDTH-2]};
    end
    else begin
      if (barrel == 1) mid_barreled = {mid[0],mid[MID_WIDTH-1:1]};
      if (barrel == 2) mid_barreled = {mid[1:0],mid[MID_WIDTH-1:2]};
    end
    // logN = 16
    // out = {in,mid_barreled};
    case (base)
      0: out = {in,mid_barreled};
      1: out = {in[WIDTH-MID_WIDTH-1:1],mid_barreled,in[0]};
      2: out = {in[WIDTH-MID_WIDTH-1:2],mid_barreled,in[1:0]};
      3: out = {in[WIDTH-MID_WIDTH-1:3],mid_barreled,in[2:0]};
      4: out = {in[WIDTH-MID_WIDTH-1:4],mid_barreled,in[3:0]};
      5: out = {in[WIDTH-MID_WIDTH-1:5],mid_barreled,in[4:0]};
      6: out = {in[WIDTH-MID_WIDTH-1:6],mid_barreled,in[5:0]};
      7: out = {in[WIDTH-MID_WIDTH-1:7],mid_barreled,in[6:0]};
      8: out = {in[WIDTH-MID_WIDTH-1:8],mid_barreled,in[7:0]};
      9: out = {in[WIDTH-MID_WIDTH-1],mid_barreled,in[8:0]};
      default: out = {mid_barreled,in};
    endcase
  /*  if (base == 0) out = {in,mid_barreled};
    else if (base == 1) out = {in[WIDTH-MID_WIDTH-1:1],mid_barreled,in[0]};
    else if (base == 2) out = {in[WIDTH-MID_WIDTH-1:2],mid_barreled,in[1:0]};
    else if (base == 3) out = {in[WIDTH-MID_WIDTH-1:3],mid_barreled,in[2:0]};
    else if (base == 4) out = {in[WIDTH-MID_WIDTH-1:4],mid_barreled,in[3:0]};
    else if (base == 5) out = {in[WIDTH-MID_WIDTH-1:5],mid_barreled,in[4:0]};
    else if (base == 6) out = {in[WIDTH-MID_WIDTH-1:6],mid_barreled,in[5:0]};
    else if (base == 7) out = {in[WIDTH-MID_WIDTH-1:7],mid_barreled,in[6:0]};
    else if (base == 8) out = {in[WIDTH-MID_WIDTH-1:8],mid_barreled,in[7:0]};
    else if (base == 9) out = {in[WIDTH-MID_WIDTH-1],mid_barreled,in[8:0]};
    else out = {mid_barreled,in}; */
  end
endmodule