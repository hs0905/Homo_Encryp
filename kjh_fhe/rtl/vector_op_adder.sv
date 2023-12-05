`timescale 1 ns / 1 ns

`include "defines.vh"
import FHE_ALU_PKG::*;

module ElemAdder #(
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

  logic [FSIZE-1:0] i0_in, i0; FifoBuffer #(.DATA_SIZE(FSIZE), .CYCLES(MULT_CYCLES*2) )  i0_fifo (.clk(clk), .rstn(rstn), .in(i0_in), .out(i0));
  
  FifoBuffer #(.DATA_SIZE(1), .CYCLES(5) )  out_valid_fifo (.clk(clk), .rstn(rstn), .in(in_valid), .out(out_valid));
  FifoBuffer #(.DATA_SIZE(1), .CYCLES(5) )  out_last_fifo (.clk(clk), .rstn(rstn), .in(in_last), .out(out_last));
  
  logic [FSIZE-1:0] add_in, add;                        FifoBuffer #(.DATA_SIZE(FSIZE), .CYCLES(1) )  add_fifo (.clk(clk), .rstn(rstn), .in(add_in), .out(add));
  logic compare1_in,compare1;                           FifoBuffer #(.DATA_SIZE(1), .CYCLES(1) )  compare1_fifo (.clk(clk), .rstn(rstn), .in(compare1_in), .out(compare1));
  logic compare2_in,compare2;                           FifoBuffer #(.DATA_SIZE(1), .CYCLES(1) )  compare2_fifo (.clk(clk), .rstn(rstn), .in(compare2_in), .out(compare2));
  logic [FSIZE-1:0] compared1_data_in, compared1_data;  FifoBuffer #(.DATA_SIZE(FSIZE), .CYCLES(1) )  compared1_data_fifo (.clk(clk), .rstn(rstn), .in(compared1_data_in), .out(compared1_data));
  logic [FSIZE-1:0] compared2_data_in, compared2_data;  FifoBuffer #(.DATA_SIZE(FSIZE), .CYCLES(1) )  compared2_data_fifo (.clk(clk), .rstn(rstn), .in(compared2_data_in), .out(compared2_data));
  logic [FSIZE-1:0] reduced1_data_in, reduced1_data;    FifoBuffer #(.DATA_SIZE(FSIZE), .CYCLES(1) )  reduced1_data_fifo  (.clk(clk), .rstn(rstn), .in(reduced1_data_in), .out(reduced1_data));
  logic [FSIZE-1:0] reduced2_data_in, reduced2_data;    FifoBuffer #(.DATA_SIZE(FSIZE), .CYCLES(1) )  reduced2_data_fifo  (.clk(clk), .rstn(rstn), .in(reduced2_data_in), .out(reduced2_data));
  
      
  always_comb begin
    add_in = op1 + op2;
    
    compared1_data_in = add;
    compare1_in = 0;
    if(add >= 2*p) compare1_in = 1;
    
    reduced1_data_in = compared1_data;
    if(compare1) reduced1_data_in = compared1_data - 2*p;
    
    compared2_data_in = reduced1_data;
    compare2_in = 0;
    if(reduced1_data >= p) compare2_in = 1;

    reduced2_data_in = compared2_data;
    if(compare2) reduced2_data_in = compared2_data - p;
    
    out = reduced2_data;
  end           
endmodule
