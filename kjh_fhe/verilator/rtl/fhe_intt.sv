`timescale 1 ns / 1 ns

`include "defines.vh"
import FHE_ALU_PKG::*;

module fhe_intt #(
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
  localparam STATE_RUNNING_SCALAR = 2;
  localparam STATE_WAIT = 3;
  
  localparam VALID_IDLE = 0;
  localparam VALID_NORMAL = 1;
  localparam VALID_PHASE_END = 2;

  localparam VSIZE = 2;


  logic butt_in_valid;
  logic [FSIZE-1:0] butt_in_a;
  logic [FSIZE-1:0] butt_in_b;
  logic [FSIZE-1:0] butt_in_p;
  logic [FSIZE-1:0] butt_in_W;
  logic [FSIZE-1:0] butt_in_WQ;
  logic [FSIZE-1:0] butt_a_out;
  logic [FSIZE-1:0] butt_b_out;
  logic butt_out_valid;

  ibutt ibutt(
    .clk(clk),
    .rstn(rstn),
    .in_valid(butt_in_valid),
    .a(butt_in_a),
    .b(butt_in_b),
    .p(butt_in_p),
    .W(butt_in_W),
    .WQ(butt_in_WQ),
    .a_out(butt_a_out),
    .b_out(butt_b_out),
    .out_valid(butt_out_valid)
  );
  
  typedef struct packed {
    logic [31:0] state;
    logic [FSIZE-1:0] W;
    logic [FSIZE-1:0] WQ;
    logic [FSIZE-1:0] p;
    logic [FSIZE-1:0] a;
    logic [FSIZE-1:0] b;
    logic [FSIZE-1:0] a_out;
    logic [FSIZE-1:0] b_out;
  } Registers;
    
  Registers reg_current,reg_next;

  always_comb begin
    reg_next = reg_current;
    
    stateport0 = reg_current.state;
    stateport1 = reg_current.a_out;
    stateport2 = reg_current.b_out;
    
    
    if(commanddataport.valid) begin
      if(commanddataport.command == COMMAND_IBUTTER_W) begin
        reg_next.W = commanddataport.data0;
        reg_next.WQ = commanddataport.data1;

        if($time()%2==0)$display("W %x %d WQ %x %d at %d",commanddataport.data0,commanddataport.data0,commanddataport.data1,commanddataport.data1,$time()/2) ; 
      end

      if(commanddataport.command == COMMAND_IBUTTER_P) begin
        reg_next.p = commanddataport.data0;

        if($time()%2==0)$display("p %x %d at %d",commanddataport.data0,commanddataport.data0,$time()/2) ; 
      end
      
      if(commanddataport.command == COMMAND_IBUTTER_A) begin
        reg_next.a = commanddataport.data0;
        reg_next.b = commanddataport.data1;
        
        reg_next.state = STATE_RUNNING;

        if($time()%2==0)$display("a %x %d b %x %d  at %d",commanddataport.data0,commanddataport.data0,commanddataport.data1,commanddataport.data1,$time()/2) ; 
      end

      if(commanddataport.command == COMMAND_IBUTTER_SCALAR) begin
        reg_next.a = commanddataport.data0;
        reg_next.b = 0;
                
        reg_next.state = STATE_RUNNING_SCALAR;

        if($time()%2==0)$display("a %x %d b %x %d  at %d",commanddataport.data0,commanddataport.data0,commanddataport.data1,commanddataport.data1,$time()/2) ; 
      end
    end

    butt_in_valid = 0;
    butt_in_a = reg_current.a;
    butt_in_b = reg_current.b;
    butt_in_p = reg_current.p;
    butt_in_W = reg_current.W;
    butt_in_WQ = reg_current.WQ;
    if(reg_current.state == STATE_RUNNING) begin
      butt_in_valid = 1;          
      reg_next.state = STATE_WAIT;
    end
    if(reg_current.state == STATE_RUNNING_SCALAR) begin
      butt_in_valid = 2;          
      reg_next.state = STATE_WAIT;
    end
    if(reg_current.state == STATE_WAIT) begin
      if(butt_out_valid) begin
        reg_next.state = STATE_IDLE;
        reg_next.a_out = butt_a_out;
        reg_next.b_out = butt_b_out;
      end
    end

    if(rstn == 0) begin
      reg_next.state = STATE_IDLE;
    end
  end
       
    
  always @ (posedge clk) begin  
    reg_current <= reg_next;
	end
endmodule
