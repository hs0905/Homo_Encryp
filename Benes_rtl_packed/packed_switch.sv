`timescale 1ns/1ns

module packed_switch #(
    parameter integer DATA_WIDTH = 512
)(
  input  logic clk,
  input  logic SWITCH_SET,
  input  logic [DATA_WIDTH-1:0][0:1] I_SWITCH_PORT,
  output logic [DATA_WIDTH-1:0][0:1] O_SWITCH_PORT
);
  logic [DATA_WIDTH-1:0][0:1] i_port;
  logic [DATA_WIDTH-1:0][0:1] o_port;

  assign i_port 			 = I_SWITCH_PORT;
  assign O_SWITCH_PORT = o_port;

  always_ff@(posedge clk) begin
    if(!SWITCH_SET)begin
      for(int i = 0; i < DATA_WIDTH; i = i++)begin
        o_port[i][0] <= i_port[i][0];
        o_port[i][1] <= i_port[i][1];
      end
    end else begin
      for(int i = 0; i < DATA_WIDTH; i = i++)begin
        o_port[i][0] <= i_port[i][1];
        o_port[i][1] <= i_port[i][0];
      end
    end
  end
endmodule