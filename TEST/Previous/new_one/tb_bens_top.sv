`timescale 1ps/1ps

import USER_PARAM_PKG::*;
import FHE_ALU_PKG::*;

module tb_benes_top;

parameter clk_period = 100;


logic clk;
logic rst_n;
logic [SWITCH_NUM-1:0]switch_selection[0:STAGE_NUM-1];
logic [DATA_WIDTH-1:0] o_port [0:SIZE-1];

always begin

	#(clk_period/2) clk = ~clk; 

end

benes_top dut(
	.clk(clk),
	.rst_n(rst_n),
	.switch_selection(switch_selection),
	.o_port(o_port)
);

initial begin

clk = 0;

#clk_period;

rst_n = 0;

# clk_period;

switch_selection[0] = 4'b0000;
switch_selection[1] = 4'b0000;
switch_selection[2] = 4'b0000;
switch_selection[3] = 4'b0000;
switch_selection[4] = 4'b0000;

# (4*clk_period);

switch_selection[0] = 4'b1111;
switch_selection[1] = 4'b1101;
switch_selection[2] = 4'b1001;
switch_selection[3] = 4'b0101;
switch_selection[4] = 4'b0101;

# (10*clk_period);

switch_selection[0] = 4'b1111;
switch_selection[1] = 4'b1111;
switch_selection[2] = 4'b1111;
switch_selection[3] = 4'b1111;
switch_selection[4] = 4'b1111;

# (10*clk_period);

$finish;

end

endmodule