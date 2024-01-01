`timescale 1 ns / 1 ns

`include "defines.vh"
import FHE_ALU_PKG::*;

module dummy_butt #(
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
  
  FifoBuffer #(.DATA_SIZE(1), .CYCLES(BUTTER_CYCLES) )  out_valid_fifo (.clk(clk), .rstn(1), .in(in_valid), .out(valid_pipe));
  FifoBuffer #(.DATA_SIZE(FSIZE), .CYCLES(BUTTER_CYCLES) )  a_fifo (.clk(clk), .rstn(1), .in(a), .out(a_pipe));
  FifoBuffer #(.DATA_SIZE(FSIZE), .CYCLES(BUTTER_CYCLES) )  b_fifo (.clk(clk), .rstn(1), .in(b), .out(b_pipe));
  
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
    //   if( x != a || y != b|| root_idx != W) 
    //     $display("BUTT_ERR(%d,%d) %d %d NTT_level:%d chunk_idx:%d/%d gap_idx:%d/%d x:%d y:%d root_idx:%d rx:%d ry:%d rW:%d gap_size:%d",LEVEL_OFFSET,BUTT_ID,in_valid,skip_level,NTT_level,chunk_idx,num_chunk,gap_idx,gap_size,x,y,root_idx,a,b,W,gap_size);
    //   else
    //     $display("BUTT_OKA(%d,%d) %d %d NTT_level:%d chunk_idx:%d/%d gap_idx:%d/%d x:%d y:%d root_idx:%d rx:%d ry:%d rW:%d gap_size:%d",LEVEL_OFFSET,BUTT_ID,in_valid,skip_level,NTT_level,chunk_idx,num_chunk,gap_idx,gap_size,x,y,root_idx,a,b,W,gap_size);
    // end
  end

  
  always @ (posedge clk) begin  
    a_reg <= a;
    b_reg <= b;
    valid_reg <= in_valid;
	end
endmodule

module butt #(
        parameter BUTT_ID         = 0,
        parameter LEVEL_OFFSET    = 0,
        parameter SIM_MODE        = 0,
        parameter FSIZE           = FSIZE_60,
        parameter MULT_CYCLES     = MULT_CYCLES
	) (
		input logic	clk,		    		
		input logic rstn,			

    input logic in_valid,    
    input logic skip_level,
    input logic [FSIZE-1:0] a,
    input logic [FSIZE-1:0] b,
    input logic [FSIZE-1:0] p,
    input logic [64-1:0] W,
    input logic [64-1:0] WQ,
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
  logic [64-1:0] mult1_in_A,mult1_in_B;
  logic [64*2-1:0] mult1_out;
  Mult #(.DATA_SIZE(64), .CYCLES(MULT_CYCLES)) mult1 (
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
 
  
  logic [FSIZE-1:0] H;

  
  logic [FSIZE-1:0] p1,p1_in;      FifoBuffer #(.DATA_SIZE(FSIZE), .CYCLES(1) )  p1_fifo (.clk(clk), .rstn(rstn), .in(p1_in), .out(p1));
  logic [FSIZE-1:0] p2,p2_in;      FifoBuffer #(.DATA_SIZE(FSIZE), .CYCLES(1) )  p2_fifo (.clk(clk), .rstn(rstn), .in(p2_in), .out(p2));
  logic [FSIZE-1:0] p5,p5_in;      FifoBuffer #(.DATA_SIZE(FSIZE), .CYCLES(1+MULT_CYCLES) )  p5_fifo (.clk(clk), .rstn(rstn), .in(p5_in), .out(p5));
  
  logic [FSIZE-1:0] x_comp,x_comp_in;  FifoBuffer #(.DATA_SIZE(1), .CYCLES(1) )  x_comp_fifo (.clk(clk), .rstn(rstn), .in(x_comp_in), .out(x_comp));
  logic [FSIZE-1:0] x1,x1_in;  FifoBuffer #(.DATA_SIZE(FSIZE), .CYCLES(1) )  x1_fifo (.clk(clk), .rstn(rstn), .in(x1_in), .out(x1));
  logic [FSIZE-1:0] x5,x5_in;  FifoBuffer #(.DATA_SIZE(FSIZE), .CYCLES(MULT_CYCLES*2) )  x5_fifo (.clk(clk), .rstn(rstn), .in(x5_in), .out(x5));
  
  logic [FSIZE-1:0] m3_4,m3_4_in;  FifoBuffer #(.DATA_SIZE(FSIZE), .CYCLES(MULT_CYCLES) )  m3_4_fifo (.clk(clk), .rstn(rstn), .in(m3_4_in), .out(m3_4));
  logic [FSIZE-1:0] tmp2,tmp2_in;  FifoBuffer #(.DATA_SIZE(FSIZE), .CYCLES(1) )  tmp2_fifo (.clk(clk), .rstn(rstn), .in(tmp2_in), .out(tmp2));
  logic [FSIZE-1:0] tmp3,tmp3_in;  FifoBuffer #(.DATA_SIZE(FSIZE), .CYCLES(1) )  tmp3_fifo (.clk(clk), .rstn(rstn), .in(tmp3_in), .out(tmp3));
  logic [FSIZE-1:0] tmp4,tmp4_in;  FifoBuffer #(.DATA_SIZE(FSIZE), .CYCLES(1) )  tmp4_fifo (.clk(clk), .rstn(rstn), .in(tmp4_in), .out(tmp4));
  
  logic [FSIZE-1:0] v1,v1_in;  FifoBuffer #(.DATA_SIZE(1), .CYCLES(1) )  v1_fifo (.clk(clk), .rstn(rstn), .in(v1_in), .out(v1));
  
  logic [FSIZE-1:0] outv,outv_in;  FifoBuffer #(.DATA_SIZE(1), .CYCLES(2) )  outv_fifo (.clk(clk), .rstn(rstn), .in(outv_in), .out(outv));

  
  logic [FSIZE-1:0] a_skip_reg;
  logic [FSIZE-1:0] b_skip_reg;
  logic valid_skip_reg;
    
  always_comb begin    
    x_comp_in = 0;
    if(a >= p<<1) x_comp_in = 1; // a 60

    p1_in = p; // p 60
    p2_in = p1;
    p5_in = p2;

    x1_in = a;
    x5_in = x1;
    if(x_comp) x5_in = x1 - (p1<<1);

    mult1_in_A = b;
    mult1_in_B = WQ;
    mult1_in_valid = in_valid;
    // if(in_valid == 1)  $display("mult1_in_A %x, mult1_in_B %x",b,WQ) ; 

    mult3_in_A = W;
    mult3_in_B = b;
    mult3_in_valid = in_valid;
    // if(in_valid == 1)  $display("mult3_in_A %x, mult3_in_B %x",W,b) ; 

    mult2_in_A = mult1_out[62+64-1:64];
    mult2_in_B = p2;
    mult2_in_valid = mult1_out_valid;
    // if(mult1_out_valid == 1)  $display("mult1_out %x",mult1_out) ;
    // if(mult1_out_valid == 1)  $display("mult1_out %x",mult1_out) ;
    // if(mult1_out_valid == 1)  $display("mult2_in_A %x, mult2_in_B %x",mult1_out[FSIZE*2-1:64],p2) ;

    m3_4_in = mult3_out[FSIZE-1:0];
    // if(mult3_out_valid == 1)  $display("mult3_out %x",mult3_out) ;

    tmp2_in = m3_4 - mult2_out[FSIZE-1:0];

    tmp3_in = x5 + tmp2;
    tmp4_in = (x5 + (p5<<1)) - tmp2;

    // v1_in = mult2_out_valid;
    //  if(v1)  $display("p5 %x %d x5 %x %d tmp2 %x %d tmp4_in %x %d at %d",p5,p5,x5,x5,tmp2,tmp2,tmp4_in,tmp4_in,$time()/2) ; 


    outv_in = mult2_out_valid;
    // if(mult2_out_valid == 1)  $display("mult2_out %x",mult2_out) ;

    a_out = tmp3;
    // if(tmp3[FSIZE-1] == 1) a_out = {2'b11,tmp3};
    b_out = tmp4;
    // if(tmp4[FSIZE-1] == 1) b_out = {2'b11,tmp4};
    // b_out = tmp4;
    out_valid = outv;

    // if(outv == 1)  $display("a_out %x, b_out %x",tmp3,tmp4) ; 
    // if(skip_level) begin
    //   a_out = a_skip_reg;
    //   b_out = b_skip_reg;
    //   out_valid = valid_skip_reg;
    // end
    if(skip_level) begin
      a_out = {a_skip_reg};
      // if(a_skip_reg[FSIZE-1] == 1) a_out = {2'b11,a_skip_reg};
      b_out = {b_skip_reg};
      // if(b_skip_reg[FSIZE-1] == 1) b_out = {2'b11,b_skip_reg};
      out_valid = valid_skip_reg;
    end

    // if(in_valid && !skip_level && $time()%2==1 ) begin
    //   if( x != a || y != b|| root_idx != W) 
    //     $display("BUTT_ERR(%d,%d) %d %d NTT_level:%d chunk_idx:%d/%d gap_idx:%d/%d x:%d y:%d root_idx:%d rx:%d ry:%d rW:%d gap_size:%d",LEVEL_OFFSET,BUTT_ID,in_valid,skip_level,NTT_level,chunk_idx,num_chunk,gap_idx,gap_size,x,y,root_idx,a,b,W,gap_size);
    //   else
    //     $display("BUTT_OKA(%d,%d) %d %d NTT_level:%d chunk_idx:%d/%d gap_idx:%d/%d x:%d y:%d root_idx:%d rx:%d ry:%d rW:%d gap_size:%d",LEVEL_OFFSET,BUTT_ID,in_valid,skip_level,NTT_level,chunk_idx,num_chunk,gap_idx,gap_size,x,y,root_idx,a,b,W,gap_size);
    // end
  end

  
  always @ (posedge clk) begin  
    a_skip_reg <= a;
    b_skip_reg <= b;
    valid_skip_reg <= in_valid;
	end
endmodule
