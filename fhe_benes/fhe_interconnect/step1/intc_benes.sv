`timescale 1 ns/ 1 ns
`include "defines.vh"
import USER_PKG::*;
import FHE_ALU_PKG::*;

// data width : 512 == [E * FSIZE]
// size : 32
// STAGE_NUM : 5
  /*typedef struct packed{
  logic [31:0]        raddr;
  logic [31:0]        waddr;
  logic [E*FSIZE-1:0] wdata;
  logic               wren;
} BufferRAMTEFsizeInputs;*/

module Interconnect_benes(
	input  logic 										clk,
	input  logic 										rst_n,
	input  logic [DATA_WIDTH-1:0]   i_ram_outputs		[0:SLOT_NUM_IN_BUFF-1], 	
	input  BufferRAMTEFsizeInputs 	i_module_outputs[0:MODULE_NUM_IN_BUFF-1], 
	input  logic [SWITCH_NUM-1:0]	  i_module_select	[0:STAGE_NUM-1],
	input  logic [SWITCH_NUM-1:0]	  i_slot_select		[0:STAGE_NUM-1],
  output BufferRAMTEFsizeInputs 	o_ram_inputs		[0:SLOT_NUM_IN_BUFF-1],
	output logic [DATA_WIDTH-1:0]   o_module_inputs	[0:MODULE_NUM_IN_BUFF-1] 	
	//	input  logic [DATA_WIDTH-1:0]  	i_module_outputs[0:MODULE_NUM_IN_BUFF-1], 
	//	output logic [DATA_WIDTH-1:0]	  o_ram_inputs		[0:SLOT_NUM_IN_BUFF-1], 	
);

logic [DATA_WIDTH-1:0] ram_output_reg 		[0:SLOT_NUM_IN_BUFF-1]; 		// input reg
logic [DATA_WIDTH-1:0] module_input_reg 	[0:MODULE_NUM_IN_BUFF-1]; 	// output reg
BufferRAMTEFsizeInputs module_output_reg 	[0:MODULE_NUM_IN_BUFF-1]; 	// input reg 
BufferRAMTEFsizeInputs ram_input_reg 			[0:SLOT_NUM_IN_BUFF-1]; 		// output reg

always_ff@(posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		for(int i = 0; i<SLOT_NUM_IN_BUFF ; i++)begin
			ram_output_reg		[i] <= {DATA_WIDTH{1'b0}};
			module_input_reg  [i] <= {DATA_WIDTH{1'b0}};

			module_output_reg[i].raddr <= 0;
			module_output_reg[i].waddr <= 0;
			module_output_reg[i].wdata <= 0;
			module_output_reg[i].wren  <= 0;

			ram_input_reg[i].raddr <= 0;
			ram_input_reg[i].waddr <= 0;
			ram_input_reg[i].wdata <= 0;
			ram_input_reg[i].wren  <= 0;
		end
	end else begin
		ram_output_reg 		<= 	i_ram_outputs;
		module_output_reg <= 	i_module_outputs;
		o_ram_inputs			<= 	ram_input_reg;
		o_module_inputs 	<= 	module_input_reg;
	end
end

logic [DATA_WIDTH-1:0] input_benes_reg_R2M 	[0:SIZE-1]; // 512 bit size & 32 vector
logic [DATA_WIDTH-1:0] output_benes_reg_R2M [0:SIZE-1];
BufferRAMTEFsizeInputs input_benes_reg_M2R 	[0:SIZE-1];
BufferRAMTEFsizeInputs output_benes_reg_M2R [0:SIZE-1];

// create dummy port for adjusting the size of the module(20) to benes network(32)
always_comb begin
	for(int i=0; i< SLOT_NUM_IN_BUFF; i=i+1) begin
		input_benes_reg_R2M[i] = ram_output_reg		[i];
		input_benes_reg_M2R[i] = module_output_reg[i];
	end
	for(int i=SLOT_NUM_IN_BUFF; i< SIZE; i=i+1) begin
		input_benes_reg_R2M[i] = 0 ;
		input_benes_reg_M2R[i] = 0 ;
	end
end 
// 	Output of the benes network, eliminate the dummy port 
//	32(Dummy + Real) - 12(Dummy) = 20(Real)
always_comb begin
	for(int i = 0; i< SLOT_NUM_IN_BUFF; i++)begin
		module_input_reg[i] = output_benes_reg_R2M[i];
		ram_input_reg		[i] = output_benes_reg_M2R[i];
	end
end

network_module R2M(
	.clk(clk),
	.i_port(input_benes_reg_R2M),
	.o_port(output_benes_reg_R2M),
	.switch_set(i_module_select)
);

network_module M2R(
	.clk(clk),
	.i_port(input_benes_reg_M2R),
	.o_port(output_benes_reg_M2R),
	.switch_set(i_slot_select)
);


endmodule
