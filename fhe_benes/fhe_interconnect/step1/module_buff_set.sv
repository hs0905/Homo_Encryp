`timescale 1 ns / 1 ns

`include "defines.vh"
import FHE_ALU_PKG::*;

module module_set #(
        // param set
        parameter REV_TRANS_MODULE_NUM_IN_SET   = 1,
        parameter PERM_MODULE_NUM_IN_SET        = 1,
        parameter AUTO_MODULE_NUM_IN_SET        = 1,
        parameter NTT_MODULE_NUM_IN_SET         = 2,
        parameter INTT_MODULE_NUM_IN_SET        = 2,
        parameter ADD_MODULE_NUM_IN_SET         = 1,
        parameter MULTI_MODULE_NUM_IN_SET       = 1,
        parameter LAZY_MODULE_NUM_IN_SET        = 1,
        parameter SET_UINT_MODULE_NUM_IN_SET    = 1,
        parameter DECOMP_MODULE_NUM_IN_SET      = 1,

        // param auto
        parameter MODULE_NUM_IN_SET = (1 + REV_TRANS_MODULE_NUM_IN_SET + PERM_MODULE_NUM_IN_SET*2 + AUTO_MODULE_NUM_IN_SET
                                         + NTT_MODULE_NUM_IN_SET + INTT_MODULE_NUM_IN_SET+ ADD_MODULE_NUM_IN_SET*2
                                         + MULTI_MODULE_NUM_IN_SET*2 + LAZY_MODULE_NUM_IN_SET*4 + SET_UINT_MODULE_NUM_IN_SET*2 + DECOMP_MODULE_NUM_IN_SET), // number of module(20)
        parameter SLOT_NUM_IN_SET = MODULE_NUM_IN_SET, // number of buffer ram slot (equal to number of module)

        parameter NTT_INTT_NUM_IN_SET = NTT_MODULE_NUM_IN_SET + INTT_MODULE_NUM_IN_SET, // 4
        parameter ROOT_POWER_NUM_IN_SET = NTT_INTT_NUM_IN_SET 
	) (
		input logic	clk,		    		
		input logic rstn,
        input logic soft_rst_count,
        input logic [logE-1:0] diff_logN, // (logE = 3) => 3bit

        // start signal
        input logic [REV_TRANS_MODULE_NUM_IN_SET-1:0]   start_bitRev,
        input logic [REV_TRANS_MODULE_NUM_IN_SET-1:0]   start_transpose,
        input logic [PERM_MODULE_NUM_IN_SET-1:0]        start_perm,
        input logic [AUTO_MODULE_NUM_IN_SET-1:0]        start_auto,
        input logic [NTT_MODULE_NUM_IN_SET-1:0]         start_NTT,
        input logic [INTT_MODULE_NUM_IN_SET-1:0]        start_iNTT,
        input logic [ADD_MODULE_NUM_IN_SET-1:0]         start_vector_add,
        input logic [MULTI_MODULE_NUM_IN_SET-1:0]       start_vector_multi,
        input logic [LAZY_MODULE_NUM_IN_SET-1:0]        start_vector_lazy,
        input logic [SET_UINT_MODULE_NUM_IN_SET-1:0]    start_set_uint,
        input logic [DECOMP_MODULE_NUM_IN_SET-1:0]      start_vector_decomp,

        // rev_trans parameter
        input logic [$clog2(logN-logE)-1:0] transpose_base,
        input logic [$clog2(logE)-1:0]      barrel_store,
        input logic [$clog2(logE)-1:0]      barrel_load,

        // perm parameter
        input logic [15:0] perm_pattern,

        //  p
        input logic [FSIZE-1:0] p,
        input logic [FSIZE-1:0] scalar,
        input logic [FSIZE-1:0] pq0,
        input logic [FSIZE-1:0] pq1,

        // auto parameter
        input logic [logE-1:0] auto_offset	,
        input logic [logN-1:0] auto_base,
        input logic [FSIZE-1:0] k	,

        // ntt/intt parameter
        input logic [$clog2(logE)-1:0] NTT_levels	,
        input logic [$clog2(logN)-1:0] NTT_base_level	,

        // vector parameter
        input logic [3:0]                               vector_operation,
        input logic [logE-1:0][$clog2(N/(E/2))-1:0]     ntt_input_W_waddr,
        input logic [logE-1:0][E/2-1:0][FSIZE-1:0]      ntt_input_W_wdata,
        input logic [logE-1:0][E/2-1:0]                 ntt_input_W_wren,
        input logic [logE-1:0][$clog2(N/(E/2))-1:0]     ntt_input_WQ_waddr,
        input logic [logE-1:0][E/2-1:0][FSIZE-1:0]      ntt_input_WQ_wdata,
        input logic [logE-1:0][E/2-1:0]                 ntt_input_WQ_wren,

        input logic [SLOT_NUM_IN_SET-1:0][$clog2(MODULE_NUM_IN_SET)-1:0] module_select	,
        input logic [MODULE_NUM_IN_SET-1:0][$clog2(SLOT_NUM_IN_SET)-1:0] slot_select	,
        input logic [ROOT_POWER_NUM_IN_SET-1:0][$clog2(NTT_INTT_NUM_IN_SET)-1:0] ntt_intt_select	,
        input logic [NTT_INTT_NUM_IN_SET-1:0][$clog2(ROOT_POWER_NUM_IN_SET)-1:0] root_select	,

        // working
        output logic bitRev_working [0:REV_TRANS_MODULE_NUM_IN_SET-1],
        output logic perm_working [0:PERM_MODULE_NUM_IN_SET-1],
        output logic auto_working [0:AUTO_MODULE_NUM_IN_SET-1],
        output logic NTT_working [0:NTT_MODULE_NUM_IN_SET-1],
        output logic iNTT_working [0:INTT_MODULE_NUM_IN_SET-1],
        output logic vector_add_working [0:ADD_MODULE_NUM_IN_SET-1],
        output logic vector_multi_working [0:MULTI_MODULE_NUM_IN_SET-1],
        output logic vector_lazy_working [0:LAZY_MODULE_NUM_IN_SET-1],
        output logic set_uint_working [0:SET_UINT_MODULE_NUM_IN_SET-1],
        output logic vector_decomp_working [0:DECOMP_MODULE_NUM_IN_SET-1],

        // from host
        input BufferRAMTEFsizeInputs  host_outputs,
        output logic [E*FSIZE-1:0]   host_inputs,

        // to router
        output BufferRAMTEFsizeInputs NTT_ram_inputs[0:SLOT_NUM_IN_SET-1],
        input logic [E*FSIZE-1:0] NTT_ram_outputs_rdata[0:SLOT_NUM_IN_SET-1]
	);

    //ROOT_POWER
    logic [ROOT_POWER_NUM_IN_SET-1:0][logE-1:0][$clog2(N/(E/2))-1:0]     W_ram_raddr;
    logic [ROOT_POWER_NUM_IN_SET-1:0][logE-1:0][E/2-1:0][FSIZE-1:0]  W_ram_rdata;
    logic [ROOT_POWER_NUM_IN_SET-1:0][logE-1:0][E/2-1:0][FSIZE-1:0]  WQ_ram_rdata;

    logic [ROOT_POWER_NUM_IN_SET-1:0][logE-1:0][$clog2(N/(E/2))-1:0]     W_ram_waddr;
    logic [ROOT_POWER_NUM_IN_SET-1:0][logE-1:0][E/2-1:0][FSIZE-1:0]  W_ram_wdata;
    logic [ROOT_POWER_NUM_IN_SET-1:0][logE-1:0][E/2-1:0]             W_ram_wren;
    logic [ROOT_POWER_NUM_IN_SET-1:0][logE-1:0][$clog2(N/(E/2))-1:0]     WQ_ram_waddr;
    logic [ROOT_POWER_NUM_IN_SET-1:0][logE-1:0][E/2-1:0][FSIZE-1:0]  WQ_ram_wdata;
    logic [ROOT_POWER_NUM_IN_SET-1:0][logE-1:0][E/2-1:0]             WQ_ram_wren;

    
    genvar gi, gj;
    generate
        for(gj = 0; gj < ROOT_POWER_NUM_IN_SET; gj++) begin : ROOT_POWER
            for(gi = 0; gi < logE; gi++) begin  
                BufferRAMT #(
                .ID(0),
                .DEPTH(N/(E/2)),
                .WIDTH(FSIZE),
                .ITEMS(1<<gi)
                // .MEMORY_TYPE("ultra")
                )  W_ram (
                .clk(clk),
                .raddr(W_ram_raddr[gj][gi]),
                .waddr(W_ram_waddr[gj][gi]),
                .wdata(W_ram_wdata[gj][gi]),
                .wren(W_ram_wren[gj][gi]),
                .rdata(W_ram_rdata[gj][gi])
                );
                
                BufferRAMT #(
                .ID(0),
                .DEPTH(N/(E/2)),
                .WIDTH(FSIZE),
                .ITEMS(1<<gi)
                // .MEMORY_TYPE("ultra")/////////////////////
                )  WQ_ram (
                .clk(clk),
                .raddr(W_ram_raddr[gj][gi]), //same as W
                .waddr(WQ_ram_waddr[gj][gi]),
                .wdata(WQ_ram_wdata[gj][gi]),
                .wren(WQ_ram_wren[gj][gi]),
                .rdata(WQ_ram_rdata[gj][gi])
                );
            end
        end
    endgenerate

    //read
    logic [NTT_INTT_NUM_IN_SET-1:0   ][logE-1:0][$clog2(N/(E/2))-1:0]  ntt_output; //addr
    logic [NTT_INTT_NUM_IN_SET-1:0][logE-1:0][E/2-1:0][FSIZE-1:0]   ntt_input_W; //data
    logic [NTT_INTT_NUM_IN_SET-1:0][logE-1:0][E/2-1:0][FSIZE-1:0]   ntt_input_WQ;

    RootInterconnect_v2 #(
          .NTT_INTT_NUM_IN_ROOT(NTT_INTT_NUM_IN_SET),
          .ROOT_POWER_NUM_IN_ROOT(ROOT_POWER_NUM_IN_SET)
        )  root_interconnect (
        .clk(clk),
        .rstn(rstn),
        .root_input(W_ram_raddr),
        .root_output_W(W_ram_rdata),
        .root_output_WQ(WQ_ram_rdata),
        .ntt_output(ntt_output),
        .ntt_input_W(ntt_input_W),
        .ntt_input_WQ(ntt_input_WQ),

        .ntt_input_W_waddr(ntt_input_W_waddr),
        .ntt_input_W_wdata(ntt_input_W_wdata),
        .ntt_input_W_wren(ntt_input_W_wren),
        .ntt_input_WQ_waddr(ntt_input_WQ_waddr),
        .ntt_input_WQ_wdata(ntt_input_WQ_wdata),
        .ntt_input_WQ_wren(ntt_input_WQ_wren),

        .W_ram_wdata(W_ram_wdata),
        .W_ram_wren(W_ram_wren),
        .W_ram_waddr(W_ram_waddr),
        .WQ_ram_wdata(WQ_ram_wdata),
        .WQ_ram_wren(WQ_ram_wren),
        .WQ_ram_waddr(WQ_ram_waddr),

        .ntt_intt_select(ntt_intt_select),
        .root_select(root_select)
    );

    BufferRAMTEFsizeInputs  module_outputs[0:MODULE_NUM_IN_SET-1];
    logic [E*FSIZE-1:0]   module_inputs[0:MODULE_NUM_IN_SET-1];

    BufferInterconnect_v6 #(
          .SLOT_NUM_IN_BUFF(SLOT_NUM_IN_SET),
          .MODULE_NUM_IN_BUFF(MODULE_NUM_IN_SET)
        )  buffer_interconnect (
        .clk(clk),
        .rstn(rstn),
        .ram_inputs(NTT_ram_inputs),
        .ram_outputs(NTT_ram_outputs_rdata),
        .module_outputs(module_outputs),
        .module_inputs(module_inputs),
        .module_select(module_select),
        .slot_select(slot_select)
    );

    //bit reverse & transpose
    // logic                  bitRev_working[0:REV_TRANS_MODULE_NUM_IN_SET-1];
    BufferRAMTEFsizeInputs NTT_ram_inputs_BitRev[0:REV_TRANS_MODULE_NUM_IN_SET-1];
    logic [E*FSIZE-1:0]    REV_TRANS_inputs_rdata[0:REV_TRANS_MODULE_NUM_IN_SET-1];
    genvar a;
    generate
        for(a = 0 ; a < REV_TRANS_MODULE_NUM_IN_SET ; a++) begin : REV_TRANS_MODULE
        BitRevControl_v2 bit_rev_control(
            .clk(clk),
            .rstn(rstn && (soft_rst_count == 0)),
            .diff_logN(diff_logN),
            .start_bitRev(start_bitRev[a]),
            .start_transpose(start_transpose[a]),
            .transpose_base(transpose_base),
            .barrel_store(barrel_store),
            .barrel_load(barrel_load),
            .bitRev_working(bitRev_working[a]),
            .ram_inputs(NTT_ram_inputs_BitRev[a]),
            .ram_outputs_rdata(REV_TRANS_inputs_rdata[a])
        );
        end
    endgenerate

    //permutation
    // logic                  perm_working[0:PERM_MODULE_NUM_IN_SET-1];
    BufferRAMTEFsizeInputs NTT_ram_inputs_perm1[0:PERM_MODULE_NUM_IN_SET-1];
    BufferRAMTEFsizeInputs NTT_ram_inputs_perm2[0:PERM_MODULE_NUM_IN_SET-1];
    logic [E*FSIZE-1:0]    PERM_inputs_rdata[0:PERM_MODULE_NUM_IN_SET-1];
    genvar b;
    generate
        for(b = 0 ; b < PERM_MODULE_NUM_IN_SET ; b++) begin : PERM_MODULE
        PermControl_v2 perm_control(
            .clk(clk),
            .rstn(rstn && (soft_rst_count == 0)),
            .diff_logN(diff_logN),
            .start_perm(start_perm[b]),
            .perm_pattern(perm_pattern),
            .perm_working(perm_working[b]),
            .ram_inputs1(NTT_ram_inputs_perm1[b]),
            .ram_inputs2(NTT_ram_inputs_perm2[b]),
            .ram_outputs_rdata1(PERM_inputs_rdata[b])
        );
        end
    endgenerate

    //auto
    // logic                  auto_working[0:AUTO_MODULE_NUM_IN_SET-1];
    BufferRAMTEFsizeInputs NTT_ram_inputs_auto[0:AUTO_MODULE_NUM_IN_SET-1];
    logic [E*FSIZE-1:0]    AUTO_inputs_rdata[0:AUTO_MODULE_NUM_IN_SET-1];
    genvar c;
    generate
        for(c = 0 ; c < AUTO_MODULE_NUM_IN_SET ; c++) begin : AUTO_MODULE
        AutomorphismControl_v2 auto_control (	
            .clk(clk),		    		
            .rstn(rstn && (soft_rst_count == 0)),	
            .diff_logN(diff_logN),		
            .start_auto(start_auto[c]),
            .p(p),
            .auto_offset(auto_offset), //not optimize
            .auto_base(auto_base), //not optimize   
            .k(k),
            .auto_working(auto_working[c]),
            .ram_inputs(NTT_ram_inputs_auto[c]),
            .ram_outputs_rdata(AUTO_inputs_rdata[c])
        );
        end
    endgenerate

    //ntt
    // logic                                 NTT_working[0:NTT_MODULE_NUM_IN_SET-1];
    BufferRAMTEFsizeInputs                NTT_ram_inputs_NTT[0:NTT_MODULE_NUM_IN_SET-1];
    logic [E*FSIZE-1:0]                   NTT_inputs_rdata[0:NTT_MODULE_NUM_IN_SET-1]; // <= module_inputs
    logic [logE-1:0][$clog2(N/(E/2))-1:0]  NTT_W_raddr[0:NTT_MODULE_NUM_IN_SET-1];
    logic [logE-1:0][E/2-1:0][FSIZE-1:0]   NTT_input_W[0:NTT_MODULE_NUM_IN_SET-1]; // <= ntt_input_W
    logic [logE-1:0][E/2-1:0][FSIZE-1:0]   NTT_input_WQ[0:NTT_MODULE_NUM_IN_SET-1]; // <= ntt_input_WQ
    genvar d;
    generate
        for(d = 0 ; d < NTT_MODULE_NUM_IN_SET ; d++) begin : NTT_MODULE
        NTTControl_v2 ntt_control(
            .clk(clk),
            .rstn(rstn && (soft_rst_count == 0)),
            .diff_logN(diff_logN),
            .start_NTT(start_NTT[d]),
            .p(p),
            .NTT_levels(NTT_levels),
            .NTT_base_level(NTT_base_level),
            .NTT_working(NTT_working[d]),
            .ram_inputs(NTT_ram_inputs_NTT[d]),
            .ram_outputs_rdata(NTT_inputs_rdata[d]),
            .W_ram_raddr(NTT_W_raddr[d]),
            .W_ram_rdata(NTT_input_W[d]),
            .WQ_ram_rdata(NTT_input_WQ[d])
        );
        end
    endgenerate

    //intt
    // logic                                 iNTT_working[0:INTT_MODULE_NUM_IN_SET-1];
    BufferRAMTEFsizeInputs                INTT_ram_inputs_INTT[0:INTT_MODULE_NUM_IN_SET-1];
    logic [E*FSIZE-1:0]                   INTT_inputs_rdata[0:INTT_MODULE_NUM_IN_SET-1]; // <= module_inputs
    logic [logE-1:0][$clog2(N/(E/2))-1:0] INTT_W_raddr[0:INTT_MODULE_NUM_IN_SET-1];
    logic [logE-1:0][E/2-1:0][FSIZE-1:0]   INTT_input_W[0:INTT_MODULE_NUM_IN_SET-1]; // <= ntt_input_W
    logic [logE-1:0][E/2-1:0][FSIZE-1:0]   INTT_input_WQ[0:INTT_MODULE_NUM_IN_SET-1]; // <= ntt_input_WQ
    genvar e;
    generate
        for(e = 0 ; e < INTT_MODULE_NUM_IN_SET ; e++) begin : INTT_MODULE
        iNTTControl_v2 intt_control(
            .clk(clk),
            .rstn(rstn && (soft_rst_count == 0)),
            .diff_logN(diff_logN),
            .start_NTT(start_iNTT[e]),
            .p(p),
            .NTT_levels(NTT_levels),
            .NTT_base_level(NTT_base_level),
            .NTT_working(iNTT_working[e]),
            .ram_inputs(INTT_ram_inputs_INTT[e]),
            .ram_outputs_rdata(INTT_inputs_rdata[e]),
            .W_ram_raddr(INTT_W_raddr[e]),
            .W_ram_rdata(INTT_input_W[e]),
            .WQ_ram_rdata(INTT_input_WQ[e])
        );
        end
    endgenerate

    //add
    // logic                  vector_add_working[0:ADD_MODULE_NUM_IN_SET-1];
    BufferRAMTEFsizeInputs NTT_ram_inputs_vector_add_op1[0:ADD_MODULE_NUM_IN_SET-1];
    BufferRAMTEFsizeInputs NTT_ram_inputs_vector_add_op2[0:ADD_MODULE_NUM_IN_SET-1];
    logic [E*FSIZE-1:0]    ADD_inputs_rdata1[0:ADD_MODULE_NUM_IN_SET-1];
    logic [E*FSIZE-1:0]    ADD_inputs_rdata2[0:ADD_MODULE_NUM_IN_SET-1];
    genvar f;
        generate
        for(f = 0 ; f < ADD_MODULE_NUM_IN_SET ; f++) begin : ADD_MODULE
            VectorControl_Add vector_contrl_add(
            .clk(clk),
            .rstn(rstn && (soft_rst_count == 0)),
            .diff_logN(diff_logN),
            .start_vector(start_vector_add[f]), //seperate per operation
            .operation(vector_operation),
            .vector_working(vector_add_working[f]), //seperate per operation
            .p(p),
            .scalar(scalar),
            .ram_inputs_op1(NTT_ram_inputs_vector_add_op1[f]),
            .ram_inputs_op2(NTT_ram_inputs_vector_add_op2[f]),
            .op1(ADD_inputs_rdata1[f]),
            .op2(ADD_inputs_rdata2[f])
            );
        end
    endgenerate

    //multi
    // logic                  vector_multi_working[0:MULTI_MODULE_NUM_IN_SET-1];
    BufferRAMTEFsizeInputs NTT_ram_inputs_vector_multi_op1[0:MULTI_MODULE_NUM_IN_SET-1];
    BufferRAMTEFsizeInputs NTT_ram_inputs_vector_multi_op2[0:MULTI_MODULE_NUM_IN_SET-1];
    logic [E*FSIZE-1:0]    MULTI_inputs_rdata1[0:MULTI_MODULE_NUM_IN_SET-1];
    logic [E*FSIZE-1:0]    MULTI_inputs_rdata2[0:MULTI_MODULE_NUM_IN_SET-1];
    genvar g;
        generate
        for(g = 0 ; g < MULTI_MODULE_NUM_IN_SET ; g++) begin : MULTI_MODULE
            VectorControl_Multi vector_contrl_multi(
            .clk(clk),
            .rstn(rstn && (soft_rst_count == 0)),
            .diff_logN(diff_logN),
            .start_vector(start_vector_multi[g]), //seperate per operation
            .operation(vector_operation),
            .vector_working(vector_multi_working[g]), //seperate per operation
            .p(p),
            .pq0(pq0),
            .pq1(pq1),
            .scalar(scalar),
            .ram_inputs_op1(NTT_ram_inputs_vector_multi_op1[g]),
            .ram_inputs_op2(NTT_ram_inputs_vector_multi_op2[g]),
            .op1(MULTI_inputs_rdata1[g]),
            .op2(MULTI_inputs_rdata2[g])
            );
        end
    endgenerate

    //lazy
    // logic                  vector_lazy_working[0:LAZY_MODULE_NUM_IN_SET-1];
    BufferRAMTEFsizeInputs NTT_ram_inputs_vector_lazy_op1[0:LAZY_MODULE_NUM_IN_SET-1];
    BufferRAMTEFsizeInputs NTT_ram_inputs_vector_lazy_op2[0:LAZY_MODULE_NUM_IN_SET-1];
    BufferRAMTEFsizeInputs NTT_ram_inputs_vector_lazy_op3[0:LAZY_MODULE_NUM_IN_SET-1];
    BufferRAMTEFsizeInputs NTT_ram_inputs_vector_lazy_op4[0:LAZY_MODULE_NUM_IN_SET-1];
    logic [E*FSIZE-1:0]    LAZY_inputs_rdata1[0:LAZY_MODULE_NUM_IN_SET-1];
    logic [E*FSIZE-1:0]    LAZY_inputs_rdata2[0:LAZY_MODULE_NUM_IN_SET-1];
    logic [E*FSIZE-1:0]    LAZY_inputs_rdata3[0:LAZY_MODULE_NUM_IN_SET-1];
    logic [E*FSIZE-1:0]    LAZY_inputs_rdata4[0:LAZY_MODULE_NUM_IN_SET-1];
    genvar h;
        generate
        for(h = 0 ; h < LAZY_MODULE_NUM_IN_SET ; h++) begin : LAZY_MODULE
            VectorControl_Lazy vector_contrl_lazy(
            .clk(clk),
            .rstn(rstn && (soft_rst_count == 0)),
            .start_vector(start_vector_lazy[h]), //seperate per operation
            .operation(vector_operation),
            .vector_working(vector_lazy_working[h]), //seperate per operation
            .ram_inputs_op1(NTT_ram_inputs_vector_lazy_op1[h]),
            .ram_inputs_op2(NTT_ram_inputs_vector_lazy_op2[h]),
            .ram_inputs_op3(NTT_ram_inputs_vector_lazy_op3[h]),
            .ram_inputs_op4(NTT_ram_inputs_vector_lazy_op4[h]),
            .op1(LAZY_inputs_rdata1[h]),
            .op2(LAZY_inputs_rdata2[h]),
            .op3(LAZY_inputs_rdata3[h]),
            .op4(LAZY_inputs_rdata4[h])
            );
        end
    endgenerate

    //set_uint
    // logic                  set_uint_working[0:SET_UINT_MODULE_NUM_IN_SET-1];
    BufferRAMTEFsizeInputs NTT_ram_inputs_set_uint1[0:SET_UINT_MODULE_NUM_IN_SET-1];
    BufferRAMTEFsizeInputs NTT_ram_inputs_set_uint2[0:SET_UINT_MODULE_NUM_IN_SET-1];
    logic [E*FSIZE-1:0]    SET_UINT_inputs_rdata1[0:SET_UINT_MODULE_NUM_IN_SET-1];
    genvar i;
        generate
        for(i = 0 ; i < SET_UINT_MODULE_NUM_IN_SET ; i++) begin : SET_UINT_MODULE
            Set_Unit_Control set_uint_control(
            .clk(clk),
            .rstn(rstn && (soft_rst_count == 0)),
            .start_set_uint(start_set_uint[i]),
            .set_uint_working(set_uint_working[i]),
            .ram_inputs1(NTT_ram_inputs_set_uint1[i]),
            .ram_inputs2(NTT_ram_inputs_set_uint2[i]),
            .ram_outputs_rdata1(SET_UINT_inputs_rdata1[i])
            );
        end
    endgenerate

    //decompose
    // logic                  vector_decomp_working[0:DECOMP_MODULE_NUM_IN_SET-1];
    BufferRAMTEFsizeInputs NTT_ram_inputs_vector_decomp_op1[0:DECOMP_MODULE_NUM_IN_SET-1];
    logic [E*FSIZE-1:0]    DECOMP_inputs_rdata1[0:DECOMP_MODULE_NUM_IN_SET-1];
    genvar j;
        generate
        for(j = 0 ; j < DECOMP_MODULE_NUM_IN_SET ; j++) begin : DECOMP_MODULE
            VectorControl_Decomp vector_contrl_decomp(
            .clk(clk),
            .rstn(rstn && (soft_rst_count == 0)),
            .start_vector(start_vector_decomp[j]), //seperate per operation
            .operation(vector_operation),
            .vector_working(vector_decomp_working[j]), //seperate per operation
            .p(p),
            .pq0(pq0),
            .ram_inputs_op1(NTT_ram_inputs_vector_decomp_op1[j]),
            .op1(DECOMP_inputs_rdata1[j])
            );
        end
    endgenerate

    always_comb begin

        module_outputs[0] = host_outputs;
        host_inputs = module_inputs[0];
        for(int i = 1; i < MODULE_NUM_IN_SET ;i+=0 ) begin
            if(i < (1 + REV_TRANS_MODULE_NUM_IN_SET)) begin
                for(int j = 0; j < REV_TRANS_MODULE_NUM_IN_SET ; j++, i++) begin
                module_outputs[i] = NTT_ram_inputs_BitRev[j];
                REV_TRANS_inputs_rdata[j] = module_inputs[i];
                end
            end
            else if(i < (1 + REV_TRANS_MODULE_NUM_IN_SET + PERM_MODULE_NUM_IN_SET*2)) begin
                for(int j = 0; j < PERM_MODULE_NUM_IN_SET ; j++, i+=2) begin
                module_outputs[i] = NTT_ram_inputs_perm1[j];
                module_outputs[i+1] = NTT_ram_inputs_perm2[j];
                PERM_inputs_rdata[j] = module_inputs[i];
                end
            end
            else if(i < (1 + REV_TRANS_MODULE_NUM_IN_SET + PERM_MODULE_NUM_IN_SET*2 + AUTO_MODULE_NUM_IN_SET)) begin
                for(int j = 0; j < AUTO_MODULE_NUM_IN_SET ; j++, i++) begin
                module_outputs[i] = NTT_ram_inputs_auto[j];
                AUTO_inputs_rdata[j] = module_inputs[i];
                end
            end
            else if(i < (1 + REV_TRANS_MODULE_NUM_IN_SET + PERM_MODULE_NUM_IN_SET*2 + AUTO_MODULE_NUM_IN_SET 
                            + NTT_MODULE_NUM_IN_SET)) begin
                for(int j = 0; j < NTT_MODULE_NUM_IN_SET ; j++, i++) begin
                module_outputs[i] = NTT_ram_inputs_NTT[j];
                NTT_inputs_rdata[j] = module_inputs[i];
                end
            end
            else if(i < (1 + REV_TRANS_MODULE_NUM_IN_SET + PERM_MODULE_NUM_IN_SET*2 + AUTO_MODULE_NUM_IN_SET 
                            + NTT_MODULE_NUM_IN_SET + INTT_MODULE_NUM_IN_SET)) begin
                for(int j = 0; j < INTT_MODULE_NUM_IN_SET ; j++, i++) begin
                module_outputs[i] = INTT_ram_inputs_INTT[j];
                INTT_inputs_rdata[j] = module_inputs[i];
                end
            end
            else if(i < (1 + REV_TRANS_MODULE_NUM_IN_SET + PERM_MODULE_NUM_IN_SET*2 + AUTO_MODULE_NUM_IN_SET 
                            + NTT_MODULE_NUM_IN_SET + INTT_MODULE_NUM_IN_SET
                            + ADD_MODULE_NUM_IN_SET*2)) begin
                for(int j = 0; j < ADD_MODULE_NUM_IN_SET ; j++, i+=2) begin
                module_outputs[i] = NTT_ram_inputs_vector_add_op1[j];
                module_outputs[i+1] = NTT_ram_inputs_vector_add_op2[j];
                ADD_inputs_rdata1[j] = module_inputs[i];
                ADD_inputs_rdata2[j] = module_inputs[i+1];
                end
            end
            else if(i < (1 + REV_TRANS_MODULE_NUM_IN_SET + PERM_MODULE_NUM_IN_SET*2 + AUTO_MODULE_NUM_IN_SET 
                            + NTT_MODULE_NUM_IN_SET + INTT_MODULE_NUM_IN_SET
                            + ADD_MODULE_NUM_IN_SET*2 + MULTI_MODULE_NUM_IN_SET*2)) begin
                for(int j = 0; j < MULTI_MODULE_NUM_IN_SET ; j++, i+=2) begin
                module_outputs[i] = NTT_ram_inputs_vector_multi_op1[j];
                module_outputs[i+1] = NTT_ram_inputs_vector_multi_op2[j];
                MULTI_inputs_rdata1[j] = module_inputs[i];
                MULTI_inputs_rdata2[j] = module_inputs[i+1];
                end
            end
            else if(i < (1 + REV_TRANS_MODULE_NUM_IN_SET + PERM_MODULE_NUM_IN_SET*2 + AUTO_MODULE_NUM_IN_SET 
                            + NTT_MODULE_NUM_IN_SET + INTT_MODULE_NUM_IN_SET
                            + ADD_MODULE_NUM_IN_SET*2 + MULTI_MODULE_NUM_IN_SET*2
                            + LAZY_MODULE_NUM_IN_SET*4)) begin
                for(int j = 0; j < LAZY_MODULE_NUM_IN_SET ; j++, i+=4) begin
                module_outputs[i] = NTT_ram_inputs_vector_lazy_op1[j];
                module_outputs[i+1] = NTT_ram_inputs_vector_lazy_op2[j];
                module_outputs[i+2] = NTT_ram_inputs_vector_lazy_op3[j];
                module_outputs[i+3] = NTT_ram_inputs_vector_lazy_op4[j];
                LAZY_inputs_rdata1[j] = module_inputs[i];
                LAZY_inputs_rdata2[j] = module_inputs[i+1];
                LAZY_inputs_rdata3[j] = module_inputs[i+2];
                LAZY_inputs_rdata4[j] = module_inputs[i+3];
                end
            end
            else if(i < (1 + REV_TRANS_MODULE_NUM_IN_SET + PERM_MODULE_NUM_IN_SET*2 + AUTO_MODULE_NUM_IN_SET 
                            + NTT_MODULE_NUM_IN_SET + INTT_MODULE_NUM_IN_SET
                            + ADD_MODULE_NUM_IN_SET*2 + MULTI_MODULE_NUM_IN_SET*2
                            + LAZY_MODULE_NUM_IN_SET*4 + SET_UINT_MODULE_NUM_IN_SET*2)) begin
                for(int j = 0; j < SET_UINT_MODULE_NUM_IN_SET ; j++, i+=2) begin
                module_outputs[i] = NTT_ram_inputs_set_uint1[j];
                module_outputs[i+1] = NTT_ram_inputs_set_uint2[j];
                SET_UINT_inputs_rdata1[j] = module_inputs[i];
                end
            end
            else if(i < (1 + REV_TRANS_MODULE_NUM_IN_SET + PERM_MODULE_NUM_IN_SET*2 + AUTO_MODULE_NUM_IN_SET 
                            + NTT_MODULE_NUM_IN_SET + INTT_MODULE_NUM_IN_SET
                            + ADD_MODULE_NUM_IN_SET*2 + MULTI_MODULE_NUM_IN_SET*2
                            + LAZY_MODULE_NUM_IN_SET*4 + SET_UINT_MODULE_NUM_IN_SET*2 + DECOMP_MODULE_NUM_IN_SET)) begin
                for(int j = 0; j < DECOMP_MODULE_NUM_IN_SET ; j++, i++) begin
                module_outputs[i] = NTT_ram_inputs_vector_decomp_op1[j];
                DECOMP_inputs_rdata1[j] = module_inputs[i];
                end
            end
        end

        for(int i = 0; i < NTT_INTT_NUM_IN_SET ;i+=0 ) begin
        if(i < NTT_MODULE_NUM_IN_SET) begin
            for(int j = 0; j < NTT_MODULE_NUM_IN_SET ; j++, i++) begin
            ntt_output[i] = NTT_W_raddr[j];
            NTT_input_W[j] = ntt_input_W[i];
            NTT_input_WQ[j] = ntt_input_WQ[i];
            end
        end
        else if(i < NTT_MODULE_NUM_IN_SET + INTT_MODULE_NUM_IN_SET) begin
            for(int j = 0; j < INTT_MODULE_NUM_IN_SET ; j++, i++) begin
            ntt_output[i] = INTT_W_raddr[j];
            INTT_input_W[j] = ntt_input_W[i];
            INTT_input_WQ[j] = ntt_input_WQ[i];
            end
        end
        end
    end



endmodule