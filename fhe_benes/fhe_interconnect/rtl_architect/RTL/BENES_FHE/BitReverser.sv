`timescale 1 ns / 1 ns

`include "defines.vh"
import FHE_ALU_PKG::*;

module BitReverser #(parameter WIDTH = 3)(	
    input logic   [WIDTH-1:0] in,
    output logic  [WIDTH-1:0] out
  );
  always_comb begin
    for(int i = 0; i < WIDTH; i ++) 
      out[WIDTH-1-i] = in[i];
  end
endmodule