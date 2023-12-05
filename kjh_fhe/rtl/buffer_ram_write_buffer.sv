`timescale 1 ns / 1 ns

`include "defines.vh"

import FHE_ALU_PKG::*;


module BufferRAMWriteBuffer #(
  parameter ID      = 0,
  parameter DEPTH   = 512,
  parameter READ_LATENCY = BUFFER_READ_LATENCY,
  parameter WIDTH = FSIZE,
  parameter DEPTHAD = $clog2(DEPTH)
) (
  input clk,
  input rstn,
  input logic [DEPTHAD-1:0]           raddr,
  input logic [DEPTHAD-1:0]           waddr,
  input logic [WIDTH-1:0]  wdata,
  input logic              wren,
  output logic [WIDTH-1:0] rdata
);

  logic [WIDTH-1:0] rdata_from_buf;
  BufferRAM #(
    .ID(ID),
    .DEPTH(DEPTH),
    .READ_LATENCY(READ_LATENCY-1),
    .WIDTH(WIDTH)
  ) buffer_ram (
    .clk(clk),
    .raddr(raddr),
    .waddr(waddr),
    .wdata(wdata),
    .wren(wren),
    .rdata(rdata_from_buf)
  );

  // assume READ_LATENCY=4
  // cycle  0       1         2         3               4
  //        raddr                       rdata_from_buf      
  //                                                    rdata
  //        waddr3  waddr2    waddr1    waddr0
  //                                    raddr_delayed
  //                                    waddr

  typedef struct packed {
    logic wren;
    logic [DEPTHAD-1:0] waddr;
    logic [WIDTH-1:0] wdata;
  } Write_info;


  typedef struct packed {
    logic [WIDTH-1:0] rdata;
    Write_info [READ_LATENCY-1:0] write_info;
  } Registers;

  Registers reg_current,reg_next;
  
  logic [DEPTHAD-1:0] raddr_delayed;
  generate 
  if(READ_LATENCY == 1)
    assign raddr_delayed = raddr;
  else
    FifoBuffer #(.DATA_SIZE(WIDTH), .CYCLES(READ_LATENCY-1) )  raddr_delayed_fifo (.clk(clk), .rstn(rstn), .in(raddr), .out(raddr_delayed));
  endgenerate

  always_comb begin
    reg_next = reg_current;

    rdata = reg_current.rdata;

    reg_next.write_info[0].waddr = waddr;
    reg_next.write_info[0].wdata = wdata;
    reg_next.write_info[0].wren = wren;

    reg_next.rdata = rdata_from_buf;
    for(int i = READ_LATENCY-1; i >= 0; i --) begin
      if(reg_next.write_info[i].wren) begin
        if(reg_next.write_info[i].waddr == raddr_delayed) begin
          reg_next.rdata = reg_next.write_info[i].wdata;
        end
      end
    end  

    
    for(int i = 0; i < READ_LATENCY-1; i ++)  
      reg_next.write_info[i+1] <= reg_current.write_info[i];
    

  end
    
  always @ (posedge clk) begin  
    reg_current <= reg_next;
	end
endmodule




module BufferRAMWriteBufferCancellable #(
  parameter ID      = 0,
  parameter DEPTH   = 512,
  parameter CANCEL_DURATION = 2,
  parameter READ_LATENCY = 1,
  parameter WIDTH = FSIZE,
  parameter DEPTHAD = $clog2(DEPTH)
) (
  input clk,
  input rstn,
  input cancel,
  input logic [DEPTHAD-1:0] raddr0,
  input logic [DEPTHAD-1:0] raddr1,
  input logic [DEPTHAD-1:0] waddr,
  input logic [WIDTH-1:0]  wdata,
  input logic              wren,
  output logic [WIDTH-1:0] rdata0,
  output logic [WIDTH-1:0] rdata1
);

  logic [WIDTH-1:0] rdata0_memory;
  logic [WIDTH-1:0] rdata1_memory;
  logic [DEPTHAD-1:0] waddr_memory;
  logic [WIDTH-1:0]  wdata_memory;
  logic              wren_memory;

  BufferRAM2P #(
    .ID(ID),
    .DEPTH(DEPTH),
    .READ_LATENCY(1),
    .WIDTH(WIDTH)
  ) memory (
    .clk(clk),
    .raddr0(raddr0),
    .raddr1(raddr1),
    .waddr(waddr_memory),
    .wdata(wdata_memory),
    .wren(wren_memory),
    .rdata0(rdata0_memory),
    .rdata1(rdata1_memory)
  );

  typedef struct packed {
    logic wren;
    logic [DEPTHAD-1:0] waddr;
    logic [WIDTH-1:0] wdata;
  } Write_info;

  typedef struct packed {
    Write_info [CANCEL_DURATION:0] write_info;
    logic rdata0_valid;
    logic [WIDTH-1:0] rdata0;
    logic rdata1_valid;
    logic [WIDTH-1:0] rdata1;
  } Registers;

  Registers reg_current,reg_next;
  
  always_comb begin
    reg_next = reg_current;

    reg_next.write_info[0].waddr = waddr;
    reg_next.write_info[0].wdata = wdata;
    reg_next.write_info[0].wren = wren;
    
    for(int i = 0; i < CANCEL_DURATION; i ++)  
      reg_next.write_info[i+1] = reg_current.write_info[i];
    
    if(cancel) begin
      for(int i = 0; i < CANCEL_DURATION; i ++)   begin
        reg_next.write_info[i].wren = 0;
      end            
    end
        
    wren_memory = reg_current.write_info[CANCEL_DURATION-1].wren;
    waddr_memory = reg_current.write_info[CANCEL_DURATION-1].waddr;
    wdata_memory = reg_current.write_info[CANCEL_DURATION-1].wdata;

    rdata0 = rdata0_memory;
    reg_next.rdata0_valid = 0;
    for(int i = CANCEL_DURATION; i >= 0; i --) begin
      if(reg_current.write_info[i].wren) begin
        if(reg_current.write_info[i].waddr == raddr0) begin
          reg_next.rdata0_valid = 1;
          reg_next.rdata0 = reg_current.write_info[i].wdata;
        end
      end
    end  
    if(reg_current.rdata0_valid) begin
      rdata0 = reg_current.rdata0;
    end

    rdata1 = rdata1_memory;
    reg_next.rdata1_valid = 0;
    for(int i = CANCEL_DURATION; i >= 0; i --) begin
      if(reg_current.write_info[i].wren) begin
        if(reg_current.write_info[i].waddr == raddr1) begin
          reg_next.rdata1_valid = 1;
          reg_next.rdata1 = reg_current.write_info[i].wdata;
        end
      end
    end  
    if(reg_current.rdata1_valid) begin
      rdata1 = reg_current.rdata1;
    end


  end
    
  always @ (posedge clk) begin  
    reg_current <= reg_next;
	end
endmodule

