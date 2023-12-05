import USER_PARAM_PKG::*;
`timescale 1ns/1ns
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