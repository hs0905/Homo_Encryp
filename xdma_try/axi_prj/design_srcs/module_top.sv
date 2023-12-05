
module benes_top#(
localparam num_stage = 5,
localparam switch_num = 4,
localparam data_width = 8,
localparam port_num = 8
)
(
  input logic                       clk,
  input logic                       rst_n,
  input logic   [switch_num -1:0]   switch_selection  [0:num_stage - 1],//switch set for each stage
  output logic  [data_width - 1:0]  o_port            [0:port_num -1]
);

logic [data_width-1:0] net_in0;
logic [data_width-1:0] net_in1;
logic [data_width-1:0] net_in2;
logic [data_width-1:0] net_in3;
logic [data_width-1:0] net_in4;
logic [data_width-1:0] net_in5;
logic [data_width-1:0] net_in6;
logic [data_width-1:0] net_in7;

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