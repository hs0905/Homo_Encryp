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

switch_set[0] = 16'hA300;
switch_set[1] = 16'h00A8;
switch_set[2] = 16'hE0E4;
switch_set[3] = 16'h183C;
switch_set[4] = 16'h1014;
switch_set[5] = 16'h1014;
switch_set[6] = 16'h2020;
switch_set[7] = 16'h2810;
switch_set[8] = 16'h2D00;

#(CLK_PERIOD*10);

for(int i=0; i < SIZE; i++)begin
  i_port[i] = i;
end

#(CLK_PERIOD*30);

$finish;

end

endmodule