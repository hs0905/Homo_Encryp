`timescale 1 ns / 1 ns

`include "defines.vh"
import FHE_ALU_PKG::*;

module fhe_ntt2 #(
        parameter SIM_MODE        = 0
	) (
		input logic	clk,		    		
		input logic rstn,			

    input CommandDataPort commanddataport,
    output logic [FSIZE-1:0] stateport0,
    output logic [FSIZE-1:0] stateport1
	);


  `ifdef verilator
  logic[31:0] debug;
  initial begin
    debug = 0;
  end
  `endif  


  localparam STATE_RUNNING = 1;
  localparam STATE_WAIT = 2;
  localparam STATE_BITREVERSE = 3;
  localparam STATE_NTT_STORE_DMA = 4;
  // localparam STATE_NTT_LOAD_P = 5;
  // localparam STATE_NTT_LOAD_WQ = 6;
  localparam STATE_NTT_LOAD_A = 7;
  localparam STATE_PERM = 8;
  localparam STATE_NTT_A_DMA = 9;
  
  
  localparam VALID_IDLE = 0;
  localparam VALID_NORMAL = 1;
  localparam VALID_PHASE_END = 2;

  localparam VSIZE = 2;

  // //ROOT_POWER

  //SLOT_RAM
  // not module slot => ram slot
  BufferRAMTEFsizeInputs NTT_ram_inputs[0:PE_CNT*SLOT_NUM-1];
  logic [E*FSIZE-1:0] NTT_ram_outputs_rdata[0:PE_CNT*SLOT_NUM-1];

  genvar gi, gj;
  generate
  for(gi = 0; gi < PE_CNT*SLOT_NUM; gi++) begin : SLOT
    BufferRAMTEFsize #(
      .ID(2),
      .DEPTH(N/E)
    )  NTT_ram(
      .clk(clk),
      .inputs(NTT_ram_inputs[gi]),
      .rdata(NTT_ram_outputs_rdata[gi])
    );
  end
  endgenerate

  
  typedef struct packed {
    logic [7:0] state;


    logic [FSIZE-1:0] W;
    logic [FSIZE-1:0] WQ;
    logic [FSIZE-1:0] a;
    logic [FSIZE-1:0] b;
    logic [FSIZE-1:0] a_out;
    logic [FSIZE-1:0] b_out;
    
    logic [$clog2(N)-1:0] W_addr;
    logic [$clog2(N/E)-1:0] NTT_addr;
    logic [$clog2(N)-1:0] ntt_raddr0;

    logic [$clog2(N)-1:0] m;
    logic [$clog2(N)-1:0] i;
    logic [$clog2(N)-1:0] j;
    logic [$clog2(N)-1:0] gap;
    logic [$clog2(N)-1:0] rootidx;
    logic [$clog2(N)-1:0] offset;
    
    
    logic NTT_in;
    logic [E-1:0] [FSIZE-1:0]NTT_A;
    logic [$clog2(E)-1:0] NTT_A_idx;
    logic [FSIZE-1:0] NTT_read_data;

    logic [logE-1:0] NTT_levels;
    logic [logN-1:0] NTT_base_level;
    logic [NTT_MODULE_NUM-1:0] ntt_module_select;

    logic [3:0] soft_rst_count;

    logic [$clog2(N)-1:0] ntt_store_idx;
    logic [$clog2(N)-1:0] ntt_load_idx;

    logic state_STATE_NTT_A_DMA;
    logic state_STATE_NTT_STORE_DMA;

    logic [PE_CNT-1:0][REV_TRANS_MODULE_NUM-1:0] state_STATE_WAIT_BITREV;
    logic [PE_CNT-1:0][REV_TRANS_MODULE_NUM-1:0] state_STATE_RUN_BITREV;
    logic [PE_CNT-1:0][PERM_MODULE_NUM-1:0] state_STATE_WAIT_PERM;
    logic [PE_CNT-1:0][PERM_MODULE_NUM-1:0] state_STATE_RUN_PERM;
    logic [PE_CNT-1:0][AUTO_MODULE_NUM-1:0] state_STATE_WAIT_AUTO;
    logic [PE_CNT-1:0][AUTO_MODULE_NUM-1:0] state_STATE_RUN_AUTO;
    logic [PE_CNT-1:0][NTT_MODULE_NUM-1:0] state_STATE_WAIT_NTT;
    logic [PE_CNT-1:0][NTT_MODULE_NUM-1:0] state_STATE_RUN_NTT;
    logic [PE_CNT-1:0][INTT_MODULE_NUM-1:0] state_STATE_WAIT_INTT;
    logic [PE_CNT-1:0][INTT_MODULE_NUM-1:0] state_STATE_RUN_INTT;
    logic [PE_CNT-1:0][ADD_MODULE_NUM-1:0] state_STATE_WAIT_ADD;//ADD
    logic [PE_CNT-1:0][ADD_MODULE_NUM-1:0] state_STATE_RUN_ADD;
    logic [PE_CNT-1:0][MULTI_MODULE_NUM-1:0] state_STATE_WAIT_MULTI;//MULTI
    logic [PE_CNT-1:0][MULTI_MODULE_NUM-1:0] state_STATE_RUN_MULTI;
    logic [PE_CNT-1:0][LAZY_MODULE_NUM-1:0] state_STATE_WAIT_LAZY;//LAZY
    logic [PE_CNT-1:0][LAZY_MODULE_NUM-1:0] state_STATE_RUN_LAZY;
    logic [PE_CNT-1:0][SET_UINT_MODULE_NUM-1:0] state_STATE_WAIT_SET_UINT;//SET_UINT
    logic [PE_CNT-1:0][SET_UINT_MODULE_NUM-1:0] state_STATE_RUN_SET_UINT;
    logic [PE_CNT-1:0][DECOMP_MODULE_NUM-1:0] state_STATE_WAIT_DECOMP; //DECOMP
    logic [PE_CNT-1:0][DECOMP_MODULE_NUM-1:0] state_STATE_RUN_DECOMP;
    //logic [module_num-1:0] state_STATE_wait_
    //logic [module_num-1:0] state_STATE_running_
    
    // logic start_vector;
    logic [PE_CNT-1:0][REV_TRANS_MODULE_NUM-1:0] start_bitRev;
    logic [PE_CNT-1:0][REV_TRANS_MODULE_NUM-1:0] start_transpose;
    logic [PE_CNT-1:0][PERM_MODULE_NUM-1:0] start_perm;
    logic [PE_CNT-1:0][NTT_MODULE_NUM-1:0] start_NTT;
    logic [PE_CNT-1:0][INTT_MODULE_NUM-1:0] start_iNTT;
    logic [PE_CNT-1:0][AUTO_MODULE_NUM-1:0] start_auto;
    logic [PE_CNT-1:0][ADD_MODULE_NUM-1:0] start_vector_add;
    logic [PE_CNT-1:0][MULTI_MODULE_NUM-1:0] start_vector_multi;
    logic [PE_CNT-1:0][LAZY_MODULE_NUM-1:0] start_vector_lazy;
    logic [PE_CNT-1:0][SET_UINT_MODULE_NUM-1:0] start_set_uint;
    logic [PE_CNT-1:0][DECOMP_MODULE_NUM-1:0] start_vector_decomp;
    //logic [module_num-1:0] start_
    
    logic [3:0] vector_operation;

    logic [FSIZE-1:0] p;
    logic [FSIZE-1:0] scalar;
    logic [FSIZE-1:0] pq0;
    logic [FSIZE-1:0] pq1;

    logic [logN-logE-1:0] transpose_base;
    logic [logE-1:0] barrel_store, barrel_load;

    logic [15:0] perm_pattern;

    logic [logE-1:0] auto_offset;
    logic [logN-1:0] auto_base;
    logic [FSIZE-1:0] k;

    logic [PE_CNT-1:0][SLOT_NUM-1:0][$clog2(MODULE_NUM)-1:0] module_select;
    logic [PE_CNT-1:0][MODULE_NUM-1:0][$clog2(SLOT_NUM)-1:0] slot_select;
    //module_slot => load, store to/from host and ddr + sum of every module num

    logic [PE_CNT-1:0][ROOT_POWER_NUM-1:0][$clog2(NTT_INTT_NUM)-1:0] ntt_intt_select;
    logic [PE_CNT-1:0][NTT_INTT_NUM-1:0][$clog2(ROOT_POWER_NUM)-1:0] root_select;
    //NTT_INTT_NUM = ntt module num + intt module num

    logic [PE_CNT-1:0] pe_select;
    logic [PE_CNT*SLOT_NUM-1:0] ring_writing;
    logic [PE_CNT*SLOT_NUM-1:0] ring_reading;

    //COMMAND_SET_BACKGROUND
    logic [31:0] host_N;
    logic [logN:0] host_logN;
    logic [logE-1:0] diff_logN;
  } Registers;
    
  Registers reg_current,reg_next;

  BufferRAMTEFsizeInputs  router_inputs[0:PE_CNT*SLOT_NUM-1];
  logic [E*FSIZE-1:0]   router_outputs[0:PE_CNT*SLOT_NUM-1];
  logic router_working;

  ring_router_v2 #(
        // param set
        .SLOT_NUM_IN_RING(PE_CNT*SLOT_NUM)
	) ring_router(	
		.clk(clk),		    		
		.rstn(rstn),		

    //intc <=> router
    .router_inputs(router_inputs),
    .router_outputs(router_outputs),

    //router <=> slot
    .ram_inputs(NTT_ram_inputs),
    .ram_outputs(NTT_ram_outputs_rdata),

    .ring_writing(reg_current.ring_writing),
    .ring_reading(reg_current.ring_reading),

    .working(router_working)
  );

  // host <-> fpga
  BufferRAMTEFsizeInputs  module_outputs[0:PE_CNT-1];
  logic [E*FSIZE-1:0]   module_inputs[0:PE_CNT-1];

  // module_buff_set write
  logic [logE-1:0][$clog2(N/(E/2))-1:0]     ntt_input_W_waddr[0:PE_CNT-1];
  logic [logE-1:0][E/2-1:0][FSIZE-1:0]      ntt_input_W_wdata[0:PE_CNT-1];
  logic [logE-1:0][E/2-1:0]                 ntt_input_W_wren[0:PE_CNT-1];
  logic [logE-1:0][$clog2(N/(E/2))-1:0]     ntt_input_WQ_waddr[0:PE_CNT-1];
  logic [logE-1:0][E/2-1:0][FSIZE-1:0]      ntt_input_WQ_wdata[0:PE_CNT-1];
  logic [logE-1:0][E/2-1:0]                 ntt_input_WQ_wren[0:PE_CNT-1];

  logic bitRev_working [0:PE_CNT-1][0:REV_TRANS_MODULE_NUM-1];
  logic perm_working [0:PE_CNT-1][0:PERM_MODULE_NUM-1];
  logic auto_working [0:PE_CNT-1][0:AUTO_MODULE_NUM-1];
  logic NTT_working [0:PE_CNT-1][0:NTT_MODULE_NUM-1];
  logic iNTT_working [0:PE_CNT-1][0:INTT_MODULE_NUM-1];
  logic vector_add_working [0:PE_CNT-1][0:ADD_MODULE_NUM-1];
  logic vector_multi_working [0:PE_CNT-1][0:MULTI_MODULE_NUM-1];
  logic vector_lazy_working [0:PE_CNT-1][0:LAZY_MODULE_NUM-1];
  logic set_uint_working [0:PE_CNT-1][0:SET_UINT_MODULE_NUM-1];
  logic vector_decomp_working [0:PE_CNT-1][0:DECOMP_MODULE_NUM-1];

  BufferRAMTEFsizeInputs  module_set_outputs[0:PE_CNT-1][0:SLOT_NUM-1];
  logic [E*FSIZE-1:0]   module_set_inputs[0:PE_CNT-1][0:SLOT_NUM-1];

  module_set #(
        // param set
        .REV_TRANS_MODULE_NUM_IN_SET(REV_TRANS_MODULE_NUM),
        .PERM_MODULE_NUM_IN_SET(PERM_MODULE_NUM),
        .AUTO_MODULE_NUM_IN_SET(AUTO_MODULE_NUM),
        .NTT_MODULE_NUM_IN_SET(NTT_MODULE_NUM),
        .INTT_MODULE_NUM_IN_SET(INTT_MODULE_NUM),
        .ADD_MODULE_NUM_IN_SET(ADD_MODULE_NUM),
        .MULTI_MODULE_NUM_IN_SET(MULTI_MODULE_NUM),
        .LAZY_MODULE_NUM_IN_SET(LAZY_MODULE_NUM),
        .SET_UINT_MODULE_NUM_IN_SET(SET_UINT_MODULE_NUM),
        .DECOMP_MODULE_NUM_IN_SET(DECOMP_MODULE_NUM)
	) module_set_0(
		.clk(clk),		    		
		.rstn(rstn),

    .soft_rst_count(reg_current.soft_rst_count),

    .diff_logN(reg_current.diff_logN),
    
    // start
    .start_bitRev(reg_current.start_bitRev[0]),
    .start_transpose(reg_current.start_transpose[0]),
    .start_perm(reg_current.start_perm[0]),
    .start_auto(reg_current.start_auto[0]),
    .start_NTT(reg_current.start_NTT[0]),
    .start_iNTT(reg_current.start_iNTT[0]),
    .start_vector_add(reg_current.start_vector_add[0]),
    .start_vector_multi(reg_current.start_vector_multi[0]),
    .start_vector_lazy(reg_current.start_vector_lazy[0]),
    .start_set_uint(reg_current.start_set_uint[0]),
    .start_vector_decomp(reg_current.start_vector_decomp[0]),

    // rev_trans parameter
    .transpose_base(reg_current.transpose_base),
    .barrel_store(reg_current.barrel_store),
    .barrel_load(reg_current.barrel_load),
    // perm parameter
    .perm_pattern(reg_current.perm_pattern),
    //  p
    .p(reg_current.p),
    .scalar(reg_current.scalar),
    .pq0(reg_current.pq0),
    .pq1(reg_current.pq1),
    // auto parameter
    .auto_offset(reg_current.auto_offset),
    .auto_base(reg_current.auto_base),
    .k(reg_current.k),
    // ntt/intt parameter
    .NTT_levels(reg_current.NTT_levels),
    .NTT_base_level(reg_current.NTT_base_level),
    // vector parameter
    .vector_operation(reg_current.vector_operation),

    // root write
    .ntt_input_W_waddr(ntt_input_W_waddr[0]),
    .ntt_input_W_wdata(ntt_input_W_wdata[0]),
    .ntt_input_W_wren(ntt_input_W_wren[0]),
    .ntt_input_WQ_waddr(ntt_input_WQ_waddr[0]),
    .ntt_input_WQ_wdata(ntt_input_WQ_wdata[0]),
    .ntt_input_WQ_wren(ntt_input_WQ_wren[0]),

    // interconnect select
    .module_select(reg_current.module_select[0]),
    .slot_select(reg_current.slot_select[0]),
    .ntt_intt_select(reg_current.ntt_intt_select[0]),
    .root_select(reg_current.root_select[0]),

    // working
    .bitRev_working(bitRev_working[0]),
    .perm_working(perm_working[0]),
    .auto_working(auto_working[0]),
    .NTT_working(NTT_working[0]),
    .iNTT_working(iNTT_working[0]),
    .vector_add_working(vector_add_working[0]),
    .vector_multi_working(vector_multi_working[0]),
    .vector_lazy_working(vector_lazy_working[0]),
    .set_uint_working(set_uint_working[0]),
    .vector_decomp_working(vector_decomp_working[0]),

    // from host <-> slot
    .host_outputs(module_outputs[0]),
    .host_inputs(module_inputs[0]),

    // to router(slot)
    .NTT_ram_inputs(module_set_outputs[0]),
    .NTT_ram_outputs_rdata(module_set_inputs[0])
	);

  module_set #(
        // param set
        .REV_TRANS_MODULE_NUM_IN_SET(REV_TRANS_MODULE_NUM),
        .PERM_MODULE_NUM_IN_SET(PERM_MODULE_NUM),
        .AUTO_MODULE_NUM_IN_SET(AUTO_MODULE_NUM),
        .NTT_MODULE_NUM_IN_SET(NTT_MODULE_NUM),
        .INTT_MODULE_NUM_IN_SET(INTT_MODULE_NUM),
        .ADD_MODULE_NUM_IN_SET(ADD_MODULE_NUM),
        .MULTI_MODULE_NUM_IN_SET(MULTI_MODULE_NUM),
        .LAZY_MODULE_NUM_IN_SET(LAZY_MODULE_NUM),
        .SET_UINT_MODULE_NUM_IN_SET(SET_UINT_MODULE_NUM),
        .DECOMP_MODULE_NUM_IN_SET(DECOMP_MODULE_NUM)
	) module_set_1(
		.clk(clk),		    		
		.rstn(rstn),

    .soft_rst_count(reg_current.soft_rst_count),

    .diff_logN(reg_current.diff_logN),
    
    // start
    .start_bitRev(reg_current.start_bitRev[1]),
    .start_transpose(reg_current.start_transpose[1]),
    .start_perm(reg_current.start_perm[1]),
    .start_auto(reg_current.start_auto[1]),
    .start_NTT(reg_current.start_NTT[1]),
    .start_iNTT(reg_current.start_iNTT[1]),
    .start_vector_add(reg_current.start_vector_add[1]),
    .start_vector_multi(reg_current.start_vector_multi[1]),
    .start_vector_lazy(reg_current.start_vector_lazy[1]),
    .start_set_uint(reg_current.start_set_uint[1]),
    .start_vector_decomp(reg_current.start_vector_decomp[1]),

    // rev_trans parameter
    .transpose_base(reg_current.transpose_base),
    .barrel_store(reg_current.barrel_store),
    .barrel_load(reg_current.barrel_load),
    // perm parameter
    .perm_pattern(reg_current.perm_pattern),
    //  p
    .p(reg_current.p),
    .scalar(reg_current.scalar),
    .pq0(reg_current.pq0),
    .pq1(reg_current.pq1),
    // auto parameter
    .auto_offset(reg_current.auto_offset),
    .auto_base(reg_current.auto_base),
    .k(reg_current.k),
    // ntt/intt parameter
    .NTT_levels(reg_current.NTT_levels),
    .NTT_base_level(reg_current.NTT_base_level),
    // vector parameter
    .vector_operation(reg_current.vector_operation),

    // root write
    .ntt_input_W_waddr(ntt_input_W_waddr[1]),
    .ntt_input_W_wdata(ntt_input_W_wdata[1]),
    .ntt_input_W_wren(ntt_input_W_wren[1]),
    .ntt_input_WQ_waddr(ntt_input_WQ_waddr[1]),
    .ntt_input_WQ_wdata(ntt_input_WQ_wdata[1]),
    .ntt_input_WQ_wren(ntt_input_WQ_wren[1]),

    // interconnect select
    .module_select(reg_current.module_select[1]),
    .slot_select(reg_current.slot_select[1]),
    .ntt_intt_select(reg_current.ntt_intt_select[1]),
    .root_select(reg_current.root_select[1]),

    // working
    .bitRev_working(bitRev_working[1]),
    .perm_working(perm_working[1]),
    .auto_working(auto_working[1]),
    .NTT_working(NTT_working[1]),
    .iNTT_working(iNTT_working[1]),
    .vector_add_working(vector_add_working[1]),
    .vector_multi_working(vector_multi_working[1]),
    .vector_lazy_working(vector_lazy_working[1]),
    .set_uint_working(set_uint_working[1]),
    .vector_decomp_working(vector_decomp_working[1]),

    // from host <-> slot
    .host_outputs(module_outputs[1]),
    .host_inputs(module_inputs[1]),

    // to router(slot)
    .NTT_ram_inputs(module_set_outputs[1]),
    .NTT_ram_outputs_rdata(module_set_inputs[1])
	);

  logic NTT_read_in, NTT_read, NTT_read_1;
  FifoBuffer #(.DATA_SIZE(1), .CYCLES(BUFFER_READ_LATENCY +  STAGE_MODULE_DELAY +  STAGE_SLOT_DELAY + RING_ROUTER_DELAY) )  NTT_read_fifo (.clk(clk), .rstn(1), .in(NTT_read_in), .out(NTT_read));

  FifoBuffer #(.DATA_SIZE(1), .CYCLES(BUFFER_READ_LATENCY+1 +  STAGE_MODULE_DELAY +  STAGE_SLOT_DELAY + RING_ROUTER_DELAY) )  NTT_read_fifo_1 (.clk(clk), .rstn(1), .in(NTT_read_in), .out(NTT_read_1));

  logic [$clog2(E)-1:0] NTT_read_offset_in, NTT_read_offset;
  FifoBuffer #(.DATA_SIZE($clog2(E)), .CYCLES(BUFFER_READ_LATENCY +  STAGE_MODULE_DELAY +  STAGE_SLOT_DELAY + RING_ROUTER_DELAY) )  NTT_read_offset_fifo (.clk(clk), .rstn(1), .in(NTT_read_offset_in), .out(NTT_read_offset));

  logic NTT_read_DMA_in, NTT_read_DMA;
  FifoBuffer #(.DATA_SIZE(1), .CYCLES(BUFFER_READ_LATENCY+1) )  NTT_read_DMA_fifo (.clk(clk), .rstn(1), .in(NTT_read_DMA_in), .out(NTT_read_DMA));

  logic NTT_read_last_in, NTT_read_last;
  FifoBuffer #(.DATA_SIZE(1), .CYCLES(BUFFER_READ_LATENCY+1) )  NTT_read_last_fifo (.clk(clk), .rstn(1), .in(NTT_read_last_in), .out(NTT_read_last));

  logic [FSIZE-1:0] NTT_rdata_in, NTT_rdata;
  FifoBuffer #(.DATA_SIZE(FSIZE), .CYCLES(1) )  NTT_rdata_fifo (.clk(clk), .rstn(1), .in(NTT_rdata_in), .out(NTT_rdata));

  logic [$clog2(E)-1:0] NTT_rdata_idx_delay;
  FifoBuffer #(.DATA_SIZE($clog2(E)), .CYCLES(1 + STAGE_MODULE_DELAY + RING_ROUTER_DELAY) )  NTT_rdata_idx_delay_fifo (.clk(clk), .rstn(1), .in(reg_current.NTT_A_idx), .out(NTT_rdata_idx_delay));

  always_comb begin
    reg_next = reg_current;
    
    // stateport0 = reg_current.state;
    stateport0 = {
      reg_current.NTT_A_idx,NTT_rdata_idx_delay,
      NTT_read_1, reg_current.state_STATE_NTT_A_DMA,reg_current.state_STATE_NTT_STORE_DMA,
      
      reg_current.state_STATE_RUN_BITREV[0],
      reg_current.state_STATE_RUN_PERM[0],
      reg_current.state_STATE_RUN_AUTO[0],
      reg_current.state_STATE_RUN_NTT[0],
      reg_current.state_STATE_RUN_INTT[0],
      reg_current.state_STATE_RUN_ADD[0],
      reg_current.state_STATE_RUN_MULTI[0],
      reg_current.state_STATE_RUN_LAZY[0],
      reg_current.state_STATE_RUN_SET_UINT[0],
      reg_current.state_STATE_RUN_DECOMP[0],

      reg_current.state_STATE_RUN_BITREV[1],
      reg_current.state_STATE_RUN_PERM[1],
      reg_current.state_STATE_RUN_AUTO[1],
      reg_current.state_STATE_RUN_NTT[1],
      reg_current.state_STATE_RUN_INTT[1],
      reg_current.state_STATE_RUN_ADD[1],
      reg_current.state_STATE_RUN_MULTI[1],
      reg_current.state_STATE_RUN_LAZY[1],
      reg_current.state_STATE_RUN_SET_UINT[1],
      reg_current.state_STATE_RUN_DECOMP[1]
    };// stateport0

    stateport1 = reg_current.NTT_read_data;
    
    for(int i = 0 ; i < PE_CNT ; i++) begin
      ntt_input_W_wdata[i] = '{default:'0};
      ntt_input_W_wren[i] = '{default:'0};
      ntt_input_W_waddr[i] = '{default:'0};
      ntt_input_WQ_wdata[i]  = '{default:'0};
      ntt_input_WQ_wren[i] = '{default:'0};
      ntt_input_WQ_waddr[i] = '{default:'0};

      module_outputs[i] = '{default:'0};
    end
    

    NTT_read_offset_in = 0;
    NTT_read_in = 0;
    reg_next.ring_writing = 0;
    reg_next.ring_reading = 0;
    for(int k = 0 ; k < PE_CNT ; k++) begin
      for(int i = 0 ; i < REV_TRANS_MODULE_NUM ; i++) begin
        reg_next.start_bitRev[k][i] = 0;
      end
      for(int i = 0 ; i < REV_TRANS_MODULE_NUM ; i++) begin
        reg_next.start_transpose[k][i] = 0;
      end
      for(int i = 0 ; i < PERM_MODULE_NUM ; i++) begin
        reg_next.start_perm[k][i] = 0;
      end
      for(int i = 0 ; i < AUTO_MODULE_NUM ; i++) begin
        reg_next.start_auto[k][i] = 0;
      end
      for(int i = 0 ; i < NTT_MODULE_NUM ; i++) begin
        reg_next.start_NTT[k][i] = 0;
      end
      for(int i = 0 ; i < INTT_MODULE_NUM ; i++) begin
        reg_next.start_iNTT[k][i] = 0;
      end
      for(int i = 0 ; i < ADD_MODULE_NUM ; i++) begin
        reg_next.start_vector_add[k][i] = 0;
      end
      for(int i = 0 ; i < MULTI_MODULE_NUM ; i++) begin
        reg_next.start_vector_multi[k][i] = 0;
      end
      for(int i = 0 ; i < LAZY_MODULE_NUM ; i++) begin
        reg_next.start_vector_lazy[k][i] = 0;
      end
      for(int i = 0 ; i < SET_UINT_MODULE_NUM ; i++) begin
        reg_next.start_set_uint[k][i] = 0;
      end
      for(int i = 0 ; i < DECOMP_MODULE_NUM ; i++) begin
        reg_next.start_vector_decomp[k][i] = 0;
      end
    end
          
    if(commanddataport.valid) begin

      if(commanddataport.command == COMMAND_NTT_W) begin
        ntt_input_W_wdata[reg_current.pe_select][commanddataport.data1[7:0]][commanddataport.data1[15:8]] = commanddataport.data0;
        ntt_input_W_wren[reg_current.pe_select][commanddataport.data1[7:0]][commanddataport.data1[15:8]] = 1;
        ntt_input_W_waddr[reg_current.pe_select][commanddataport.data1[7:0]] = commanddataport.data1[31:16];        
      end
      
      if(commanddataport.command == COMMAND_NTT_WQ) begin
        ntt_input_WQ_wdata[reg_current.pe_select][commanddataport.data1[7:0]][commanddataport.data1[15:8]] = commanddataport.data0;
        ntt_input_WQ_wren[reg_current.pe_select][commanddataport.data1[7:0]] [commanddataport.data1[15:8]] = 1;
        ntt_input_WQ_waddr[reg_current.pe_select][commanddataport.data1[7:0]] = commanddataport.data1[31:16];
      end

      if(commanddataport.command == COMMAND_NTT_P) begin
        reg_next.p = commanddataport.data0;

        // if($time()%2==0)$display("p %x %d pInv %x %d at %d",commanddataport.data0,commanddataport.data0,commanddataport.data1,commanddataport.data1,$time()/2) ; 
      end

      if(commanddataport.command == COMMAND_SET_BACKGROUND1) begin
        reg_next.host_N = commanddataport.data0; //need
        reg_next.host_logN = commanddataport.data1; //need
      
      end

      if(commanddataport.command == COMMAND_SET_BACKGROUND2) begin
        reg_next.diff_logN = logN - reg_current.host_logN;
      end
      
      if(commanddataport.command == COMMAND_NTT_A) begin
        reg_next.NTT_A[reg_current.NTT_A_idx] = commanddataport.data0;
        reg_next.NTT_A_idx = reg_current.NTT_A_idx + 1;

        if(reg_current.NTT_A_idx == E-1) begin
          reg_next.NTT_in = 1;
          reg_next.NTT_A_idx = 0;
        end
        // if($time()%2==0)$display("COMMAND_NTT_A %d %d  at %d",reg_current.NTT_addr,commanddataport.data0,$time()/2) ; 
      end

      if(commanddataport.command == COMMAND_NTT_A_DMA) begin
        reg_next.NTT_addr = 0;
        reg_next.NTT_A_idx = 0;        
        reg_next.state_STATE_NTT_A_DMA = 1;
      end
      if(commanddataport.command == COMMAND_NTT_GET_DMA) begin
        reg_next.ntt_store_idx = 0;        
        reg_next.state_STATE_NTT_STORE_DMA = 1;
      end

      //one set
      if(commanddataport.command == COMMAND_BITREVERSE1) begin        
        reg_next.start_bitRev[reg_current.pe_select][0] = 1;
        reg_next.state_STATE_WAIT_BITREV[reg_current.pe_select][0] = 1;
      end
      if(commanddataport.command == COMMAND_TRANSPOSE1) begin        
        reg_next.start_transpose[reg_current.pe_select][0] = 1;
        reg_next.transpose_base = commanddataport.data0;
        reg_next.barrel_load = commanddataport.data1[15:0];      
        reg_next.barrel_store = commanddataport.data1[31:16];
        reg_next.state_STATE_WAIT_BITREV[reg_current.pe_select][0] = 1;
      end
      // if(commanddataport.command == COMMAND_BITREVERSE2) begin        
      //   reg_next.start_bitRev[1] = 1;
      //   reg_next.state_STATE_WAIT_BITREV[1] = 1;
      // end
      // if(commanddataport.command == COMMAND_TRANSPOSE2) begin        
      //   reg_next.start_transpose[1] = 1;
      //   reg_next.transpose_base = commanddataport.data0;
      //   reg_next.barrel_load = commanddataport.data1[15:0];      
      //   reg_next.barrel_store = commanddataport.data1[31:16];
      //   reg_next.state_STATE_WAIT_BITREV[1] = 1;
      // end

      if(commanddataport.command == COMMAND_PERM_PATTERN1) begin        
        reg_next.start_perm[reg_current.pe_select][0] = 1;
        reg_next.perm_pattern = commanddataport.data0[15:0]; 
        reg_next.state_STATE_WAIT_PERM[reg_current.pe_select][0] = 1;
      end
      // if(commanddataport.command == COMMAND_PERM_PATTERN2) begin        
      //   reg_next.start_perm[1] = 1;
      //   reg_next.perm_pattern = commanddataport.data0[15:0]; 
      //   reg_next.state_STATE_WAIT_PERM[1] = 1;
      // end

      if(commanddataport.command == COMMAND_AUTO1) begin        
        reg_next.start_auto[reg_current.pe_select][0] = 1;
        reg_next.k = commanddataport.data0;
        reg_next.auto_offset = commanddataport.data1[15:0];      
        reg_next.auto_base = commanddataport.data1[31:16];
        reg_next.state_STATE_WAIT_AUTO[reg_current.pe_select][0] = 1;
      end
      // if(commanddataport.command == COMMAND_AUTO2) begin        
      //   reg_next.start_auto[1] = 1;
      //   reg_next.k = commanddataport.data0;
      //   reg_next.auto_offset = commanddataport.data1[15:0];      
      //   reg_next.auto_base = commanddataport.data1[31:16];
      //   reg_next.state_STATE_WAIT_AUTO[1] = 1;
      // end

      if(commanddataport.command == COMMAND_NTT_RUN1) begin     
        reg_next.NTT_levels = commanddataport.data0;
        reg_next.NTT_base_level = commanddataport.data1;
        reg_next.state_STATE_WAIT_NTT[reg_current.pe_select][0] = 1;
        reg_next.start_NTT[reg_current.pe_select][0] = 1;
      end
      if(commanddataport.command == COMMAND_NTT_RUN2) begin    
        reg_next.NTT_levels = commanddataport.data0;
        reg_next.NTT_base_level = commanddataport.data1;
        reg_next.state_STATE_WAIT_NTT[reg_current.pe_select][1] = 1;
        reg_next.start_NTT[reg_current.pe_select][1] = 1;
      end
      // if(commanddataport.command == COMMAND_NTT_RUN3) begin     
      //   reg_next.NTT_levels = commanddataport.data0;
      //   reg_next.NTT_base_level = commanddataport.data1;
      //   reg_next.state_STATE_WAIT_NTT[2] = 1;
      //   reg_next.start_NTT[2] = 1;

      // end
      // if(commanddataport.command == COMMAND_NTT_RUN4) begin    
      //   reg_next.NTT_levels = commanddataport.data0;
      //   reg_next.NTT_base_level = commanddataport.data1;
      //   reg_next.state_STATE_WAIT_NTT[3] = 1;
      //   reg_next.start_NTT[3] = 1;
      // end

      if(commanddataport.command == COMMAND_MULTI_NTT_RUN1) begin    
        reg_next.NTT_levels = commanddataport.data0[15:0];
        reg_next.NTT_base_level = commanddataport.data0[31:16];

        reg_next.ntt_module_select = commanddataport.data1;
      end
      if(commanddataport.command == COMMAND_MULTI_NTT_RUN2) begin  
        for(int i = 0 ; i < NTT_MODULE_NUM; i++) begin
          if(reg_current.ntt_module_select[i]) begin
            reg_next.state_STATE_WAIT_NTT[reg_current.pe_select][i] = 1;
            reg_next.start_NTT[reg_current.pe_select][i] = 1;
          end
        end
      end
      
      if(commanddataport.command == COMMAND_MULTI_INTT_RUN1) begin    
        reg_next.NTT_levels = commanddataport.data0[15:0];
        reg_next.NTT_base_level = commanddataport.data0[31:16];

        reg_next.ntt_module_select = commanddataport.data1;
      end
      if(commanddataport.command == COMMAND_MULTI_INTT_RUN2) begin  
        for(int i = 0 ; i < INTT_MODULE_NUM; i++) begin
          if(reg_current.ntt_module_select[i]) begin
            reg_next.state_STATE_WAIT_INTT[reg_current.pe_select][i] = 1;
            reg_next.start_iNTT[reg_current.pe_select][i] = 1;
          end
        end
      end

      if(commanddataport.command == COMMAND_INTT_RUN1) begin        
        reg_next.NTT_levels = commanddataport.data0;
        reg_next.NTT_base_level = commanddataport.data1;
        reg_next.state_STATE_WAIT_INTT[reg_current.pe_select][0] = 1;
        reg_next.start_iNTT[reg_current.pe_select][0] = 1;
      end
      if(commanddataport.command == COMMAND_INTT_RUN2) begin
        reg_next.NTT_levels = commanddataport.data0;
        reg_next.NTT_base_level = commanddataport.data1;
        reg_next.state_STATE_WAIT_INTT[reg_current.pe_select][1]= 1;
        reg_next.start_iNTT[reg_current.pe_select][1] = 1;
      end
      // if(commanddataport.command == COMMAND_INTT_RUN3) begin        
      //   reg_next.NTT_levels = commanddataport.data0;
      //   reg_next.NTT_base_level = commanddataport.data1;
      //   reg_next.state_STATE_WAIT_INTT[2] = 1;
      //   reg_next.start_iNTT[2] = 1;
      // end
      // if(commanddataport.command == COMMAND_INTT_RUN4) begin
      //   reg_next.NTT_levels = commanddataport.data0;
      //   reg_next.NTT_base_level = commanddataport.data1;
      //   reg_next.state_STATE_WAIT_INTT[3]= 1;
      //   reg_next.start_iNTT[3] = 1;
      // end

      if(commanddataport.command == COMMAND_VECTOR_ADD_MOD1) begin        
        reg_next.start_vector_add[reg_current.pe_select][0] = 1;
        reg_next.vector_operation = VECTOR_OPERATION_ADD;
        reg_next.state_STATE_WAIT_ADD[reg_current.pe_select][0] = 1;
      end
      if(commanddataport.command == COMMAND_VECTOR_ADD_MOD_SCALAR1) begin        
        reg_next.start_vector_add[reg_current.pe_select][0] = 1;
        reg_next.vector_operation = VECTOR_OPERATION_SCALAR_ADD;
        reg_next.state_STATE_WAIT_ADD[reg_current.pe_select][0] = 1;
        reg_next.scalar = commanddataport.data0;
      end
      if(commanddataport.command == COMMAND_VECTOR_SUB1) begin        
        reg_next.start_vector_add[reg_current.pe_select][0] = 1;
        reg_next.vector_operation = VECTOR_OPERATION_SUB;
        reg_next.state_STATE_WAIT_ADD[reg_current.pe_select][0] = 1;
      end
      // if(commanddataport.command == COMMAND_VECTOR_ADD_MOD2) begin        
      //   reg_next.start_vector_add[1] = 1;
      //   reg_next.vector_operation = VECTOR_OPERATION_ADD;
      //   reg_next.state_STATE_WAIT_ADD[1] = 1;
      // end
      // if(commanddataport.command == COMMAND_VECTOR_ADD_MOD_SCALAR2) begin        
      //   reg_next.start_vector_add[1] = 1;
      //   reg_next.vector_operation = VECTOR_OPERATION_SCALAR_ADD;
      //   reg_next.state_STATE_WAIT_ADD[1] = 1;
      //   reg_next.scalar = commanddataport.data0;
      // end
      
      // multi prepare
      if(commanddataport.command == COMMAND_VECTOR_MULT_MOD_PQ) begin        
        reg_next.pq0 = commanddataport.data0;
        reg_next.pq1 = commanddataport.data1;
      end
      if(commanddataport.command == COMMAND_VECTOR_MULT_MOD1) begin        
        reg_next.start_vector_multi[reg_current.pe_select][0] = 1;
        reg_next.vector_operation = VECTOR_OPERATION_MULT;
        reg_next.state_STATE_WAIT_MULTI[reg_current.pe_select][0] = 1;
      end
      if(commanddataport.command == COMMAND_VECTOR_SCALAR_MULT_MOD1) begin        
        reg_next.start_vector_multi[reg_current.pe_select][0] = 1;
        reg_next.vector_operation = VECTOR_OPERATION_SCALAR_MULT;
        reg_next.state_STATE_WAIT_MULTI[reg_current.pe_select][0] = 1;
        reg_next.scalar = commanddataport.data0;
      end
      if(commanddataport.command == COMMAND_VECTOR_BARRETT_REDUCTION1) begin        
        reg_next.start_vector_multi[reg_current.pe_select][0] = 1;
        reg_next.vector_operation = VECTOR_VECTOR_BARRETT_REDUCTION;
        reg_next.state_STATE_WAIT_MULTI[reg_current.pe_select][0] = 1;
      end
      // if(commanddataport.command == COMMAND_VECTOR_MULT_MOD2) begin        
      //   reg_next.start_vector_multi[1] = 1;
      //   reg_next.vector_operation = VECTOR_OPERATION_MULT;
      //   reg_next.state_STATE_WAIT_MULTI[1] = 1;
      // end
      // if(commanddataport.command == COMMAND_VECTOR_SCALAR_MULT_MOD2) begin        
      //   reg_next.start_vector_multi[1] = 1;
      //   reg_next.vector_operation = VECTOR_OPERATION_SCALAR_MULT;
      //   reg_next.state_STATE_WAIT_MULTI[1] = 1;
      //   reg_next.scalar = commanddataport.data0;
      // end
      // if(commanddataport.command == COMMAND_VECTOR_BARRETT_REDUCTION2) begin        
      //   reg_next.start_vector_multi[1] = 1;
      //   reg_next.vector_operation = VECTOR_VECTOR_BARRETT_REDUCTION;
      //   reg_next.state_STATE_WAIT_MULTI[1] = 1;
      // end

      //lazy reduction
      if(commanddataport.command == COMMAND_VECTOR_LAZY_REDUCTION1) begin        
        reg_next.start_vector_lazy[reg_current.pe_select][0] = 1;
        reg_next.vector_operation = VECTOR_OPERATION_LAZY_REDUCTION;
        reg_next.state_STATE_WAIT_LAZY[reg_current.pe_select][0] = 1;
      end
      // if(commanddataport.command == COMMAND_VECTOR_LAZY_REDUCTION2) begin        
      //   reg_next.start_vector_lazy[1] = 1;
      //   reg_next.vector_operation = VECTOR_OPERATION_LAZY_REDUCTION;
      //   reg_next.state_STATE_WAIT_LAZY[1] = 1;
      // end

      if(commanddataport.command == COMMAND_SET_UNIT1) begin        
        reg_next.start_set_uint[reg_current.pe_select][0] = 1;
        reg_next.state_STATE_WAIT_SET_UINT[reg_current.pe_select][0] = 1;
      end
      // if(commanddataport.command == COMMAND_SET_UNIT2) begin        
      //   reg_next.start_set_uint[1] = 1;
      //   reg_next.state_STATE_WAIT_SET_UINT[1] = 1;
      // end

      //decomp
      if(commanddataport.command == COMMAND_VECTOR_DECOMP1) begin        
        reg_next.start_vector_decomp[reg_current.pe_select][0] = 1;
        reg_next.vector_operation = VECTOR_OPERATION_DECOMP_REDUCTION;
        reg_next.state_STATE_WAIT_DECOMP[reg_current.pe_select][0] = 1;
        reg_next.pq0 = commanddataport.data0;
      end
      // if(commanddataport.command == COMMAND_VECTOR_DECOMP2) begin        
      //   reg_next.start_vector_decomp[1] = 1;
      //   reg_next.vector_operation = VECTOR_OPERATION_DECOMP_REDUCTION;
      //   reg_next.state_STATE_WAIT_DECOMP[1] = 1;
      //   reg_next.pq0 = commanddataport.data0;
      // end

      if(commanddataport.command == COMMAND_RESET) begin        
        reg_next.state = STATE_IDLE;
        reg_next.state_STATE_NTT_A_DMA = 0;
        reg_next.state_STATE_NTT_STORE_DMA = 0;
        for(int k = 0 ; k < PE_CNT ; k++) begin
          for(int i = 0 ; i < REV_TRANS_MODULE_NUM ; i++) begin
            reg_next.state_STATE_WAIT_BITREV[k][i] = 0;
            reg_next.state_STATE_RUN_BITREV[k][i] = 0;
          end
          for(int i = 0 ; i < PERM_MODULE_NUM ; i++) begin
            reg_next.state_STATE_WAIT_PERM[k][i] = 0;
            reg_next.state_STATE_RUN_PERM[k][i] = 0;
          end
          for(int i = 0 ; i < AUTO_MODULE_NUM ; i++) begin
            reg_next.state_STATE_WAIT_AUTO[k][i] = 0;
            reg_next.state_STATE_RUN_AUTO[k][i] = 0;
          end
          for(int i = 0 ; i < NTT_MODULE_NUM ; i++) begin
            reg_next.state_STATE_WAIT_NTT[k][i] = 0;
            reg_next.state_STATE_RUN_NTT[k][i] = 0;
          end
          for(int i = 0 ; i < INTT_MODULE_NUM ; i++) begin
            reg_next.state_STATE_WAIT_INTT[k][i] = 0;
            reg_next.state_STATE_RUN_INTT[k][i] = 0;
          end
          for(int i = 0 ; i < ADD_MODULE_NUM ; i++) begin
            reg_next.state_STATE_WAIT_ADD[k][i] = 0;
            reg_next.state_STATE_RUN_ADD[k][i] = 0;
          end
          for(int i = 0 ; i < MULTI_MODULE_NUM ; i++) begin
            reg_next.state_STATE_WAIT_MULTI[k][i] = 0;
            reg_next.state_STATE_RUN_MULTI[k][i] = 0;
          end
          for(int i = 0 ; i < LAZY_MODULE_NUM ; i++) begin
            reg_next.state_STATE_WAIT_LAZY[k][i] = 0;
            reg_next.state_STATE_RUN_LAZY[k][i] = 0;
          end
          for(int i = 0 ; i < SET_UINT_MODULE_NUM ; i++) begin
            reg_next.state_STATE_WAIT_SET_UINT[k][i] = 0;
            reg_next.state_STATE_RUN_SET_UINT[k][i] = 0;
          end
          for(int i = 0 ; i < DECOMP_MODULE_NUM ; i++) begin
            reg_next.state_STATE_WAIT_DECOMP[k][i] = 0;
            reg_next.state_STATE_RUN_DECOMP[k][i] = 0;
          end
        end
        reg_next.W_addr = 0;
        reg_next.NTT_addr = 0;

        reg_next.NTT_in = 0;
        reg_next.NTT_A_idx = 0;

        reg_next.soft_rst_count = 10;
        reg_next.pe_select = 0;

        reg_next.host_N = 0;
        reg_next.host_logN = 0;
        reg_next.diff_logN = 0;

      end

      if(commanddataport.command == COMMAND_NTT_GET_PE_SELECT) begin        
        reg_next.pe_select = commanddataport.data0;
      end
      if(commanddataport.command == COMMAND_NTT_GET) begin        
        module_outputs[reg_current.pe_select].raddr = commanddataport.data0[$clog2(N)-1:$clog2(E)];
        NTT_read_offset_in = commanddataport.data0[$clog2(E)-1:0];
        NTT_read_in = 1;
      end
      
      if(commanddataport.command == COMMAND_SET_MODULE1) begin        
        reg_next.module_select[reg_current.pe_select][0] = commanddataport.data0[5:0];
        reg_next.module_select[reg_current.pe_select][1] = commanddataport.data0[11:6];
        reg_next.module_select[reg_current.pe_select][2] = commanddataport.data0[17:12];
        reg_next.module_select[reg_current.pe_select][3] = commanddataport.data0[23:18];
        reg_next.module_select[reg_current.pe_select][4] = commanddataport.data0[29:24];

        reg_next.module_select[reg_current.pe_select][5] = commanddataport.data1[5:0];
        reg_next.module_select[reg_current.pe_select][6] = commanddataport.data1[11:6];
        reg_next.module_select[reg_current.pe_select][7] = commanddataport.data1[17:12];
        reg_next.module_select[reg_current.pe_select][8] = commanddataport.data1[23:18];
        reg_next.module_select[reg_current.pe_select][9] = commanddataport.data1[29:24];
      end
      if(commanddataport.command == COMMAND_SET_MODULE2) begin        
        reg_next.module_select[reg_current.pe_select][10] = commanddataport.data0[5:0];
        reg_next.module_select[reg_current.pe_select][11] = commanddataport.data0[11:6];
        reg_next.module_select[reg_current.pe_select][12] = commanddataport.data0[17:12];
        reg_next.module_select[reg_current.pe_select][13] = commanddataport.data0[23:18];
        reg_next.module_select[reg_current.pe_select][14] = commanddataport.data0[29:24];

        reg_next.module_select[reg_current.pe_select][15] = commanddataport.data1[5:0];
        reg_next.module_select[reg_current.pe_select][16] = commanddataport.data1[11:6];
        reg_next.module_select[reg_current.pe_select][17] = commanddataport.data1[17:12];
        reg_next.module_select[reg_current.pe_select][18] = commanddataport.data1[23:18];
        reg_next.module_select[reg_current.pe_select][19] = commanddataport.data1[29:24];
      end
      // if(commanddataport.command == COMMAND_SET_MODULE3) begin        
      //   reg_next.module_select[20] = commanddataport.data0[5:0];
      //   reg_next.module_select[21] = commanddataport.data0[11:6];
      //   reg_next.module_select[22] = commanddataport.data0[17:12];
      //   reg_next.module_select[23] = commanddataport.data0[23:18];
      // end

      if(commanddataport.command == COMMAND_SET_RAM1) begin
        reg_next.slot_select[reg_current.pe_select][0] = commanddataport.data0[4:0];
        reg_next.slot_select[reg_current.pe_select][1] = commanddataport.data0[9:5];
        reg_next.slot_select[reg_current.pe_select][2] = commanddataport.data0[14:10];
        reg_next.slot_select[reg_current.pe_select][3] = commanddataport.data0[19:15];
        reg_next.slot_select[reg_current.pe_select][4] = commanddataport.data0[24:20];
        reg_next.slot_select[reg_current.pe_select][5] = commanddataport.data0[29:25];

        reg_next.slot_select[reg_current.pe_select][6]  = commanddataport.data1[4:0];
        reg_next.slot_select[reg_current.pe_select][7]  = commanddataport.data1[9:5];
        reg_next.slot_select[reg_current.pe_select][8]  = commanddataport.data1[14:10];
        reg_next.slot_select[reg_current.pe_select][9]  = commanddataport.data1[19:15];
        reg_next.slot_select[reg_current.pe_select][10] = commanddataport.data1[24:20];
        reg_next.slot_select[reg_current.pe_select][11] = commanddataport.data1[29:25];
      end

      if(commanddataport.command == COMMAND_SET_RAM2) begin
        reg_next.slot_select[reg_current.pe_select][12] = commanddataport.data0[4:0];
        reg_next.slot_select[reg_current.pe_select][13] = commanddataport.data0[9:5];
        reg_next.slot_select[reg_current.pe_select][14] = commanddataport.data0[14:10];
        reg_next.slot_select[reg_current.pe_select][15] = commanddataport.data0[19:15];
        reg_next.slot_select[reg_current.pe_select][16] = commanddataport.data0[24:20];
        reg_next.slot_select[reg_current.pe_select][17] = commanddataport.data0[29:25];

        reg_next.slot_select[reg_current.pe_select][18] = commanddataport.data1[4:0];
        reg_next.slot_select[reg_current.pe_select][19] = commanddataport.data1[9:5];
        // reg_next.slot_select[20] = commanddataport.data1[14:10];
        // reg_next.slot_select[21] = commanddataport.data1[19:15];
        // reg_next.slot_select[22] = commanddataport.data1[24:20];
        // reg_next.slot_select[23] = commanddataport.data1[29:25];
      end

      // if(commanddataport.command == COMMAND_SET_RAM3) begin
      //   reg_next.slot_select[24] = commanddataport.data0[4:0];
      //   reg_next.slot_select[25] = commanddataport.data0[9:5];
      //   reg_next.slot_select[26] = commanddataport.data0[14:10];
      //   reg_next.slot_select[27] = commanddataport.data0[19:15];
      //   reg_next.slot_select[28] = commanddataport.data0[24:20];
      //   reg_next.slot_select[29] = commanddataport.data0[29:25];

      //   reg_next.slot_select[30] = commanddataport.data1[4:0];
      //   reg_next.slot_select[31] = commanddataport.data1[9:5];
      //   reg_next.slot_select[32] = commanddataport.data1[14:10];
      //   reg_next.slot_select[33] = commanddataport.data1[19:15];
      //   reg_next.slot_select[34] = commanddataport.data1[24:20];
      //   reg_next.slot_select[35] = commanddataport.data1[29:25];
      // end
      // if(commanddataport.command == COMMAND_SET_RAM4) begin
      //   reg_next.slot_select[36] = commanddataport.data0[4:0];
      //   reg_next.slot_select[37] = commanddataport.data0[9:5];
      //   reg_next.slot_select[38] = commanddataport.data0[14:10];
      // end



      if(commanddataport.command == COMMAND_SET_SLOT_NTT) begin     
        reg_next.ntt_intt_select[reg_current.pe_select][0] = commanddataport.data0[2:0];
        reg_next.ntt_intt_select[reg_current.pe_select][1] = commanddataport.data0[5:3];
        reg_next.ntt_intt_select[reg_current.pe_select][2] = commanddataport.data1[2:0];
        reg_next.ntt_intt_select[reg_current.pe_select][3] = commanddataport.data1[5:3];
      end
      if(commanddataport.command == COMMAND_SET_SLOT_ROOT) begin     
        reg_next.root_select[reg_current.pe_select][0] = commanddataport.data0[1:0];
        reg_next.root_select[reg_current.pe_select][1] = commanddataport.data0[3:2];
        reg_next.root_select[reg_current.pe_select][2] = commanddataport.data0[5:4];
        reg_next.root_select[reg_current.pe_select][3] = commanddataport.data0[7:6];

        reg_next.root_select[reg_current.pe_select][4] = commanddataport.data1[1:0];
        reg_next.root_select[reg_current.pe_select][5] = commanddataport.data1[3:2];
        reg_next.root_select[reg_current.pe_select][6] = commanddataport.data1[5:4];
        reg_next.root_select[reg_current.pe_select][7] = commanddataport.data1[7:6];
      end

      if(commanddataport.command == COMMAND_SET_RING) begin     
        reg_next.ring_writing = commanddataport.data0[PE_CNT*SLOT_NUM-1:0];
        reg_next.ring_reading = commanddataport.data1[PE_CNT*SLOT_NUM-1:0];
      end 

    end

    if(reg_current.state_STATE_NTT_A_DMA) begin
    end

    if(reg_current.NTT_in) begin
      for(int i = 0; i < E; i ++) begin
        module_outputs[reg_current.pe_select].wdata[i*FSIZE +: FSIZE] = reg_current.NTT_A[i];
      end

      module_outputs[reg_current.pe_select].wren = 1;
      module_outputs[reg_current.pe_select].waddr = reg_current.NTT_addr;

      reg_next.NTT_addr = reg_current.NTT_addr + 1;
      reg_next.NTT_in = 0;
    end

    if(NTT_read) begin
      for(int i = 0; i < E; i ++) begin
        if(i == NTT_read_offset) begin
         reg_next.NTT_read_data =module_inputs[reg_current.pe_select][i*FSIZE +: FSIZE];
        end
      end
    end

    for(int i = 0; i < E; i ++) begin
      if(i == NTT_read_offset) begin
        NTT_rdata_in =module_inputs[reg_current.pe_select][i*FSIZE +: FSIZE];
      end
    end

    for(int k = 0; k < PE_CNT ; k++) begin
      for(int i = 0; i < SLOT_NUM ; i++) begin
        router_inputs[k*SLOT_NUM + i] = module_set_outputs[k][i];
        module_set_inputs[k][i] = router_outputs[k*SLOT_NUM + i];
      end
    end

    //rev_working
    for(int k = 0; k < PE_CNT ; k++) begin
      for(int i = 0; i < REV_TRANS_MODULE_NUM ; i++) begin
        if(reg_current.state_STATE_WAIT_BITREV[k][i]) begin
          reg_next.state_STATE_WAIT_BITREV[k][i] = 0;
          reg_next.state_STATE_RUN_BITREV[k][i] = 1;
        end
        if(reg_current.state_STATE_RUN_BITREV[k][i]) begin
          if(!bitRev_working[k][i]) begin
            reg_next.state_STATE_RUN_BITREV[k][i] = 0;
          end
        end
      end
      //perm_working
      for(int i = 0; i < PERM_MODULE_NUM ; i++) begin
        if(reg_current.state_STATE_WAIT_PERM[k][i]) begin
          reg_next.state_STATE_WAIT_PERM[k][i] = 0;
          reg_next.state_STATE_RUN_PERM[k][i] = 1;
        end
        if(reg_current.state_STATE_RUN_PERM[k][i]) begin
          if(!perm_working[k][i]) begin
            reg_next.state_STATE_RUN_PERM[k][i] = 0;
          end
        end
      end
      //auto_working
      for(int i = 0; i < AUTO_MODULE_NUM ; i++) begin
        if(reg_current.state_STATE_WAIT_AUTO[k][i]) begin
          reg_next.state_STATE_WAIT_AUTO[k][i] = 0;
          reg_next.state_STATE_RUN_AUTO[k][i] = 1;
        end
        if(reg_current.state_STATE_RUN_AUTO[k][i]) begin
          if(!auto_working[k][i]) begin
            reg_next.state_STATE_RUN_AUTO[k][i] = 0;
          end
        end
      end
      //ntt_working
      for(int i = 0; i < NTT_MODULE_NUM ; i++) begin
        if(reg_current.state_STATE_WAIT_NTT[k][i]) begin
          reg_next.state_STATE_WAIT_NTT[k][i] = 0;
          reg_next.state_STATE_RUN_NTT[k][i] = 1;
        end
        if(reg_current.state_STATE_RUN_NTT[k][i]) begin
          if(!NTT_working[k][i]) begin
            reg_next.state_STATE_RUN_NTT[k][i] = 0;
          end
        end
      end
      //intt_working
      for(int i = 0; i < INTT_MODULE_NUM ; i++) begin
        if(reg_current.state_STATE_WAIT_INTT[k][i]) begin
          reg_next.state_STATE_WAIT_INTT[k][i] = 0;
          reg_next.state_STATE_RUN_INTT[k][i] = 1;
        end
        if(reg_current.state_STATE_RUN_INTT[k][i]) begin
          if(!iNTT_working[k][i]) begin
            reg_next.state_STATE_RUN_INTT[k][i] = 0;
          end
        end
      end
      //vector_add_working
      for(int i = 0; i < ADD_MODULE_NUM ; i++) begin
        if(reg_current.state_STATE_WAIT_ADD[k][i]) begin
          reg_next.state_STATE_WAIT_ADD[k][i] = 0;
          reg_next.state_STATE_RUN_ADD[k][i] = 1;
        end
        if(reg_current.state_STATE_RUN_ADD[k][i]) begin
          if(!vector_add_working[k][i]) begin
            reg_next.state_STATE_RUN_ADD[k][i] = 0;
          end
        end
      end
      //vector_multi_working
      for(int i = 0; i < MULTI_MODULE_NUM ; i++) begin
        if(reg_current.state_STATE_WAIT_MULTI[k][i]) begin
          reg_next.state_STATE_WAIT_MULTI[k][i] = 0;
          reg_next.state_STATE_RUN_MULTI[k][i] = 1;
        end
        if(reg_current.state_STATE_RUN_MULTI[k][i]) begin
          if(!vector_multi_working[k][i]) begin
            reg_next.state_STATE_RUN_MULTI[k][i] = 0;
          end
        end
      end
      //vector_lazy_working
      for(int i = 0; i < LAZY_MODULE_NUM ; i++) begin
        if(reg_current.state_STATE_WAIT_LAZY[k][i]) begin
          reg_next.state_STATE_WAIT_LAZY[k][i] = 0;
          reg_next.state_STATE_RUN_LAZY[k][i] = 1;
        end
        if(reg_current.state_STATE_RUN_LAZY[k][i]) begin
          if(!vector_lazy_working[k][i]) begin
            reg_next.state_STATE_RUN_LAZY[k][i] = 0;
          end
        end
      end
      //set_uint_working
      for(int i = 0; i < SET_UINT_MODULE_NUM ; i++) begin
        if(reg_current.state_STATE_WAIT_SET_UINT[k][i]) begin
          reg_next.state_STATE_WAIT_SET_UINT[k][i] = 0;
          reg_next.state_STATE_RUN_SET_UINT[k][i] = 1;
        end
        if(reg_current.state_STATE_RUN_SET_UINT[k][i]) begin
          if(!set_uint_working[k][i]) begin
            reg_next.state_STATE_RUN_SET_UINT[k][i] = 0;
          end
        end
      end
      //vector_decomp_working
      for(int i = 0; i < DECOMP_MODULE_NUM ; i++) begin
        if(reg_current.state_STATE_WAIT_DECOMP[k][i]) begin
          reg_next.state_STATE_WAIT_DECOMP[k][i] = 0;
          reg_next.state_STATE_RUN_DECOMP[k][i] = 1;
        end
        if(reg_current.state_STATE_RUN_DECOMP[k][i]) begin
          if(!vector_decomp_working[k][i]) begin
            reg_next.state_STATE_RUN_DECOMP[k][i] = 0;
          end
        end
      end
    end
      
    if(reg_current.soft_rst_count > 0) begin
      reg_next.soft_rst_count = reg_current.soft_rst_count -1;      
    end

    if(rstn == 0) begin
      for(int k = 0; k < PE_CNT ; k++) begin
        for(int i = 0 ; i < REV_TRANS_MODULE_NUM ; i++) begin
          reg_next.state_STATE_WAIT_BITREV[k][i] = 0;
          reg_next.state_STATE_RUN_BITREV[k][i] = 0;
        end
        for(int i = 0 ; i < PERM_MODULE_NUM ; i++) begin
          reg_next.state_STATE_WAIT_PERM[k][i] = 0;
          reg_next.state_STATE_RUN_PERM[k][i] = 0;
        end
        for(int i = 0 ; i < AUTO_MODULE_NUM ; i++) begin
          reg_next.state_STATE_WAIT_AUTO[k][i] = 0;
          reg_next.state_STATE_RUN_AUTO[k][i] = 0;
        end
        for(int i = 0 ; i < NTT_MODULE_NUM ; i++) begin
          reg_next.state_STATE_WAIT_NTT[k][i] = 0;
          reg_next.state_STATE_RUN_NTT[k][i] = 0;
        end
        for(int i = 0 ; i < INTT_MODULE_NUM ; i++) begin
          reg_next.state_STATE_WAIT_INTT[k][i] = 0;
          reg_next.state_STATE_RUN_INTT[k][i] = 0;
        end
        for(int i = 0 ; i < ADD_MODULE_NUM ; i++) begin
          reg_next.state_STATE_WAIT_ADD[k][i] = 0;
          reg_next.state_STATE_RUN_ADD[k][i] = 0;
        end
        for(int i = 0 ; i < MULTI_MODULE_NUM ; i++) begin
          reg_next.state_STATE_WAIT_MULTI[k][i] = 0;
          reg_next.state_STATE_RUN_MULTI[k][i] = 0;
        end
        for(int i = 0 ; i < LAZY_MODULE_NUM ; i++) begin
          reg_next.state_STATE_WAIT_LAZY[k][i] = 0;
          reg_next.state_STATE_RUN_LAZY[k][i] = 0;
        end
        for(int i = 0 ; i < SET_UINT_MODULE_NUM ; i++) begin
          reg_next.state_STATE_WAIT_SET_UINT[k][i] = 0;
          reg_next.state_STATE_RUN_SET_UINT[k][i] = 0;
        end
        for(int i = 0 ; i < DECOMP_MODULE_NUM ; i++) begin
          reg_next.state_STATE_WAIT_DECOMP[k][i] = 0;
          reg_next.state_STATE_RUN_DECOMP[k][i] = 0;
        end
      end
      
      reg_next.W_addr = 0;
      reg_next.NTT_addr = 0;

      reg_next.soft_rst_count = 10;

    end
  end
       
    
  always @ (posedge clk) begin  
    reg_current <= reg_next;
	end
endmodule
