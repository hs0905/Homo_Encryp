`timescale 1 ns / 1 ns

`include "defines.vh"

package FHE_ALU_PKG;

// axi_sl_write input/output
typedef struct {
    logic [`AXI_SLAVE_ADDR_WIDTH-1:0]   awaddr;
    logic [1:0]                         awburst;
    logic [`AXI_SLAVE_ID_WIDTH-1:0]     awid;
    logic [7:0]                         awlen;
    logic [2:0]                         awsize;
    logic                               awvalid;
    logic                               bready;
    logic [`AXI_SLAVE_DATA_WIDTH-1:0]   wdata;
    logic                               wlast;
    logic [`DDR_DATA_WIDTH/8-1:0]       wstrb;
    logic                               wvalid;
} axi_sl_write_input;
    
typedef struct {
    logic                               awready;
    logic [`AXI_SLAVE_ID_WIDTH-1:0]     bid;
    logic [1:0]                         bresp;
    logic                               bvalid;
    logic                               wready;
} axi_sl_write_output;

// axi_sl_read input/output
typedef struct {
    logic [`AXI_SLAVE_ADDR_WIDTH-1:0]   araddr;
    logic [1:0]                         arburst;
    logic [`AXI_SLAVE_ID_WIDTH-1:0]     arid;
    logic [7:0]                         arlen;
    logic [2:0]                         arsize;
    logic                               arvalid;
    logic                               rready;
} axi_sl_read_input;
    
typedef struct {
    logic                               arready;
    logic [`AXI_SLAVE_DATA_WIDTH-1:0]   rdata;
    logic [`AXI_SLAVE_ID_WIDTH-1:0]     rid;
    logic                               rlast;
    logic [1:0]                         rresp;
    logic                               rvalid;
} axi_sl_read_output;


typedef struct packed {
    logic [`DDR_ADDR_WIDTH-1:0]     araddr;
    logic [1:0]                     arburst;
    logic [`DDR_ID_WIDTH-1:0]       arid;
    logic [7:0]                     arlen;
    logic [2:0]                     arsize;
    logic                           arvalid;
    logic [`DDR_ADDR_WIDTH-1:0]     awaddr;
    logic [1:0]                     awburst;
    logic [`DDR_ID_WIDTH-1:0]       awid;
    logic [7:0]                     awlen;
    logic [2:0]                     awsize;
    logic                           awvalid;
    logic                           bready;
    logic                           rready;
    logic [`DDR_DATA_WIDTH-1:0]     wdata;
    logic                           wlast;
    logic [`DDR_DATA_WIDTH/8-1:0]   wstrb;
    logic                           wvalid;
} axi_output;
    
typedef struct packed {
    logic                           arready;
    logic                           awready;
    logic [`DDR_ID_WIDTH-1:0]       bid;
    logic [1:0]                     bresp;
    logic                           bvalid;
    logic [`DDR_DATA_WIDTH-1:0]     rdata;
    logic [`DDR_ID_WIDTH-1:0]       rid;
    logic                           rlast;
    logic [1:0]                     rresp;
    logic                           rvalid;
    logic                           wready;
} axi_input;

    
typedef struct packed {
    logic arready;
    logic awready;
    logic [1:0]bresp;
    logic bvalid;
    logic [`GP_DATA_WIDTH-1:0]rdata;
    logic [1:0]rresp;
    logic rvalid;
    logic wready;
} axi_lite_input;
    
typedef struct packed {
    logic [`GP_ADDR_WIDTH-1:0]araddr;
    logic arvalid;
    logic [`GP_ADDR_WIDTH-1:0]awaddr;
    logic awvalid;
    logic bready;
    logic rready;
    logic [`GP_DATA_WIDTH-1:0]wdata;
    logic [`GP_DATA_WIDTH/8-1:0]wstrb;
    logic wvalid;
} axi_lite_output;

typedef struct packed {
    logic [`DDR_ADDR_WIDTH-1:0]     awaddr;
    logic [1:0]                     awburst;
    logic [`DDR_ID_WIDTH-1:0]       awid;
    logic [7:0]                     awlen;
    logic [2:0]                     awsize;
    logic                           awvalid;
    logic                           bready;
    logic [`DDR_DATA_WIDTH-1:0]     wdata;
    logic                           wlast;
    logic [`DDR_DATA_WIDTH/8-1:0]   wstrb;
    logic                           wvalid;
} axi_write_output;
    
typedef struct packed {
    logic [`DDR_ADDR_WIDTH-1:0]     araddr;
    logic [1:0]                     arburst;
    logic [`DDR_ID_WIDTH-1:0]       arid;
    logic [7:0]                     arlen;
    logic [2:0]                     arsize;
    logic                           arvalid;
    logic                           rready;
} axi_read_output;

typedef struct packed {
    logic                           awready;
    logic [`DDR_ID_WIDTH-1:0]       bid;
    logic [1:0]                     bresp;
    logic                           bvalid;
    logic                           wready;
} axi_write_input;

typedef struct packed {
    logic                           arready;
    logic [`DDR_DATA_WIDTH-1:0]     rdata;
    logic [`DDR_ID_WIDTH-1:0]       rid;
    logic                           rlast;
    logic [1:0]                     rresp;
    logic                           rvalid;
} axi_read_input;



typedef struct packed {
    logic [`DDR_ADDR_WIDTH-1:0]     awaddr;
    logic [1:0]                     awburst;
    logic [`DDR_ID_WIDTH-1:0]       awid;
    logic [7:0]                     awlen;
    logic [2:0]                     awsize;
    logic                           awvalid;
    logic                           bready;
    logic                           wlast;
    logic                           wvalid;
} axi_write_output_nodata;

typedef struct packed {
    logic                           arready;
    logic                           rlast;
    logic [1:0]                     rresp;
    logic                           rvalid;
} axi_read_input_nodata;


localparam IN_BUFFER_SIZE = 32'h1000;      //4096
localparam OP_WORDS_MAX = 4096;
localparam STACK_BUFFER_SIZE = 32;

localparam AXI_IN_FMAP_LOAD_ADDR  = 32'h10000000;


localparam AXI_LITE_WORD_WIDTH	= 32; //axi lite data width
localparam AXI_LITE_ARG_NUM	  = 8;

localparam COMMAND_WIDTH=8;
localparam FSIZE=64;
localparam FSIZE_RAM=64;
localparam SSIZE=16;
localparam STATE_WIDTH=64;
localparam PCIe_DATA_WIDTH=512;

localparam E = 8;
localparam logE =3;


typedef struct  packed {
  logic valid;
  logic [COMMAND_WIDTH-1:0] command;
  logic [AXI_LITE_WORD_WIDTH-1:0] data0;//FSIZE
  logic [AXI_LITE_WORD_WIDTH-1:0] data1;//FSIZE
} CommandDataPort;

typedef struct  packed {
  logic [AXI_LITE_WORD_WIDTH-1:0] state0;//FSIZE
  logic [AXI_LITE_WORD_WIDTH-1:0] state1;//FSIZE
  logic [AXI_LITE_WORD_WIDTH-1:0] state2;//FSIZE
  logic [AXI_LITE_WORD_WIDTH-1:0] state3;//FSIZE
} StatePort;

typedef struct packed{
  logic [31:0]        raddr;
  logic [31:0]        waddr;
  logic [FSIZE-1:0]   wdata;
  logic               wren;
} BufferRAMTFsizeInputs;


typedef struct packed{
  logic [31:0]        raddr0;
  logic [31:0]        raddr1;
  logic [31:0]        waddr;
  logic [FSIZE-1:0]   wdata;
  logic               wren;
} BufferRAMTFsizeInputsR2W1;


typedef struct packed{
  logic [31:0]        raddr;
  logic [31:0]        waddr;
  logic [E*FSIZE-1:0] wdata;
  logic               wren;
} BufferRAMTEFsizeInputs;

// typedef struct packed{
//   reg [31:0]        raddr;
//   reg [31:0]        waddr;
//   reg [E*FSIZE-1:0] wdata;
//   reg               wren;
// } BufferRAMTEFsizeInputs_reg;


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

localparam COMMAND_RESET = 1;
localparam COMMAND_SET_BACKGROUND1 = 22;
localparam COMMAND_SET_BACKGROUND2 = 23;
localparam COMMAND_SET_BACKGROUND3 = 24;

// localparam COMMAND_BUTTER_W  = 10;
// localparam COMMAND_BUTTER_P  = 11;
// localparam COMMAND_BUTTER_A  = 12;

localparam COMMAND_NTT_W  = 44;
localparam COMMAND_NTT_WQ = 2;
localparam COMMAND_NTT_P  = 3;
localparam COMMAND_NTT_A  = 4;
localparam COMMAND_NTT_GET  = 6;
localparam COMMAND_NTT_A_DMA  = 10;
localparam COMMAND_NTT_GET_DMA  = 11;
localparam COMMAND_NTT_W_DMA = 12;
localparam COMMAND_NTT_WQ_DMA = 18;
// localparam COMMAND_INTT_W_DMA = 19;
//localparam COMMAND_INTT_WQ_DMA = 21;

// localparam COMMAND_IBUTTER_W  = 10;
// localparam COMMAND_IBUTTER_P  = 11;
// localparam COMMAND_IBUTTER_A  = 12;
// localparam COMMAND_IBUTTER_SCALAR  = 13;

// localparam COMMAND_INTT_W  = 30;
// localparam COMMAND_INTT_P  = 31;
// localparam COMMAND_INTT_SCALAR  = 35;
// localparam COMMAND_INTT_A  = 32;
localparam COMMAND_NTT_RUN1  = 5;
localparam COMMAND_NTT_RUN2  = 43;
localparam COMMAND_INTT_RUN1  = 33;
localparam COMMAND_INTT_RUN2  = 45;
// localparam COMMAND_INTT_GET  = 34;

localparam COMMAND_BITREVERSE  = 7;
localparam COMMAND_TRANSPOSE  = 8;
localparam COMMAND_PERM_PATTERN  = 9;
localparam COMMAND_PERM_PATTERN_GENERATE  = 40;

localparam COMMAND_VECTOR_MULT_MOD1 = 13;
localparam COMMAND_VECTOR_MULT_MOD2 = 26;
localparam COMMAND_VECTOR_SCALAR_MULT_MOD1 = 14;
localparam COMMAND_VECTOR_SCALAR_MULT_MOD2 = 15;
localparam COMMAND_VECTOR_SCALAR_MULT_MOD3 = 25;
localparam COMMAND_VECTOR_ADD_MOD = 16;
localparam COMMAND_VECTOR_ADD_MOD_SCALAR = 17;
localparam COMMAND_VECTOR_BARRETT_REDUCTION1 = 27;
localparam COMMAND_VECTOR_BARRETT_REDUCTION2 = 28;
localparam COMMAND_VECTOR_LAZY_REDUCTION = 30;
localparam COMMAND_VECTOR_DECOMP = 34;
localparam COMMAND_DDR_LOAD_START = 31;
localparam COMMAND_DDR_STORE_START = 32;
localparam COMMAND_AUTO1 = 35;
localparam COMMAND_AUTO2 = 36;
localparam COMMAND_SET_UNIT = 37;


// localparam COMMAND_SET_SLOT1 = 20;
// localparam COMMAND_SET_SLOT2 = 21;
localparam COMMAND_SET_MODULE1 = 20;
localparam COMMAND_SET_MODULE2 = 21;
localparam COMMAND_SET_RAM1 = 38;
localparam COMMAND_SET_RAM2 = 39;
localparam COMMAND_SET_SLOT_NTT = 41;
localparam COMMAND_SET_SLOT_ROOT = 42;


localparam VECTOR_OPERATION_MULT = 1;
localparam VECTOR_OPERATION_SCALAR_MULT = 2;
localparam VECTOR_OPERATION_ADD = 3;
localparam VECTOR_OPERATION_SCALAR_ADD = 4;
localparam VECTOR_VECTOR_BARRETT_REDUCTION = 5;
localparam VECTOR_OPERATION_LAZY_REDUCTION = 6;
localparam VECTOR_OPERATION_DECOMP_REDUCTION = 7;

localparam STATE_IDLE = 0;

localparam MUL_LATENCY = 3;
localparam ADD_LATENCY = 1;

localparam MULT_CYCLES = 18;
localparam MULT_CYCLES_128 = 50;

localparam VSIZE = 4;

////////////////////////////////////////////////////////////////////////////////////////
localparam N_13 = 8192;
localparam logN_13 =13;
//localparam N = 16384;
//localparam logN =14;
localparam N = 32768;
localparam logN =15;



//logN, N <- host_program
//localparam  skip_level =  2;  //(logE - (logN % logE))
// localparam skip_level_dma = ((logE - (logN % logE)) == logE) ? 0 : logE - (logN % logE) ; //3 - (14 % 3) = 1

// //localparam intt_base_level_ref =  4'b1110; //2^13  13 - 3*5 = -2
// localparam signed [logE+1:0] intt_base_level_ref = (((logN % logE) -logE) == -logE) ? 0 : (logN % logE) -logE ;//(logN % logE) -logE;//4'b1111; //2^14 logN - logE -logE... while intt_base_level_ref < 0 14 - 3*5 = -1

// localparam dma_buffer_size = 128 * 1024;

// localparam num_dma_last = (N * 8) / dma_buffer_size;
////////////////////////////////////////////////////////////////////////////////////////

localparam BUTTER_CYCLES = MULT_CYCLES*2+2;
localparam IBUTTER_CYCLES = MULT_CYCLES*2+2+1;



///localparam NTT_SLOTS = 20; //lazy reduction
localparam MODULE_SLOTS = 22;
localparam NTT_SLOTS = 22;
localparam ROOT_SLOTS = 4;
localparam NTT_INTT_SLOTS = 4;

localparam BUFFER_READ_LATENCY=2;
localparam BUFFER_READ_DELAY=5;
localparam BUFFER_WRITE_DELAY=2;

localparam STAGE_MODULE=5;
localparam STAGE_MODULE_POWER=32;

localparam STAGE_NTT=2;
localparam STAGE_NTT_POWER=4;




////////////////////fpga_rnn
typedef struct {
    logic [31:0]	arg1;
    logic [31:0]	arg2;
    logic [31:0]	arg3;
    logic [31:0]	arg4;
    logic [31:0]	arg5;
    logic [31:0]	arg6;
    logic [31:0]	arg7;
    logic [31:0]	arg8;
    logic [31:0]	arg9;
    logic [31:0]	arg10;
    logic [31:0]	arg11;
    logic [31:0]	arg12;
    logic [31:0]	arg13;
    logic [31:0]	arg14;
    logic [31:0]	arg15;
} kernel_engine_arg;

localparam WORD_SIZE = 32;

endpackage: FHE_ALU_PKG

