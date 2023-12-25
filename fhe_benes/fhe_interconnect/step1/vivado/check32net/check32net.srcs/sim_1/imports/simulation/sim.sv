`timescale 1ps / 1ps

import USER_PKG::*;
import FHE_ALU_PKG::*;

module benes_32;

  parameter CLK_PERIOD = 10;

	logic clk; //clock
	logic [DATA_WIDTH-1:0]  i_port      [0:SIZE-1]; 
  logic [SWITCH_NUM-1:0]  switch_set  [0:STAGE_NUM-1];
	logic [DATA_WIDTH-1:0]  o_port      [0:SIZE-1]; 

  always begin
  clk = 1'b1;
  #(CLK_PERIOD/2);
  clk = 1'b0;
  #(CLK_PERIOD/2);
  end

initial begin

#(CLK_PERIOD*10);

  foreach(i_port[i])   i_port[i]   = 0;
  foreach(switch_set[i]) switch_set[i] = 0;

#(CLK_PERIOD*10);

switch_set[0] = 16'b0000001111100000;
switch_set[1] = 16'b0001111100000000;
switch_set[2] = 16'b0000000100010000;
switch_set[3] = 16'b0110000100010110;
switch_set[4] = 16'b0010000000000010;
switch_set[5] = 16'b0010000000000010;
switch_set[6] = 16'b0010001000100010;
switch_set[7] = 16'b0000101000001010;
switch_set[8] = 16'b0000001010101010;

#(CLK_PERIOD*10);

for(int i=0; i < SIZE; i++)begin
  i_port[i] = i;
end

#(CLK_PERIOD*30);

$finish;

end

network_module DUT(
    .clk(clk),
    .i_port(i_port),
    .o_port(o_port),
    .switch_set(switch_set)
);

endmodule