`timescale 1 ns / 1 ns

`include "defines.vh"
import FHE_ALU_PKG::*;

module Set_Unit_Control #(
		parameter WIDTH     = logN-logE	
	) (	

    input logic	clk,		    		
    input logic rstn,			

    input logic start_set_uint,
    output logic set_uint_working,

    output BufferRAMTEFsizeInputs ram_inputs1,
    output BufferRAMTEFsizeInputs ram_inputs2,
    input logic [E*FSIZE-1:0] ram_outputs_rdata1
  );
  
  localparam N_ITEMS = 1 << WIDTH;

  typedef struct packed {
    logic state_STATE_SET_UINT_WAIT;
    logic state_STATE_SET_UINT;

    logic [WIDTH-1:0] set_uint_idx_read_load_counter;
    logic [WIDTH-1:0] set_uint_idx_write_load_counter;
  } Registers;

  Registers reg_current,reg_next;

  localparam STATE_SET_UINT_GENERATE = 9;
  localparam STATE_SET_UINT = 7;
  localparam STATE_SET_UINT_WAIT = 8;

  

  logic set_uint_idx_valid_in, set_uint_idx_valid;
  FifoBuffer #(.DATA_SIZE(1), .CYCLES(1) )  set_uint_idx_valid_fifo (.clk(clk), .rstn(1), .in(set_uint_idx_valid_in), .out(set_uint_idx_valid));

  logic ram_valid_in, ram_valid;
  FifoBuffer #(.DATA_SIZE(1), .CYCLES(BUFFER_READ_LATENCY + 1 + 1 + STAGE_MODULE_DELAY + STAGE_SLOT_DELAY + RING_ROUTER_DELAY) )  ram_valid_fifo (.clk(clk), .rstn(1), .in(ram_valid_in), .out(ram_valid));

  logic ram_last_in, ram_last;
  FifoBuffer #(.DATA_SIZE(1), .CYCLES(BUFFER_READ_LATENCY + 1 + 1 + STAGE_MODULE_DELAY + STAGE_SLOT_DELAY + RING_ROUTER_DELAY) )  ram_last_fifo (.clk(clk), .rstn(1), .in(ram_last_in), .out(ram_last));

  logic [WIDTH-1:0] set_uint_addr_out;
  logic [WIDTH-1:0] set_uint_addr_out_delayed;
  FifoBuffer #(.DATA_SIZE(WIDTH), .CYCLES(BUFFER_READ_LATENCY + 2 + 1 + STAGE_MODULE_DELAY + STAGE_SLOT_DELAY + RING_ROUTER_DELAY) )  set_uint_idx_write_rdata_fifo (.clk(clk), .rstn(1), .in(set_uint_addr_out), .out(set_uint_addr_out_delayed));
  // BUFFER_READ_LATENCY + raddr delay + just data delay

  logic [E*FSIZE-1:0] ram_outputs_rdata_delayed;
  FifoBuffer #(.DATA_SIZE(E*FSIZE), .CYCLES(1) )  ram_outputs_rdata_fifo (.clk(clk), .rstn(1), .in(ram_outputs_rdata1), .out(ram_outputs_rdata_delayed));

  // logic  [WIDTH-1:0] set_uinted_store_idx_delayed_in, set_uinted_store_idx_delayed;
  // FifoBuffer #(.DATA_SIZE(WIDTH), .CYCLES(BUFFER_READ_LATENCY) )  set_uinted_store_idx_delayed_fifo (.clk(clk), .rstn(1), .in(set_uinted_store_idx_delayed_in), .out(set_uinted_store_idx_delayed));

  logic [WIDTH-1:0] raddr_in;
  logic [WIDTH-1:0] raddr_out;
  FifoBuffer #(.DATA_SIZE(WIDTH), .CYCLES(2) )  raddr_fifo (.clk(clk), .rstn(1), .in(raddr_in), .out(raddr_out));//raddr delay

  always_comb begin
    reg_next = reg_current;

    ram_inputs1 = '{default:'0};
    ram_inputs2 = '{default:'0};
    if(start_set_uint) begin
      reg_next.state_STATE_SET_UINT = 1;
      reg_next.set_uint_idx_read_load_counter = 0;
      reg_next.set_uint_idx_write_load_counter = 0;
    end

    ram_inputs1.raddr = raddr_out;
    raddr_in = 0;
    set_uint_idx_valid_in = 0;
    if(reg_current.state_STATE_SET_UINT) begin
      set_uint_idx_valid_in = 1;
      
      set_uint_addr_out = reg_current.set_uint_idx_read_load_counter;
      // ram_inputs1.raddr = reg_current.set_uint_idx_read_load_counter;
      raddr_in = reg_current.set_uint_idx_read_load_counter;

      reg_next.set_uint_idx_read_load_counter = reg_current.set_uint_idx_read_load_counter + 1;
      if(reg_current.set_uint_idx_read_load_counter == 10'b1111111111) begin
        reg_next.state_STATE_SET_UINT = 0;
        reg_next.state_STATE_SET_UINT_WAIT = 1;
      end
    end
    
    ram_valid_in = 0;
    ram_last_in = 0;
    
    if(set_uint_idx_valid) begin
      ram_valid_in = 1;
      reg_next.set_uint_idx_write_load_counter = reg_current.set_uint_idx_write_load_counter + 1;      
      if(reg_current.set_uint_idx_write_load_counter == 10'b1111111111) begin
        ram_last_in = 1;
        reg_next.state_STATE_SET_UINT = 0;
        reg_next.state_STATE_SET_UINT_WAIT = 1;
      end
    end

    ram_inputs2.waddr = set_uint_addr_out_delayed;
    ram_inputs2.wdata = ram_outputs_rdata_delayed;
    if(ram_valid) begin        
      if(ram_last) begin
        reg_next.state_STATE_SET_UINT = 0;
        reg_next.state_STATE_SET_UINT_WAIT = 0;
      end
      ram_inputs2.wren = 1;
    end

    set_uint_working = 0;
    if(reg_current.state_STATE_SET_UINT_WAIT  || reg_current.state_STATE_SET_UINT ) set_uint_working = 1;

    if(rstn == 0) begin  
      reg_next.state_STATE_SET_UINT_WAIT = 0;      
      reg_next.state_STATE_SET_UINT = 0;      
    end
  end
       
    
  always @ (posedge clk) begin  
    reg_current <= reg_next;
	end


endmodule
