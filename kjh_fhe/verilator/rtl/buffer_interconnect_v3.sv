`timescale 1 ns / 1 ns

`include "defines.vh"
import FHE_ALU_PKG::*;


module BufferInterconnect_v3 #(
		parameter DATA_SIZE     = FSIZE,
		parameter integer CYCLES        = 2
	) (	
	  input logic	                        clk,	
	  input logic	                        rstn,	
    
    output BufferRAMTEFsizeInputs ram_inputs[0:MODULE_NUM-1],
    input logic [E*FSIZE-1:0]   ram_outputs[0:MODULE_NUM-1],

    input BufferRAMTEFsizeInputs  module_outputs[0:MODULE_NUM-1],
    output logic [E*FSIZE-1:0]   module_inputs[0:MODULE_NUM-1],

    input logic [MODULE_NUM-1:0][$clog2(SLOT_NUM)-1:0] module_select,
    input logic [MODULE_NUM-1:0][$clog2(SLOT_NUM)-1:0] slot_select
  );
  
  
  BufferRAMTEFsizeInputs intc_set_in [0:MODULE_NUM-1][0:STAGE_MODULE][0:STAGE_MODULE_POWER-1];
  BufferRAMTEFsizeInputs intc_set_out [0:MODULE_NUM-1][0:STAGE_MODULE][0:STAGE_MODULE_POWER-1];

  logic [E*FSIZE-1:0] intc_indiv_in [0:MODULE_NUM-1][0:STAGE_MODULE][0:STAGE_MODULE_POWER-1];
  logic [E*FSIZE-1:0] intc_indiv_out [0:MODULE_NUM-1][0:STAGE_MODULE][0:STAGE_MODULE_POWER-1];

  BufferRAMTEFsizeInputs intc_set_middle [0:MODULE_NUM-1][0:STAGE_MODULE][0:STAGE_MODULE_POWER-1];
  logic [E*FSIZE-1:0] intc_indiv_middle [0:MODULE_NUM-1][0:STAGE_MODULE][0:STAGE_MODULE_POWER-1];

  genvar gi, gj, gk, gl, gp;
  generate
    for(gl = 0; gl < MODULE_NUM ; gl++) begin: slot

      for(gi = 0; gi < STAGE_MODULE; gi++) begin : stage1

        for(gj = 0; gj < 2**(STAGE_MODULE-gi) ; gj++ ) begin :fifo
          FifoBuffer #(.DATA_SIZE(32),      .CYCLES(1) )  fifo_raddr (.clk(clk), .rstn(1), .in(intc_set_in[gl][gi][gj].raddr), .out(intc_set_middle[gl][gi][gj].raddr));    
          FifoBuffer #(.DATA_SIZE(32),      .CYCLES(1) )  fifo_waddr (.clk(clk), .rstn(1), .in(intc_set_in[gl][gi][gj].waddr), .out(intc_set_middle[gl][gi][gj].waddr));    
          FifoBuffer #(.DATA_SIZE(E*FSIZE), .CYCLES(1) )  fifo_wdata (.clk(clk), .rstn(1), .in(intc_set_in[gl][gi][gj].wdata), .out(intc_set_middle[gl][gi][gj].wdata));    
          FifoBuffer #(.DATA_SIZE(1),       .CYCLES(1) )  fifo_wren  (.clk(clk), .rstn(1), .in(intc_set_in[gl][gi][gj].wren ), .out(intc_set_middle[gl][gi][gj].wren ));

          FifoBuffer #(.DATA_SIZE(E*FSIZE),       .CYCLES(1) )  fifo_indi  (.clk(clk), .rstn(1), .in(intc_indiv_in[gl][gi][gj]), .out(intc_indiv_middle[gl][gi][gj]));
        end

        for(gj = 0; gj < 2**(STAGE_MODULE-gi-1) ; gj++ ) begin :fifo1
          assign intc_set_out[gl][gi][gj] = module_select[gl][gi] ? intc_set_middle[gl][gi][2*gj+1] : intc_set_middle[gl][gi][2*gj];
          assign intc_indiv_out[gl][gi][gj] = slot_select[gl][gi] ? intc_indiv_middle[gl][gi][2*gj+1] : intc_indiv_middle[gl][gi][2*gj];
        end

      end

      for(gi = 0; gi < STAGE_MODULE+1; gi++) begin : stage3
        for(gj = 0 ; gj < 2**(STAGE_MODULE-gi-1); gj++)begin
            assign intc_set_in[gl][gi+1][gj] = intc_set_out[gl][gi][gj];
            assign intc_indiv_in[gl][gi+1][gj] = intc_indiv_out[gl][gi][gj];
        end
      end

      for(gi = 0; gi < MODULE_NUM; gi++) begin
        assign intc_set_in[gl][0][gi] = module_outputs[gi];
      end
      for(gi = MODULE_NUM; gi < 2**STAGE_MODULE; gi++) begin
        assign intc_set_in[gl][0][gi] = '{default:'0};
      end

      for(gi = 0; gi < MODULE_NUM; gi++) begin //2**STAGE_MODULE
        assign intc_indiv_in[gl][0][gi] = ram_outputs[gi];
      end
      for(gi = MODULE_NUM; gi < 2**STAGE_MODULE; gi++) begin
        assign intc_indiv_in[gl][0][gi] = '{default:'0};
      end
      
      assign ram_inputs[gl] = intc_set_in[gl][STAGE_MODULE][0];
      assign module_inputs[gl] = intc_indiv_in[gl][STAGE_MODULE][0];
    end

   
  endgenerate
  
  always_comb begin

    // for(int k = 0; k < MODULE_NUM; k++) begin
    //   for(int i = 0; i < STAGE_MODULE; i++) begin
    //     for(int j = 0; j < 2**(STAGE_MODULE-i-1); j++) begin
    //       if(module_select[k][i]) begin
    //         assign intc_set_out[k][i][j] = intc_set_middle[k][i][2*j+1];
    //       end
    //       else begin
    //         assign intc_set_out[k][i][j] = intc_set_middle[k][i][2*j];
    //       end
    //     end
    //   end
    // end

    // for(int k = 0; k < MODULE_NUM; k++) begin
    //   for(int i = 0; i < STAGE_MODULE; i++) begin
    //     for(int j = 0; j < 2**(STAGE_MODULE-i-1); j++) begin
    //       if(slot_select[k][i]) begin
    //         assign intc_indiv_out[k][i][j] = intc_indiv_middle[k][i][2*j+1];
    //       end
    //       else begin
    //         assign intc_indiv_out[k][i][j] =intc_indiv_middle[k][i][2*j];
    //       end
    //     end
    //   end
    // end


  // //   // reg_next = reg_current;

  //   // for(int i = 0; i < MODULE_NUM-1; i ++) begin
  //   //   ram_inputs[i] = intc_outputs_reg[module_select[i]];
  //   // end
  //   for(int i = 0; i < MODULE_NUM; i ++) begin
  //       // intc_inputs[i] = module_outputs[i];
  //       if(rstn)
  //         intc_inputs[module_select[i]] = module_outputs[i];
  //   end
    
  //   for(int i = 0; i < MODULE_NUM-1; i ++) begin
  //     intc_outputs[i] = ram_outputs[module_select[i]];
  //   end
  // end

  // assign out = reg_current.data[CYCLES-1];
            
  // always @ (posedge clk) begin
  //   reg_current <= reg_next;
	end
endmodule