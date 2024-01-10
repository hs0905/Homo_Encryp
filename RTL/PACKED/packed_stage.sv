`timescale 1ns/1ns

module packed_stage #(
  parameter integer DATA_WIDTH  = 512,
  parameter integer PORT_SIZE   = 32,
  parameter integer SWITCH_SIZE = PORT_SIZE/2
)(
  input  logic                                 clk,
  input  logic [SWITCH_SIZE-1:0]               SWITCH_SET,
  input  logic [DATA_WIDTH-1:0][0:PORT_SIZE-1] I_PORT, // [511:0][0:31] I_PORT
  output logic [DATA_WIDTH-1:0][0:PORT_SIZE-1] O_PORT // [511:0][0:31] O_PORT
);

generate
  for(genvar switch_num = 0; switch_num < SWITCH_SIZE; switch_num++) begin : gen_switch
    packed_switch #(.DATA_WIDTH(DATA_WIDTH)) inst_switch (
      .clk(clk),
      .SWITCH_SET(SWITCH_SET[switch_num]),
      .I_SWITCH_PORT({I_PORT[switch_num*2], I_PORT[switch_num*2 + 1]}),
      .O_SWITCH_PORT({O_PORT[switch_num*2], O_PORT[switch_num*2 + 1]})
    );
  end
endgenerate


endmodule