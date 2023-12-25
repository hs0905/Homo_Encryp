package USER_PKG;

import FHE_ALU_PKG::*;

localparam  SIZE = 32; // number of ports
localparam  SWITCH_NUM = SIZE/2;
localparam  DATA_WIDTH = E * FSIZE; // data bit width
localparam  LAYER_NUM = $clog2(SIZE); 
localparam  STAGE_NUM = (LAYER_NUM*2)-1; // number of stages in 
localparam  BUFFER_NUM = STAGE_NUM - 1;
localparam  MID_STAGE = STAGE_NUM/2;
localparam  DATA_SIZE = FSIZE; // Fsize == 64
localparam  CYCLES = 2;
localparam  SLOT_NUM_IN_BUFF = SLOT_NUM; // Slot_num == 20 -> number of buffer ram slots
localparam  MODULE_NUM_IN_BUFF = MODULE_NUM; // module_num == 20 -> total number of arithmetic modules(rev_trans, add, mult, etc.)
localparam  STAGE_MODULE_8_IN_BUFF = 2; 
localparam  STAGE_SLOT_8_IN_BUFF = 2;
localparam  STAGE_MODULE_POWER_8_IN_BUFF = 8**STAGE_MODULE_8_IN_BUFF;// 8**2 = 64
localparam  STAGE_SLOT_POWER_8_IN_BUFF = 8**STAGE_SLOT_8_IN_BUFF; // 8**2 = 64


function int abs(int x);
    return (x < 0) ? -x : x;
endfunction
    
function int pow(int base, int exponent);
    automatic int result = 1;
    for (int i = 0; i < exponent; i = i + 1) begin
        result = result * base;
    end
    return result;
endfunction

function int out_sw(int stage, int p_out);
    automatic int port_pos = p_out % 2; // 0 : upper port, 1 : lower port
    automatic int layer = MID_STAGE - abs(stage -MID_STAGE);
    automatic int num_subnet = pow(2,layer);
    automatic int row_size = SIZE / num_subnet;
    automatic int subnet = p_out / row_size;
    automatic int subnet_pos = subnet %2;
    int p_in;
    if(stage < MID_STAGE) begin
        if(!port_pos)begin
            p_in = (p_out % row_size)/2 + (row_size/2)*(2*subnet);
        end else begin
            p_in = (p_out % row_size)/2 + (row_size/2)*(2*subnet+1);
        end
    end else if(stage >= MID_STAGE) begin
        if(!subnet_pos) begin
            p_in = (p_out % row_size)*2 + (subnet * row_size);
        end else begin
            p_in = (p_out % row_size)*2 + (subnet -1) * row_size +1 ;
        end
    end
    return p_in;
endfunction

  /*typedef struct packed{
  logic [31:0]        raddr;
  logic [31:0]        waddr;
  logic [E*FSIZE-1:0] wdata;
  logic               wren;
} BufferRAMTEFsizeInputs;*/

typedef struct packed {
 logic [DATA_WIDTH-1:0] i_ram_outputs   [0:SLOT_NUM_IN_BUFF-1];
 BufferRAMTEFsizeInputs	i_module_outputs[0:MODULE_NUM_IN_BUFF-1];
 logic [SWITCH_NUM-1:0]	i_module_select	[0:STAGE_NUM-1];
 logic [SWITCH_NUM-1:0]	i_slot_select	[0:STAGE_NUM-1];
} IntcBenesInputs;



endpackage