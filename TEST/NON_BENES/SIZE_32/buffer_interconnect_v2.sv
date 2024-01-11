`timescale 1 ns / 1 ns

import util_pack::*;

module BufferInterconnect_v2 #(
		parameter integer DATA_SIZE         = 512,
		parameter integer CYCLES            = 2,
    parameter integer MODULE_SLOTS      = 32,
    parameter integer NTT_SLOTS         = 32,
    parameter integer STAGE_MODULE      = 5,
    parameter integer STAGE_MODULE_POWER= 32
	) (	
	  input logic	clk,	
	  input logic	rstn,	

    input logic [DATA_SIZE-1:0]     ram_outputs[0:MODULE_SLOTS-1],
    input BufferRAMTEFsizeInputs    module_outputs[0:MODULE_SLOTS-1],

    input logic [MODULE_SLOTS-1:0][$clog2(NTT_SLOTS)-1:0] module_slots,
    input logic [MODULE_SLOTS-1:0][$clog2(NTT_SLOTS)-1:0] ram_slots,

    output logic [DATA_SIZE-1:0]    module_inputs[0:MODULE_SLOTS-1],
    output BufferRAMTEFsizeInputs   ram_inputs   [0:MODULE_SLOTS-1]
  );

  genvar gi, gj, gk, gl, gp;
  generate

    for(gl = 0; gl < MODULE_SLOTS ; gl++) begin: slot
      (* max_fanout = 256 *)logic [$clog2(NTT_SLOTS)-1:0] module_slots_fifo_in[0:STAGE_MODULE];
      (* max_fanout = 256 *)logic [$clog2(NTT_SLOTS)-1:0] ram_slots_fifo_in   [0:STAGE_MODULE];

      logic [$clog2(NTT_SLOTS)-1:0] module_slots_fifo_out [0:STAGE_MODULE];
      logic [$clog2(NTT_SLOTS)-1:0] ram_slots_fifo_out    [0:STAGE_MODULE];

      BufferRAMTEFsizeInputs intc_set_in  [0:STAGE_MODULE][0:STAGE_MODULE_POWER-1];
      BufferRAMTEFsizeInputs intc_set_out [0:STAGE_MODULE][0:STAGE_MODULE_POWER-1];

      logic [DATA_SIZE-1:0] intc_indiv_in   [0:STAGE_MODULE][0:STAGE_MODULE_POWER-1];
      logic [DATA_SIZE-1:0] intc_indiv_out  [0:STAGE_MODULE][0:STAGE_MODULE_POWER-1];

      BufferRAMTEFsizeInputs intc_set_middle [0:STAGE_MODULE][0:STAGE_MODULE_POWER-1];
      logic [DATA_SIZE-1:0] intc_indiv_middle [0:STAGE_MODULE][0:STAGE_MODULE_POWER-1];

      for(gi = 0; gi < STAGE_MODULE; gi++) begin : stage1

        for(gj = 0; gj < 2**(STAGE_MODULE-gi) ; gj++ ) begin :fifo
          FifoBuffer #(.DATA_SIZE(32),        .CYCLES(1) )  fifo_raddr (.clk(clk), .rstn(1), .in(intc_set_in[gi][gj].raddr), .out(intc_set_middle[gi][gj].raddr));    
          FifoBuffer #(.DATA_SIZE(32),        .CYCLES(1) )  fifo_waddr (.clk(clk), .rstn(1), .in(intc_set_in[gi][gj].waddr), .out(intc_set_middle[gi][gj].waddr));    
          FifoBuffer #(.DATA_SIZE(DATA_SIZE), .CYCLES(1) )  fifo_wdata (.clk(clk), .rstn(1), .in(intc_set_in[gi][gj].wdata), .out(intc_set_middle[gi][gj].wdata));    
          FifoBuffer #(.DATA_SIZE(1),         .CYCLES(1) )  fifo_wren  (.clk(clk), .rstn(1), .in(intc_set_in[gi][gj].wren ), .out(intc_set_middle[gi][gj].wren ));
          FifoBuffer #(.DATA_SIZE(DATA_SIZE), .CYCLES(1) )  fifo_indi  (.clk(clk), .rstn(1), .in(intc_indiv_in[gi][gj]), .out(intc_indiv_middle[gi][gj]));
        end

        for(gj = 0; gj < 2**(STAGE_MODULE-gi-1) ; gj++ ) begin :fifo1
          // assign intc_set_out[gi][gj] = module_slots[gl][gi] ? intc_set_middle[gi][2*gj+1] : intc_set_middle[gi][2*gj];
          // assign intc_indiv_out[gi][gj] = ram_slots[gl][gi] ? intc_indiv_middle[gi][2*gj+1] : intc_indiv_middle[gi][2*gj];
          assign intc_set_out  [gi][gj] = module_slots_fifo_in[gi][gi]  ?   intc_set_middle  [gi][2*gj+1] : intc_set_middle  [gi][2*gj];
          assign intc_indiv_out[gi][gj] = ram_slots_fifo_in   [gi][gi]  ?   intc_indiv_middle[gi][2*gj+1] : intc_indiv_middle[gi][2*gj];
        end

        FifoBuffer #(.DATA_SIZE(($clog2(NTT_SLOTS))),.CYCLES(1) )  fifo_slot11  (.clk(clk), .rstn(1), .in(module_slots_fifo_in[gi]), .out(module_slots_fifo_out[gi]));
        FifoBuffer #(.DATA_SIZE(($clog2(NTT_SLOTS))),.CYCLES(1) )  fifo_slot12  (.clk(clk), .rstn(1), .in(ram_slots_fifo_in[gi]), .out(ram_slots_fifo_out[gi]));

        assign module_slots_fifo_in[gi+1] = module_slots_fifo_out[gi];
        assign ram_slots_fifo_in   [gi+1] = ram_slots_fifo_out   [gi];
      end

      for(gi = 0; gi < STAGE_MODULE+1; gi++) begin : stage3
        for(gj = 0 ; gj < 2**(STAGE_MODULE-gi-1); gj++)begin
            assign intc_set_in  [gi+1][gj] = intc_set_out[gi][gj];
            assign intc_indiv_in[gi+1][gj] = intc_indiv_out[gi][gj];
        end
      end

      
      assign module_slots_fifo_in[0] = module_slots[gl];
      assign ram_slots_fifo_in   [0] = ram_slots[gl];

      for(gi = 0; gi < MODULE_SLOTS; gi++) begin
        assign intc_set_in[0][gi] = module_outputs[gi];
      end
      for(gi = MODULE_SLOTS; gi < 2**STAGE_MODULE; gi++) begin
        assign intc_set_in[0][gi] = '{default:'0};
      end

      for(gi = 0; gi < MODULE_SLOTS; gi++) begin //2**STAGE_MODULE
        assign intc_indiv_in[0][gi] = ram_outputs[gi];
      end
      for(gi = MODULE_SLOTS; gi < 2**STAGE_MODULE; gi++) begin
        assign intc_indiv_in[0][gi] = '{default:'0};
      end
      
      assign ram_inputs[gl]    = intc_set_in  [STAGE_MODULE][0];
      assign module_inputs[gl] = intc_indiv_in[STAGE_MODULE][0];
    end  
  endgenerate
endmodule