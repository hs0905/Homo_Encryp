`timescale 1ns / 1ns

`include "defines.vh"
import FHE_ALU_PKG::*;

module RootInterconnect #(
  parameter         DATA_SIZE = FSIZE, // 64
  parameter integer CYCLES = 2,

  // NTT_INTT parameters
  parameter NTT_INTT_NUM_IN_ROOT = NTT_INTT_NUM,      //number of ntt and intt module : 4
  parameter ROOT_POWER_NUM_IN_ROOT = ROOT_POWER_NUM,  //number of rootpower : 4

  // Parameter for auto
  parameter STAGE_NTT_INTT_ROOT         = $clog2(NTT_INTT_NUM_IN_ROOT),   // 2
  parameter STAGE_NTT_INTT_POWER_ROOT   = 2**STAGE_NTT_INTT_ROOT,         // 4
  parameter STAGE_ROOT_POWER_ROOT       = $clog2(ROOT_POWER_NUM_IN_ROOT), // 2
  parameter STAGE_ROOT_POWER_POWER_ROOT = 2**STAGE_ROOT_POWER_ROOT      // 4
)(
  input logic clk,
  input logic rstn,
  // ntt_intt <=> intc <=> root
  // intc <=> root
  // W_ram_rdata, WQ_ram_rdata
  input  logic [ROOT_POWER_NUM_IN_ROOT-1:0][logE-1:0][(E/2)-1:0][FSIZE-1:0] root_output_W,
  input  logic [ROOT_POWER_NUM_IN_ROOT-1:0][logE-1:0][(E/2)-1:0][FSIZE-1:0] root_output_WQ,
  output logic [ROOT_POWER_NUM_IN_ROOT-1:0][logE-1:0][$clog2(N/(E/2))-1:0]  root_input,

  // ntt_intt <=> intc
  // W_ram_raddr
  input  logic [NTT_INTT_NUM_IN_ROOT-1:0][logE-1:0][$clog2(N/(E/2))-1:0]  ntt_output,
  output logic [NTT_INTT_NUM_IN_ROOT-1:0][logE-1:0][(E/2)-1:0][FSIZE-1:0] ntt_input_W,
  output logic [NTT_INTT_NUM_IN_ROOT-1:0][logE-1:0][(E/2)-1:0][FSIZE-1:0] ntt_input_WQ,

  // dma => intc
  input logic [logE-1:0][$clog2(N/(E/2))-1:0]  ntt_input_W_waddr,
  input logic [logE-1:0][(E/2)-1:0][FSIZE-1:0] ntt_input_W_wdata,
  input logic [logE-1:0][(E/2)-1:0]            ntt_input_W_wren,
  input logic [logE-1:0][$clog2(N/(E/2))-1:0]  ntt_input_WQ_waddr,
  input logic [logE-1:0][(E/2)-1:0][FSIZE-1:0] ntt_input_WQ_wdata,
  input logic [logE-1:0][(E/2)-1:0]            ntt_input_WQ_wren,

  // intc => root
  output logic [ROOT_POWER_NUM_IN_ROOT-1:0][logE-1:0][E/2-1:0][FSIZE-1:0]  W_ram_wdata,
  output logic [ROOT_POWER_NUM_IN_ROOT-1:0][logE-1:0][E/2-1:0]             W_ram_wren,
  output logic [ROOT_POWER_NUM_IN_ROOT-1:0][logE-1:0][$clog2(N/(E/2))-1:0] W_ram_waddr,
  output logic [ROOT_POWER_NUM_IN_ROOT-1:0][logE-1:0][E/2-1:0][FSIZE-1:0]  WQ_ram_wdata,
  output logic [ROOT_POWER_NUM_IN_ROOT-1:0][logE-1:0][E/2-1:0]             WQ_ram_wren,
  output logic [ROOT_POWER_NUM_IN_ROOT-1:0][logE-1:0][$clog2(N/(E/2))-1:0] WQ_ram_waddr,

  input logic [ROOT_POWER_NUM_IN_ROOT-1:0][$clog2(NTT_INTT_NUM_IN_ROOT)-1:0] ntt_intt_select, // root -> intc
  input logic [NTT_INTT_NUM_IN_ROOT-1:0][$clog2(ROOT_POWER_NUM_IN_ROOT)-1:0] root_select      // ntt_intt -> root
);

  genvar gi, gj, gk, gl, gp;
  generate
    
    logic [ROOT_POWER_NUM_IN_ROOT-1:0][$clog2(NTT_INTT_NUM_IN_ROOT)-1:0] ntt_intt_select_fifo;
    for(gi=0; gi < ROOT_POWER_NUM_IN_ROOT; gi++) begin: slot_fifo1
      FifoBuffer #(.DATA_SIZE($clog2(NTT_INTT_NUM_IN_ROOT)),.CYCLES(1))
        fifo_slot1  (.clk(clk), .rstn(1), .in(ntt_intt_select[gi]), .out(ntt_intt_select_fifo[gi]));
    end

    // module to ram => addr (3stage)
    for(gl = 0; gl < ROOT_POWER_NUM_IN_ROOT ; gl++) begin: module_to_rootpower
      // [1:0][3:0][2:0][13:0]intc_set_in(midle/out)
      logic [STAGE_NTT_INTT_ROOT-1:0][STAGE_NTT_INTT_POWER_ROOT-1:0][logE-1:0][$clog2(N/(E/2))-1:0] intc_set_in ;
      logic [STAGE_NTT_INTT_ROOT-1:0][STAGE_NTT_INTT_POWER_ROOT-1:0][logE-1:0][$clog2(N/(E/2))-1:0] intc_set_middle ;
      logic [STAGE_NTT_INTT_ROOT-1:0][STAGE_NTT_INTT_POWER_ROOT-1:0][logE-1:0][$clog2(N/(E/2))-1:0] intc_set_out ;

      for(gi = 0; gi < STAGE_NTT_INTT_ROOT; gi++) begin : fifo_M_to_R // FIFOBuffer(intc_set_in => intc_set_middle)
        /*for(gj = 0; gj < 2**(STAGE_NTT_INTT_ROOT-gi) ; gj++ ) begin
            for(gp = 0; gp < logE ; gp++ ) begin
              FifoBuffer #(.DATA_SIZE($clog2(N/(E/2))),.CYCLES(1) )  
                fifo_indi1  (.clk(clk),.rstn(1),.in(intc_set_in[gi][gj][gp]),.out(intc_set_middle[gi][gj][gp]));
            end
          end */
       
        for(gj = 0; gj < 2**(STAGE_NTT_INTT_ROOT-gi-1) ; gj++ ) begin
            assign intc_set_middle[gi][gj] = ntt_intt_select_fifo[gl][gi] ? intc_set_in[gi][2*gj+1] : intc_set_in[gi][2*gj];
            // if(ntt_intt_select_fifo[gl][gi] == 1) => intc_set_middle[gi][gj] = intc_set_in[gi][2*gj+1]
            // else => intc_set_middle[gi][gj] = intc_set_in[gi][2*gj]
        end
      end
      for(gi = 0; gi < STAGE_NTT_INTT_ROOT-1; gi++) begin
        for(gj = 0 ; gj < 2**(STAGE_NTT_INTT_ROOT-gi-1); gj++)begin
          for(gp = 0; gp <logE; gp++) begin
            FifoBuffer #(.DATA_SIZE($clog2(N/(E/2))),.CYCLES(1) )
              fifo_indi1  (.clk(clk), .rstn(1), .in(intc_set_middle[gi][gj][gp]), .out(intc_set_out[gi][gj][gp]));
          end
          assign intc_set_in[gi+1][gj] = intc_set_out[gi][gj];
        end
      end

      for(gi = 0; gi < NTT_INTT_NUM_IN_ROOT; gi++) begin // NTT_INTT_NUM_IN_ROOT = 4
        assign intc_set_in[0][gi] = ntt_output[gi];
      end
      for(gi = NTT_INTT_NUM_IN_ROOT; gi < NTT_INTT_NUM_IN_ROOT + 1 ; gi++) begin // non_assignment(out of range)
        if( gi < 2**STAGE_NTT_INTT_POWER_ROOT)
          assign intc_set_in[0][gi] = '{default:'0};
      end
      assign root_input[gl] = intc_set_middle[STAGE_NTT_INTT_ROOT-1][0]; 
    end

    logic [NTT_INTT_NUM_IN_ROOT-1:0][$clog2(ROOT_POWER_NUM_IN_ROOT)-1:0] root_select_fifo;
    for(gi = 0; gi < NTT_INTT_NUM_IN_ROOT ; gi++) begin: slot_fifo2
      FifoBuffer #(.DATA_SIZE($clog2(ROOT_POWER_NUM_IN_ROOT)),.CYCLES(1) )  
        fifo_slot2  (.clk(clk),.rstn(1),.in(root_select[gi]),.out(root_select_fifo[gi]));
    end

    // ram to module => rootpower_data (2 stage)
    for(gl = 0; gl < NTT_INTT_NUM_IN_ROOT ; gl++) begin: rootpower_to_module
      // [1:0][3:0][2:0][3:0][63:0]
      logic [STAGE_ROOT_POWER_ROOT-1:0][STAGE_ROOT_POWER_POWER_ROOT-1:0][logE-1:0][(E/2)-1:0][FSIZE-1:0] intc_indiv_in_W;
      logic [STAGE_ROOT_POWER_ROOT-1:0][STAGE_ROOT_POWER_POWER_ROOT-1:0][logE-1:0][(E/2)-1:0][FSIZE-1:0] intc_indiv_middle_W;
      logic [STAGE_ROOT_POWER_ROOT:0]  [STAGE_ROOT_POWER_POWER_ROOT-1:0][logE-1:0][(E/2)-1:0][FSIZE-1:0] intc_indiv_out_W;

      logic [STAGE_ROOT_POWER_ROOT-1:0][STAGE_ROOT_POWER_POWER_ROOT-1:0][logE-1:0][(E/2)-1:0][FSIZE-1:0] intc_indiv_in_WQ;
      logic [STAGE_ROOT_POWER_ROOT-1:0][STAGE_ROOT_POWER_POWER_ROOT-1:0][logE-1:0][(E/2)-1:0][FSIZE-1:0] intc_indiv_middle_WQ;
      logic [STAGE_ROOT_POWER_ROOT-1:0][STAGE_ROOT_POWER_POWER_ROOT-1:0][logE-1:0][(E/2)-1:0][FSIZE-1:0] intc_indiv_out_WQ;
      //================================================================================================
      //=================================================================================================
      for(gi = 0; gi < STAGE_ROOT_POWER_ROOT; gi++) begin : fifo_R_to_M
        /*for(gj = 0; gj < 2**(STAGE_ROOT_POWER_ROOT-gi) ; gj++ ) begin
            FifoBuffer #(.DATA_SIZE(E*FSIZE),.CYCLES(1) )  
              fifo_indi1(.clk(clk), .rstn(1), .in(intc_indiv_in_W[gi][gj]), .out(intc_indiv_middle_W[gi][gj]));
            FifoBuffer #(.DATA_SIZE(E*FSIZE),.CYCLES(1) )  
              fifo_indi2(.clk(clk), .rstn(1), .in(intc_indiv_in_WQ[gi][gj]), .out(intc_indiv_middle_WQ[gi][gj]));
            for(gp = 0; gp < logE ; gp++ ) begin
              for(gk = 0; gk < E/2 ; gk++ ) begin
                FifoBuffer #(.DATA_SIZE(FSIZE),.CYCLES(1) )  
                  fifo_indi1(.clk(clk),.rstn(1),.in(intc_indiv_in_W[gi][gj][gp][gk]), .out(intc_indiv_middle_W[gi][gj][gp][gk]));
                FifoBuffer #(.DATA_SIZE(FSIZE),.CYCLES(1) )
                  fifo_indi2(.clk(clk),.rstn(1), .in(intc_indiv_in_WQ[gi][gj][gp][gk]), .out(intc_indiv_middle_WQ[gi][gj][gp][gk]));
              end
            end
          end*/
        for(gj = 0; gj < 2**(STAGE_ROOT_POWER_ROOT-gi-1) ; gj++ ) begin
          assign intc_indiv_middle_W [gi][gj]  = root_select_fifo[gl][gi] ? intc_indiv_in_W [gi][2*gj+1] : intc_indiv_in_W [gi][2*gj];
          assign intc_indiv_middle_WQ[gi][gj]  = root_select_fifo[gl][gi] ? intc_indiv_in_WQ[gi][2*gj+1] : intc_indiv_in_WQ[gi][2*gj];
        end
      end
        for(gi = 0; gi < STAGE_ROOT_POWER_ROOT-1; gi++) begin
          for(gj = 0 ; gj < 2**(STAGE_ROOT_POWER_ROOT-gi-1); gj++)begin
            for(gp = 0; gp < logE ; gp++ ) begin
              for(gk = 0; gk < E/2 ; gk++ ) begin
                FifoBuffer #(.DATA_SIZE(FSIZE),.CYCLES(1) )  
                  fifo_indi1  (.clk(clk),.rstn(1),.in(intc_indiv_middle_W[gi][gj][gp][gk]),.out(intc_indiv_out_W[gi][gj][gp][gk]));
                FifoBuffer #(.DATA_SIZE(FSIZE),.CYCLES(1) )  
                  fifo_indi2  (.clk(clk),.rstn(1),.in(intc_indiv_middle_WQ[gi][gj][gp][gk]),.out(intc_indiv_out_WQ[gi][gj][gp][gk]));
              end
            end
              assign intc_indiv_in_W [gi+1][gj]  = intc_indiv_out_W [gi][gj];
              assign intc_indiv_in_WQ[gi+1][gj]  = intc_indiv_out_WQ[gi][gj];
          end
      end
      for(gi = 0; gi < ROOT_POWER_NUM_IN_ROOT; gi++) begin //2**STAGE_MODULE
        assign intc_indiv_in_W[0][gi] = root_output_W[gi];
        assign intc_indiv_in_WQ[0][gi] = root_output_WQ[gi];
      end
      for(gi = ROOT_POWER_NUM_IN_ROOT; gi < ROOT_POWER_NUM_IN_ROOT + 1; gi++) begin // non_assignment(out of range)
        if( gi < 2**STAGE_ROOT_POWER_ROOT) begin
          assign intc_indiv_in_W[0][gi]  = '{default:'0};
          assign intc_indiv_in_WQ[0][gi] = '{default:'0};
        end
      end
      assign ntt_input_W[gl]  = intc_indiv_middle_W [STAGE_ROOT_POWER_ROOT-1][0];
      assign ntt_input_WQ[gl] = intc_indiv_middle_WQ[STAGE_ROOT_POWER_ROOT-1][0];
  end
    //================================================================================================
    // 20231220 23:36
    //================================================================================================

  // rootpower write => 2 stage
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

  endgenerate

endmodule