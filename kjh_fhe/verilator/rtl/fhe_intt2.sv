`timescale 1 ns / 1 ns

`include "defines.vh"
import FHE_ALU_PKG::*;

module fhe_intt2 #(
        parameter SIM_MODE        = 0
	) (
		input logic	clk,		    		
		input logic rstn,			

    input CommandDataPort commanddataport,
    output logic [FSIZE-1:0] stateport0,
    output logic [FSIZE-1:0] stateport1
	);


  `ifdef verilator
  logic[31:0] debug;
  initial begin
    debug = 0;
  end
  `endif  


  localparam STATE_RUNNING = 1;
  localparam STATE_SCALAR = 2;
  localparam STATE_WAIT = 3;
  
  localparam VALID_IDLE = 0;
  localparam VALID_NORMAL = 1;
  localparam VALID_PHASE_END = 2;

  localparam VSIZE = 2;


  BufferRAMTFsizeInputs W_ram_inputs;
  BufferRAMTFsizeOutputs W_ram_outputs;

  BufferRAMTFsize #(
    .ID(0),
    .DEPTH(N)
  )  W_ram(
    .clk(clk),
    .inputs(W_ram_inputs),
    .outputs(W_ram_outputs)
  );

  BufferRAMTFsizeInputs WQ_ram_inputs;
  BufferRAMTFsizeOutputs WQ_ram_outputs;

  BufferRAMTFsize #(
    .ID(1),
    .DEPTH(N)
  )  WQ_ram(
    .clk(clk),
    .inputs(WQ_ram_inputs),
    .outputs(WQ_ram_outputs)
  );

  BufferRAMTFsizeInputsR2W2 NTT_ram_inputs;
  logic [FSIZE-1:0] NTT_ram_outputs_rdata0;
  logic [FSIZE-1:0] NTT_ram_outputs_rdata1;

  BufferRAMTFsizeR2W2 #(
    .ID(2),
    .DEPTH(N)
  )  NTT_ram(
    .clk(clk),
    .inputs(NTT_ram_inputs),
    .rdata0(NTT_ram_outputs_rdata0),
    .rdata1(NTT_ram_outputs_rdata1)
  );

  logic [1:0] butt_in_valid;
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
    
    logic [FSIZE-1:0] scalar;
    logic [FSIZE-1:0] scalar_div_p;

    logic [$clog2(N)-1:0] W_addr;
    logic [$clog2(N)-1:0] NTT_addr;
    logic [$clog2(N)-1:0] ntt_raddr0;

    logic [$clog2(N)-1:0] m;
    logic [$clog2(N)-1:0] i;
    logic [$clog2(N)-1:0] j;
    logic [$clog2(N)-1:0] gap;
    logic [$clog2(N)-1:0] rootidx;
    logic [$clog2(N)-1:0] offset;


  } Registers;
    
  Registers reg_current,reg_next;

  logic [$clog2(N)-1:0] NTT_waddr0_in, NTT_waddr0;
  FifoBuffer #(.DATA_SIZE($clog2(N)), .CYCLES(IBUTTER_CYCLES+BUFFER_READ_LATENCY) )  NTT_waddr0_fifo (.clk(clk), .rstn(rstn), .in(NTT_waddr0_in), .out(NTT_waddr0));
  
  logic [$clog2(N)-1:0] NTT_waddr1_in, NTT_waddr1;
  FifoBuffer #(.DATA_SIZE($clog2(N)), .CYCLES(IBUTTER_CYCLES+BUFFER_READ_LATENCY) )  NTT_waddr1_fifo (.clk(clk), .rstn(rstn), .in(NTT_waddr1_in), .out(NTT_waddr1));
  
  logic NTT_wren0_in, NTT_wren0;
  logic NTT_wren1_in, NTT_wren1;
  FifoBuffer #(.DATA_SIZE(1), .CYCLES(IBUTTER_CYCLES+BUFFER_READ_LATENCY) )  NTT_wren0_fifo (.clk(clk), .rstn(rstn), .in(NTT_wren0_in), .out(NTT_wren0));
  FifoBuffer #(.DATA_SIZE(1), .CYCLES(IBUTTER_CYCLES+BUFFER_READ_LATENCY) )  NTT_wren1_fifo (.clk(clk), .rstn(rstn), .in(NTT_wren1_in), .out(NTT_wren1));
  
  logic[1:0] NTT_rvalid_in, NTT_rvalid;
  FifoBuffer #(.DATA_SIZE(2), .CYCLES(BUFFER_READ_LATENCY) )  NTT_rvalid_fifo (.clk(clk), .rstn(rstn), .in(NTT_rvalid_in), .out(NTT_rvalid));


  always_comb begin
    reg_next = reg_current;
    
    stateport0 = reg_current.state;
    stateport1 = NTT_ram_outputs_rdata0;
    
    W_ram_inputs.raddr = 0;
    W_ram_inputs.waddr = 0;
    W_ram_inputs.wdata = 0;
    W_ram_inputs.wren = 0;

    WQ_ram_inputs.raddr = 0;
    WQ_ram_inputs.waddr = 0;
    WQ_ram_inputs.wdata = 0;
    WQ_ram_inputs.wren = 0;
    
    NTT_ram_inputs.raddr0 = reg_current.ntt_raddr0;
    NTT_ram_inputs.raddr1 = 0;
    NTT_ram_inputs.waddr0 = 0;
    NTT_ram_inputs.wdata0 = 0;
    NTT_ram_inputs.wren0 = 0;
    NTT_ram_inputs.waddr1 = 0;
    NTT_ram_inputs.wdata1 = 0;
    NTT_ram_inputs.wren1 = 0;

    
    if(commanddataport.valid) begin
      if(commanddataport.command == COMMAND_INTT_W) begin
        W_ram_inputs.wdata = commanddataport.data0;
        W_ram_inputs.wren = 1;
        W_ram_inputs.waddr = reg_current.W_addr;
        
        WQ_ram_inputs.wdata = commanddataport.data1;
        WQ_ram_inputs.wren = 1;
        WQ_ram_inputs.waddr = reg_current.W_addr;
        
        reg_next.W_addr = reg_current.W_addr + 1;

        // if($time()%2==0)$display("W %x %d at %d",commanddataport.data0,commanddataport.data0,$time()/2) ; 
      end

      if(commanddataport.command == COMMAND_INTT_P) begin
        reg_next.p = commanddataport.data0;

        // if($time()%2==0)$display("p %x %d pInv %x %d at %d",commanddataport.data0,commanddataport.data0,commanddataport.data1,commanddataport.data1,$time()/2) ; 
      end

      if(commanddataport.command == COMMAND_INTT_SCALAR) begin
        reg_next.scalar = commanddataport.data0;
        reg_next.scalar_div_p = commanddataport.data1;
      end
      
      if(commanddataport.command == COMMAND_INTT_A) begin
        NTT_ram_inputs.wdata0 = commanddataport.data0;
        NTT_ram_inputs.wren0 = 1;
        NTT_ram_inputs.waddr0 = reg_current.NTT_addr;
        
        reg_next.NTT_addr = reg_current.NTT_addr + 1;
        
        // if($time()%2==0)$display("COMMAND_NTT_A %d %d  at %d",reg_current.NTT_addr,commanddataport.data0,$time()/2) ; 
      end

      if(commanddataport.command == COMMAND_INTT_RUN) begin        
        reg_next.state = STATE_RUNNING;
        
        reg_next.m =  N/2;
        reg_next.gap = 1;
        reg_next.rootidx = 1;
        reg_next.i = 0;
        reg_next.j = 0;
        reg_next.offset = 0;
      end


      if(commanddataport.command == COMMAND_RESET) begin        
        reg_next.state = STATE_IDLE;
        
        reg_next.W_addr = 0;
        reg_next.NTT_addr = 0;
      end

      if(commanddataport.command == COMMAND_INTT_GET) begin        
        reg_next.ntt_raddr0 = commanddataport.data0;
      end
    end


    NTT_waddr0_in = 0;
    NTT_waddr1_in = 0;
    NTT_rvalid_in = 0;
    NTT_wren0_in = 0;
    NTT_wren1_in = 0;

    if(reg_current.state == STATE_RUNNING) begin
      
      // if($time()%2==0)
      // $display("m %d i %d j %d gap %d offset %d rootidx %d at %d",reg_current.m,reg_current.i,reg_current.j,reg_current.gap,reg_current.offset,reg_current.rootidx,$time()/2) ; 
      
      reg_next.j = reg_current.j +1;
      
      if(reg_current.j == reg_current.gap -1) begin
        reg_next.i = reg_current.i + 1;
        reg_next.j = 0;
        reg_next.rootidx = reg_current.rootidx + 1;
        
        reg_next.offset = reg_current.offset + (reg_current.gap <<1);
        
        if(reg_current.i == reg_current.m-1) begin 
          reg_next.i = 0;
          reg_next.offset = 0;
          
          reg_next.m = reg_current.m >> 1;
          
          reg_next.gap = reg_current.gap <<1;
        
          if(reg_current.m == 1) begin 
            reg_next.state = STATE_SCALAR;
          end
        end
      end

      NTT_rvalid_in = 1;
      NTT_wren0_in = 1;
      NTT_wren1_in = 1;

      W_ram_inputs.raddr = reg_current.rootidx;
      WQ_ram_inputs.raddr = reg_current.rootidx;

      NTT_ram_inputs.raddr0 = reg_current.offset + reg_current.j;
      NTT_ram_inputs.raddr1 = reg_current.offset + reg_current.j + reg_current.gap ;
      
      NTT_waddr0_in = NTT_ram_inputs.raddr0;
      NTT_waddr1_in = NTT_ram_inputs.raddr1;
    end

    if(reg_current.state == STATE_SCALAR) begin
      reg_next.j = reg_current.j +1;
      
      if(reg_current.j == N-1) begin
        reg_next.j = 0;
        reg_next.state = STATE_IDLE;
      end

      NTT_rvalid_in = 2;
      NTT_ram_inputs.raddr0 = reg_current.j;
      NTT_wren1_in = 1;
      NTT_waddr1_in = NTT_ram_inputs.raddr0;
    end

    if(NTT_wren0) begin
      NTT_ram_inputs.waddr0 = NTT_waddr0;
      NTT_ram_inputs.wren0 = 1;
      NTT_ram_inputs.wdata0 = butt_a_out;
    end
    if(NTT_wren1) begin
      NTT_ram_inputs.waddr1 = NTT_waddr1;
      NTT_ram_inputs.wren1 = 1;
      NTT_ram_inputs.wdata1 = butt_b_out;
    end

    butt_in_valid = NTT_rvalid;
    butt_in_a = NTT_ram_outputs_rdata0;
    butt_in_b = NTT_ram_outputs_rdata1;
    butt_in_p = reg_current.p;
    butt_in_W = W_ram_outputs.rdata;
    butt_in_WQ = WQ_ram_outputs.rdata;
    if(NTT_rvalid == 2) begin
      butt_in_W = reg_current.scalar;
      butt_in_WQ = reg_current.scalar_div_p;
    end

    // if(NTT_rvalid) begin
    //   if($time()%2==0)$display("NTT_rvalid a %d b %d p %d pInv %d W %d at %d",NTT_ram_outputs_rdata0,NTT_ram_outputs_rdata1,butt_in_p,butt_in_pInv,butt_in_W,$time()/2) ;       
    // end

    // if(butt_out_valid) begin
    //   if($time()%2==0)$display("butt_out_valid addr_a %d addr_b %d a %d %x b %d %x %d at %d",NTT_waddr0,NTT_waddr1,butt_a_out,butt_a_out,butt_b_out,butt_b_out,NTT_wren,$time()/2) ; 
    // end

    if(rstn == 0) begin
      reg_next.state = STATE_IDLE;
      
      reg_next.W_addr = 0;
      reg_next.NTT_addr = 0;
    end
  end
       
    
  always @ (posedge clk) begin  
    reg_current <= reg_next;
	end
endmodule
