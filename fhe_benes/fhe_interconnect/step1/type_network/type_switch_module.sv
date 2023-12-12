import USER_PARAM_PKG::*;
import FHE_ALU_PKG::*;

`timescale 1ns/1ns
module type_switch_module(
    input BufferRAMTEFsizeInputs i_port_0,
    input BufferRAMTEFsizeInputs i_port_1,
    input logic clk,
    input logic switch_set,
    output BufferRAMTEFsizeInputs o_port_0,
    output BufferRAMTEFsizeInputs o_port_1
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