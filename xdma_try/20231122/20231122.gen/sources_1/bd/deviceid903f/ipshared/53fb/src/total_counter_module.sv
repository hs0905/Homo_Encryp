`timescale 1ps/1ps

module test_counter_plus#(
  localparam FULL = 16
)
(
    input   logic       clk,
    input   logic       rst_n,
    output  logic [7:0] out_wire
  );
  logic [7:0]out_reg;
  always_ff @(posedge clk, negedge rst_n) begin 
    if(!rst_n)
      out_reg <= 0;
    else if(out_reg == FULL)
      out_reg <= 0;
    else 
      out_reg <= out_reg + 1;    
  end

  assign out_wire = out_reg;
endmodule

module test_counter_minus#(
  localparam FULL = 16
)(
    input   logic       clk,
    input   logic       rst_n,
    output  logic [7:0] out_wire
  );
  logic [7:0] out_reg;

  always_ff @(posedge clk, negedge rst_n) begin
  if(!rst_n) 
    out_reg <=FULL;
  else if(out_reg == 0)
    out_reg <= FULL;
  else
    out_reg <= out_reg - 1;
  end

  assign out_wire = out_reg;
endmodule

module test_counter_2plus#(
  localparam FULL = 16
)(
  input  logic clk,
  input  logic rst_n,
  output logic [7:0] out_wire
);

logic [7:0] out_reg;

always_ff @(posedge clk, negedge rst_n) begin
  if(!rst_n)
  out_reg <= 0;
  else if(out_reg + 2 > FULL)
  out_reg <= 0;
  else
  out_reg <= out_reg + 2;
end

assign out_wire = out_reg;

endmodule

module test_counter_2minus#(
  localparam FULL = 16
)(
    input   logic       clk,
    input   logic       rst_n,
    output  logic [7:0] out_wire
);

logic [7:0] out_reg;

always_ff @(posedge clk, negedge rst_n) begin
if(!rst_n) 
  out_reg <=FULL;
else if(out_reg -2 < 0)
  out_reg <= FULL;
else
  out_reg <= out_reg - 2;
end

assign out_wire = out_reg;

endmodule

module test_counter_3plus#(
  localparam FULL = 16
)(
  input  logic clk,
  input  logic rst_n,
  output logic [7:0] out_wire
);

logic [7:0] out_reg;

always_ff @(posedge clk, negedge rst_n) begin
  if(!rst_n)
  out_reg <= 0;
  else if(out_reg + 3 > FULL)
  out_reg <= 0;
  else
  out_reg <= out_reg + 3;
end

assign out_wire = out_reg;

endmodule

module test_counter_3minus#(
  localparam FULL = 16
)(
    input   logic       clk,
    input   logic       rst_n,
    output  logic [7:0] out_wire
);

logic [7:0] out_reg;

always_ff @(posedge clk, negedge rst_n) begin
if(!rst_n) 
  out_reg <=FULL;
else if(out_reg -3 < 0)
  out_reg <= FULL;
else
  out_reg <= out_reg - 3;
end

assign out_wire = out_reg;

endmodule

module test_counter_4minus#(
  localparam FULL = 16
)(
    input   logic       clk,
    input   logic       rst_n,
    output  logic [7:0] out_wire
);

logic [7:0] out_reg;

always_ff @(posedge clk, negedge rst_n) begin
if(!rst_n) 
  out_reg <=FULL;
else if(out_reg -4 < 0)
  out_reg <= FULL;
else
  out_reg <= out_reg - 4;
end

assign out_wire = out_reg;

endmodule

module test_counter_4plus#(
  localparam FULL = 16
)(
  input  logic clk,
  input  logic rst_n,
  output logic [7:0] out_wire
);

logic [7:0] out_reg;

always_ff @(posedge clk, negedge rst_n) begin
  if(!rst_n)
  out_reg <= 0;
  else if(out_reg + 4 > FULL)
  out_reg <= 0;
  else
  out_reg <= out_reg + 4;
end

assign out_wire = out_reg;

endmodule