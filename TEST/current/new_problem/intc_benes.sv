`timescale 1 ns/ 1 ns
`include "defines.vh"
//import USER_PKG::*;
import FHE_ALU_PKG::*;

module Interconnect_benes(
	input  logic 										clk,
	input  logic 										rst_n,
	input  logic [DATA_WIDTH-1:0]   I_RAM_OUTPUTS		[0:SLOT_NUM_IN_BUFF-1], 	
	input  BufferRAMTEFsizeInputs 	I_MODULE_OUTPUTS[0:MODULE_NUM_IN_BUFF-1], 
	input  logic [SWITCH_NUM-1:0]	  I_MODULE_SELECT	[0:STAGE_NUM-1],
	input  logic [SWITCH_NUM-1:0]	  I_SLOT_SELECT		[0:STAGE_NUM-1],
  output BufferRAMTEFsizeInputs 	O_RAM_INPUTS		[0:SLOT_NUM_IN_BUFF-1],
	output logic [DATA_WIDTH-1:0]   O_MODULE_INPUTS	[0:MODULE_NUM_IN_BUFF-1] 	
);

logic [DATA_WIDTH-1:0] ram_output_reg 		[0:SLOT_NUM_IN_BUFF-1]; 		// input reg
logic [DATA_WIDTH-1:0] module_input_reg 	[0:MODULE_NUM_IN_BUFF-1]; 	// output reg
BufferRAMTEFsizeInputs module_output_reg 	[0:MODULE_NUM_IN_BUFF-1]; 	// input reg 
BufferRAMTEFsizeInputs ram_input_reg 			[0:SLOT_NUM_IN_BUFF-1]; 		// output reg

logic [DATA_WIDTH-1:0] input_benes_reg_R2M 	[0:SIZE-1]; // 512 bit size & 32 vector
BufferRAMTEFsizeInputs input_benes_reg_M2R 	[0:SIZE-1];

logic [DATA_WIDTH-1:0] output_benes_reg_R2M [0:SIZE-1];
BufferRAMTEFsizeInputs output_benes_reg_M2R [0:SIZE-1];

logic [DATA_WIDTH-1:0] output_benes_wire_R2M [0:SIZE-1];
BufferRAMTEFsizeInputs output_benes_wire_M2R [0:SIZE-1];

always_comb begin
	O_RAM_INPUTS = ram_input_reg;
	O_MODULE_INPUTS = module_input_reg;
end

always_ff@(posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		for(int i = 0; i<SLOT_NUM_IN_BUFF ; i++)begin
			module_input_reg	[i] <= 0;
			ram_input_reg		[i].raddr <= 0;
			ram_input_reg		[i].waddr <= 0;
			ram_input_reg		[i].wdata <= 0;
			ram_input_reg		[i].wren  <= 0;
		end
	end else begin
		module_input_reg <= output_benes_reg_R2M;
		ram_input_reg		 <= output_benes_reg_M2R;
	end
end



always_ff@(posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		for(int i = 0; i<SLOT_NUM_IN_BUFF ; i++)begin
			ram_output_reg		[i] <= 0;
			module_output_reg[i].raddr <= 0;
			module_output_reg[i].waddr <= 0;
			module_output_reg[i].wdata <= 0;
			module_output_reg[i].wren  <= 0;
		end
	end else begin
		ram_output_reg 		<= 	I_RAM_OUTPUTS;
		module_output_reg <= 	I_MODULE_OUTPUTS;
	end
end

always_comb begin
	input_benes_reg_R2M = ram_output_reg;
	input_benes_reg_M2R = module_output_reg;
end

always_ff@(posedge clk or negedge rst_n) begin 
	if(!rst_n)begin
		for(int i = 0; i< SLOT_NUM_IN_BUFF; i++)begin
			output_benes_reg_R2M[i] <= 0;
			output_benes_reg_M2R[i].raddr <= 0;
			output_benes_reg_M2R[i].waddr <= 0;
			output_benes_reg_M2R[i].wdata <= 0;
			output_benes_reg_M2R[i].wren  <= 0;
		end
		end else begin
			output_benes_reg_R2M = output_benes_wire_R2M;
			output_benes_reg_M2R = output_benes_wire_M2R;
		end
end

network_module R2M(
	.clk(clk),
	.rst_n(rst_n),
	.i_port(input_benes_reg_R2M),
	.o_port(output_benes_wire_R2M),
	.switch_set(I_MODULE_SELECT)
);

type_network_module M2R(
	.clk(clk),
	.rst_n(rst_n),	
	.i_port(input_benes_reg_M2R),
	.o_port(output_benes_wire_M2R),
	.switch_set(I_SLOT_SELECT)
);


endmodule
