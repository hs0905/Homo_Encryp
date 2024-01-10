`timescale 1ns/1ns

module packed_switch #(
    parameter integer DATA_WIDTH = 512
)(
  input logic  RST_N,
  input  logic CLK,
  input  logic SWITCH_SET,
  input  logic [0:1][DATA_WIDTH-1:0] I_PORT,
  output logic [0:1][DATA_WIDTH-1:0] O_PORT
);
  logic [0:1][DATA_WIDTH-1:0] i_port;
  logic [0:1][DATA_WIDTH-1:0] o_port;
  logic switch_set_reg;

  assign O_PORT = o_port;

  always_ff@(posedge CLK or negedge RST_N) begin
    if(!RST_N)begin
      switch_set_reg <= 0;
      i_port         <= 0;
      o_port         <= 0;
    end else begin
      i_port         <= I_PORT;
      switch_set_reg <= SWITCH_SET;
      if(!switch_set_reg) begin
        o_port <= i_port;
      end else begin
        for(int i = 0; i<DATA_WIDTH; i++) begin
          o_port[0][i] <= i_port[1][i];
          o_port[1][i] <= i_port[0][i];
        end
      end
    end
  end
endmodule