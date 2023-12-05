`timescale 1 ns / 1 ns

`include "defines.vh"
import FHE_ALU_PKG::*;

module ScalarMultiplier #(
        parameter ID         = 0,
        parameter SIM_MODE        = 0
	) (
		input logic	clk,		    		
		input logic rstn,			

    input logic in_valid,    
    input logic in_last,    
    input logic [FSIZE-1:0] a,
    input logic [FSIZE-1:0] p,
    input logic [FSIZE-1:0] scalar,
    input logic [FSIZE-1:0] scalar_div_p,
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
  logic [FSIZE-1:0] mult2_in_A,mult2_in_B;
  logic [FSIZE*2-1:0] mult2_out;
  Mult #(.DATA_SIZE(FSIZE), .CYCLES(MULT_CYCLES)) mult2 (
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
 
  
  logic [FSIZE-1:0] p4;      FifoBuffer #(.DATA_SIZE(FSIZE), .CYCLES(MULT_CYCLES) )  p4_fifo (.clk(clk), .rstn(rstn), .in(p), .out(p4));
  

  logic [FSIZE-1:0] r_tmp2,r_tmp2_in; FifoBuffer #(.DATA_SIZE(FSIZE), .CYCLES(MULT_CYCLES) )  r_tmp2_fifo (.clk(clk), .rstn(rstn), .in(r_tmp2_in), .out(r_tmp2));
  logic [FSIZE-1:0] tmp4,tmp4_in;     FifoBuffer #(.DATA_SIZE(FSIZE), .CYCLES(1) )  tmp4_fifo (.clk(clk), .rstn(rstn), .in(tmp4_in), .out(tmp4));
  
  logic outv,outv_in;              FifoBuffer #(.DATA_SIZE(1), .CYCLES(1) )  outv_fifo (.clk(clk), .rstn(rstn), .in(outv_in), .out(outv));
  
  FifoBuffer #(.DATA_SIZE(1), .CYCLES(MULT_CYCLES*2+1) )  out_last_fifo (.clk(clk), .rstn(rstn), .in(in_last), .out(out_last));
  
  
  logic [FSIZE-1:0] a_skip_reg;
  logic [FSIZE-1:0] b_skip_reg;
  logic valid_skip_reg;
    
  always_comb begin
    mult1_in_A = a;
    mult1_in_B = scalar_div_p;
    mult1_in_valid = in_valid;

    mult2_in_A = a;
    mult2_in_B = scalar;
    mult2_in_valid = in_valid;

    mult3_in_A = mult1_out[FSIZE*2-1:FSIZE];  //tmp3
    mult3_in_B = p4;
    mult3_in_valid = mult1_out_valid;

    r_tmp2_in = mult2_out;  //r_tmp2

    tmp4_in = r_tmp2 - mult3_out; //tmp4_1
    
    outv_in = mult3_out_valid;

    out = tmp4;

    out_valid = outv;
  end           
endmodule
