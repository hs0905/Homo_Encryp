package USER_PARAM_PKG;

import FHE_ALU_PKG::*;


localparam  SIZE = 8; // number of ports
localparam  SWITCH_NUM = SIZE/2;
localparam  DATA_WIDTH = 8; // data bit width
localparam  LAYER_NUM = $clog2(SIZE); 
localparam  STAGE_NUM = (LAYER_NUM*2)-1; // number of stages in 
localparam  BUFFER_NUM = STAGE_NUM - 1;
localparam  MID_STAGE = STAGE_NUM/2;

function int abs(int x);
    return (x < 0) ? -x : x;
endfunction
    
function int pow(int base, int exponent);
    automatic int result = 1;
    for (int i = 0; i < exponent; i = i + 1) begin
        result = result * base;
    end
    return result;
endfunction

function int out_sw(int stage, int p_out);
    automatic int port_pos = p_out % 2; // 0 : upper port, 1 : lower port
    automatic int layer = MID_STAGE - abs(stage -MID_STAGE);
    automatic int num_subnet = pow(2,layer);
    automatic int row_size = SIZE / num_subnet;
    automatic int subnet = p_out / row_size;
    automatic int subnet_pos = subnet %2;
    int p_in;
    if(stage < MID_STAGE) begin
        if(!port_pos)begin
            p_in = (p_out % row_size)/2 + (row_size/2)*(2*subnet);
        end else begin
            p_in = (p_out % row_size)/2 + (row_size/2)*(2*subnet+1);
        end
    end else if(stage >= MID_STAGE) begin
        if(!subnet_pos) begin
            p_in = (p_out % row_size)*2 + (subnet * row_size);
        end else begin
            p_in = (p_out % row_size)*2 + (subnet -1) * row_size +1 ;
        end
    end
    return p_in;
endfunction

endpackage