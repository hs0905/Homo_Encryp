`timescale 1 ns / 1 ns

`include "defines.vh"
import FHE_ALU_PKG::*;

module router #(
	) (	
		input logic	clk,		    		
		input logic rstn,		

        // left side
        input BufferRAMTEFsizeInputs intc_outputs,
        output logic [E*FSIZE-1:0] intc_inputs_rdata,

        // right side
        output BufferRAMTEFsizeInputs route_outputs,
        input logic [E*FSIZE-1:0] route_inputs_rdata,

        // top side
        input BufferRAMTEFsizeInputs ring_top_inputs,
        output BufferRAMTEFsizeInputs ring_top_outputs,
        
        // bottom side
        input BufferRAMTEFsizeInputs ring_bottom_inputs,
        output BufferRAMTEFsizeInputs ring_bottom_outputs,

        input logic ring_writing,
        input logic ring_reading
  );
 

//   typedef struct packed {

//   } Registers;
//   Registers reg_current,reg_next;

//   always_comb begin
//     reg_next = reg_current;

//     if(rstn == 0) begin

//     end
//   end
       
    
  always @ (posedge clk , negedge rstn) begin  
    // reg_current <= reg_next;

    
    route_outputs <= intc_outputs;
    intc_inputs_rdata <= route_inputs_rdata;
    ring_bottom_outputs <= ring_top_inputs;
    ring_top_outputs <= ring_bottom_inputs;
    
    if(ring_writing) begin
        ring_bottom_outputs <= intc_outputs;
        route_outputs <= '{default:'0};
    end

    if(ring_reading) begin
        route_outputs <= ring_bottom_inputs;
        ring_top_outputs <= '{default:'0};
    end

    if(rstn == 0) begin
        ring_bottom_outputs <= 0;
        ring_top_outputs <= 0;
    end
  end

endmodule

module ring_router #(
	) (	
		input logic	clk,		    		
		input logic rstn,		

        //intc <=> router
        input BufferRAMTEFsizeInputs  router_inputs[0:SLOT_NUM-1],
        output logic [E*FSIZE-1:0]   router_outputs[0:SLOT_NUM-1],

        //router <=> slot
        output BufferRAMTEFsizeInputs ram_inputs[0:SLOT_NUM-1],
        input logic [E*FSIZE-1:0]   ram_outputs[0:SLOT_NUM-1],

        input logic [SLOT_NUM-1:0] ring_writing,
        input logic [SLOT_NUM-1:0] ring_reading
  );

//   typedef struct packed {

//   } Registers;
//   Registers reg_current,reg_next;

  BufferRAMTEFsizeInputs ring_top_inputs[0:SLOT_NUM-1];
  BufferRAMTEFsizeInputs ring_top_outputs[0:SLOT_NUM-1];
  BufferRAMTEFsizeInputs ring_bottom_inputs[0:SLOT_NUM-1];
  BufferRAMTEFsizeInputs ring_bottom_outputs[0:SLOT_NUM-1];

  genvar gi;
  generate
    for( gi = 0 ; gi < SLOT_NUM ; gi++) begin : router
        router router(	
                .clk(clk),		    		
                .rstn(rstn),		
                // left side
                .intc_outputs(router_inputs[gi]),
                .intc_inputs_rdata(router_outputs[gi]),
                // right side
                .route_outputs(ram_inputs[gi]),
                .route_inputs_rdata(ram_outputs[gi]),
                // top side
                .ring_top_inputs(ring_top_inputs[gi]),
                .ring_top_outputs(ring_top_outputs[gi]),
                // bottom side
                .ring_bottom_inputs(ring_bottom_inputs[gi]),
                .ring_bottom_outputs(ring_bottom_outputs[gi]),

                .ring_writing(ring_writing[gi]),
                .ring_reading(ring_reading[gi])
        );
    end
  endgenerate

  assign ring_top_inputs[0] = ring_top_outputs[0];
  assign ring_bottom_inputs[SLOT_NUM-1] = ring_bottom_outputs[SLOT_NUM-1];
  genvar gj;
  generate
    for( gj = 0 ; gj < SLOT_NUM-1 ; gj++) begin
        assign ring_top_inputs[gj+1] = ring_bottom_outputs[gj];
        assign ring_bottom_inputs[gj] = ring_top_outputs[gj+1];
    end
  endgenerate
//   always_comb begin
//     reg_next = reg_current;

//     if(rstn == 0) begin

//     end
//   end
       
    
  always @ (posedge clk) begin  
    // reg_current <= reg_next;

    // route_outputs <= intc_outputs;
    // intc_inputs_rdata <= route_inputs_rdata;
    // ring_bottom_outputs <= ring_top_inputs;
    // ring_top_outputs <= ring_bottom_inputs;
    
    // if(ring_writing) begin
    //     ring_bottom_outputs <= intc_outputs;
    //     route_outputs <= '{default:'0};
    // end

    // if(ring_reading) begin
    //     route_outputs <= ring_bottom_inputs;
    //     ring_top_outputs <= '{default:'0};
    // end


  end

endmodule
