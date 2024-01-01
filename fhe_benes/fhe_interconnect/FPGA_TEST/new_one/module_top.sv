import USER_PARAM_PKG::*;
import FHE_ALU_PKG::*;

module benes_top(
  input logic clk,
  input logic rst_n,
  input logic [SWITCH_NUM-1:0]switch_selection[0:STAGE_NUM-1],//switch set for each stage
  output logic [DATA_WIDTH-1:0] o_port [0:SIZE-1]
);
/*
generate
  for(genvar i = 0; i< SIZE; i++)begin
  end
endgenerate
*/
logic [7:0] net_in0;
logic [7:0] net_in1;
logic [7:0] net_in2;
logic [7:0] net_in3;
logic [7:0] net_in4;
logic [7:0] net_in5;
logic [7:0] net_in6;
logic [7:0] net_in7;

network_module network(
  .clk(clk),
  .i_port({net_in0,net_in1,net_in2,net_in3,net_in4,net_in5,net_in6,net_in7}),
  .switch_set(switch_selection),
  .o_port(o_port)
);

test_counter_plus counter0(
  .clk(clk),
  .rst_n(rst_n),
  .out_wire(net_in0)
);

test_counter_2plus counter1(
  .clk(clk),
  .rst_n(rst_n),
  .out_wire(net_in1)
);

test_counter_3plus counter2(
  .clk(clk),
  .rst_n(rst_n),
  .out_wire(net_in2)
);

test_counter_4plus counter3(
  .clk(clk),
  .rst_n(rst_n),
  .out_wire(net_in3)
);

test_counter_minus counter4(
  .clk(clk),
  .rst_n(rst_n),
  .out_wire(net_in4)
);

test_counter_2minus counter5(
  .clk(clk),
  .rst_n(rst_n),
  .out_wire(net_in5)
);

test_counter_3minus counter6(
  .clk(clk),
  .rst_n(rst_n),
  .out_wire(net_in6)
);

test_counter_4minus counter7(
  .clk(clk),
  .rst_n(rst_n),
  .out_wire(net_in7)
);

endmodule