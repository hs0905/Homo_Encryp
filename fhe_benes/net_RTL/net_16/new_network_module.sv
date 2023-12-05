module network_module#(
    parameter SIZE = 16,
    parameter STAGE_NUM = 2*($clog2(SIZE)) - 1
)(
    input   logic         clk,
    input   logic [3:0]   i_port[0:SIZE-1],
    input   logic [7:0]   switch_set[0:STAGE_NUM-1],
    output  logic [3:0]   o_port[0:SIZE-1]
);

generate
    for(genvar gi = 1; gi<=STAGE_NUM; gi++) begin gen_stage_regs
        logic [3:0] stage_in_reg[gi][0:15];
        logic [3:0] stage_out_reg[gi-1][0:15];
    end
endgenerate

always_ff@(posedge clk) begin : stage_path
        stage_in_reg[1] <= { // stage 0 -> stage 1
            stage_out_reg[0][0],stage_out_reg[0][2],stage_out_reg[0][4],stage_out_reg[0][6],
            stage_out_reg[0][8],stage_out_reg[0][10],stage_out_reg[0][12],stage_out_reg[0][14],
            stage_out_reg[0][1],stage_out_reg[0][3],stage_out_reg[0][5],stage_out_reg[0][7],
            stage_out_reg[0][9],stage_out_reg[0][11],stage_out_reg[0][13],stage_out_reg[0][15]
        };

        stage_in_reg[2] <= { // stage 1 -> stage 2
            stage_out_reg[1][0],stage_out_reg[1][2],stage_out_reg[1][4],stage_out_reg[1][6],
            stage_out_reg[1][1],stage_out_reg[1][3],stage_out_reg[1][5],stage_out_reg[1][7],
            stage_out_reg[1][8],stage_out_reg[1][10],stage_out_reg[1][12],stage_out_reg[1][14],
            stage_out_reg[1][9],stage_out_reg[1][11],stage_out_reg[1][13],stage_out_reg[1][15]
        };

        stage_in_reg[3] <= { // stage 2 -> stage 3
            stage_out_reg[2][0],stage_out_reg[2][2],stage_out_reg[2][1],stage_out_reg[2][3],
            stage_out_reg[2][4],stage_out_reg[2][6],stage_out_reg[2][5], stage_out_reg[2][7],
            stage_out_reg[2][8],stage_out_reg[2][10],stage_out_reg[2][9],stage_out_reg[2][11],
            stage_out_reg[2][12],stage_out_reg[2][14],stage_out_reg[2][13],stage_out_reg[2][15]
        };

        stage_in_reg[4] <= { // stage 3 -> stage 4
            stage_out_reg[3][0],stage_out_reg[3][2],stage_out_reg[3][1],stage_out_reg[3][3],
            stage_out_reg[3][4],stage_out_reg[3][6],stage_out_reg[3][5],stage_out_reg[3][7],
            stage_out_reg[3][8],stage_out_reg[3][10],stage_out_reg[3][9],stage_out_reg[3][11],
            stage_out_reg[3][12],stage_out_reg[3][14],stage_out_reg[3][13],stage_out_reg[3][15]
        };

        stage_in_reg[5] <= { // stage 4 -> stage 5
            stage_out_reg[4][0],stage_out_reg[4][4],stage_out_reg[4][1],stage_out_reg[4][5],
            stage_out_reg[4][2],stage_out_reg[4][6],stage_out_reg[4][3],stage_out_reg[4][7],
            stage_out_reg[4][8],stage_out_reg[4][12],stage_out_reg[4][9],stage_out_reg[4][13],
            stage_out_reg[4][10],stage_out_reg[4][14],stage_out_reg[4][11],stage_out_reg[4][15]
        };

        stage_in_reg[6] <= { // stage 5 -> stage 6
            stage_out_reg[5][0],stage_out_reg[5][8],stage_out_reg[5][1],stage_out_reg[5][9],
            stage_out_reg[5][2],stage_out_reg[5][10],stage_out_reg[5][3],stage_out_reg[5][11],
            stage_out_reg[5][4],stage_out_reg[5][12],stage_out_reg[5][5],stage_out_reg[5][13],
            stage_out_reg[5][6],stage_out_reg[5][14],stage_out_reg[5][7],stage_out_reg[5][15]
        };
    end
stage_module stage0(
        .clk(clk),
        .switch_set(switch_set[0]),
        .i_port(i_port), // input port
        .o_port(stage_out_reg[0]) // stage 0 -> stage 1
    );

    stage_module stage1(
        .clk(clk),
        .switch_set(switch_set[1]),
        .i_port(stage_in_reg[1]), // stage 0 -> stage 1
        .o_port(stage_out_reg[1]) // stage 1 -> stage 2
    );

    stage_module stage2(
        .clk(clk),
        .switch_set(switch_set[2]),
        .i_port(stage_in_reg[2]), // stage 1 -> stage 2
        .o_port(stage_out_reg[2]) // stage 2 -> stage 3
    );

    stage_module stage3(
        .clk(clk),
        .switch_set(switch_set[3]),
        .i_port(stage_in_reg[3]), // stage 2 -> stage 3
        .o_port(stage_out_reg[3]) // stage 3 -> stage 4
    );
    
    stage_module stage4(
        .clk(clk),
        .switch_set(switch_set[4]),
        .i_port(stage_in_reg[4]), // stage 3 -> stage 4
        .o_port(stage_out_reg[4]) // stage 4 -> stage 5
    );            

    stage_module stage5(
        .clk(clk),
        .switch_set(switch_set[5]),
        .i_port(stage_in_reg[5]), // stage 4 -> stage 5
        .o_port(stage_out_reg[5]) // stage 5 -> stage 6
    );    

    stage_module stage6(
        .clk(clk),
        .switch_set(switch_set[6]),
        .i_port(stage_in_reg[6]), // stage 5 -> stage 6
        .o_port(o_port) // output port
    );
endmodule