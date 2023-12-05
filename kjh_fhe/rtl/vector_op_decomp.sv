`timescale 1 ns / 1 ns

`include "defines.vh"
import FHE_ALU_PKG::*;

module ElemDecomp#(
        parameter ID         = 0,
        parameter SIM_MODE        = 0
    ) (
        input logic	clk,		    		
        input logic rstn,			

    input logic in_valid,    
    input logic in_last,    
    input logic [FSIZE-1:0] shift,
    input logic [FSIZE-1:0] decomp_bit_cnt,
    input logic [FSIZE-1:0] op,   //encrypted_coeff
    output logic [FSIZE-1:0] out, //decomp_encrypted
    output logic out_valid,
    output logic out_last
    );

  //shift fifo
  logic [FSIZE-1:0] shift_in, shift_out;
  FifoBuffer #(.DATA_SIZE(FSIZE), .CYCLES(4) )  shift_fifo (.clk(clk), .rstn(rstn), .in(shift_in), .out(shift_out)); //2-> 4

  logic shift_valid_in, shift_valid_out;
  FifoBuffer #(.DATA_SIZE(1), .CYCLES(4) )  shift_valid_fifo (.clk(clk), .rstn(rstn), .in(shift_valid_in), .out(shift_valid_out));

  //bitwise fifo
  logic [FSIZE-1:0] bit_wise_in, bit_wise_out;
  FifoBuffer #(.DATA_SIZE(FSIZE), .CYCLES(4) )  bitwise_ready_fifo (.clk(clk), .rstn(rstn), .in(bit_wise_in), .out(bit_wise_out));

//   logic bit_wise_valid_in, bit_wise_valid_out;
//   FifoBuffer #(.DATA_SIZE(1), .CYCLES(2) )  bitwise_valid_fifo (.clk(clk), .rstn(rstn), .in(bit_wise_valid_in), .out(bit_wise_valid_out));


  logic [FSIZE-1:0] out_in, out_out;
  FifoBuffer #(.DATA_SIZE(FSIZE), .CYCLES(1) )  result1_fifo (.clk(clk), .rstn(rstn), .in(out_in), .out(out_out));

  logic out_valid_in, out_valid_out;
  FifoBuffer #(.DATA_SIZE(1), .CYCLES(1) )  result2_fifo (.clk(clk), .rstn(rstn), .in(out_valid_in), .out(out_valid_out));

  FifoBuffer #(.DATA_SIZE(1), .CYCLES(4+1) )  out_last_fifo (.clk(clk), .rstn(rstn), .in(in_last), .out(out_last));
  
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
    //first op = shift
    shift_in = op >> shift;
    bit_wise_in = 64'hffffffffffffffff >> (64 - decomp_bit_cnt);
    shift_valid_in = in_valid;

    //second op = bitwise
    out_in = shift_out & bit_wise_out;
    out_valid_in = shift_valid_out;
    
    out = out_out;
    out_valid = out_valid_out;
  end           
endmodule
