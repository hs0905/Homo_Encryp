`timescale 1ns/1ns
import USER_PARAM_PKG::*;
import FHE_ALU_PKG::*;
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

