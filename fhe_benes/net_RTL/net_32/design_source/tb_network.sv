`timescale 1ps/1ps

module tb_network;

parameter CLK_PERIOD = 10; // 100 MHz => 10 ns
parameter SIZE = 32;
parameter LAYER_NUM = $clog2(SIZE); // layer_num : 5
parameter STAGE_NUM = (LAYER_NUM*2)-1;
parameter DATA_WIDTH = 8; // data width of each port
parameter SWITCH_NUM = SIZE/2;
parameter MID_STAGE = STAGE_NUM/2;
parameter BUFFER_NUM = STAGE_NUM - 1;

logic clk;
logic [DATA_WIDTH-1:0]i_port[0:SIZE-1];
logic [DATA_WIDTH-1:0]o_port[0:SIZE-1];
logic [SWITCH_NUM-1:0]switch_set[0:STAGE_NUM-1];

always begin // clock generator
    clk = 0;
    #5;
    clk = 1;
    #5;
end

network_module dut(
    .clk(clk),
    .i_port(i_port),
    .o_port(o_port),
    .switch_set(switch_set) // 5 switches, each switch has 4 bits
);

initial begin

    foreach(i_port[i]) i_port[i] = 8'b00000000; // initialize all ports to 0
    foreach(o_port[i]) o_port[i] = 8'b00000000; // initialize all ports to 0
    foreach(switch_set[i]) switch_set[i] =16'd0; // initialize all switches to 0

    #CLK_PERIOD; // wait for 1 clock cycle

    // set switch 0 to 0b0001
    switch_set[0] = 16'b0000000011111111; 
    switch_set[1] = 16'b0000111111110000; 
    switch_set[2] = 16'b0011110011000011;
    switch_set[3] = 16'b0110100110010110;
    switch_set[4] = 16'b0110100110010110;
    switch_set[5] = 16'b0101010101010101;
    switch_set[6] = 16'b0101010101010101;
    switch_set[7] = 16'b0101010101010101;
    switch_set[8] = 16'b0101010101010101;

    #CLK_PERIOD; // wait for 1 clock cycle

    // set i_port 0 to 0b0001

    for(int i= 0; i<32; i=i+1) begin 
        i_port[i] = i; 
    end

    #100; // wait for 1 clock cycle

    $finish;

end

endmodule
