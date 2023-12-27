`timescale 1 ns / 1 ns

`include "defines.vh"

package FHE_ALU_PKG;

localparam DDR_WIDTH_BYTE         = 64;
localparam IN_BUFFER_SIZE         = 32'h1000;      //4096
localparam STACK_BUFFER_SIZE      = 32;
localparam AXI_IN_FMAP_LOAD_ADDR  = 32'h10000000;

localparam COMMAND_WIDTH          = 8;
localparam FSIZE_60               = 62;
localparam FSIZE                  = 64;
localparam SSIZE                  = 16;
localparam STATE_WIDTH            = 32;
localparam E                      = 8;

typedef struct packed {
  logic                     valid;
  logic [COMMAND_WIDTH-1:0] command;
  logic [FSIZE-1:0]         data0;
  logic [FSIZE-1:0]         data1;
} CommandDataPort;

typedef struct  packed {
  logic [FSIZE-1:0]         state0;
  logic [FSIZE-1:0]         state1;
  logic [FSIZE-1:0]         state2;
  logic [FSIZE-1:0]         state3;
} StatePort;


typedef struct packed{
  logic [31:0]              raddr;
  logic [31:0]              waddr;
  logic [FSIZE-1:0]         wdata;
  logic                     wren;
} BufferRAMTFsizeInputs;


typedef struct packed{
  logic [31:0]        raddr0;
  logic [31:0]        raddr1;
  logic [31:0]        waddr;
  logic [FSIZE-1:0]   wdata;
  logic               wren;
} BufferRAMTFsizeInputsR2W1;

typedef struct packed{
  logic [31:0]        raddr0;
  logic [31:0]        raddr1;
  logic [31:0]        waddr0;
  logic [FSIZE-1:0]   wdata0;
  logic               wren0;
  logic [31:0]        waddr1;
  logic [FSIZE-1:0]   wdata1;
  logic               wren1;
} BufferRAMTFsizeInputsR2W2;

typedef struct packed{
  logic [31:0]        raddr;
  logic [31:0]        waddr;
  logic [511:0] wdata;
  logic               wren;
} BufferRAMTEFsizeInputs;


typedef struct packed{
  logic [31:0]        raddr0;
  logic [31:0]        raddr1;
  logic [31:0]        raddr2;
  logic [31:0]        waddr;
  logic [FSIZE-1:0]   wdata;
  logic               wren;
} BufferRAMTFsizeInputsR3W1;

typedef struct packed{
  logic [31:0]        raddr0;
  logic [31:0]        raddr1;
  logic [31:0]        raddr2;
  logic [31:0]        raddr3;
  logic [31:0]        waddr;
  logic [FSIZE-1:0]   wdata;
  logic               wren;
} BufferRAMTFsizeInputsR4W1;

typedef struct packed{
  logic [FSIZE-1:0]   rdata;
} BufferRAMTFsizeOutputs;


typedef struct packed{
  logic [31:0]        raddr;
  logic [31:0]        waddr;
  logic [SSIZE-1:0]   wdata;
  logic               wren;
} BufferRAMTSsizeInputs;

typedef struct packed{
  logic [SSIZE-1:0]   rdata;
} BufferRAMTSsizeOutputs;

localparam COMMAND_RESET = 111;

// localparam COMMAND_BUTTER_W  = 10;
// localparam COMMAND_BUTTER_P  = 11;
// localparam COMMAND_BUTTER_A  = 12;

localparam COMMAND_NTT_W  = 1;
localparam COMMAND_NTT_WQ = 2;
localparam COMMAND_NTT_P  = 3;
localparam COMMAND_NTT_A  = 4;
localparam COMMAND_NTT_GET_PE_SELECT  = 5;
localparam COMMAND_NTT_GET  = 6;
localparam COMMAND_NTT_A_DMA  = 10;
localparam COMMAND_NTT_GET_DMA  = 11;

localparam COMMAND_SET_BACKGROUND1  = 12;
localparam COMMAND_SET_BACKGROUND2  = 13;

// localparam COMMAND_IBUTTER_W  = 10;
// localparam COMMAND_IBUTTER_P  = 11;
// localparam COMMAND_IBUTTER_A  = 12;
// localparam COMMAND_IBUTTER_SCALAR  = 13;

// localparam COMMAND_INTT_W  = 30;
// localparam COMMAND_INTT_P  = 31;
// localparam COMMAND_INTT_SCALAR  = 35;
// localparam COMMAND_INTT_A  = 32;


// localparam COMMAND_INTT_GET  = 34;

// prepare
localparam COMMAND_VECTOR_MULT_MOD_PQ       = 59;
localparam COMMAND_BITREVERSE1              = 60;
localparam COMMAND_TRANSPOSE1               = 61;
localparam COMMAND_PERM_PATTERN1            = 62;
localparam COMMAND_AUTO1                    = 63;
localparam COMMAND_VECTOR_ADD_MOD1          = 64;
localparam COMMAND_VECTOR_ADD_MOD_SCALAR1   = 65;
localparam COMMAND_VECTOR_MULT_MOD1         = 66;
localparam COMMAND_VECTOR_SCALAR_MULT_MOD1  = 67;
localparam COMMAND_VECTOR_BARRETT_REDUCTION1= 68;
localparam COMMAND_VECTOR_LAZY_REDUCTION1   = 69;
localparam COMMAND_SET_UNIT1                = 70;
localparam COMMAND_VECTOR_DECOMP1           = 71;
localparam COMMAND_VECTOR_SUB1              = 72;
localparam COMMAND_NTT_RUN1  = 41;
localparam COMMAND_NTT_RUN2  = 42;
localparam COMMAND_NTT_RUN3  = 43;
localparam COMMAND_NTT_RUN4  = 44;
localparam COMMAND_INTT_RUN1  = 51;
localparam COMMAND_INTT_RUN2  = 52;
localparam COMMAND_INTT_RUN3  = 53;
localparam COMMAND_INTT_RUN4  = 54;
localparam COMMAND_MULTI_NTT_RUN1  = 55;
localparam COMMAND_MULTI_NTT_RUN2  = 56;
localparam COMMAND_MULTI_INTT_RUN1  = 57;
localparam COMMAND_MULTI_INTT_RUN2  = 58;
localparam COMMAND_BITREVERSE2  = 80;
localparam COMMAND_TRANSPOSE2  = 81;
localparam COMMAND_PERM_PATTERN2  = 82;
localparam COMMAND_AUTO2 = 83;
localparam COMMAND_VECTOR_ADD_MOD2 = 84;
localparam COMMAND_VECTOR_ADD_MOD_SCALAR2 = 85;
localparam COMMAND_VECTOR_MULT_MOD2 = 86;
localparam COMMAND_VECTOR_SCALAR_MULT_MOD2 = 87;
localparam COMMAND_VECTOR_BARRETT_REDUCTION2 = 88;
localparam COMMAND_VECTOR_LAZY_REDUCTION2 = 89;
localparam COMMAND_SET_UNIT2 = 90;
localparam COMMAND_VECTOR_DECOMP2 = 91;
localparam COMMAND_VECTOR_SUB2 = 92;


localparam COMMAND_SET_MODULE1 = 20;
localparam COMMAND_SET_MODULE2 = 21;
localparam COMMAND_SET_MODULE3 = 22;
localparam COMMAND_SET_RAM1 = 23;
localparam COMMAND_SET_RAM2 = 24;
localparam COMMAND_SET_RAM3 = 25;
localparam COMMAND_SET_RAM4 = 26;
localparam COMMAND_SET_SLOT_NTT = 27;
localparam COMMAND_SET_SLOT_ROOT = 28;
localparam COMMAND_SET_RING = 29;


localparam VECTOR_OPERATION_MULT = 1;
localparam VECTOR_OPERATION_SCALAR_MULT = 2;
localparam VECTOR_VECTOR_BARRETT_REDUCTION = 5;
localparam VECTOR_OPERATION_ADD = 3;
localparam VECTOR_OPERATION_SCALAR_ADD = 4;
localparam VECTOR_OPERATION_LAZY_REDUCTION = 6;
localparam VECTOR_OPERATION_DECOMP_REDUCTION = 7;
localparam VECTOR_OPERATION_SUB = 8;


localparam STATE_IDLE = 0;

localparam MUL_LATENCY = 3;
localparam ADD_LATENCY = 1;

localparam MULT_CYCLES = 18;
localparam MULT_CYCLES_60 = 18;
localparam MULT_CYCLES_128 = 50;

localparam VSIZE = 4;
localparam N     = 65536;
localparam logN  = 16;



localparam BUTTER_CYCLES = MULT_CYCLES*2+2;
localparam BUTTER_CYCLES_60 = MULT_CYCLES_60*2+2;
localparam IBUTTER_CYCLES = MULT_CYCLES*2+2+1;

// localparam SLOT_NUM = 2;
localparam PE_CNT = 2;

localparam REV_TRANS_MODULE_NUM = 1;
localparam PERM_MODULE_NUM = 1;
localparam AUTO_MODULE_NUM = 1;
localparam NTT_MODULE_NUM = 2;
localparam INTT_MODULE_NUM = 2;
localparam ADD_MODULE_NUM = 1;
localparam MULTI_MODULE_NUM = 1;
localparam LAZY_MODULE_NUM = 1;
localparam SET_UINT_MODULE_NUM = 1;
localparam DECOMP_MODULE_NUM = 1;

localparam MODULE_NUM = (1 + REV_TRANS_MODULE_NUM + PERM_MODULE_NUM*2 + AUTO_MODULE_NUM
                                  + NTT_MODULE_NUM + INTT_MODULE_NUM
                                  + ADD_MODULE_NUM*2 + MULTI_MODULE_NUM*2
                                  + LAZY_MODULE_NUM*4 + SET_UINT_MODULE_NUM*2 + DECOMP_MODULE_NUM);
localparam STAGE_MODULE = $clog2(MODULE_NUM);
localparam STAGE_MODULE_POWER = 2**STAGE_MODULE;

localparam STAGE_MODULE_4 = 3;
localparam STAGE_MODULE_POWER_4 = 4**STAGE_MODULE_4;

localparam STAGE_MODULE_8 = 2;
localparam STAGE_MODULE_POWER_8 = 8**STAGE_MODULE_8;

localparam STAGE_MODULE_DELAY = STAGE_MODULE_8 - 1;

localparam SLOT_NUM = 20; // number of buffer ram slot
localparam STAGE_SLOT = $clog2(SLOT_NUM);
localparam STAGE_SLOT_POWER = 2**STAGE_SLOT;

localparam STAGE_SLOT_4 = 3;
localparam STAGE_SLOT_POWER_4 = 4**STAGE_SLOT_4;

localparam STAGE_SLOT_8 = 2;
localparam STAGE_SLOT_POWER_8 = 8**STAGE_SLOT_8;

localparam STAGE_SLOT_DELAY = STAGE_SLOT_8 - 1;

localparam NTT_INTT_NUM = NTT_MODULE_NUM + INTT_MODULE_NUM; //number of ntt and intt module
localparam STAGE_NTT_INTT = $clog2(NTT_INTT_NUM);
localparam STAGE_NTT_INTT_POWER = 2**STAGE_NTT_INTT;
localparam STAGE_NTT_INTT_DELAY = STAGE_NTT_INTT - 1;

localparam ROOT_POWER_NUM = 4; //number of rootpower
localparam STAGE_ROOT_POWER = $clog2(ROOT_POWER_NUM);
localparam STAGE_ROOT_POWER_POWER = 2**STAGE_ROOT_POWER;
localparam STAGE_ROOT_POWER_DELAY = STAGE_ROOT_POWER - 1;

localparam RING_ROUTER_DELAY = 2;

localparam BUFFER_READ_LATENCY = 2;
localparam BUFFER_READ_DELAY = 5;
localparam BUFFER_WRITE_DELAY=  2;
localparam SLOT_DELAY=3;

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

typedef struct{
  logic [511:0] 	        i_ram_outputs   [0:SLOT_NUM_IN_BUFF-1];
  BufferRAMTEFsizeInputs	i_module_outputs[0:MODULE_NUM_IN_BUFF-1];
  logic [15:0]	          i_module_select	[0:STAGE_NUM-1];
  logic [15:0]	          i_slot_select	  [0:STAGE_NUM-1];
} IntcBenesInputs;

typedef struct{
	BufferRAMTEFsizeInputs 	o_ram_inputs	  [0:SLOT_NUM_IN_BUFF-1];
	logic [511:0]           o_module_inputs	[0:MODULE_NUM_IN_BUFF-1];
} IntcBenesOutputs;


endpackage: FHE_ALU_PKG

