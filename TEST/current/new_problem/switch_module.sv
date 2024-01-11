//import USER_PKG::*;
import FHE_ALU_PKG::*;
`timescale 1ns/1ns

module switch_module(
    input logic clk,
    input logic rst_n,
    input logic [DATA_WIDTH-1:0]    i_port_0,
    input logic [DATA_WIDTH-1:0]    i_port_1,
    input logic                     switch_set,
    output logic [DATA_WIDTH-1:0]   o_port_0,
    output logic [DATA_WIDTH-1:0]   o_port_1
);

logic [DATA_WIDTH-1:0] i_port_0_reg;
logic [DATA_WIDTH-1:0] i_port_1_reg;
logic [DATA_WIDTH-1:0] o_port_0_reg;
logic [DATA_WIDTH-1:0] o_port_1_reg;

always_ff@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        i_port_0_reg <= 0;
        i_port_1_reg <= 0;
        o_port_0_reg <= 0;
        o_port_1_reg <= 0;
    end else begin
        i_port_0_reg <= i_port_0;
        i_port_1_reg <= i_port_1;
        o_port_0 <= o_port_0_reg;
        o_port_1 <= o_port_1_reg;
        if(!switch_set) begin
            o_port_0_reg <= i_port_0_reg;
            o_port_1_reg <= i_port_1_reg;
        end else begin
            o_port_0_reg <= i_port_1_reg;
            o_port_1_reg <= i_port_0_reg;
        end
    end
end
endmodule

