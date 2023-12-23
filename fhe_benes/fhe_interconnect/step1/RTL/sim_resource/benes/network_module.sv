`timescale 1ns/1ns

import USER_PKG::*;
import FHE_ALU_PKG::*;

module	network_module(
	input logic clk, //clock
	input logic [DATA_WIDTH-1:0] i_port [0:SIZE-1], //input port bit size : 512
  input logic [SWITCH_NUM-1:0]switch_set[0:STAGE_NUM-1],//switch set for each stage
	output logic [DATA_WIDTH-1:0] o_port [0:SIZE-1] //output port bit size : 512
);


logic [DATA_WIDTH-1:0] stage_in_reg[0:BUFFER_NUM-1][0:SIZE-1]; // 0 ~ 8
logic [DATA_WIDTH-1:0] stage_out_reg[0:BUFFER_NUM-1][0:SIZE-1]; // 0 ~ 8
integer p_in;

always_ff@(posedge clk) begin
	for(integer stage = 0; stage<BUFFER_NUM;stage++) begin
		for(integer p_out=0; p_out<SIZE ; p_out++)begin
            p_in = out_sw(stage,p_out);
            stage_in_reg[stage][p_in] <= stage_out_reg[stage][p_out];
        end
    end
end

stage_module stage_0(
	.clk(clk),
	.i_port(i_port),
	.o_port(stage_out_reg[0][0:SIZE-1]),
	.switch_set(switch_set[0])
);

genvar stage_M;

generate

    for(stage_M = 1; stage_M<BUFFER_NUM; stage_M++) begin // stage_M : stage_module 1 ~ 7
		stage_module stage_inst(
			.clk(clk),
			.i_port(stage_in_reg[stage_M-1][0:SIZE-1]),
			.o_port(stage_out_reg[stage_M][0:SIZE-1]),
			.switch_set(switch_set[stage_M])
		);
	end
endgenerate



stage_module stage_8(
	.clk(clk),
	.i_port(stage_in_reg[BUFFER_NUM-1][0:SIZE-1]),
	.o_port(o_port),
	.switch_set(switch_set[BUFFER_NUM])
);

endmodule

module stage_module
(
    input   logic                   clk,
    input   logic [SWITCH_NUM-1:0]  switch_set, // 16bit -> number of switch
    input   logic [DATA_WIDTH-1:0]  i_port      [0:SIZE-1], // 4bit * 32 vector -> input port
    output  logic [DATA_WIDTH-1:0]  o_port      [0:SIZE-1] // 4bit * 32 vector -> output port
);

generate
    for(genvar i=0; i<SWITCH_NUM; i++) begin:switch_instance
    switch_module s(
        .clk(clk),
        .switch_set(switch_set[i]),
        .i_port_0(i_port[2*i]),
        .i_port_1(i_port[2*i+1]),
        .o_port_0(o_port[2*i]),
        .o_port_1(o_port[2*i+1])
    );
    end
endgenerate

endmodule

module switch_module(
    input logic [DATA_WIDTH-1:0]i_port_0,
    input logic [DATA_WIDTH-1:0]i_port_1,
    input logic clk,
    input logic switch_set,
    output logic [DATA_WIDTH-1:0]o_port_0,
    output logic [DATA_WIDTH-1:0]o_port_1
);

always_comb begin
    if(!switch_set)//bar
    begin
        o_port_0 = i_port_0;
        o_port_1 = i_port_1;        
    end
    else begin
        o_port_0 = i_port_1;
        o_port_1 = i_port_0;
    end
end

endmodule