`timescale 1 ns / 1 ns

`include "defines.vh"
import FHE_ALU_PKG::*;


module Transposer #(
		parameter DATA_SIZE     = FSIZE,
		parameter ELEMS         = E
	) (	
	  input logic	                        clk,	
	  input logic	                        rstn,	
    input logic   [DATA_SIZE*E-1:0]     in,
    input logic                         in_valid,
    input logic                         in_last,
    output logic  [DATA_SIZE*E-1:0]     out,
    output logic                        out_valid,
    output logic                        out_last
  );

  typedef struct packed {   
    logic [ELEMS-1:0][ELEMS-1:0][DATA_SIZE-1:0] data_in;
    logic [ELEMS-1:0][ELEMS-1:0][DATA_SIZE-1:0] data_out;
    logic [$clog2(ELEMS+1)-1:0] in_count;
    logic [$clog2(ELEMS+1)-1:0] out_count;
    logic [ELEMS:0] last;
  } Registers;
  
  Registers reg_current,reg_next;
  
  always_comb begin
    reg_next = reg_current;

    if(in_valid) begin
      reg_next.in_count = reg_current.in_count + 1;
      
      for(int i = 0; i < ELEMS-1; i ++) begin
        reg_next.data_in[i] = reg_current.data_in[i+1];
      end  

      for(int i = 0; i < ELEMS; i ++) begin
        reg_next.data_in[ELEMS-1][i] = in[DATA_SIZE*i +: DATA_SIZE];
      end
    end
    

    out_valid = 0;
    if(reg_current.out_count > 0) begin
      reg_next.out_count = reg_current.out_count -1;
      for(int i = 0; i < ELEMS; i ++) begin
        for(int j = 0; j < ELEMS-1; j ++) begin
          reg_next.data_out[i][j] = reg_current.data_out[i][j+1];
        end  
      end  
      out_valid = 1;
    end


    if(reg_current.in_count == ELEMS) begin
      if(in_valid) reg_next.in_count = 1;
      else reg_next.in_count = 0;

      reg_next.data_out = reg_current.data_in;
      reg_next.out_count = ELEMS;
    end
    
    for(int i = 0; i < ELEMS; i ++) begin
      out[DATA_SIZE*i +: DATA_SIZE] = reg_current.data_out[i][0];
    end

    //++ Last logic
    reg_next.last[0] = in_last;
    for(int i = 0; i < ELEMS; i ++) begin
      reg_next.last[i+1] = reg_current.last[i];
    end
    out_last = reg_current.last[ELEMS];
    //-- Last logic
    
    if(!rstn) begin
      reg_next.in_count = 0; 
      reg_next.out_count = 0;
    end
  end

  always @ (posedge clk) begin
    reg_current <= reg_next;
	end
endmodule
