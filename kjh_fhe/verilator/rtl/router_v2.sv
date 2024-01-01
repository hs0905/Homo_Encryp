`timescale 1 ns / 1 ns

`include "defines.vh"
import FHE_ALU_PKG::*;

module router_v2 #(
    
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
        
        // bottom side
        output BufferRAMTEFsizeInputs ring_bottom_outputs,

        input logic start_writing,
        input logic start_reading,

        output logic working
  );

  localparam WIDTH  = logN-logE;

  typedef struct packed {
    logic [WIDTH:0] raddr_cnt;
    logic writing_working;
    // logic [15:0] raddr;

    logic [WIDTH:0] reading_cnt;
    logic reading_working;

  } Registers;
  Registers reg_current,reg_next;

  logic [WIDTH-1:0] waddr_in;
  logic [WIDTH-1:0] waddr_out;
  FifoBuffer #(.DATA_SIZE(WIDTH), .CYCLES(2 + 1) )  waddr_fifo (.clk(clk), .rstn(1), .in(waddr_in), .out(waddr_out));

  logic wren_in;
  logic wren_out;
  FifoBuffer #(.DATA_SIZE(1), .CYCLES(2 + 1) )  wren_fifo (.clk(clk), .rstn(1), .in(wren_in), .out(wren_out));

  logic write_delay_in;
  logic write_delay_out;
  FifoBuffer #(.DATA_SIZE(1), .CYCLES(2 + 1) )  write_delay_fifo (.clk(clk), .rstn(1), .in(write_delay_in), .out(write_delay_out));

  BufferRAMTEFsizeInputs route_outputs_in;
  logic [E*FSIZE-1:0] intc_inputs_rdata_in;
  FifoBuffer #(.DATA_SIZE(32), .CYCLES(1) )  route_waddr_fifo (.clk(clk), .rstn(1), .in(route_outputs_in.waddr), .out(route_outputs.waddr));
  FifoBuffer #(.DATA_SIZE(32), .CYCLES(1) )  route_raddr_fifo (.clk(clk), .rstn(1), .in(route_outputs_in.raddr), .out(route_outputs.raddr));
  FifoBuffer #(.DATA_SIZE(E*FSIZE), .CYCLES(1) )  route_wdata_fifo (.clk(clk), .rstn(1), .in(route_outputs_in.wdata), .out(route_outputs.wdata));
  FifoBuffer #(.DATA_SIZE(1), .CYCLES(1) )  route_wren_fifo (.clk(clk), .rstn(1), .in(route_outputs_in.wren), .out(route_outputs.wren));
  FifoBuffer #(.DATA_SIZE(E*FSIZE), .CYCLES(1) )  intc_inputs_rdata_fifo (.clk(clk), .rstn(1), .in(intc_inputs_rdata_in), .out(intc_inputs_rdata));

  BufferRAMTEFsizeInputs ring_bottom_outputs_in;
  FifoBuffer #(.DATA_SIZE(32), .CYCLES(1) )  ring_bottom_outputs_waddr_fifo (.clk(clk), .rstn(1), .in(ring_bottom_outputs_in.waddr), .out(ring_bottom_outputs.waddr));
  FifoBuffer #(.DATA_SIZE(32), .CYCLES(1) )  ring_bottom_outputs_raddr_fifo (.clk(clk), .rstn(1), .in(ring_bottom_outputs_in.raddr), .out(ring_bottom_outputs.raddr));
  FifoBuffer #(.DATA_SIZE(E*FSIZE), .CYCLES(1) )  ring_bottom_outputs_wdata_fifo (.clk(clk), .rstn(1), .in(ring_bottom_outputs_in.wdata), .out(ring_bottom_outputs.wdata));
  FifoBuffer #(.DATA_SIZE(1), .CYCLES(1) )  ring_bottom_outputs_wren_fifo (.clk(clk), .rstn(1), .in(ring_bottom_outputs_in.wren), .out(ring_bottom_outputs.wren));

  always_comb begin
    reg_next = reg_current;

    route_outputs_in = intc_outputs;
    intc_inputs_rdata_in = route_inputs_rdata;

    ring_bottom_outputs_in = ring_top_inputs;

    if(start_writing) begin
      reg_next.raddr_cnt = 0;
      reg_next.writing_working = 1;
    end

    if(start_reading) begin
      reg_next.reading_cnt = 0;
      reg_next.reading_working = 1;
    end

    // writing
    waddr_in = 0;
    wren_in = 0;
    write_delay_in = 0;
    if(reg_current.writing_working) begin
      write_delay_in = 1;
      reg_next.raddr_cnt = reg_current.raddr_cnt + 1;

      route_outputs_in.raddr = reg_current.raddr_cnt;
      waddr_in = reg_current.raddr_cnt;
      wren_in = 1;
      

      if(reg_current.raddr_cnt == ((8192/E)-1) ) begin
        reg_next.writing_working = 0;
      end
    end

    if(write_delay_out) begin
      ring_bottom_outputs_in.waddr = waddr_out;
      ring_bottom_outputs_in.wren = wren_out;
      ring_bottom_outputs_in.wdata = route_inputs_rdata;
    end

    /////////////////////////////////////////////////
    if(reg_current.reading_working) begin
      if(ring_top_inputs.wren) begin
        reg_next.reading_cnt = reg_current.reading_cnt + 1;

        route_outputs_in.wdata = ring_top_inputs.wdata;
        route_outputs_in.wren = ring_top_inputs.wren;
        route_outputs_in.waddr = ring_top_inputs.waddr;

        ring_bottom_outputs_in.wdata = 0;
        ring_bottom_outputs_in.wren = 0;
        ring_bottom_outputs_in.waddr = 0;
      end
    end

    if(reg_current.reading_cnt == ((8192/E)-1)) begin
      reg_next.reading_working = 0;
    end

    working = reg_current.writing_working | wren_out | reg_current.reading_working;

    if(rstn == 0) begin
      ring_bottom_outputs_in = '{default:'0};
      reg_next.writing_working = 0;
      reg_next.reading_working = 0;
      reg_next.reading_cnt = 0;
      reg_next.raddr_cnt = 0;
    end
  end
       
    
  always @ (posedge clk , negedge rstn) begin  
    reg_current <= reg_next;
  end

endmodule

module ring_router_v2 #(
      parameter SLOT_NUM_IN_RING = PE_CNT*SLOT_NUM
	) (	
		input logic	clk,		    		
		input logic rstn,		

        //intc <=> router
        input BufferRAMTEFsizeInputs  router_inputs[0:SLOT_NUM_IN_RING-1],
        output logic [E*FSIZE-1:0]   router_outputs[0:SLOT_NUM_IN_RING-1],

        //router <=> slot
        output BufferRAMTEFsizeInputs ram_inputs[0:SLOT_NUM_IN_RING-1],
        input logic [E*FSIZE-1:0]   ram_outputs[0:SLOT_NUM_IN_RING-1],

        input logic [SLOT_NUM_IN_RING-1:0] ring_writing,
        input logic [SLOT_NUM_IN_RING-1:0] ring_reading,

        output logic working
  );

//   typedef struct packed {

//   } Registers;
//   Registers reg_current,reg_next;

  BufferRAMTEFsizeInputs ring_top_inputs[0:SLOT_NUM_IN_RING-1];
  BufferRAMTEFsizeInputs ring_bottom_outputs[0:SLOT_NUM_IN_RING-1];

  logic [SLOT_NUM_IN_RING-1:0] router_working;
  genvar gi;
  generate
    for( gi = 0 ; gi < SLOT_NUM_IN_RING ; gi++) begin : router
        router_v2 router_v2(	
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
                // bottom side
                .ring_bottom_outputs(ring_bottom_outputs[gi]),

                .start_writing(ring_writing[gi]),
                .start_reading(ring_reading[gi]),
                
                .working(router_working[gi])
        );
    end
  endgenerate

  assign working = router_working ?  1 : 0; 

  assign ring_top_inputs[0] = ring_bottom_outputs[SLOT_NUM_IN_RING-1];

  genvar gj;
  generate
    for( gj = 0 ; gj < SLOT_NUM_IN_RING-1 ; gj++) begin
        assign ring_top_inputs[gj+1] = ring_bottom_outputs[gj];
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
