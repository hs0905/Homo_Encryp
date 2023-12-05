`timescale 1 ns / 1 ns

`include "defines.vh"
import FHE_ALU_PKG::*;

module ElemSub #(
        parameter ID         = 0,
        parameter SIM_MODE        = 0
	) (
		input logic	clk,		    		
		input logic rstn,			

    input logic in_valid,    
    input logic in_last,    
    input logic [FSIZE-1:0] op1,
    input logic [FSIZE-1:0] op2,
    input logic [FSIZE-1:0] p,
    output logic [FSIZE-1:0] out,
    output logic out_valid,
    output logic out_last
	);

  // logic [FSIZE-1:0] i0_in, i0; FifoBuffer #(.DATA_SIZE(FSIZE), .CYCLES(MULT_CYCLES*2) )  i0_fifo (.clk(clk), .rstn(rstn), .in(i0_in), .out(i0));
  
  FifoBuffer #(.DATA_SIZE(1), .CYCLES(2) )  out_valid_fifo (.clk(clk), .rstn(rstn), .in(in_valid), .out(out_valid));
  FifoBuffer #(.DATA_SIZE(1), .CYCLES(2) )  out_last_fifo (.clk(clk), .rstn(rstn), .in(in_last), .out(out_last));
  
  logic [FSIZE-1:0] sub_in, sub;                        FifoBuffer #(.DATA_SIZE(FSIZE), .CYCLES(1) )  sub_fifo (.clk(clk), .rstn(rstn), .in(sub_in), .out(sub));
  logic compare1_in,compare1;                           FifoBuffer #(.DATA_SIZE(1), .CYCLES(1) )  compare1_fifo (.clk(clk), .rstn(rstn), .in(compare1_in), .out(compare1));

  logic [FSIZE-1:0] result_in, result;                  FifoBuffer #(.DATA_SIZE(FSIZE), .CYCLES(1) )  borrow_fifo (.clk(clk), .rstn(rstn), .in(result_in), .out(result));
  
  always_comb begin
    sub_in = op1 - op2;
    compare1_in = 0;
    if(op1 < op2) compare1_in = 1;

    result_in = sub;
    if(compare1 == 1) result_in = sub + p;

    out = result;
  end           
endmodule
