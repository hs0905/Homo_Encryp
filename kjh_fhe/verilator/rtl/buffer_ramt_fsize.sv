`timescale 1 ns / 1 ns

`include "defines.vh"

import FHE_ALU_PKG::*;


module BufferRAMTFsize #(
  parameter ID      = 0,
  parameter DEPTH   = 512,
  parameter READ_LATENCY = BUFFER_READ_LATENCY,
  parameter DEPTHAD = $clog2(DEPTH)
) (
  input clk,
  input BufferRAMTFsizeInputs inputs,
  output BufferRAMTFsizeOutputs outputs
);
  localparam WIDTH = FSIZE;

  logic[WIDTH-1:0] memory[0:DEPTH-1];

  logic[WIDTH-1:0] rbuffer[0:READ_LATENCY-1];

  assign outputs.rdata = rbuffer[READ_LATENCY-1];
  
  always @ (posedge clk) begin
    rbuffer[0] <= memory[inputs.raddr];
    
    if(inputs.wren && inputs.raddr==inputs.waddr ) begin
      rbuffer[0] <= inputs.wdata;
    end

    for(int i = 0; i < READ_LATENCY-1; i ++)  
      rbuffer[i+1] <= rbuffer[i];
    
    if(inputs.wren) begin
      memory[inputs.waddr] = inputs.wdata;
    end
	end  
endmodule



module BufferRAMT #(
  parameter ID      = 0,
  parameter DEPTH   = 512,
  parameter READ_LATENCY = BUFFER_READ_LATENCY,
  parameter WIDTH = FSIZE,
  parameter ITEMS = E,
  parameter DEPTHAD = $clog2(DEPTH)
) (
  input clk,
  input logic [DEPTHAD-1:0]           raddr,
  input logic [DEPTHAD-1:0]           waddr,
  input logic [ITEMS-1:0][WIDTH-1:0]  wdata,
  input logic  [ITEMS-1:0]            wren,
  output logic [ITEMS-1:0][WIDTH-1:0] rdata
);
  logic[ITEMS-1:0][WIDTH-1:0] memory[0:DEPTH-1];
  logic[ITEMS-1:0][WIDTH-1:0] rbuffer[0:READ_LATENCY-1];
  genvar gi;
  generate
  for(gi = 0; gi < ITEMS; gi++) begin
    assign rdata[gi] = rbuffer[READ_LATENCY-1][gi];
  end
  endgenerate
  
  always @ (posedge clk) begin
    rbuffer[0] <= memory[raddr];
  
    for(int i = 0; i < READ_LATENCY-1; i ++)  
      rbuffer[i+1] <= rbuffer[i];
    
    for(int i = 0; i < ITEMS; i ++) begin
      if(wren[i]) begin
        memory[waddr][i] = wdata[i];
      end
    end
	end  
endmodule





module BufferRAMTFsizeR2W1 #(
  parameter ID      = 0,
  parameter DEPTH   = 512,
  parameter READ_LATENCY = BUFFER_READ_LATENCY,
  parameter DEPTHAD = $clog2(DEPTH)
) (
  input clk,
  input BufferRAMTFsizeInputsR2W1 inputs,
  output logic [FSIZE-1:0] rdata0,
  output logic [FSIZE-1:0] rdata1
);
  BufferRAMTFsizeInputs inputs0;
  BufferRAMTFsizeInputs inputs1;
  BufferRAMTFsizeOutputs outputs0;
  BufferRAMTFsizeOutputs outputs1;

  assign inputs0.raddr = inputs.raddr0;
  assign inputs0.waddr = inputs.waddr;
  assign inputs0.wdata = inputs.wdata;
  assign inputs0.wren = inputs.wren;

  assign inputs1.raddr = inputs.raddr1;
  assign inputs1.waddr = inputs.waddr;
  assign inputs1.wdata = inputs.wdata;
  assign inputs1.wren = inputs.wren;

  BufferRAMTFsize #(
      .ID(ID),
      .DEPTH(DEPTH),
      .READ_LATENCY(READ_LATENCY),
      .DEPTHAD(DEPTHAD)
  ) ram0 (
    .clk(clk),
    .inputs(inputs0),
    .outputs(outputs0)
  );

  BufferRAMTFsize #(
      .ID(ID),
      .DEPTH(DEPTH),
      .READ_LATENCY(READ_LATENCY),
      .DEPTHAD(DEPTHAD)
  ) ram1 (
    .clk(clk),
    .inputs(inputs1),
    .outputs(outputs1)
  );

  assign rdata0 = outputs0.rdata;
  assign rdata1 = outputs1.rdata;

endmodule




module BufferRAMTFsizeR2W2 #(
  parameter ID      = 0,
  parameter DEPTH   = 512,
  parameter READ_LATENCY = BUFFER_READ_LATENCY,
  parameter DEPTHAD = $clog2(DEPTH)
) (
  input clk,
  input BufferRAMTFsizeInputsR2W2 inputs,
  output logic [FSIZE-1:0] rdata0,
  output logic [FSIZE-1:0] rdata1
);
  localparam WIDTH = FSIZE;

  logic[WIDTH-1:0] memory[0:DEPTH-1];

  logic[WIDTH-1:0] rbuffer0[0:READ_LATENCY-1];
  logic[WIDTH-1:0] rbuffer1[0:READ_LATENCY-1];

  assign rdata0 = rbuffer0[READ_LATENCY-1];
  assign rdata1 = rbuffer1[READ_LATENCY-1];
  
  always @ (posedge clk) begin
    rbuffer0[0] <= memory[inputs.raddr0];
    rbuffer1[0] <= memory[inputs.raddr1];
    
    // if(inputs.wren0 && inputs.raddr0==inputs.waddr0 ) begin
    //   rbuffer0[0] <= inputs.wdata0;
    // end
    // if(inputs.wren1 && inputs.raddr0==inputs.waddr1 ) begin
    //   rbuffer0[0] <= inputs.wdata1;
    // end
    // if(inputs.wren0 && inputs.raddr1==inputs.waddr0 ) begin
    //   rbuffer1[0] <= inputs.wdata0;
    // end
    // if(inputs.wren1 && inputs.raddr1==inputs.waddr1 ) begin
    //   rbuffer1[0] <= inputs.wdata1;
    // end

    for(int i = 0; i < READ_LATENCY-1; i ++)  
      rbuffer0[i+1] <= rbuffer0[i];
    for(int i = 0; i < READ_LATENCY-1; i ++)  
      rbuffer1[i+1] <= rbuffer1[i];
    
    if(inputs.wren0) begin
      memory[inputs.waddr0] <= inputs.wdata0;
    end
    if(inputs.wren1) begin
      memory[inputs.waddr1] <= inputs.wdata1;
    end
	end  

endmodule




module BufferRAMTEFsize #(
  parameter ID      = 0,
  parameter DEPTH   = 512,
  parameter READ_LATENCY = BUFFER_READ_LATENCY,
  parameter DEPTHAD = $clog2(DEPTH)
) (
  input clk,
  input BufferRAMTEFsizeInputs inputs,
  output logic [E*FSIZE-1:0] rdata
);
  localparam WIDTH = E*FSIZE;

  logic[WIDTH-1:0] memory[0:DEPTH-1];

  logic[WIDTH-1:0] rbuffer[0:READ_LATENCY-1];

  assign rdata = rbuffer[READ_LATENCY-1];
  
  always @ (posedge clk) begin
    rbuffer[0] <= memory[inputs.raddr];
    
    for(int i = 0; i < READ_LATENCY-1; i ++)  
      rbuffer[i+1] <= rbuffer[i];
    if(inputs.wren) begin
      memory[inputs.waddr] <= inputs.wdata;
    end
	end  

endmodule


module BufferRAM #(
  parameter ID      = 0,
  parameter DEPTH   = 512,
  parameter READ_LATENCY = BUFFER_READ_LATENCY,
  parameter WIDTH = FSIZE,
  parameter DEPTHAD = $clog2(DEPTH)
) (
  input clk,
  input logic [DEPTHAD-1:0]           raddr,
  input logic [DEPTHAD-1:0]           waddr,
  input logic [WIDTH-1:0]             wdata,
  input logic                         wren,
  output logic [WIDTH-1:0]            rdata
);
  logic[WIDTH-1:0] memory[0:DEPTH-1];
  logic[WIDTH-1:0] rbuffer[0:READ_LATENCY-1];
  
  assign rdata = rbuffer[READ_LATENCY-1];
  
  always @ (posedge clk) begin
    rbuffer[0] <= memory[raddr];
  
    for(int i = 0; i < READ_LATENCY-1; i ++)  
      rbuffer[i+1] <= rbuffer[i];
    
    if(wren) begin
      memory[waddr] <= wdata;
    end
	end  
endmodule

module BufferRAM2P #(
  parameter ID      = 0,
  parameter DEPTH   = 512,
  parameter READ_LATENCY = BUFFER_READ_LATENCY,
  parameter WIDTH = FSIZE,
  parameter DEPTHAD = $clog2(DEPTH)
) (
  input clk,
  input logic [DEPTHAD-1:0]           raddr0,
  input logic [DEPTHAD-1:0]           raddr1,
  input logic [DEPTHAD-1:0]           waddr,
  input logic [WIDTH-1:0]             wdata,
  input logic                         wren,
  output logic [WIDTH-1:0]            rdata0,
  output logic [WIDTH-1:0]            rdata1
);
  logic[WIDTH-1:0] memory[0:DEPTH-1];
  logic[WIDTH-1:0] rbuffer0[0:READ_LATENCY-1];
  logic[WIDTH-1:0] rbuffer1[0:READ_LATENCY-1];
  
  assign rdata0 = rbuffer0[READ_LATENCY-1];
  assign rdata1 = rbuffer1[READ_LATENCY-1];
  
  always @ (posedge clk) begin
    rbuffer0[0] <= memory[raddr0];
    rbuffer1[0] <= memory[raddr1];
  
    for(int i = 0; i < READ_LATENCY-1; i ++)  begin
      rbuffer0[i+1] <= rbuffer0[i];
      rbuffer1[i+1] <= rbuffer1[i];
    end
    
    if(wren) begin
      memory[waddr] <= wdata;
    end
	end  
endmodule


module BufferRAMTFsizeR3W1 #(
  parameter ID      = 0,
  parameter DEPTH   = 512,
  parameter READ_LATENCY = BUFFER_READ_LATENCY,
  parameter DEPTHAD = $clog2(DEPTH)
) (
  input clk,
  input BufferRAMTFsizeInputsR3W1 inputs,
  output logic [FSIZE-1:0] rdata0,
  output logic [FSIZE-1:0] rdata1,
  output logic [FSIZE-1:0] rdata2
);
  BufferRAMTFsizeInputs inputs0;
  BufferRAMTFsizeInputs inputs1;
  BufferRAMTFsizeInputs inputs2;
  BufferRAMTFsizeOutputs outputs0;
  BufferRAMTFsizeOutputs outputs1;
  BufferRAMTFsizeOutputs outputs2;

  assign inputs0.raddr = inputs.raddr0;
  assign inputs0.waddr = inputs.waddr;
  assign inputs0.wdata = inputs.wdata;
  assign inputs0.wren = inputs.wren;

  assign inputs1.raddr = inputs.raddr1;
  assign inputs1.waddr = inputs.waddr;
  assign inputs1.wdata = inputs.wdata;
  assign inputs1.wren = inputs.wren;

  assign inputs2.raddr = inputs.raddr2;
  assign inputs2.waddr = inputs.waddr;
  assign inputs2.wdata = inputs.wdata;
  assign inputs2.wren = inputs.wren;

  BufferRAMTFsize #(
      .ID(ID),
      .DEPTH(DEPTH),
      .READ_LATENCY(READ_LATENCY),
      .DEPTHAD(DEPTHAD)
  ) ram0 (
    .clk(clk),
    .inputs(inputs0),
    .outputs(outputs0)
  );

  BufferRAMTFsize #(
      .ID(ID),
      .DEPTH(DEPTH),
      .READ_LATENCY(READ_LATENCY),
      .DEPTHAD(DEPTHAD)
  ) ram1 (
    .clk(clk),
    .inputs(inputs1),
    .outputs(outputs1)
  );

  BufferRAMTFsize #(
      .ID(ID),
      .DEPTH(DEPTH),
      .READ_LATENCY(READ_LATENCY),
      .DEPTHAD(DEPTHAD)
  ) ram2 (
    .clk(clk),
    .inputs(inputs2),
    .outputs(outputs2)
  );

  assign rdata0 = outputs0.rdata;
  assign rdata1 = outputs1.rdata;
  assign rdata2 = outputs2.rdata;

endmodule



module BufferRAMTFsizeR4W1 #(
  parameter ID      = 0,
  parameter DEPTH   = 512,
  parameter READ_LATENCY = BUFFER_READ_LATENCY,
  parameter DEPTHAD = $clog2(DEPTH)
) (
  input clk,
  input BufferRAMTFsizeInputsR4W1 inputs,
  output logic [FSIZE-1:0] rdata0,
  output logic [FSIZE-1:0] rdata1,
  output logic [FSIZE-1:0] rdata2,
  output logic [FSIZE-1:0] rdata3
);
  BufferRAMTFsizeInputs inputs0;
  BufferRAMTFsizeInputs inputs1;
  BufferRAMTFsizeInputs inputs2;
  BufferRAMTFsizeInputs inputs3;
  BufferRAMTFsizeOutputs outputs0;
  BufferRAMTFsizeOutputs outputs1;
  BufferRAMTFsizeOutputs outputs2;
  BufferRAMTFsizeOutputs outputs3;

  assign inputs0.raddr = inputs.raddr0;
  assign inputs0.waddr = inputs.waddr;
  assign inputs0.wdata = inputs.wdata;
  assign inputs0.wren = inputs.wren;

  assign inputs1.raddr = inputs.raddr1;
  assign inputs1.waddr = inputs.waddr;
  assign inputs1.wdata = inputs.wdata;
  assign inputs1.wren = inputs.wren;

  assign inputs2.raddr = inputs.raddr2;
  assign inputs2.waddr = inputs.waddr;
  assign inputs2.wdata = inputs.wdata;
  assign inputs2.wren = inputs.wren;

  assign inputs3.raddr = inputs.raddr3;
  assign inputs3.waddr = inputs.waddr;
  assign inputs3.wdata = inputs.wdata;
  assign inputs3.wren = inputs.wren;

  BufferRAMTFsize #(
      .ID(ID),
      .DEPTH(DEPTH),
      .READ_LATENCY(READ_LATENCY),
      .DEPTHAD(DEPTHAD)
  ) ram0 (
    .clk(clk),
    .inputs(inputs0),
    .outputs(outputs0)
  );

  BufferRAMTFsize #(
      .ID(ID),
      .DEPTH(DEPTH),
      .READ_LATENCY(READ_LATENCY),
      .DEPTHAD(DEPTHAD)
  ) ram1 (
    .clk(clk),
    .inputs(inputs1),
    .outputs(outputs1)
  );

  BufferRAMTFsize #(
      .ID(ID),
      .DEPTH(DEPTH),
      .READ_LATENCY(READ_LATENCY),
      .DEPTHAD(DEPTHAD)
  ) ram2 (
    .clk(clk),
    .inputs(inputs2),
    .outputs(outputs2)
  );

  BufferRAMTFsize #(
      .ID(ID),
      .DEPTH(DEPTH),
      .READ_LATENCY(READ_LATENCY),
      .DEPTHAD(DEPTHAD)
  ) ram3 (
    .clk(clk),
    .inputs(inputs3),
    .outputs(outputs3)
  );

  assign rdata0 = outputs0.rdata;
  assign rdata1 = outputs1.rdata;
  assign rdata2 = outputs2.rdata;
  assign rdata3 = outputs3.rdata;

endmodule




module BufferRAMTSsize #(
  parameter ID      = 0,
  parameter DEPTH   = 512,
  parameter READ_LATENCY = BUFFER_READ_LATENCY,
  parameter DEPTHAD = $clog2(DEPTH)
) (
  input clk,
  input BufferRAMTSsizeInputs inputs,
  output BufferRAMTSsizeOutputs outputs
);
  localparam WIDTH = SSIZE;

  logic[WIDTH-1:0] memory[0:DEPTH-1];

  logic[WIDTH-1:0] rbuffer[0:READ_LATENCY-1];

  assign outputs.rdata = rbuffer[READ_LATENCY-1];
  
  always @ (posedge clk) begin
    rbuffer[0] <= memory[inputs.raddr];
    for(int i = 0; i < READ_LATENCY-1; i ++)  
      rbuffer[i+1] <= rbuffer[i];
    
    if(inputs.wren) begin
      memory[inputs.waddr] = inputs.wdata;
    end
	end  
endmodule