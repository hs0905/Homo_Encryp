`timescale 1 ns / 1 ns

`include "defines.vh"
import FHE_ALU_PKG::*;


module RootInterconnect_v2 #(
		parameter         DATA_SIZE     = FSIZE, 
		parameter integer CYCLES        = 2, // 1 cycle for read, 1 cycle for write

    // param set
    parameter NTT_INTT_NUM_IN_ROOT    =  NTT_INTT_NUM,    //4
    parameter ROOT_POWER_NUM_IN_ROOT  =  ROOT_POWER_NUM, //4

    // param auto
    parameter STAGE_NTT_INTT_ROOT           = $clog2(NTT_INTT_NUM_IN_ROOT),
    parameter STAGE_NTT_INTT_POWER_ROOT     = 2**STAGE_NTT_INTT_ROOT,
    parameter STAGE_ROOT_POWER_ROOT         = $clog2(ROOT_POWER_NUM_IN_ROOT),
    parameter STAGE_ROOT_POWER_POWER_ROOT   = 2**STAGE_ROOT_POWER_ROOT
	) (

	  input logic	                        clk,	
	  input logic	                        rstn,	
    // ntt_intt <=> intc <=> root
    // intc <=> root
    // W_ram_rdata, WQ_ram_rdata
    output  logic   [ROOT_POWER_NUM_IN_ROOT-1:0][logE-1:0][$clog2(N/(E/2))-1:0]   root_input, //addr
    input   logic   [ROOT_POWER_NUM_IN_ROOT-1:0][logE-1:0][E/2-1:0][FSIZE-1:0]    root_output_W, //data
    input   logic   [ROOT_POWER_NUM_IN_ROOT-1:0][logE-1:0][E/2-1:0][FSIZE-1:0]    root_output_WQ, //data

    // ntt_intt <=> intc
    // W_ram_raddr
    input logic [NTT_INTT_NUM_IN_ROOT-1:0][logE-1:0][$clog2(N/(E/2))-1:0]  ntt_output, //addr
    output logic [NTT_INTT_NUM_IN_ROOT-1:0][logE-1:0][E/2-1:0][FSIZE-1:0]   ntt_input_W, //data
    output logic [NTT_INTT_NUM_IN_ROOT-1:0][logE-1:0][E/2-1:0][FSIZE-1:0]   ntt_input_WQ, //data

    // dma => intc
    input logic [logE-1:0][$clog2(N/(E/2))-1:0]     ntt_input_W_waddr,
    input logic [logE-1:0][E/2-1:0][FSIZE-1:0]      ntt_input_W_wdata,
    input logic [logE-1:0][E/2-1:0]                 ntt_input_W_wren,
    input logic [logE-1:0][$clog2(N/(E/2))-1:0]     ntt_input_WQ_waddr,
    input logic [logE-1:0][E/2-1:0][FSIZE-1:0]      ntt_input_WQ_wdata,
    input logic [logE-1:0][E/2-1:0]                 ntt_input_WQ_wren,

    // intc => root
    output logic [ROOT_POWER_NUM_IN_ROOT-1:0][logE-1:0][E/2-1:0][FSIZE-1:0]  W_ram_wdata,
    output logic [ROOT_POWER_NUM_IN_ROOT-1:0][logE-1:0][E/2-1:0]             W_ram_wren,
    output logic [ROOT_POWER_NUM_IN_ROOT-1:0][logE-1:0][$clog2(N/(E/2))-1:0]  W_ram_waddr,
    output logic [ROOT_POWER_NUM_IN_ROOT-1:0][logE-1:0][E/2-1:0][FSIZE-1:0]  WQ_ram_wdata,
    output logic [ROOT_POWER_NUM_IN_ROOT-1:0][logE-1:0][E/2-1:0]             WQ_ram_wren,
    output logic [ROOT_POWER_NUM_IN_ROOT-1:0][logE-1:0][$clog2(N/(E/2))-1:0]  WQ_ram_waddr,

    input logic [ROOT_POWER_NUM_IN_ROOT-1:0][$clog2(NTT_INTT_NUM_IN_ROOT)-1:0] ntt_intt_select, //set module to W/WQ
    input logic [NTT_INTT_NUM_IN_ROOT-1:0][$clog2(ROOT_POWER_NUM_IN_ROOT)-1:0] root_select

    
  );
  genvar gi, gj, gk, gl, gp;
  generate

    logic [ROOT_POWER_NUM_IN_ROOT-1:0][$clog2(NTT_INTT_NUM_IN_ROOT)-1:0] ntt_intt_select_fifo;
    for(gi = 0; gi < ROOT_POWER_NUM_IN_ROOT ; gi++) begin: slot_fifo1
        FifoBuffer #(.DATA_SIZE($clog2(NTT_INTT_NUM_IN_ROOT)),       .CYCLES(1) )  fifo_slot1  (.clk(clk), .rstn(1), .in(ntt_intt_select[gi]), .out(ntt_intt_select_fifo[gi]));
    end
    // module to ram => addr (3stage)
    for(gl = 0; gl < ROOT_POWER_NUM_IN_ROOT ; gl++) begin: module_to_rootpower
      logic [STAGE_NTT_INTT_ROOT-1:0][STAGE_NTT_INTT_POWER_ROOT-1:0][logE-1:0][$clog2(N/(E/2))-1:0] intc_set_in ; //[0:STAGE_NTT_INTT_ROOT][0:STAGE_NTT_INTT_POWER_ROOT-1]
      logic [STAGE_NTT_INTT_ROOT-1:0][STAGE_NTT_INTT_POWER_ROOT-1:0][logE-1:0][$clog2(N/(E/2))-1:0] intc_set_middle ;
      logic [STAGE_NTT_INTT_ROOT-1:0][STAGE_NTT_INTT_POWER_ROOT-1:0][logE-1:0][$clog2(N/(E/2))-1:0] intc_set_out ;

      for(gi = 0; gi < STAGE_NTT_INTT_ROOT; gi++) begin : fifo_M_to_R
        // for(gj = 0; gj < 2**(STAGE_NTT_INTT_ROOT-gi) ; gj++ ) begin
        //   for(gp = 0; gp < logE ; gp++ ) begin
        //       FifoBuffer #(.DATA_SIZE($clog2(N/(E/2))),       .CYCLES(1) )  fifo_indi1  (.clk(clk), .rstn(1), .in(intc_set_in[gi][gj][gp]), .out(intc_set_middle[gi][gj][gp]));
        //   end
        // end
        

        for(gj = 0; gj < 2**(STAGE_NTT_INTT_ROOT-gi-1) ; gj++ ) begin
          assign intc_set_middle[gi][gj] = ntt_intt_select_fifo[gl][gi] ? intc_set_in[gi][2*gj+1] : intc_set_in[gi][2*gj];
        end
      end

      for(gi = 0; gi < STAGE_NTT_INTT_ROOT-1; gi++) begin
        for(gj = 0 ; gj < 2**(STAGE_NTT_INTT_ROOT-gi-1); gj++)begin

            for(gp = 0; gp < logE ; gp++ ) begin
                FifoBuffer #(.DATA_SIZE($clog2(N/(E/2))),       .CYCLES(1) )  fifo_indi1  (.clk(clk), .rstn(1), .in(intc_set_middle[gi][gj][gp]), .out(intc_set_out[gi][gj][gp]));
            end

            assign intc_set_in[gi+1][gj] = intc_set_out[gi][gj];
        end
      end

      for(gi = 0; gi < NTT_INTT_NUM_IN_ROOT; gi++) begin
        assign intc_set_in[0][gi] = ntt_output[gi];
      end
      for(gi = NTT_INTT_NUM_IN_ROOT; gi < NTT_INTT_NUM_IN_ROOT + 1 ; gi++) begin
        if( gi < 2**STAGE_NTT_INTT_ROOT)
          assign intc_set_in[0][gi] = '{default:'0};
      end
      
      assign root_input[gl] = intc_set_middle[STAGE_NTT_INTT_ROOT-1][0];
    end


    logic [NTT_INTT_NUM_IN_ROOT-1:0][$clog2(ROOT_POWER_NUM_IN_ROOT)-1:0] root_select_fifo;
    for(gi = 0; gi < NTT_INTT_NUM_IN_ROOT ; gi++) begin: slot_fifo2
        FifoBuffer #(.DATA_SIZE($clog2(ROOT_POWER_NUM_IN_ROOT)),       .CYCLES(1) )  fifo_slot2  (.clk(clk), .rstn(1), .in(root_select[gi]), .out(root_select_fifo[gi]));
    end

    // ram to module => rootpower_data (2stage)
    for(gl = 0; gl < NTT_INTT_NUM_IN_ROOT ; gl++) begin: rootpower_to_module
      logic [STAGE_ROOT_POWER_ROOT-1:0][STAGE_ROOT_POWER_POWER_ROOT-1:0][logE-1:0][E/2-1:0][FSIZE-1:0] intc_indiv_in_W;
      logic [STAGE_ROOT_POWER_ROOT-1:0][STAGE_ROOT_POWER_POWER_ROOT-1:0][logE-1:0][E/2-1:0][FSIZE-1:0] intc_indiv_middle_W;
      logic [STAGE_ROOT_POWER_ROOT:0][STAGE_ROOT_POWER_POWER_ROOT-1:0][logE-1:0][E/2-1:0][FSIZE-1:0] intc_indiv_out_W;


      logic [STAGE_ROOT_POWER_ROOT-1:0][STAGE_ROOT_POWER_POWER_ROOT-1:0][logE-1:0][E/2-1:0][FSIZE-1:0] intc_indiv_in_WQ;
      logic [STAGE_ROOT_POWER_ROOT-1:0][STAGE_ROOT_POWER_POWER_ROOT-1:0][logE-1:0][E/2-1:0][FSIZE-1:0] intc_indiv_middle_WQ;
      logic [STAGE_ROOT_POWER_ROOT-1:0][STAGE_ROOT_POWER_POWER_ROOT-1:0][logE-1:0][E/2-1:0][FSIZE-1:0] intc_indiv_out_WQ;

      for(gi = 0; gi < STAGE_ROOT_POWER_ROOT; gi++) begin : fifo_R_to_M

        // for(gj = 0; gj < 2**(STAGE_ROOT_POWER_ROOT-gi) ; gj++ ) begin
        //   // FifoBuffer #(.DATA_SIZE(E*FSIZE),       .CYCLES(1) )  fifo_indi1  (.clk(clk), .rstn(1), .in(intc_indiv_in_W[gi][gj]), .out(intc_indiv_middle_W[gi][gj]));
        //   // FifoBuffer #(.DATA_SIZE(E*FSIZE),       .CYCLES(1) )  fifo_indi2  (.clk(clk), .rstn(1), .in(intc_indiv_in_WQ[gi][gj]), .out(intc_indiv_middle_WQ[gi][gj]));
        //   for(gp = 0; gp < logE ; gp++ ) begin
        //     for(gk = 0; gk < E/2 ; gk++ ) begin
        //       FifoBuffer #(.DATA_SIZE(FSIZE),       .CYCLES(1) )  fifo_indi1  (.clk(clk), .rstn(1), .in(intc_indiv_in_W[gi][gj][gp][gk]), .out(intc_indiv_middle_W[gi][gj][gp][gk]));
        //       FifoBuffer #(.DATA_SIZE(FSIZE),       .CYCLES(1) )  fifo_indi2  (.clk(clk), .rstn(1), .in(intc_indiv_in_WQ[gi][gj][gp][gk]), .out(intc_indiv_middle_WQ[gi][gj][gp][gk]));
        //     end
        //   end

        // end

        for(gj = 0; gj < 2**(STAGE_ROOT_POWER_ROOT-gi-1) ; gj++ ) begin
          assign intc_indiv_middle_W[gi][gj] = root_select_fifo[gl][gi] ? intc_indiv_in_W[gi][2*gj+1] : intc_indiv_in_W[gi][2*gj];
          assign intc_indiv_middle_WQ[gi][gj] = root_select_fifo[gl][gi] ? intc_indiv_in_WQ[gi][2*gj+1] : intc_indiv_in_WQ[gi][2*gj];
        end

      end

      for(gi = 0; gi < STAGE_ROOT_POWER_ROOT-1; gi++) begin
        for(gj = 0 ; gj < 2**(STAGE_ROOT_POWER_ROOT-gi-1); gj++)begin

            for(gp = 0; gp < logE ; gp++ ) begin
              for(gk = 0; gk < E/2 ; gk++ ) begin
                FifoBuffer #(.DATA_SIZE(FSIZE),       .CYCLES(1) )  fifo_indi1  (.clk(clk), .rstn(1), .in(intc_indiv_middle_W[gi][gj][gp][gk]), .out(intc_indiv_out_W[gi][gj][gp][gk]));
                FifoBuffer #(.DATA_SIZE(FSIZE),       .CYCLES(1) )  fifo_indi2  (.clk(clk), .rstn(1), .in(intc_indiv_middle_WQ[gi][gj][gp][gk]), .out(intc_indiv_out_WQ[gi][gj][gp][gk]));
              end
            end

            assign intc_indiv_in_W[gi+1][gj] = intc_indiv_out_W[gi][gj];
            assign intc_indiv_in_WQ[gi+1][gj] = intc_indiv_out_WQ[gi][gj];
        end
      end

      for(gi = 0; gi < ROOT_POWER_NUM_IN_ROOT; gi++) begin //2**STAGE_MODULE
        assign intc_indiv_in_W[0][gi] = root_output_W[gi];
        assign intc_indiv_in_WQ[0][gi] = root_output_WQ[gi];
      end
      for(gi = ROOT_POWER_NUM_IN_ROOT; gi < ROOT_POWER_NUM_IN_ROOT + 1; gi++) begin
        if( gi < 2**STAGE_ROOT_POWER_ROOT) begin
          assign intc_indiv_in_W[0][gi] = '{default:'0};
          assign intc_indiv_in_WQ[0][gi] = '{default:'0};
        end
      end
      
      assign ntt_input_W[gl] = intc_indiv_middle_W[STAGE_ROOT_POWER_ROOT-1][0];
      assign ntt_input_WQ[gl] = intc_indiv_middle_WQ[STAGE_ROOT_POWER_ROOT-1][0];
    end

    //rootpower write => 2 stage
    for(gl = 0; gl < ROOT_POWER_NUM_IN_ROOT ; gl++) begin: rootpower_write
      logic [logE-1:0][E/2-1:0][FSIZE-1:0]      ntt_input_W_wdata_stage[0:STAGE_ROOT_POWER_ROOT];
      logic [logE-1:0][E/2-1:0][FSIZE-1:0]      ntt_input_WQ_wdata_stage[0:STAGE_ROOT_POWER_ROOT];
      logic [logE-1:0][E/2-1:0]                 ntt_input_W_wren_stage[0:STAGE_ROOT_POWER_ROOT];
      logic [logE-1:0][E/2-1:0]                 ntt_input_WQ_wren_stage[0:STAGE_ROOT_POWER_ROOT];
      logic [logE-1:0][$clog2(N/(E/2))-1:0]     ntt_input_W_waddr_stage[0:STAGE_ROOT_POWER_ROOT];
      logic [logE-1:0][$clog2(N/(E/2))-1:0]     ntt_input_WQ_waddr_stage[0:STAGE_ROOT_POWER_ROOT];

      logic [logE-1:0][E/2-1:0][FSIZE-1:0]      ntt_input_W_wdata_stage_mid[0:STAGE_ROOT_POWER_ROOT];
      logic [logE-1:0][E/2-1:0][FSIZE-1:0]      ntt_input_WQ_wdata_stage_mid[0:STAGE_ROOT_POWER_ROOT];
      logic [logE-1:0][E/2-1:0]                 ntt_input_W_wren_stage_mid[0:STAGE_ROOT_POWER_ROOT];
      logic [logE-1:0][E/2-1:0]                 ntt_input_WQ_wren_stage_mid[0:STAGE_ROOT_POWER_ROOT];
      logic [logE-1:0][$clog2(N/(E/2))-1:0]     ntt_input_W_waddr_stage_mid[0:STAGE_ROOT_POWER_ROOT];
      logic [logE-1:0][$clog2(N/(E/2))-1:0]     ntt_input_WQ_waddr_stage_mid[0:STAGE_ROOT_POWER_ROOT];

      logic [logE-1:0][E/2-1:0][FSIZE-1:0]      ntt_input_W_wdata_stage_out[0:STAGE_ROOT_POWER_ROOT];
      logic [logE-1:0][E/2-1:0][FSIZE-1:0]      ntt_input_WQ_wdata_stage_out[0:STAGE_ROOT_POWER_ROOT];
      logic [logE-1:0][E/2-1:0]                 ntt_input_W_wren_stage_out[0:STAGE_ROOT_POWER_ROOT];
      logic [logE-1:0][E/2-1:0]                 ntt_input_WQ_wren_stage_out[0:STAGE_ROOT_POWER_ROOT];
      logic [logE-1:0][$clog2(N/(E/2))-1:0]     ntt_input_W_waddr_stage_out[0:STAGE_ROOT_POWER_ROOT];
      logic [logE-1:0][$clog2(N/(E/2))-1:0]     ntt_input_WQ_waddr_stage_out[0:STAGE_ROOT_POWER_ROOT];

      for(gi = 0; gi < STAGE_ROOT_POWER_ROOT; gi++) begin : fifo_Rootpower_write
        for(gp = 0; gp < logE ; gp++ ) begin
          for(gk = 0; gk < E/2 ; gk++ ) begin
            FifoBuffer #(.DATA_SIZE(FSIZE),       .CYCLES(1) )  fifo_write1  (.clk(clk), .rstn(1), .in(ntt_input_W_wdata_stage[gi][gp][gk]), .out(ntt_input_W_wdata_stage_mid[gi][gp][gk]));
            FifoBuffer #(.DATA_SIZE(FSIZE),       .CYCLES(1) )  fifo_write2  (.clk(clk), .rstn(1), .in(ntt_input_WQ_wdata_stage[gi][gp][gk]), .out(ntt_input_WQ_wdata_stage_mid[gi][gp][gk]));
            FifoBuffer #(.DATA_SIZE(1),       .CYCLES(1) )  fifo_write3  (.clk(clk), .rstn(1), .in(ntt_input_W_wren_stage[gi][gp][gk]), .out(ntt_input_W_wren_stage_mid[gi][gp][gk]));
            FifoBuffer #(.DATA_SIZE(1),       .CYCLES(1) )  fifo_write4  (.clk(clk), .rstn(1), .in(ntt_input_WQ_wren_stage[gi][gp][gk]), .out(ntt_input_WQ_wren_stage_mid[gi][gp][gk]));
          end
            FifoBuffer #(.DATA_SIZE($clog2(N/(E/2))),       .CYCLES(1) )  fifo_write5  (.clk(clk), .rstn(1), .in(ntt_input_W_waddr_stage[gi][gp]), .out(ntt_input_W_waddr_stage_mid[gi][gp]));
            FifoBuffer #(.DATA_SIZE($clog2(N/(E/2))),       .CYCLES(1) )  fifo_write6  (.clk(clk), .rstn(1), .in(ntt_input_WQ_waddr_stage[gi][gp]), .out(ntt_input_WQ_waddr_stage_mid[gi][gp]));
        end

        assign ntt_input_W_wdata_stage_out[gi] = ntt_intt_select[gl][gi] ? '{default:'0} : ntt_input_W_wdata_stage_mid[gi];
        assign ntt_input_WQ_wdata_stage_out[gi] = ntt_intt_select[gl][gi] ? '{default:'0} : ntt_input_WQ_wdata_stage_mid[gi];
        assign ntt_input_W_wren_stage_out[gi] = ntt_intt_select[gl][gi] ? '{default:'0} : ntt_input_W_wren_stage_mid[gi];
        assign ntt_input_WQ_wren_stage_out[gi] = ntt_intt_select[gl][gi] ? '{default:'0} : ntt_input_WQ_wren_stage_mid[gi];
        assign ntt_input_W_waddr_stage_out[gi] = ntt_intt_select[gl][gi] ? '{default:'0} : ntt_input_W_waddr_stage_mid[gi];
        assign ntt_input_WQ_waddr_stage_out[gi] = ntt_intt_select[gl][gi] ? '{default:'0} : ntt_input_WQ_waddr_stage_mid[gi];

        assign ntt_input_W_wdata_stage[gi+1] = ntt_input_W_wdata_stage_out[gi];
        assign ntt_input_WQ_wdata_stage[gi+1] = ntt_input_WQ_wdata_stage_out[gi];
        assign ntt_input_W_wren_stage[gi+1] = ntt_input_W_wren_stage_out[gi];
        assign ntt_input_WQ_wren_stage[gi+1] = ntt_input_WQ_wren_stage_out[gi];
        assign ntt_input_W_waddr_stage[gi+1] = ntt_input_W_waddr_stage_out[gi];
        assign ntt_input_WQ_waddr_stage[gi+1] = ntt_input_WQ_waddr_stage_out[gi];
      end
      
      assign ntt_input_W_wdata_stage[0] = ntt_input_W_wdata;
      assign ntt_input_WQ_wdata_stage[0] = ntt_input_WQ_wdata;
      assign ntt_input_W_wren_stage[0] = ntt_input_W_wren;
      assign ntt_input_WQ_wren_stage[0] = ntt_input_WQ_wren;
      assign ntt_input_W_waddr_stage[0] = ntt_input_W_waddr;
      assign ntt_input_WQ_waddr_stage[0] = ntt_input_WQ_waddr;
    
      assign W_ram_wdata[gl] = ntt_input_W_wdata_stage[STAGE_ROOT_POWER_ROOT];
      assign WQ_ram_wdata[gl] = ntt_input_WQ_wdata_stage[STAGE_ROOT_POWER_ROOT];
      assign W_ram_wren[gl] = ntt_input_W_wren_stage[STAGE_ROOT_POWER_ROOT];
      assign WQ_ram_wren[gl] = ntt_input_WQ_wren_stage[STAGE_ROOT_POWER_ROOT];
      assign W_ram_waddr[gl] = ntt_input_W_waddr_stage[STAGE_ROOT_POWER_ROOT];
      assign WQ_ram_waddr[gl] = ntt_input_WQ_waddr_stage[STAGE_ROOT_POWER_ROOT];
    end

  endgenerate
  
  always_comb begin
    
  end
endmodule