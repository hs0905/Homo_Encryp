`timescale 1 ns/ 1 ns

`include "defines.vh"

import FHE_ALU_PKG::*;
import USER_PARAM_PKG::*;

module BufferInterconnect_v6(
	input  logic 					clk,
	input  logic 					rst_n,
	input  logic [DATA_WIDTH-1:0]   ram_outputs		[0:SLOT_NUM_IN_BUFF-1], // E == 8 e.g 8*64 = 512 bits ram->interconnect
	input  logic [DATA_WIDTH-1:0]  	module_outputs[0:MODULE_NUM_IN_BUFF-1], // module -> interconnect
	input  logic [SWITCH_NUM-1:0]	  module_select	[0:STAGE_NUM-1],
	input  logic [SWITCH_NUM-1:0]	  slot_select		[0:STAGE_NUM-1],
	output logic [DATA_WIDTH-1:0]	  ram_inputs		[0:SLOT_NUM_IN_BUFF-1], // interconnect -> ram
	output logic [DATA_WIDTH-1:0]   module_inputs	[0:MODULE_NUM_IN_BUFF-1] // interconnect -> module
);

logic [DATA_WIDTH-1:0]dummy_module_in	[0:SIZE-MODULE_NUM_IN_BUFF-1]; 
logic [DATA_WIDTH-1:0]dummy_module_out[0:SIZE-MODULE_NUM_IN_BUFF-1];
logic [DATA_WIDTH-1:0]dummy_ram_in		[0:SIZE-SLOT_NUM_IN_BUFF-1];
logic [DATA_WIDTH-1:0]dummy_ram_out		[0:SIZE-SLOT_NUM_IN_BUFF-1];

logic [DATA_WIDTH-1:0]inter_mod_dummy_in	[0:SIZE-1];
logic [DATA_WIDTH-1:0]inter_mod_dummy_out	[0:SIZE-1];
logic [DATA_WIDTH-1:0]inter_ram_dummy_in	[0:SIZE-1];
logic [DATA_WIDTH-1:0]inter_ram_dummy_out	[0:SIZE-1];

generate

for(genvar i = 0; i<SLOT_NUM_IN_BUFF; i++) begin
	assign inter_mod_dummy_out[i] = module_outputs[i];
	assign inter_ram_dummy_in	[i] = ram_inputs		[i];
	assign inter_mod_dummy_in	[i] = module_inputs	[i];
	assign inter_ram_dummy_out[i] = ram_outputs		[i];
end

for(genvar i = SLOT_NUM_IN_BUFF; i<SIZE; i++) begin
	assign inter_mod_dummy_out[i] = dummy_module_out[i-MODULE_NUM_IN_BUFF];
	assign inter_ram_dummy_in	[i] = dummy_ram_in		[i-SLOT_NUM_IN_BUFF];
	assign inter_mod_dummy_in	[i] = dummy_module_in	[i-MODULE_NUM_IN_BUFF];
	assign inter_ram_dummy_out[i] = dummy_ram_out		[i-SLOT_NUM_IN_BUFF];
end

endgenerate

network_module mod_slot(
	.clk(clk),
	.i_port(inter_mod_dummy_out),
	.o_port(inter_ram_dummy_in),
	.switch_set(slot_select) // must change the bits
);

network_module slot_mod(
	.clk(clk),
	.i_port(inter_ram_dummy_out),
	.o_port(inter_mod_dummy_in),
	.switch_set(module_select) // must change the bits
);


endmodule
