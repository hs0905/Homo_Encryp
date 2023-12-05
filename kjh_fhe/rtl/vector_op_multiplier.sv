`timescale 1 ns / 1 ns

`include "defines.vh"
import FHE_ALU_PKG::*;

module ElemMultiplier #(
        parameter ID         = 0,
        parameter SIM_MODE        = 0
	) (
		input logic	clk,		    		
		input logic rstn,			

    input logic in_valid,    
    input logic in_last,    
    input logic in_barrett,
    input logic [FSIZE-1:0] op1,
    input logic [FSIZE-1:0] op2,
    input logic [FSIZE-1:0] p,
    input logic [FSIZE-1:0] pq0,
    input logic [FSIZE-1:0] pq1,

    output logic [FSIZE-1:0] out,
    output logic out_valid,
    output logic out_last
	);
  

  logic mult1_in_valid,mult1_out_valid;
  logic [FSIZE-1:0] mult1_in_A,mult1_in_B;
  logic [FSIZE*2-1:0] mult1_out;
  Mult #(.DATA_SIZE(FSIZE), .CYCLES(MULT_CYCLES)) mult1 (
    .clk(clk),
    .rstn(rstn),
    .in_valid(mult1_in_valid),
    .out_valid(mult1_out_valid),
    .in_A(mult1_in_A),
    .in_B(mult1_in_B),
    .out(mult1_out)
  );

  logic mult2_in_valid,mult2_out_valid;
  logic [FSIZE*2-1:0] mult2_in_A,mult2_in_B;
  logic [FSIZE*4-1:0] mult2_out;
  Mult #(.DATA_SIZE(FSIZE*2), .CYCLES(MULT_CYCLES_128)) mult2 (
    .clk(clk),
    .rstn(rstn),
    .in_valid(mult2_in_valid),
    .out_valid(mult2_out_valid),
    .in_A(mult2_in_A),
    .in_B(mult2_in_B),
    .out(mult2_out)
  );
 
  logic mult3_in_valid,mult3_out_valid;
  logic [FSIZE-1:0] mult3_in_A,mult3_in_B;
  logic [FSIZE*2-1:0] mult3_out;
  Mult #(.DATA_SIZE(FSIZE), .CYCLES(MULT_CYCLES)) mult3 (
    .clk(clk),
    .rstn(rstn),
    .in_valid(mult3_in_valid),
    .out_valid(mult3_out_valid),
    .in_A(mult3_in_A),
    .in_B(mult3_in_B),
    .out(mult3_out)
  );
 
  
  logic [FSIZE-1:0] i0_in, i0; FifoBuffer #(.DATA_SIZE(FSIZE), .CYCLES(MULT_CYCLES+MULT_CYCLES_128) )  i0_fifo (.clk(clk), .rstn(rstn), .in(i0_in), .out(i0));

  //to barrett reduction
  logic barrett_in, barrett_out; FifoBuffer #(.DATA_SIZE(1), .CYCLES(MULT_CYCLES) )  barrett_fifo (.clk(clk), .rstn(rstn), .in(barrett_in), .out(barrett_out));
  logic [FSIZE-1:0] op1_in, op1_out; FifoBuffer #(.DATA_SIZE(FSIZE), .CYCLES(MULT_CYCLES) )  op1_barrett_fifo (.clk(clk), .rstn(rstn), .in(op1_in), .out(op1_out));
  logic [FSIZE-1:0] op2_in, op2_out; FifoBuffer #(.DATA_SIZE(FSIZE), .CYCLES(MULT_CYCLES) )  op2_barrett_fifo (.clk(clk), .rstn(rstn), .in(op2_in), .out(op2_out));
  
  logic outv,outv_in;              FifoBuffer #(.DATA_SIZE(1), .CYCLES(3) )  outv_fifo (.clk(clk), .rstn(rstn), .in(outv_in), .out(outv));
  
  // FifoBuffer #(.DATA_SIZE(1), .CYCLES(MULT_CYCLES*3+3) )  out_valid_fifo (.clk(clk), .rstn(rstn), .in(in_valid), .out(out_valid));
  FifoBuffer #(.DATA_SIZE(1), .CYCLES(MULT_CYCLES*2+MULT_CYCLES_128+3) )  out_last_fifo (.clk(clk), .rstn(rstn), .in(in_last), .out(out_last));
  
  logic [FSIZE-1:0] minus_in, minus;                  FifoBuffer #(.DATA_SIZE(FSIZE), .CYCLES(1) )  minus_fifo (.clk(clk), .rstn(rstn), .in(minus_in), .out(minus));
  logic compare_in,compare;                           FifoBuffer #(.DATA_SIZE(1), .CYCLES(1) )  compare_fifo (.clk(clk), .rstn(rstn), .in(compare_in), .out(compare));
  logic [FSIZE-1:0] compared_data_in, compared_data;  FifoBuffer #(.DATA_SIZE(FSIZE), .CYCLES(1) )  compared_data_fifo (.clk(clk), .rstn(rstn), .in(compared_data_in), .out(compared_data));
  logic [FSIZE-1:0] result_data_in, result_data;      FifoBuffer #(.DATA_SIZE(FSIZE), .CYCLES(1) )  result_data_fifo (.clk(clk), .rstn(rstn), .in(result_data_in), .out(result_data));
  
      
  always_comb begin
    mult1_in_A = op1;
    mult1_in_B = op2;
    mult1_in_valid = in_valid;

    op1_in = op1;
    op2_in = op2;
    barrett_in = in_barrett;

    
    if(barrett_out) i0_in = op1_out;
    else i0_in = mult1_out[FSIZE-1:0];

    
    if(barrett_out) mult2_in_A = {op2_out, op1_out};
    else mult2_in_A = mult1_out;
    
    mult2_in_B = {pq1,pq0};
    mult2_in_valid = mult1_out_valid;

    mult3_in_A = mult2_out[FSIZE*3-1:FSIZE*2];  //tmp3
    mult3_in_B = p;
    mult3_in_valid = mult2_out_valid;

    outv_in = mult3_out_valid;

    minus_in = i0 - mult3_out[FSIZE-1:0];

    compare_in = 0;
    if(minus >= p) compare_in = 1;
    compared_data_in = minus;
    
    result_data_in = compared_data;
    if(compare) result_data_in = compared_data - p;

    out = result_data;
    out_valid = outv;
  end           
endmodule
