`timescale 1ns/1ns

module packed_stage #(
  parameter integer DATA_WIDTH  = 512,
  parameter integer PORT_NUM    = 32,
  parameter integer SWITCH_NUM  = PORT_NUM/2
)(
  input  logic                                CLK,
  input  logic                                RST_N,
  input  logic [0:SWITCH_NUM-1]               SWITCH_SET,
  input  logic [0:PORT_NUM-1][DATA_WIDTH-1:0] I_PORT, // [511:0][0:31] I_PORT
  output logic [0:PORT_NUM-1][DATA_WIDTH-1:0] O_PORT // [511:0][0:31] O_PORT
);

  logic [0:SWITCH_NUM-1]               switch_set_reg;
  logic [0:PORT_NUM-1][DATA_WIDTH-1:0] i_port;
  logic [0:PORT_NUM-1][DATA_WIDTH-1:0] o_port;

  logic [0:SWITCH_NUM-1][0:1][DATA_WIDTH-1:0]switch_in_reg;
  logic [0:SWITCH_NUM-1][0:1][DATA_WIDTH-1:0]switch_out_reg;

  wire  [0:SWITCH_NUM-1][0:1][DATA_WIDTH-1:0]i_stage_to_switch;
  wire  [0:SWITCH_NUM-1][0:1][DATA_WIDTH-1:0]o_switch_to_stage;

  assign O_PORT = o_port;
  assign i_port = I_PORT;
  assign switch_set_reg = SWITCH_SET;


always_ff@(posedge CLK or negedge RST_N) begin
  if(!RST_N)begin
    switch_in_reg <= 0;
  end else begin
    
      for(int switch_idx = 0; switch_idx< SWITCH_NUM; switch_idx++) begin
        for(int port_idx = 0; port_idx<2; port_idx++) begin
          for(int bit_idx = 0; bit_idx< DATA_WIDTH; bit_idx++) begin
          switch_in_reg[switch_idx][port_idx][bit_idx] <= i_port[2*switch_idx + port_idx][bit_idx];
        end
      end
    end
  end
end

assign i_stage_to_switch = switch_in_reg;
assign switch_out_reg    = o_switch_to_stage;

always_ff@(posedge CLK or negedge RST_N) begin
  if(!RST_N)begin
    o_port <= 0;
  end else begin
      for(int switch_idx = 0; switch_idx< SWITCH_NUM; switch_idx++) begin
        for(int port_idx = 0; port_idx<2; port_idx++) begin
          for(int bit_idx = 0; bit_idx< DATA_WIDTH; bit_idx++) begin
          o_port[2*switch_idx + port_idx][bit_idx] <= switch_out_reg[switch_idx][port_idx][bit_idx];
        end
      end
    end
  end
end

  generate
    for(genvar i = 0; i< SWITCH_NUM; i++) begin: switch
      packed_switch #(.DATA_WIDTH(DATA_WIDTH)) 
        switch_inst (
          .CLK(CLK),
          .RST_N(RST_N),
          .SWITCH_SET(switch_set_reg[i]),
          .I_PORT(i_stage_to_switch[i]),
          .O_PORT(o_switch_to_stage[i])
        );
    end
  endgenerate
endmodule