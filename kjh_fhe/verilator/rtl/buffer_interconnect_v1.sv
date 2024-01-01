`timescale 1 ns / 1 ns

`include "defines.vh"
import FHE_ALU_PKG::*;


module BufferInterconnect #(
		parameter DATA_SIZE     = FSIZE,
		parameter integer CYCLES        = 2
	) (	
	  input logic	                        clk,	
	  input logic	                        rstn,	
    
    output BufferRAMTEFsizeInputs ram_inputs[0:SLOT_NUM-1],
    input logic [E*FSIZE-1:0]   ram_outputs[0:SLOT_NUM-1],

    input BufferRAMTEFsizeInputs  module_outputs[0:MODULE_NUM-1],
    output logic [E*FSIZE-1:0]   module_inputs[0:MODULE_NUM-1],

    input [MODULE_NUM-1:0][$clog2(SLOT_NUM)-1:0] module_select
  );
  
//   typedef struct packed{
//   logic [31:0]        raddr;
//   logic [31:0]        waddr;
//   logic [E*FSIZE-1:0] wdata;
//   logic               wren;
// } BufferRAMTEFsizeInputs;

  BufferRAMTEFsizeInputs intc_inputs[0:MODULE_NUM-1]; 
  BufferRAMTEFsizeInputs intc_outputs[0:MODULE_NUM-1]; 
  BufferRAMTEFsizeInputs intc_outputs_reg[0:MODULE_NUM-1]; 
  
  genvar gi, gj;
  generate
    for(gi = 0; gi < MODULE_NUM; gi++) begin : gen_ntt
      FifoBuffer #(.DATA_SIZE(32),      .CYCLES(BUFFER_READ_DELAY) )  fifo_raddr (.clk(clk), .rstn(1), .in(intc_inputs[gi].raddr), .out(ram_inputs[gi].raddr));    
      FifoBuffer #(.DATA_SIZE(32),      .CYCLES(BUFFER_READ_DELAY) )  fifo_waddr (.clk(clk), .rstn(1), .in(intc_inputs[gi].waddr), .out(ram_inputs[gi].waddr));    
      FifoBuffer #(.DATA_SIZE(E*FSIZE), .CYCLES(BUFFER_READ_DELAY) )  fifo_wdata (.clk(clk), .rstn(1), .in(intc_inputs[gi].wdata), .out(ram_inputs[gi].wdata));    
      FifoBuffer #(.DATA_SIZE(1),       .CYCLES(BUFFER_READ_DELAY) )  fifo_wren  (.clk(clk), .rstn(1), .in(intc_inputs[gi].wren ), .out(ram_inputs[gi].wren ));    
    end
    for(gi = 0; gi < MODULE_NUM; gi++) begin : gen_module
      FifoBuffer #(.DATA_SIZE(E*FSIZE), .CYCLES(BUFFER_READ_DELAY) )  fifo_rdata (.clk(clk), .rstn(1), .in(intc_outputs[gi]), .out(module_inputs[gi]));    
    end

    // for(gi = 0; gi < MODULE_NUM; gi ++) begin
    //     assign intc_inputs[module_select[gi]] = module_outputs[gi];
    // end
    
    // for(gi = 0; gi < SLOT_NUM; gi++) begin : gen_ntt
    //   assign ram_inputs[module_select[i]] = module_outputs[gi];
    //   assign module_inputs[gi] = ram_outputs[module_select[i]];
    // end
  endgenerate


  // for(int i = 0; i < MODULE_NUM; i ++) begin
  //       assign intc_inputs[module_select[i]] = module_outputs[i];
  // end

  // typedef struct packed {   
    
  // } Registers;
  
  // Registers reg_current,reg_next;
  
  always_comb begin
  //   // reg_next = reg_current;

    // for(int i = 0; i < MODULE_NUM-1; i ++) begin
    //   ram_inputs[i] = intc_outputs_reg[module_select[i]];
    // end
    for(int i = 0; i < MODULE_NUM; i ++) begin
        // intc_inputs[i] = module_outputs[i];
        if(rstn)
          intc_inputs[module_select[i]] = module_outputs[i];
    end
    
    for(int i = 0; i < MODULE_NUM-1; i ++) begin
      intc_outputs[i] = ram_outputs[module_select[i]];
    end

    // for(int i = 0; i < MODULE_NUM-1; i ++) begin
    //   ram_inputs[i] = intc_inputs[i];
    // end

    // for(int i = 0; i < MODULE_NUM-1; i ++) begin
    //   module_inputs[i] = intc_outputs[i];
    // end

  // //   if(!rstn) begin
  // //   end
    // for(int i = 0; i < MODULE_NUM; i++) begin : gen_ntt
    //   // ram_inputs[module_select[i]] = module_outputs[i];
    //   // module_inputs[i] = ram_outputs[module_select[i]];
    //   ram_inputs[i] = module_outputs[i];
    //   module_inputs[i] = ram_outputs[i];
    // end

    //     //TESTTEST
    // for(int i = 0; i < SLOT_NUM; i ++) begin
    //   ram_inputs[module_select[i]] = module_outputs[i];
    // end
    // for(int i = 0; i < MODULE_NUM; i ++) begin
    //   module_inputs[i] = ram_outputs[module_select[i]];
    // end
  end

  // assign out = reg_current.data[CYCLES-1];
            
  // always @ (posedge clk) begin
  //   reg_current <= reg_next;
	// end
endmodule