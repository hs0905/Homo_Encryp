`timescale 1ns/1ps

import util_pack::*;

module packed_intc_benes#(
  parameter integer DATA_WIDTH  = 256,
  parameter integer PORT_NUM    = 32,
  parameter integer SWITCH_NUM  = PORT_NUM/2,
  parameter integer LAYER_NUM   = $clog2(PORT_NUM),
  parameter integer STAGE_NUM   = 2*($clog2(PORT_NUM)) - 1,
  parameter integer BUFFER_NUM  = STAGE_NUM - 1,
  parameter integer SLOT_NUM    = 32,
  parameter integer MOD_NUM     = 32,
  parameter integer DUMMY_NUM   = 12,
  parameter integer NON_DUMMY_NUM = MOD_NUM - DUMMY_NUM
)(
 input  logic CLK,
 input  logic RST_N,
 input  logic [0:NON_DUMMY_NUM -1][DATA_WIDTH-1:0]   I_RAM_OUTPUTS, 	
 input  logic [0:NON_DUMMY_NUM  -1][DATA_WIDTH-1:0]  I_MODULE_OUTPUTS, 
 input  logic [0:STAGE_NUM-1][0:SWITCH_NUM-1]	       I_MODULE_SELECT,
 input  logic [0:STAGE_NUM-1][0:SWITCH_NUM-1]	       I_SLOT_SELECT,
 output logic [0:NON_DUMMY_NUM -1][DATA_WIDTH-1:0]   O_RAM_INPUTS,
 output logic [0:NON_DUMMY_NUM -1][DATA_WIDTH-1:0]   O_MODULE_INPUTS
);

  logic [0:SLOT_NUM -1][DATA_WIDTH-1:0] i_ram_outputs_reg;
  logic [0:MOD_NUM  -1][DATA_WIDTH-1:0] i_module_outputs_reg;
  logic [0:STAGE_NUM-1][0:SWITCH_NUM-1] i_module_select_reg;
  logic [0:STAGE_NUM-1][0:SWITCH_NUM-1] i_slot_select_reg;

  logic [0:SLOT_NUM -1][DATA_WIDTH-1:0] o_ram_inputs_reg;
  logic [0:MOD_NUM  -1][DATA_WIDTH-1:0] o_module_inputs_reg;

always_ff@(posedge CLK or negedge RST_N) begin
  if(!RST_N) begin
    i_ram_outputs_reg     <= 0;
    i_module_outputs_reg  <= 0;
    i_module_select_reg   <= 0;
    i_slot_select_reg     <= 0;
  end else begin
    i_module_select_reg   <= I_MODULE_SELECT;
    i_slot_select_reg     <= I_SLOT_SELECT;
    for(int i = 0; i< NON_DUMMY_NUM; i++) begin
      i_ram_outputs_reg   [i] <= I_RAM_OUTPUTS[i];
      i_module_outputs_reg[i] <= I_MODULE_OUTPUTS[i];
    end
    for(int i = NON_DUMMY_NUM; i< MOD_NUM; i++) begin
      i_ram_outputs_reg   [i] <= 0;
      i_module_outputs_reg[i] <= 0;
    end
  end
end


logic [0:PORT_NUM-1][DATA_WIDTH-1:0] i_R2M;
logic [0:PORT_NUM-1][DATA_WIDTH-1:0] i_M2R; 

logic [0:PORT_NUM-1][DATA_WIDTH-1:0] o_R2M; 	
logic [0:PORT_NUM-1][DATA_WIDTH-1:0] o_M2R; 


always_ff@(posedge CLK or negedge RST_N) begin
  if(!RST_N) begin
    i_R2M <= 0;
    i_M2R <= 0;
  end else begin
    i_R2M <= i_ram_outputs_reg;
    i_M2R <= i_module_outputs_reg;
  end
end

always_ff@(posedge CLK or negedge RST_N) begin
  if(!RST_N) begin
    o_ram_inputs_reg    <= 0;
    o_module_inputs_reg <= 0;
  end else begin
    for(int i = 0; i< NON_DUMMY_NUM; i++)begin
    o_ram_inputs_reg    <= o_R2M;
    o_module_inputs_reg <= o_M2R;
    end
  end

end

assign O_RAM_INPUTS    = o_ram_inputs_reg;
assign O_MODULE_INPUTS = o_module_inputs_reg;



packed_network #(.DATA_WIDTH(DATA_WIDTH), .PORT_NUM(PORT_NUM), .SWITCH_NUM(SWITCH_NUM),
                 .LAYER_NUM(LAYER_NUM), .STAGE_NUM(STAGE_NUM), .BUFFER_NUM(BUFFER_NUM)
) ram_to_module(
    .CLK(CLK),
    .RST_N(RST_N),
    .SWITCH_SET(i_module_select_reg),
    .I_PORT(i_R2M),
    .O_PORT(o_R2M)
  );

packed_network #(.DATA_WIDTH(DATA_WIDTH), .PORT_NUM(PORT_NUM), .SWITCH_NUM(SWITCH_NUM),
                 .LAYER_NUM(LAYER_NUM), .STAGE_NUM(STAGE_NUM), .BUFFER_NUM(BUFFER_NUM)
) module_to_ram(
  .CLK(CLK),
  .RST_N(RST_N),
  .SWITCH_SET(i_slot_select_reg),
  .I_PORT(i_M2R),
  .O_PORT(o_M2R)
);





endmodule