`timescale 1 ns / 1 ns

`include "defines.vh"
import FHE_ALU_PKG::*;

module ElemLazy #(
        parameter ID         = 0,
        parameter SIM_MODE        = 0
	) (
		input logic	clk,		    		
		input logic rstn,			

    input logic in_valid,    
    input logic in_last,    
    input logic [FSIZE-1:0] op1,   //wide_innerresult_0
    input logic [FSIZE-1:0] op2,   //wide_innerresult_1
    input logic [FSIZE-1:0] op3,   //key
    input logic [FSIZE-1:0] op4,   //temp_decomp_coeff
    output logic [FSIZE-1:0] out1, //wide_innerresult_0_res
    output logic [FSIZE-1:0] out2, //wide_innerresult_1_res
    output logic out_valid,
    output logic out_last
	);

  //64bit * 64bit
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

  logic [FSIZE-1:0] op1_in, op1_out;
  FifoBuffer #(.DATA_SIZE(FSIZE), .CYCLES(MULT_CYCLES) )  op1_fifo (.clk(clk), .rstn(rstn), .in(op1_in), .out(op1_out));

  logic [FSIZE-1:0] op2_in, op2_out;
  FifoBuffer #(.DATA_SIZE(FSIZE), .CYCLES(MULT_CYCLES+1) )  op2_fifo (.clk(clk), .rstn(rstn), .in(op2_in), .out(op2_out));

  logic [FSIZE:0] add_result_in, add_result;
  FifoBuffer #(.DATA_SIZE(FSIZE+1), .CYCLES(1) )  add_fifo (.clk(clk), .rstn(rstn), .in(add_result_in), .out(add_result));
  
  logic [FSIZE-1:0] mult1_out_in, mult1_out_out;
  FifoBuffer #(.DATA_SIZE(FSIZE), .CYCLES(1) )  dalay_fifo (.clk(clk), .rstn(rstn), .in(mult1_out_in), .out(mult1_out_out));
  
  logic [FSIZE-1:0] out1_in, out1_out;
  FifoBuffer #(.DATA_SIZE(FSIZE), .CYCLES(1) )  result1_fifo (.clk(clk), .rstn(rstn), .in(out1_in), .out(out1_out));

  logic [FSIZE-1:0] out2_in, out2_out;
  FifoBuffer #(.DATA_SIZE(FSIZE), .CYCLES(1) )  result2_fifo (.clk(clk), .rstn(rstn), .in(out2_in), .out(out2_out));
  
  FifoBuffer #(.DATA_SIZE(1), .CYCLES(2) )  to_mult1_out_valid_fifo (.clk(clk), .rstn(rstn), .in(mult1_out_valid), .out(out_valid));
  FifoBuffer #(.DATA_SIZE(1), .CYCLES(MULT_CYCLES+1+1) )  out_last_fifo (.clk(clk), .rstn(rstn), .in(in_last), .out(out_last));
  
  //for test
//   logic [FSIZE-1:0] add_in_1, add_1;                        FifoBuffer #(.DATA_SIZE(FSIZE), .CYCLES(5) )  add1_fifo (.clk(clk), .rstn(rstn), .in(add_in_1), .out(add_1));
//   logic [FSIZE-1:0] add_in_2, add_2;                        FifoBuffer #(.DATA_SIZE(FSIZE), .CYCLES(5) )  add2_fifo (.clk(clk), .rstn(rstn), .in(add_in_2), .out(add_2));

//   logic compare1_in,compare1;                           FifoBuffer #(.DATA_SIZE(1), .CYCLES(1) )  compare1_fifo (.clk(clk), .rstn(rstn), .in(compare1_in), .out(compare1));
//   logic compare2_in,compare2;                           FifoBuffer #(.DATA_SIZE(1), .CYCLES(1) )  compare2_fifo (.clk(clk), .rstn(rstn), .in(compare2_in), .out(compare2));
//   logic [FSIZE-1:0] compared1_data_in, compared1_data;  FifoBuffer #(.DATA_SIZE(FSIZE), .CYCLES(1) )  compared1_data_fifo (.clk(clk), .rstn(rstn), .in(compared1_data_in), .out(compared1_data));
//   logic [FSIZE-1:0] compared2_data_in, compared2_data;  FifoBuffer #(.DATA_SIZE(FSIZE), .CYCLES(1) )  compared2_data_fifo (.clk(clk), .rstn(rstn), .in(compared2_data_in), .out(compared2_data));
//   logic [FSIZE-1:0] reduced1_data_in, reduced1_data;    FifoBuffer #(.DATA_SIZE(FSIZE), .CYCLES(1) )  reduced1_data_fifo  (.clk(clk), .rstn(rstn), .in(reduced1_data_in), .out(reduced1_data));
//   logic [FSIZE-1:0] reduced2_data_in, reduced2_data;    FifoBuffer #(.DATA_SIZE(FSIZE), .CYCLES(1) )  reduced2_data_fifo  (.clk(clk), .rstn(rstn), .in(reduced2_data_in), .out(reduced2_data));
  
      
  always_comb begin
    //for test
    // add_in_1 = op1 + op2;
    // add_in_2 = op3 + op4;
    
    // out1 = add_1;
    // out2 = add_2;

    // 64 * 64 -> MULT_CYCLES
    op1_in = op1;
    op2_in = op2;

    mult1_in_A = op3; //key
    mult1_in_B = op4; //temp_decomp_coeff
    mult1_in_valid = in_valid;

    // add + carry -> 1 cycle
    add_result_in = mult1_out[63:0] + op1_out;//
    mult1_out_in = mult1_out[127:64];

    //result_add -> 1 cycle
    out1_in = add_result[FSIZE-1:0];
    out2_in = mult1_out_out + op2_out + add_result[FSIZE];

    out1 = out1_out;
    out2 = out2_out;

    // compared1_data_in = add;
    // compare1_in = 0;
    // if(add >= 2*p) compare1_in = 1;
    
    // reduced1_data_in = compared1_data;
    // if(compare1) reduced1_data_in = compared1_data - 2*p;
    
    // compared2_data_in = reduced1_data;
    // compare2_in = 0;
    // if(reduced1_data >= p) compare2_in = 1;

    // reduced2_data_in = compared2_data;
    // if(compare2) reduced2_data_in = compared2_data - p;
    
    // out = reduced2_data;
  end           
endmodule
