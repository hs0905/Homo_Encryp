`timescale 1 ns / 1 ns

`include "defines.vh"
import FHE_ALU_PKG::*;


module Mult #(
		parameter DATA_SIZE     = FSIZE,
		parameter integer CYCLES        = MULT_CYCLES
	) (	
	  input logic	                        clk,	
	  input logic	                        rstn,	
    input logic                         in_valid,
    output logic                        out_valid,
    input logic   [DATA_SIZE-1:0]       in_A,
    input logic   [DATA_SIZE-1:0]       in_B,
    output logic  [DATA_SIZE*2-1:0]     out
  );

  typedef struct packed {   
    logic [CYCLES-1:0][DATA_SIZE*2-1:0] data;
    logic [CYCLES-1:0] valid;
  } Registers;
  
  Registers reg_current,reg_next;
  
  always_comb begin
    reg_next = reg_current;

    reg_next.data[0] = in_A * in_B;
    reg_next.valid[0] = in_valid;

    for(int i = 0; i < CYCLES-1; i ++) begin
      reg_next.data[i+1] = reg_current.data[i];
      reg_next.valid[i+1] = reg_current.valid[i];
    end

    if(!rstn) begin
      for(int i = 0; i < CYCLES; i ++) begin
        reg_next.data[i] = 0;
        reg_next.valid[i] = 0;
      end
    end
  end

  assign out = reg_current.data[CYCLES-1];
  assign out_valid = reg_current.valid[CYCLES-1];
            
  always @ (posedge clk) begin
    reg_current <= reg_next;
	end
endmodule
