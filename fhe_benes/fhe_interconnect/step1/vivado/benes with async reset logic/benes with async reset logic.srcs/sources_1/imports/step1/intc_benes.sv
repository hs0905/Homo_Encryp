`timescale 1 ns/ 1 ns

`include "defines.vh"

import FHE_ALU_PKG::*;
import USER_PARAM_PKG::*;

module Interconnect_benes(
	input  logic 										clk,
	input  logic 										rst_n,
	input  logic [DATA_WIDTH-1:0]   ram_outputs		[0:SLOT_NUM_IN_BUFF-1], 	// E == 8 e.g 8*64 = 512 bits ram->interconnect
	input  logic [DATA_WIDTH-1:0]  	module_outputs[0:MODULE_NUM_IN_BUFF-1], // module -> interconnect
	input  logic [SWITCH_NUM-1:0]	  module_select	[0:STAGE_NUM-1],
	input  logic [SWITCH_NUM-1:0]	  slot_select		[0:STAGE_NUM-1],
	output logic [DATA_WIDTH-1:0]	  ram_inputs		[0:SLOT_NUM_IN_BUFF-1], 	// interconnect -> ram
	output logic [DATA_WIDTH-1:0]   module_inputs	[0:MODULE_NUM_IN_BUFF-1] 	// interconnect -> module
);
/*
logic [DATA_WIDTH-1:0]dummy_module_in	[0:SIZE-MODULE_NUM_IN_BUFF-1] = {0}; 
logic [DATA_WIDTH-1:0]dummy_module_out[0:SIZE-MODULE_NUM_IN_BUFF-1] = {0};
logic [DATA_WIDTH-1:0]dummy_ram_in		[0:SIZE-SLOT_NUM_IN_BUFF-1] = {0};
logic [DATA_WIDTH-1:0]dummy_ram_out		[0:SIZE-SLOT_NUM_IN_BUFF-1] = {0}; 
*/

logic [DATA_WIDTH-1:0]inner_module_in	[0:SIZE-1];
logic [DATA_WIDTH-1:0]inner_module_out	[0:SIZE-1];
logic [DATA_WIDTH-1:0]inner_ram_in	[0:SIZE-1];
logic [DATA_WIDTH-1:0]inner_ram_out	[0:SIZE-1];

generate
for(genvar i = 0; i<SLOT_NUM_IN_BUFF; i++) begin // real part(20)
	assign inner_module_out[i] 	= module_outputs	[i]; // module_out : input of interconnect(in_module register)
	assign inner_ram_out	 [i] 	= ram_outputs			[i]; // ram_out : input of interconnect(inter register)
	assign ram_inputs			 [i]	= inner_ram_in		[i]; // ram_in : output of interconnect(inter register)
	assign module_inputs   [i] 	= inner_module_in	[i]; // module_in : output of interconnect(out_module register)
end
for(genvar i = SLOT_NUM_IN_BUFF; i<SIZE; i++) begin // dummy part(network size(32) - real_size(20))
	assign inner_module_out[i] 		= 32'b0 ;						//dummy_module_out[i-MODULE_NUM_IN_BUFF];
	assign inner_ram_out	 [i] 		= 32'b0 ; 					//dummy_ram_out		[i-SLOT_NUM_IN_BUFF];
	assign inner_ram_in		 [i] 	 	= 32'b0 ;
	assign inner_module_in [i] 		= 32'b0 ;
end
endgenerate

always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
		begin
    	for (int i = 0; i < SIZE; i++) 
			begin
            inner_module_in[i] 	<= 	{DATA_WIDTH{1'b0}};
            inner_module_out[i] <= 	{DATA_WIDTH{1'b0}};
            inner_ram_in[i] 		<= 	{DATA_WIDTH{1'b0}};
            inner_ram_out[i] 		<= 	{DATA_WIDTH{1'b0}};
      end
		end else 
			begin
				for (int i = 0; i < MODULE_NUM_IN_BUFF; i++)
				begin
				  module_inputs [i] <= inner_module_in 	[i];
					ram_inputs    [i]	<= inner_ram_in			[i];
					end
    	end
end

network_module module_to_ram(
	.clk(clk),
	.i_port(inner_module_out),
	.o_port(inner_ram_in),
	.switch_set(slot_select) // must change the bits
);

network_module ram_to_module(
	.clk(clk),
	.i_port(inner_ram_out),
	.o_port(inner_module_in),
	.switch_set(module_select) // must change the bits
);


endmodule
