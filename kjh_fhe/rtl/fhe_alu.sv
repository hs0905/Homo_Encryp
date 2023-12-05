`timescale 1 ns / 1 ns

`include "defines.vh"
import FHE_ALU_PKG::*;

module fhe_alu #(
        parameter SIM_MODE        = 0
	) (
		input logic	clk,		    		
		input logic rstn,			

    input CommandDataPort commanddataport,
    output logic [FSIZE-1:0] stateport0,
    output logic [FSIZE-1:0] stateport1,
    output logic [FSIZE-1:0] stateport2
	);


  `ifdef verilator
  logic[31:0] debug;
  initial begin
    debug = 0;
  end
  `endif  


  localparam STATE_RUNNING = 1;
  
  localparam VALID_IDLE = 0;
  localparam VALID_NORMAL = 1;
  localparam VALID_PHASE_END = 2;

  localparam VSIZE = 2;

  
  typedef struct packed {
    logic [31:0] state;
    logic [FSIZE-1:0] W;
    logic [FSIZE-1:0] p;
    logic [FSIZE-1:0] pInv;
    logic [FSIZE-1:0] a;
    logic [FSIZE-1:0] b;
    logic [FSIZE-1:0] a_out;
    logic [FSIZE-1:0] b_out;

    logic [FSIZE-1:0] V;
    logic mult1_in_valid;
    logic stage1;
    logic stage2;
  } Registers;
    
  Registers reg_current,reg_next;

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
 
  logic [FSIZE-1:0] H;

  logic [FSIZE-1:0] U1_in;
  logic [FSIZE-1:0] U1;
  FifoBuffer #(.DATA_SIZE(FSIZE), .CYCLES(MULT_CYCLES*2) )  U1_fifo (.clk(clk), .rstn(rstn), .in(U1_in), .out(U1));

  always_comb begin
    reg_next = reg_current;
    
    stateport0 = reg_current.state;
    stateport1 = reg_current.a_out;
    stateport2 = reg_current.b_out;
    // stateport1 = 64'h1111222233334444; 
    // stateport0 = 64'h1234567890abcdef;

    
    reg_next.mult1_in_valid = 0;

    
    if(commanddataport.valid) begin
      if(commanddataport.command == COMMAND_BUTTER_W) begin
        reg_next.W = commanddataport.data0;

        if($time()%2==0)$display("W %x %d at %d",commanddataport.data0,commanddataport.data0,$time()/2) ; 
      end

      if(commanddataport.command == COMMAND_BUTTER_P) begin
        reg_next.p = commanddataport.data0;
        reg_next.pInv = commanddataport.data1;

        if($time()%2==0)$display("p %x %d pInv %x %d at %d",commanddataport.data0,commanddataport.data0,commanddataport.data1,commanddataport.data1,$time()/2) ; 
      end
      
      if(commanddataport.command == COMMAND_BUTTER_A) begin
        reg_next.a = commanddataport.data0;
        reg_next.b = commanddataport.data1;
        
        reg_next.state = STATE_RUNNING;

        reg_next.mult1_in_valid = 1;

        if($time()%2==0)$display("a %x %d b %x %d  at %d",commanddataport.data0,commanddataport.data0,commanddataport.data1,commanddataport.data1,$time()/2) ; 
      end
    end

    mult1_in_A = reg_current.b;
    mult1_in_B = reg_current.W;
    mult1_in_valid = reg_current.mult1_in_valid;

    U1_in = mult1_out[FSIZE*2-1:FSIZE];

    mult2_in_A = mult1_out[FSIZE-1:0];  //U0
    mult2_in_B = reg_current.pInv;
    mult2_in_valid = mult1_out_valid;

    mult3_in_A = mult2_out[FSIZE-1:0];  //Q
    mult3_in_B = reg_current.p;
    mult3_in_valid = mult2_out_valid;

    H = mult3_out[FSIZE*2-1:FSIZE];

    if(mult3_out_valid) begin
      if(U1 < H) begin
        reg_next.V = U1 + reg_current.p - H;
      end
      else begin
        reg_next.V = U1 - H;
      end
      reg_next.stage1 = 1;
    end


    if(reg_current.stage1) begin
      reg_next.stage1 = 0;
      if(reg_current.a < reg_current.V) begin
        reg_next.b_out = reg_current.a + reg_current.p - reg_current.V;
      end
      else begin
        reg_next.b_out = reg_current.a - reg_current.V;
      end
      reg_next.a_out = reg_current.a + reg_current.V;
      reg_next.stage2 = 1;
    end


    if(reg_current.stage2) begin
      reg_next.stage2 = 0;
      if(reg_current.a_out > reg_current.p) begin
        reg_next.a_out = reg_current.a_out - reg_current.p;
      end

      reg_next.state = STATE_IDLE;
    end

    if(rstn == 0) begin
      reg_next.state = STATE_IDLE;
      reg_next.stage1 = 0;
      reg_next.stage2 = 0;
    end
  end
       
    
  always @ (posedge clk) begin  
    reg_current <= reg_next;
	end
endmodule
