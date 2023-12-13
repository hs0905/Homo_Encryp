`timescale 1ps / 1ps

import USER_PKG::*;
import FHE_ALU_PKG::*;

module tb_intc_benes;

parameter CLK_PERIOD = 10;

logic clk;
logic rst_n;
logic [DATA_WIDTH-1:0]    i_ram_outputs		[0:SLOT_NUM_IN_BUFF-1];
logic [DATA_WIDTH-1:0]    o_module_inputs	[0:MODULE_NUM_IN_BUFF-1]; 	
logic [SWITCH_NUM-1:0]	  i_module_select	[0:STAGE_NUM-1];
logic [SWITCH_NUM-1:0]	  i_slot_select		[0:STAGE_NUM-1];
BufferRAMTEFsizeInputs 	  o_ram_inputs		[0:SLOT_NUM_IN_BUFF-1];
BufferRAMTEFsizeInputs 	  i_module_outputs[0:MODULE_NUM_IN_BUFF-1]; 

always begin
  clk = 1'b1;
  #(CLK_PERIOD/2);
  clk = 1'b0;
  #(CLK_PERIOD/2);
end

initial begin

rst_n = 1'b0;

#(CLK_PERIOD*10);

foreach(i_ram_outputs[i])   i_ram_outputs[i]   = 0;
foreach(i_module_select[i]) i_module_select[i] = 0;
foreach(i_slot_select[i])   i_slot_select[i]   = 0;
foreach(i_module_outputs[i]) begin
  i_module_outputs[i].raddr = 0;
  i_module_outputs[i].waddr = 0;
  i_module_outputs[i].wdata = 0;
  i_module_outputs[i].wren  = 0;
end

rst_n = 1'b1;

#(CLK_PERIOD*10);

for(int i = 0; i<)




end





Interconnect_benes DUT(
  .clk(clk),
  .rst_n(rst_n),
  .i_ram_outputs(i_ram_outputs),
  .i_module_outputs(i_module_outputs),
  .i_module_select(i_module_select),
  .i_slot_select(i_slot_select),
  .o_ram_inputs(o_ram_inputs),
  .o_module_inputs(o_module_inputs)
);


endmodule