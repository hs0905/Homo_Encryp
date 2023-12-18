`timescale 1ns / 1ns

`include "defines.vh"
import FHE_ALU_PKG::*;

module RootInterconnect #(
  parameter         DATA_SIZE = FSIZE,
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

      for(gi = 0; gi < STAGE_NTT_INTT_ROOT; gi++) begin : fifo_M_to_R
      
        for(gj = 0; gj < 2**(STAGE_NTT_INTT_ROOT-gi) ; gj++ ) begin
            for(gp = 0; gp < logE ; gp++ ) begin
              FifoBuffer #(.DATA_SIZE($clog2(N/(E/2))),.CYCLES(1) )  
                fifo_indi1  (.clk(clk),.rstn(1),.in(intc_set_in[gi][gj][gp]),.out(intc_set_middle[gi][gj][gp]));
            end
          end
       
        for(gj = 0; gj < 2**(STAGE_NTT_INTT_ROOT-gi-1) ; gj++ ) begin
            assign intc_set_middle[gi][gj] = ntt_intt_select_fifo[gl][gi] ? intc_set_in[gi][2*gj+1] : intc_set_in[gi][2*gj];
          end
      end
  
    end
  endgenerate

endmodule