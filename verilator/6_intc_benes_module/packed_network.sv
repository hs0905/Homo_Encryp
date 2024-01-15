`timescale 1ns/1ns

import util_pack::*;

module packed_network #(
  parameter integer DATA_WIDTH  = 512,
  parameter integer PORT_NUM    = 32,
  parameter integer SWITCH_NUM  = PORT_NUM/2,
  parameter integer LAYER_NUM   = $clog2(PORT_NUM),
  parameter integer STAGE_NUM   = 2*($clog2(PORT_NUM)) - 1,
  parameter integer BUFFER_NUM  = STAGE_NUM - 1
)(
  input logic CLK,
  input logic RST_N,
  input logic [0:STAGE_NUM-1][0:SWITCH_NUM-1] SWITCH_SET,
  input  logic [0:PORT_NUM-1][DATA_WIDTH-1:0] I_PORT, // [511:0][0:31] I_PORT
  output logic [0:PORT_NUM-1][DATA_WIDTH-1:0] O_PORT // [511:0][0:31] O_PORT
);

  logic [0:BUFFER_NUM][0:SWITCH_NUM-1] switch_set_reg;
  logic [0:PORT_NUM-1][DATA_WIDTH-1:0] i_port;
  logic [0:PORT_NUM-1][DATA_WIDTH-1:0] o_port;
  logic [0:PORT_NUM-1][DATA_WIDTH-1:0] module_out_reg;

  logic [0:BUFFER_NUM-1][0:PORT_NUM-1][DATA_WIDTH-1:0] middle_out_wire;
  logic [0:BUFFER_NUM-1][0:PORT_NUM-1][DATA_WIDTH-1:0] middle_out_reg;
  logic [1:BUFFER_NUM][0:PORT_NUM-1][DATA_WIDTH-1:0] middle_in_wire;
  logic [1:BUFFER_NUM][0:PORT_NUM-1][DATA_WIDTH-1:0] middle_in_reg;

  assign O_PORT = o_port;

  
always_ff@(posedge CLK or negedge RST_N) begin
  if(!RST_N) begin
    o_port <= 0;
  end else begin
    o_port <= module_out_reg;
  end
end

  always_ff@(posedge CLK or negedge RST_N) begin
    if(!RST_N) begin
      switch_set_reg <= 0;
      i_port         <= 0;
    end else begin
      switch_set_reg <= SWITCH_SET;
      i_port         <= I_PORT;
    end
  end

  always_ff@(posedge CLK or negedge RST_N) begin
    if(!RST_N) begin
      middle_out_reg <= 0;
    end else begin 
      middle_out_reg <= middle_out_wire;
    end
  end

  always_ff@(posedge CLK or negedge RST_N) begin
    if(!RST_N) begin
      middle_in_wire <= 0;
    end else begin
      middle_in_wire <= middle_in_reg;
    end
  end
 
  always_ff@(posedge CLK or negedge RST_N) begin
    if(!RST_N) begin
      middle_in_reg <= 0;
    end else begin
      for(integer stage = 0; stage < BUFFER_NUM; stage++) begin
        for(integer P_OUT = 0; P_OUT < PORT_NUM; P_OUT++) begin
          for(integer bit_idx = 0; bit_idx < DATA_WIDTH; bit_idx++) begin
            integer P_IN;
            P_IN = out_sw(stage, P_OUT);
              middle_in_reg[stage+1][P_IN][bit_idx] <= middle_out_reg[stage][P_OUT][bit_idx];
            end
          end
          end
        end
      end

  packed_stage #(.DATA_WIDTH(DATA_WIDTH),.PORT_NUM(PORT_NUM),.SWITCH_NUM(SWITCH_NUM)) 
    fisrt_stage(
      .CLK(CLK),
      .RST_N(RST_N),
      .SWITCH_SET(switch_set_reg[0]),
      .I_PORT(i_port),
      .O_PORT(middle_out_wire[0])
    );

  generate 
    for(genvar stage = 1; stage < BUFFER_NUM ; stage++) begin
      packed_stage #(.DATA_WIDTH(DATA_WIDTH),.PORT_NUM(PORT_NUM),.SWITCH_NUM(SWITCH_NUM)) 
        middle_stage(
          .CLK(CLK),
          .RST_N(RST_N),
          .SWITCH_SET(switch_set_reg[stage]),
          .I_PORT(middle_in_wire[stage]),
          .O_PORT(middle_out_wire[stage])
        );
    end
  endgenerate


  packed_stage #(.DATA_WIDTH(DATA_WIDTH),.PORT_NUM(PORT_NUM),.SWITCH_NUM(SWITCH_NUM)) 
    final_stage(
      .CLK(CLK),
      .RST_N(RST_N),
      .SWITCH_SET(switch_set_reg[BUFFER_NUM]),
      .I_PORT(middle_in_wire[BUFFER_NUM]),
      .O_PORT(module_out_reg)
    );






endmodule