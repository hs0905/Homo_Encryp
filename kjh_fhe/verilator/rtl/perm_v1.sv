`timescale 1 ns / 1 ns

`include "defines.vh"
import FHE_ALU_PKG::*;

module PermPattern1 (	
    input logic   [11:0]       in,
    output logic  [11:0]       out
  );
  always_comb begin

  // 14 13 12 11 10  9  8  7  2  1  0  3 | 6  5  4

  //  0 14 13 12 11 10  9  8  7  3  2  1  | 6  5  4
    out[0] = in[2];
    out[1] = in[3];
    out[2] = in[0];
    out[3] = in[4];
    out[4] = in[5];
    out[5] = in[6];
    out[6] = in[7];
    out[7] = in[8];
    out[8] = in[9];
    out[9] = in[10];
    out[10] = in[11];
    out[11] = in[1];
  end
endmodule

module PermPattern2(	
    input logic   [11:0]       in,
    output logic  [11:0]       out
  );
  always_comb begin     
  // 0 14 13  9  8  7  6  5  4 12 11 10  | 3  2  1

  // 0 14 13 12 11 10  9  8  7  6  5  4  | 3  2  1 
    out[0] = in[3];
    out[1] = in[4];
    out[2] = in[5];
    out[3] = in[6];
    out[4] = in[7];
    out[5] = in[8];
    out[6] = in[0];
    out[7] = in[1];
    out[8] = in[2];
    out[9] = in[9];
    out[10] = in[10];
    out[11] = in[11];
  end
endmodule


module PermPattern3(	
    input logic   [11:0]       in,
    output logic  [11:0]       out
  );
  always_comb begin    
  // 0  3  2  1 11 10  9  8  7  6  5  4  |14 13 12 

  // 0 11 10  9  8  7  6  5  4  3  2  1  |14 13 12  
    out[0] = in[8];
    out[1] = in[9];
    out[2] = in[10];
    out[3] = in[0];
    out[4] = in[1];
    out[5] = in[2];
    out[6] = in[3];
    out[7] = in[4];
    out[8] = in[5];
    out[9] = in[6];
    out[10] = in[7];
    out[11] = in[11];
  end
endmodule

module PermPattern4(	
    input logic   [11:0]       in,
    output logic  [11:0]       out
  );
  always_comb begin     
  // 0 11 10  9  8  7  6  5  4  3  2  1  |14 13 12 

  // 11 10 9  8  7  6  5  4  3  2  1  0  |14 13 12 
    out[0] = in[11];
    out[1] = in[0];
    out[2] = in[1];
    out[3] = in[2];
    out[4] = in[3];
    out[5] = in[4];
    out[6] = in[5];
    out[7] = in[6];
    out[8] = in[7];
    out[9] = in[8];
    out[10] = in[9];
    out[11] = in[10];
  end
endmodule

module PermPattern5(	
    input logic   [11:0]       in,
    output logic  [11:0]       out
  );
  always_comb begin     
  // 11 10 9  8  7  6  5  4  3 14 13 12  | 2  1  0

  // 14 13 12 11 10 9  8  7  6  5  4  3  | 2  1  0
    out[0] = in[3];
    out[1] = in[4];
    out[2] = in[5];
    out[3] = in[6];
    out[4] = in[7];
    out[5] = in[8];
    out[6] = in[9];
    out[7] = in[10];
    out[8] = in[11];
    out[9] = in[0];
    out[10] = in[1];
    out[11] = in[2];
  end
endmodule

module PermPattern6(	
    input logic   [11:0]       in,
    output logic  [11:0]       out
  );
  always_comb begin     
  //  0  4  5  6  7  8  9 10 11   1  2  3 | 12 13 14

  //  0  1  2  3  4  5  6  7  8  9 10 11 | 12 13 14
    out[0] = in[3];
    out[1] = in[4];
    out[2] = in[5];
    out[3] = in[6];
    out[4] = in[7];
    out[5] = in[8];
    out[6] = in[9];
    out[7] = in[10];
    out[8] = in[0];
    out[9] = in[1];
    out[10] = in[2];
    out[11] = in[11];
  end
endmodule 

//15 -> 13
module PermPattern7 (	
    input logic   [11:0]       in,
    output logic  [11:0]       out
  );
  always_comb begin

  // 14 13 12 11 10  9  8  2  1  0  4  3 | 7  6  5

  //  1  0 14 13 12 11 10  9  8  4  3  2 | 7  6  5
    out[0] = in[4];
    out[1] = in[0];
    out[2] = in[1];
    out[3] = in[5];
    out[4] = in[6];
    out[5] = in[7];
    out[6] = in[8];
    out[7] = in[9];
    out[8] = in[10];
    out[9] = in[11];
    out[10] = in[2];
    out[11] = in[3];
  end
endmodule

module PermPattern8(	
    input logic   [11:0]       in,
    output logic  [11:0]       out
  );
  always_comb begin     
  //  1  0 14 10  9  8  7  6  5 13 12 11 |  4  3  2

  //  1  0 14 13 12 11 10  9  8  7  6  5 |  4  3  2
    out[0] = in[3];
    out[1] = in[4];
    out[2] = in[5];
    out[3] = in[6];
    out[4] = in[7];
    out[5] = in[8];
    out[6] = in[0];
    out[7] = in[1];
    out[8] = in[2];
    out[9] = in[9];
    out[10] = in[10];
    out[11] = in[11];
  end
endmodule


module PermPattern9(	
    input logic   [11:0]       in,
    output logic  [11:0]       out
  );
  always_comb begin    
  //  1  0  4  3  2 11 10  9  8  7  6  5 | 14 13 12

  //  1  0 11 10  9  8  7  6  5  4  3  2 | 14 13 12
    out[0] = in[7];
    out[1] = in[8];
    out[2] = in[9];
    out[3] = in[0];
    out[4] = in[1];
    out[5] = in[2];
    out[6] = in[3];
    out[7] = in[4];
    out[8] = in[5];
    out[9] = in[6];
    out[10] = in[10];
    out[11] = in[11];
  end
endmodule

module PermPattern10(	
    input logic   [11:0]       in,
    output logic  [11:0]       out
  );
  always_comb begin     
  //  1  0 11 10  9  8  7  6  5  4  3  2 | 14 13 12

  // 11 10  9  8  7  6  5  4  3  2  1  0 | 14 13 12
    out[0] = in[10];
    out[1] = in[11];
    out[2] = in[0];
    out[3] = in[1];
    out[4] = in[2];
    out[5] = in[3];
    out[6] = in[4];
    out[7] = in[5];
    out[8] = in[6];
    out[9] = in[7];
    out[10] = in[8];
    out[11] = in[9];
  end
endmodule

module PermPattern11(	
    input logic   [11:0]       in,
    output logic  [11:0]       out
  );
  always_comb begin     
  // 11 10  9  8  7  6  5  4  3 14 13 12 |  2  1  0

  // 14 13 12 11 10  9  8  7  6  5  4  3 |  2  1  0
    out[0] = in[3];
    out[1] = in[4];
    out[2] = in[5];
    out[3] = in[6];
    out[4] = in[7];
    out[5] = in[8];
    out[6] = in[9];
    out[7] = in[10];
    out[8] = in[11];
    out[9] = in[0];
    out[10] = in[1];
    out[11] = in[2];
  end
endmodule

module PermPattern12(	
    input logic   [11:0]       in,
    output logic  [11:0]       out
  );
  always_comb begin     
  //  0  1  5  6  7  8  9 10 11  2  3  4 | 12 13 14  

  //  0  1  2  3  4  5  6  7  8  9 10 11 | 12 13 14 
    out[0] = in[3];
    out[1] = in[4];
    out[2] = in[5];
    out[3] = in[6];
    out[4] = in[7];
    out[5] = in[8];
    out[6] = in[9];
    out[7] = in[0];
    out[8] = in[1];
    out[9] = in[2];
    out[10] = in[10];
    out[11] = in[11];
  end
endmodule

module PermControl_v1 #(
		parameter WIDTH     = logN-logE	
	) (	
		input logic	clk,		    		
		input logic rstn,			

    input logic start_perm,
    // input logic start_perm_generate,
    input logic [15:0] perm_pattern,
    // input logic [logE-1:0] diff_logN,
		output logic perm_working,

    output BufferRAMTEFsizeInputs ram_inputs1,
    output BufferRAMTEFsizeInputs ram_inputs2,
    input logic [E*FSIZE-1:0] ram_outputs_rdata1
    // input logic [E*FSIZE-1:0] ram_outputs_rdata2
  );
  
  localparam N_ITEMS = 1 << WIDTH;

  typedef struct packed {
    // logic state_STATE_PERM_GENERATE;
    logic state_STATE_PERM_WAIT;
    logic state_STATE_PERM;


    // logic [WIDTH-1:0] load_counter_s0;
    // logic [WIDTH-1:0] load_counter_s1;
    // logic [WIDTH-1:0] load_counter_s2;
    // logic [WIDTH-1:0] load_counter_s3;
    // logic [WIDTH-1:0] read_idx_s1;
    // logic [WIDTH-1:0] read_idx_s2;
    // logic [WIDTH-1:0] permed_load_idx_s1;
    // logic [WIDTH-1:0] permed_load_idx_s2;
    // logic [WIDTH-1:0] restart_read_idx_s3;
    
    // logic valid_s1;
    // logic valid_s2;
    // logic restart_s3;

    // logic [logE-1:0] diff_logN;

    logic [15:0] perm_pattern;

    // logic reset_issued;

    // logic [WIDTH-1:0] perm_idx_store_counter;
    logic [WIDTH-1:0] perm_idx_read_load_counter;
    logic [WIDTH-1:0] perm_idx_write_load_counter;
  } Registers;

  Registers reg_current,reg_next;

  localparam STATE_PERM_GENERATE = 9;
  localparam STATE_PERM = 7;
  localparam STATE_PERM_WAIT = 8;

  // logic [$clog2(N_ITEMS)-1:0] issued_raddr0;
  // logic [$clog2(N_ITEMS)-1:0] issued_raddr1;
  // logic [$clog2(N_ITEMS)-1:0] issued_waddr;
  // logic issued_wdata;
  // logic issued_wren;
  // logic [0:0] issued_rdata0;
  // logic [0:0] issued_rdata1;
  // logic issued_cancel;

  // BufferRAMWriteBufferCancellable #(
  //   .DEPTH(N_ITEMS),
  //   .READ_LATENCY(1),
  //   .CANCEL_DURATION(2),
  //   .WIDTH(1)
  // ) issued_buffer (
  //   .clk(clk),
  //   .rstn(rstn),
  //   .cancel(issued_cancel),
  //   .raddr0(issued_raddr0),
  //   .raddr1(issued_raddr1),
  //   .waddr(issued_waddr),
  //   .wdata(issued_wdata),
  //   .wren (issued_wren),
  //   .rdata0(issued_rdata0),
  //   .rdata1(issued_rdata1)
  // );
  

  // logic [WIDTH-1:0] perm_idx_read_raddr;
  // logic [WIDTH-1:0] perm_idx_read_waddr;
  // logic [WIDTH-1:0] perm_idx_read_wdata;
  // logic perm_idx_read_wren;
  // logic [WIDTH-1:0] perm_idx_read_rdata;

  // BufferRAM #(
  //   .DEPTH(N_ITEMS),
  //   .READ_LATENCY(BUFFER_READ_LATENCY),
  //   .WIDTH(WIDTH)
  // ) perm_idx_read (
  //   .clk(clk),
  //   .raddr(perm_idx_read_raddr),
  //   .waddr(perm_idx_read_waddr),
  //   .wdata(perm_idx_read_wdata),
  //   .wren (perm_idx_read_wren),
  //   .rdata(perm_idx_read_rdata)
  // );

  // logic [WIDTH-1:0] perm_idx_write_raddr;
  // logic [WIDTH-1:0] perm_idx_write_waddr;
  // logic [WIDTH-1:0] perm_idx_write_wdata;
  // logic perm_idx_write_wren;
  // logic [WIDTH-1:0] perm_idx_write_rdata;

  // BufferRAM #(
  //   .DEPTH(N_ITEMS),
  //   .READ_LATENCY(BUFFER_READ_LATENCY),
  //   .WIDTH(WIDTH)
  // ) perm_idx_write (
  //   .clk(clk),
  //   .raddr(perm_idx_write_raddr),
  //   .waddr(perm_idx_write_waddr),
  //   .wdata(perm_idx_write_wdata),
  //   .wren (perm_idx_write_wren),
  //   .rdata(perm_idx_write_rdata)
  // );



  logic ram_valid_in, ram_valid;
  FifoBuffer #(.DATA_SIZE(1), .CYCLES(BUFFER_READ_LATENCY) )  ram_valid_fifo (.clk(clk), .rstn(1), .in(ram_valid_in), .out(ram_valid));

  logic perm_idx_valid_in, perm_idx_valid;
  FifoBuffer #(.DATA_SIZE(1), .CYCLES(1) )  perm_idx_valid_fifo (.clk(clk), .rstn(1), .in(perm_idx_valid_in), .out(perm_idx_valid));

  logic ram_last_in, ram_last;
  FifoBuffer #(.DATA_SIZE(1), .CYCLES(BUFFER_READ_LATENCY) )  ram_last_fifo (.clk(clk), .rstn(1), .in(ram_last_in), .out(ram_last));
  
  // logic perm_idx_valid_in_s2;
  // logic perm_idx_valid_in_s2, perm_idx_valid_se;
  // FifoBuffer #(.DATA_SIZE(1), .CYCLES(BUFFER_READ_LATENCY) )  perm_idx_valid_fifo (.clk(clk), .rstn(rstn), .in(perm_idx_valid_in_s2), .out(perm_idx_valid_se));

  // logic perm_idx_last_in_s2;
  // logic perm_idx_last_in_s2, perm_idx_last_se;
  // FifoBuffer #(.DATA_SIZE(1), .CYCLES(BUFFER_READ_LATENCY) )  perm_idx_last_fifo (.clk(clk), .rstn(rstn), .in(perm_idx_last_in_s2), .out(perm_idx_last_se));

  logic [WIDTH-1:0] perm_addr_in;
  // logic [WIDTH-1:0] perm_addr_in_delayed;
  // FifoBuffer #(.DATA_SIZE(WIDTH), .CYCLES(1) )  perm_idx_read_rdata_fifo (.clk(clk), .rstn(1), .in(perm_addr_in), .out(perm_addr_in_delayed));

  logic [WIDTH-1:0] perm_addr_out;
  logic [WIDTH-1:0] perm_addr_out_delayed;
  FifoBuffer #(.DATA_SIZE(WIDTH), .CYCLES(BUFFER_READ_LATENCY+1) )  perm_idx_write_rdata_fifo (.clk(clk), .rstn(1), .in(perm_addr_out), .out(perm_addr_out_delayed));


  logic [E*FSIZE-1:0] ram_outputs_rdata_delayed;
  FifoBuffer #(.DATA_SIZE(E*FSIZE), .CYCLES(1) )  ram_outputs_rdata_fifo (.clk(clk), .rstn(1), .in(ram_outputs_rdata1), .out(ram_outputs_rdata_delayed));


  logic  [WIDTH-1:0] permed_load_idx_pattern1;
  logic  [WIDTH-1:0] permed_load_idx_pattern2;
  logic  [WIDTH-1:0] permed_load_idx_pattern3;
  logic  [WIDTH-1:0] permed_load_idx_pattern4;
  logic  [WIDTH-1:0] permed_load_idx_pattern5;
  logic  [WIDTH-1:0] permed_load_idx_pattern6;
  logic  [WIDTH-1:0] permed_load_idx_pattern7;
  logic  [WIDTH-1:0] permed_load_idx_pattern8;
  logic  [WIDTH-1:0] permed_load_idx_pattern9;
  logic  [WIDTH-1:0] permed_load_idx_pattern10;
  logic  [WIDTH-1:0] permed_load_idx_pattern11;
  logic  [WIDTH-1:0] permed_load_idx_pattern12;
  // logic  [WIDTH-1:0] permed_load_idx_s1;
  PermPattern1 permed_load_idx_perm1 (.in(perm_addr_in), .out(permed_load_idx_pattern1));
  PermPattern2 permed_load_idx_perm2 (.in(perm_addr_in), .out(permed_load_idx_pattern2));
  PermPattern3 permed_load_idx_perm3 (.in(perm_addr_in), .out(permed_load_idx_pattern3));
  PermPattern4 permed_load_idx_perm4 (.in(perm_addr_in), .out(permed_load_idx_pattern4));
  PermPattern5 permed_load_idx_perm5 (.in(perm_addr_in), .out(permed_load_idx_pattern5));
  PermPattern6 permed_load_idx_perm6 (.in(perm_addr_in), .out(permed_load_idx_pattern6));
  PermPattern7 permed_load_idx_perm7 (.in(perm_addr_in), .out(permed_load_idx_pattern7));
  PermPattern8 permed_load_idx_perm8 (.in(perm_addr_in), .out(permed_load_idx_pattern8));
  PermPattern9 permed_load_idx_perm9 (.in(perm_addr_in), .out(permed_load_idx_pattern9));
  PermPattern10 permed_load_idx_perm10 (.in(perm_addr_in), .out(permed_load_idx_pattern10));
  PermPattern11 permed_load_idx_perm11 (.in(perm_addr_in), .out(permed_load_idx_pattern11));
  PermPattern12 permed_load_idx_perm12 (.in(perm_addr_in), .out(permed_load_idx_pattern12));

  // logic  [WIDTH-1:0] permed_store_idx_delayed_in, permed_store_idx_delayed;
  // FifoBuffer #(.DATA_SIZE(WIDTH), .CYCLES(BUFFER_READ_LATENCY) )  permed_store_idx_delayed_fifo (.clk(clk), .rstn(1), .in(permed_store_idx_delayed_in), .out(permed_store_idx_delayed));

  
  always_comb begin
    reg_next = reg_current;

    ram_inputs1 = '{default:'0};
    ram_inputs2 = '{default:'0};

    /*
    issued_raddr0 = 0;
    issued_raddr1 = 0;
    issued_waddr = 0;
    issued_wdata = 0;
    issued_wren  = 0;
    issued_cancel = 0;
    
    perm_idx_read_raddr = 0;
    perm_idx_read_waddr = 0;
    perm_idx_read_wdata = 0;
    perm_idx_read_wren  = 0;
    
    perm_idx_write_raddr = 0;
    perm_idx_write_waddr = 0;
    perm_idx_write_wdata = 0;
    perm_idx_write_wren  = 0;
    */
    
   

    
    perm_addr_out = permed_load_idx_pattern1;
    if(reg_current.perm_pattern == 1) perm_addr_out = permed_load_idx_pattern1;
    if(reg_current.perm_pattern == 2) perm_addr_out = permed_load_idx_pattern2;
    if(reg_current.perm_pattern == 3) perm_addr_out = permed_load_idx_pattern3;
    if(reg_current.perm_pattern == 4) perm_addr_out = permed_load_idx_pattern4;
    if(reg_current.perm_pattern == 5) perm_addr_out = permed_load_idx_pattern5;
    if(reg_current.perm_pattern == 6) perm_addr_out = permed_load_idx_pattern6;
    if(reg_current.perm_pattern == 7) perm_addr_out = permed_load_idx_pattern7;
    if(reg_current.perm_pattern == 8) perm_addr_out = permed_load_idx_pattern8;
    if(reg_current.perm_pattern == 9) perm_addr_out = permed_load_idx_pattern9;
    if(reg_current.perm_pattern == 10) perm_addr_out = permed_load_idx_pattern10;
    if(reg_current.perm_pattern == 11) perm_addr_out = permed_load_idx_pattern11;
    if(reg_current.perm_pattern == 12) perm_addr_out = permed_load_idx_pattern12;

    /*
    if(reg_current.reset_issued) begin
      issued_waddr = reg_current.load_counter_s0;
      issued_wdata = 0;
      issued_wren = 1;
      reg_next.load_counter_s0 = reg_current.load_counter_s0 + 1;
      if(reg_current.load_counter_s0 == 10'b1111111111) begin
        reg_next.reset_issued = 0;
      end
    end
    else begin
      if(start_perm_generate) begin
        reg_next.state_STATE_PERM_GENERATE = 1;
        reg_next.perm_pattern = perm_pattern;
        reg_next.load_counter_s0 = 0;
        reg_next.restart_s3 = 0;  
        reg_next.perm_idx_store_counter = 0;    
      end      
    end
      
    


    permed_store_idx_delayed_in = reg_current.read_idx_s2;

    permed_load_idx_in_s0 = 0;
    reg_next.valid_s1 = 0;


    
    //permutaion_pattern_generation
    //stage 0
    if(reg_current.state_STATE_PERM_GENERATE || reg_current.restart_s3) begin
      reg_next.valid_s1 = 1;

      reg_next.load_counter_s1 = reg_current.load_counter_s0;
      reg_next.read_idx_s1 = reg_current.load_counter_s0;
      permed_load_idx_in_s0 = reg_current.load_counter_s0;

      reg_next.load_counter_s0 = reg_current.load_counter_s0 + 1;
      //end condition
      if(reg_current.load_counter_s0 == 10'b1111111111) begin
        reg_next.load_counter_s0 = 0;
        reg_next.state_STATE_PERM_GENERATE = 0;
        reg_next.state_STATE_PERM_WAIT = 1;
      end

      if(reg_current.restart_s3) begin
        reg_next.load_counter_s1 = reg_current.load_counter_s3;
        reg_next.read_idx_s1 = reg_current.restart_read_idx_s3;
        permed_load_idx_in_s0 = reg_current.restart_read_idx_s3;

        reg_next.load_counter_s0 = reg_current.load_counter_s3 + 1;
      end
    end
   
    reg_next.valid_s2 = 0;
    //stage 1
    if(reg_current.valid_s1) begin      
      reg_next.valid_s2 = reg_current.valid_s1;

      issued_raddr0 = reg_current.permed_load_idx_s1;
      issued_raddr1 = reg_current.read_idx_s1;
      issued_wren = 1;
      issued_wdata = 1;
      issued_waddr = reg_current.read_idx_s1;
      
      reg_next.load_counter_s2 = reg_current.load_counter_s1;
      reg_next.read_idx_s2 = reg_current.read_idx_s1;
      
      reg_next.permed_load_idx_s2 = reg_current.permed_load_idx_s1;
    end

    perm_idx_valid_in_s2 = 0;
    perm_idx_last_in_s2  = 0;
    
    //stage 2
    reg_next.restart_s3 = 0;
    if(reg_current.valid_s2) begin   
      perm_idx_valid_in_s2 = 1;
      if(issued_rdata0 == 1 || reg_current.read_idx_s2==reg_current.permed_load_idx_s2) begin
        reg_next.restart_s3 = 0;
      end
      else begin
        reg_next.restart_s3 = 1;
        reg_next.valid_s1 = 0;
        reg_next.valid_s2 = 0;
            
        reg_next.load_counter_s3 = reg_current.load_counter_s2;
        reg_next.restart_read_idx_s3 = reg_current.permed_load_idx_s2;      
      end

      if(reg_current.read_idx_s2 == 10'b1111111111) begin
        perm_idx_last_in_s2 = 1;
      end

      if(issued_rdata1 == 1)begin
        perm_idx_valid_in_s2 = 0;
      end

      if(reg_current.restart_s3) begin
        perm_idx_valid_in_s2 = 0;
      end
    end

    
    if(reg_current.restart_s3) begin
      issued_cancel = 1;
    end   
   
    if(perm_idx_valid_in_s2) begin
      perm_idx_read_wdata = reg_current.read_idx_s2;
      perm_idx_read_waddr = reg_current.perm_idx_store_counter;
      perm_idx_read_wren = 1;

      perm_idx_write_wdata = reg_current.permed_load_idx_s2;
      perm_idx_write_waddr = reg_current.perm_idx_store_counter;
      perm_idx_write_wren = 1;

      reg_next.perm_idx_store_counter = reg_current.perm_idx_store_counter + 1;

      if(perm_idx_last_in_s2) begin
        reg_next.state_STATE_PERM_GENERATE = 0;
        reg_next.state_STATE_PERM_WAIT = 0;
        reg_next.reset_issued = 1;  
        reg_next.load_counter_s0 = 0;  
      end
    end
    */


    //--------------


    //permutaion_start

    if(start_perm) begin
      reg_next.state_STATE_PERM = 1;
      reg_next.perm_pattern = perm_pattern;
      reg_next.perm_idx_read_load_counter = 0;
      reg_next.perm_idx_write_load_counter = 0;

      // reg_next.diff_logN = diff_logN;
    end

    perm_idx_valid_in = 0;
    if(reg_current.state_STATE_PERM) begin
      perm_idx_valid_in = 1;
      
      perm_addr_in = reg_current.perm_idx_read_load_counter;
      ram_inputs1.raddr = reg_current.perm_idx_read_load_counter;

      reg_next.perm_idx_read_load_counter = reg_current.perm_idx_read_load_counter + 1;
      if(reg_current.perm_idx_read_load_counter == (( 1 <<  (logN - 2 -logE))-1) ) begin //10'b1111111111
        reg_next.state_STATE_PERM = 0;
        reg_next.state_STATE_PERM_WAIT = 1;
      end
    end
    
    ram_valid_in = 0;
    ram_last_in = 0;
    
    if(perm_idx_valid) begin
      ram_valid_in = 1;
      // ram_inputs.raddr = perm_idx_read_rdata_delayed;
      // perm_idx_write_raddr = reg_current.perm_idx_write_load_counter;
      reg_next.perm_idx_write_load_counter = reg_current.perm_idx_write_load_counter + 1;      
      if(reg_current.perm_idx_write_load_counter == (( 1 <<  (logN - 2 -logE))-1)) begin //10'b1111111111
        ram_last_in = 1;
        reg_next.state_STATE_PERM = 0;
        reg_next.state_STATE_PERM_WAIT = 1;
      end
    end

    ram_inputs2.waddr = perm_addr_out_delayed;
    ram_inputs2.wdata = ram_outputs_rdata_delayed;
    if(ram_valid) begin        
      if(ram_last) begin
        reg_next.state_STATE_PERM = 0;
        reg_next.state_STATE_PERM_WAIT = 0;
      end

      // ram_inputs.waddr = perm_idx_write_rdata_delayed;
      // ram_inputs.wdata = ram_outputs_rdata_delayed;
      ram_inputs2.wren = 1;
    end

    perm_working = 0;
    if(reg_current.state_STATE_PERM_WAIT  || reg_current.state_STATE_PERM ) perm_working = 1;

    if(rstn == 0) begin
      // reg_next.state_STATE_PERM_GENERATE = 0;      
      reg_next.state_STATE_PERM_WAIT = 0;      
      reg_next.state_STATE_PERM = 0;      
      // reg_next.reset_issued = 1;      
      // reg_next.restart_s3 = 0;      
      // reg_next.load_counter_s0 = 0;    
    end
  end
       
    
  always @ (posedge clk) begin  
    reg_current <= reg_next;
	end


endmodule
