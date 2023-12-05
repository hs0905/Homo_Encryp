`timescale 1 ns / 1 ns

`include "defines.vh"
import FHE_ALU_PKG::*;

module dummy_ibutt #(
        parameter BUTT_ID         = 0,
        parameter LEVEL_OFFSET    = 0,
        parameter SIM_MODE        = 0
	) (
		input logic	clk,		    		
		input logic rstn,			

    input logic in_valid,    
    input logic skip_level,    
    input logic [FSIZE-1:0] a,
    input logic [FSIZE-1:0] b,
    input logic [FSIZE-1:0] p,
    input logic [FSIZE-1:0] W,
    input logic [FSIZE-1:0] WQ,
    output logic [FSIZE-1:0] a_out,
    output logic [FSIZE-1:0] b_out,
    output logic out_valid

    //for verification
    ,
    input logic [logN-1:0] NTT_level,
    input logic [logN-2:0] chunk_idx,
    input logic [logN-1:0] num_chunk,
    input logic [logN-2:0] gap_idx,
    input logic [logN-1:0] gap_size,
    // input logic [logN-1:0] gap_size_base,
    input logic [logN-1:0] x,
    input logic [logN-1:0] y,
    input logic [logN-1:0] root_idx
	);

  logic [FSIZE-1:0] a_pipe;
  logic [FSIZE-1:0] b_pipe;
  logic valid_pipe;
  
  FifoBuffer #(.DATA_SIZE(1), .CYCLES(IBUTTER_CYCLES) )  out_valid_fifo (.clk(clk), .rstn(1), .in(in_valid), .out(valid_pipe));
  FifoBuffer #(.DATA_SIZE(FSIZE), .CYCLES(IBUTTER_CYCLES) )  a_fifo (.clk(clk), .rstn(1), .in(a), .out(a_pipe));
  FifoBuffer #(.DATA_SIZE(FSIZE), .CYCLES(IBUTTER_CYCLES) )  b_fifo (.clk(clk), .rstn(1), .in(b), .out(b_pipe));
  
  logic [FSIZE-1:0] a_reg;
  logic [FSIZE-1:0] b_reg;
  logic valid_reg;
    
  always_comb begin    
    a_out = a_pipe;
    b_out = b_pipe;
    out_valid = valid_pipe;

    if(skip_level) begin
      a_out = a_reg;
      b_out = b_reg;
      out_valid = valid_reg;
    end

    // if(in_valid && !skip_level && $time()%2==1 ) begin
    //   if( x != a || y != b || root_idx != W) 
    //   // if( x != a || y != b ) 
    //     $display("IBUTT_ERR(%d,%d) %d %d NTT_level:%d chunk_idx:%d/%d gap_idx:%d/%d x:%d y:%d root_idx:%d rx:%d ry:%d rW:%d rWQ:%d gap_size:%d",LEVEL_OFFSET,BUTT_ID,in_valid,skip_level,NTT_level,chunk_idx,num_chunk,gap_idx,gap_size,x,y,root_idx,a,b,W,WQ,gap_size);
    //   else
    //     $display("IBUTT_OKA(%d,%d) %d %d NTT_level:%d chunk_idx:%d/%d gap_idx:%d/%d x:%d y:%d root_idx:%d rx:%d ry:%d rW:%d rWQ:%d gap_size:%d",LEVEL_OFFSET,BUTT_ID,in_valid,skip_level,NTT_level,chunk_idx,num_chunk,gap_idx,gap_size,x,y,root_idx,a,b,W,WQ,gap_size);
    // end
  end

  
  always @ (posedge clk) begin  
    a_reg <= a;
    b_reg <= b;
    valid_reg <= in_valid;
	end
endmodule

module ibutt #(
        parameter BUTT_ID         = 0,
        parameter LEVEL_OFFSET    = 0,
        parameter SIM_MODE        = 0
	) (
		input logic	clk,		    		
		input logic rstn,			

    input logic [1:0] in_valid,    
    input logic skip_level,
    input logic [FSIZE-1:0] a,
    input logic [FSIZE-1:0] b,
    input logic [FSIZE-1:0] p,
    input logic [FSIZE-1:0] W,
    input logic [FSIZE-1:0] WQ,
    output logic [FSIZE-1:0] a_out,
    output logic [FSIZE-1:0] b_out,
    output logic out_valid

    //for verification
    ,
    input logic [logN-1:0] NTT_level,
    input logic [logN-2:0] chunk_idx,
    input logic [logN-1:0] num_chunk,
    input logic [logN-2:0] gap_idx,
    input logic [logN-1:0] gap_size,
    // input logic [logN-1:0] gap_size_base,
    input logic [logN-1:0] x,
    input logic [logN-1:0] y,
    input logic [logN-1:0] root_idx
	);
  

  logic mult1_in_valid,mult1_out_valid;
  logic [FSIZE-1:0] mult1_in_A,mult1_in_B;
  logic [FSIZE*2-1:0] mult1_out;
  Mult #(.DATA_SIZE(FSIZE), .CYCLES(MULT_CYCLES)) mult1 (
    .clk(clk),
    .rstn(rstn),
    .in_valid(mult1_in_valid),
    .out_valid(mult1_out_valid),
    .in_A(mult1_in_A),
    .in_B(mult1_in_B),
    .out(mult1_out)
  );

  logic mult2_in_valid,mult2_out_valid;
  logic [FSIZE-1:0] mult2_in_A,mult2_in_B;
  logic [FSIZE*2-1:0] mult2_out;
  Mult #(.DATA_SIZE(FSIZE), .CYCLES(MULT_CYCLES)) mult2 (
    .clk(clk),
    .rstn(rstn),
    .in_valid(mult2_in_valid),
    .out_valid(mult2_out_valid),
    .in_A(mult2_in_A),
    .in_B(mult2_in_B),
    .out(mult2_out)
  );
 
  logic mult3_in_valid,mult3_out_valid;
  logic [FSIZE-1:0] mult3_in_A,mult3_in_B;
  logic [FSIZE*2-1:0] mult3_out;
  Mult #(.DATA_SIZE(FSIZE), .CYCLES(MULT_CYCLES)) mult3 (
    .clk(clk),
    .rstn(rstn),
    .in_valid(mult3_in_valid),
    .out_valid(mult3_out_valid),
    .in_A(mult3_in_A),
    .in_B(mult3_in_B),
    .out(mult3_out)
  );
 
  
  logic [FSIZE-1:0] p1,p1_in;      FifoBuffer #(.DATA_SIZE(FSIZE), .CYCLES(1) )  p1_fifo (.clk(clk), .rstn(rstn), .in(p1_in), .out(p1));
  logic [FSIZE-1:0] p2,p2_in;      FifoBuffer #(.DATA_SIZE(FSIZE), .CYCLES(1) )  p2_fifo (.clk(clk), .rstn(rstn), .in(p2_in), .out(p2));
  logic [FSIZE-1:0] p4,p4_in;      FifoBuffer #(.DATA_SIZE(FSIZE), .CYCLES(MULT_CYCLES) )  p4_fifo (.clk(clk), .rstn(rstn), .in(p4_in), .out(p4));
  
  logic x_y_comp,x_y_comp_in;      FifoBuffer #(.DATA_SIZE(1), .CYCLES(1) )  x_y_comp_fifo (.clk(clk), .rstn(rstn), .in(x_y_comp_in), .out(x_y_comp));
  logic [FSIZE-1:0] y1,y1_in;      FifoBuffer #(.DATA_SIZE(FSIZE), .CYCLES(1) )  y1_fifo (.clk(clk), .rstn(rstn), .in(y1_in), .out(y1));
  logic [FSIZE-1:0] x_y1,x_y1_in;  FifoBuffer #(.DATA_SIZE(FSIZE), .CYCLES(1) )  x_y1_fifo (.clk(clk), .rstn(rstn), .in(x_y1_in), .out(x_y1));
  logic [FSIZE-1:0] x_y2,x_y2_in;  FifoBuffer #(.DATA_SIZE(FSIZE), .CYCLES(1) )  x_y2_fifo (.clk(clk), .rstn(rstn), .in(x_y2_in), .out(x_y2));
  
  logic [FSIZE-1:0] W2,W2_in;      FifoBuffer #(.DATA_SIZE(FSIZE), .CYCLES(2) )  W2_fifo (.clk(clk), .rstn(rstn), .in(W2_in), .out(W2));
  logic [FSIZE-1:0] Wq2,Wq2_in;    FifoBuffer #(.DATA_SIZE(FSIZE), .CYCLES(2) )  Wq2_fifo (.clk(clk), .rstn(rstn), .in(Wq2_in), .out(Wq2));

  logic [FSIZE-1:0] tmp1,tmp1_in;     FifoBuffer #(.DATA_SIZE(FSIZE), .CYCLES(1+2*MULT_CYCLES) )  tmp1_fifo (.clk(clk), .rstn(rstn), .in(tmp1_in), .out(tmp1));  
  logic [FSIZE-1:0] tmp2_1,tmp2_1_in; FifoBuffer #(.DATA_SIZE(FSIZE), .CYCLES(1) )  tmp2_1_fifo (.clk(clk), .rstn(rstn), .in(tmp2_1_in), .out(tmp2_1));
  logic [FSIZE-1:0] tmp2,tmp2_in;     FifoBuffer #(.DATA_SIZE(FSIZE), .CYCLES(1) )  tmp2_fifo (.clk(clk), .rstn(rstn), .in(tmp2_in), .out(tmp2));
  logic [FSIZE-1:0] r_tmp2,r_tmp2_in; FifoBuffer #(.DATA_SIZE(FSIZE), .CYCLES(MULT_CYCLES) )  r_tmp2_fifo (.clk(clk), .rstn(rstn), .in(r_tmp2_in), .out(r_tmp2));
  logic [FSIZE-1:0] tmp4,tmp4_in;     FifoBuffer #(.DATA_SIZE(FSIZE), .CYCLES(1) )  tmp4_fifo (.clk(clk), .rstn(rstn), .in(tmp4_in), .out(tmp4));
  
  logic [1:0] valid_2,valid_2_in;        FifoBuffer #(.DATA_SIZE(2), .CYCLES(2) )  valid_2_fifo (.clk(clk), .rstn(rstn), .in(valid_2_in), .out(valid_2));
  logic outv,outv_in;              FifoBuffer #(.DATA_SIZE(1), .CYCLES(1) )  outv_fifo (.clk(clk), .rstn(rstn), .in(outv_in), .out(outv));
  
  logic [FSIZE-1:0] x2,x2_in;      FifoBuffer #(.DATA_SIZE(FSIZE), .CYCLES(2) )  x2_fifo (.clk(clk), .rstn(rstn), .in(x2_in), .out(x2));
  
  logic [FSIZE-1:0] a_skip_reg;
  logic [FSIZE-1:0] b_skip_reg;
  logic valid_skip_reg;
    
  always_comb begin
    x2_in = a;

    x_y1_in = a+b;
    x_y2_in = x_y1;   
    x_y_comp_in = 0;
    if(x_y1 >= (p1<<1) ) x_y_comp_in = 1;

    p1_in = p;
    p2_in = p1;
    p4_in = p2;

    y1_in = b;

    W2_in = W;
    Wq2_in = WQ;
      
    tmp1_in = x_y2;
    if(x_y_comp) tmp1_in = x_y2 - (p2<<1);

    tmp2_1_in = a + (p<<1);
    tmp2_in = tmp2_1 - y1;
   
    valid_2_in = in_valid;

    mult1_in_A = valid_2 == 2 ? x2 : tmp2;
    mult1_in_B = Wq2;
    mult1_in_valid = valid_2 != 0 ? 1:0;

    mult2_in_A = valid_2 == 2 ? x2 : tmp2;
    mult2_in_B = W2;
    mult2_in_valid = valid_2 != 0 ? 1:0;

    mult3_in_A = mult1_out[FSIZE*2-1:FSIZE];  //tmp3
    mult3_in_B = p4;
    mult3_in_valid = mult1_out_valid;

    r_tmp2_in = mult2_out;  //r_tmp2

    tmp4_in = r_tmp2 - mult3_out; //tmp4_1
    
    outv_in = mult3_out_valid;

    a_out = tmp1;
    b_out = tmp4;

    out_valid = outv;
 
    if(skip_level) begin
      a_out = a_skip_reg;
      b_out = b_skip_reg;
      out_valid = valid_skip_reg;
    end

    // if(in_valid && !skip_level && $time()%2==1 ) begin
    //   $display("IBUTT(%d,%d) %d %d NTT_level:%d chunk_idx:%d/%d gap_idx:%d/%d x:%d y:%d root_idx:%d rx:%d ry:%d rW:%d rWQ:%d gap_size:%d",LEVEL_OFFSET,BUTT_ID,in_valid,skip_level,NTT_level,chunk_idx,num_chunk,gap_idx,gap_size,x,y,root_idx,a,b,W,WQ,gap_size);
    // end
  end       
    
  always @ (posedge clk) begin  
    a_skip_reg <= a;
    b_skip_reg <= b;
    valid_skip_reg <= in_valid;
	end
endmodule
