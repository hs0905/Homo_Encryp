`timescale 1 ns / 1 ns

`include "defines.vh"
import FHE_ALU_PKG::*;


module BitReverser #(
		parameter WIDTH     = 3		
	) (	
    input logic   [WIDTH-1:0]       in,
    output logic  [WIDTH-1:0]       out
  );
  always_comb begin
    for(int i = 0; i < WIDTH; i ++) begin
      out[WIDTH-1-i] = in[i];
    end
  end
endmodule


module BitCompose #(
		parameter WIDTH       = logN-logE,
		parameter MID_WIDTH   = logE,
		parameter LEFT_BARREL   = 0
	) (	
    input logic [$clog2(WIDTH):0]     base,
    input logic [$clog2(logE)-1:0]     barrel,
    input logic   [WIDTH-MID_WIDTH-1:0] in,
    input logic   [MID_WIDTH-1:0]       mid,
    output logic  [WIDTH-1:0]           out
  );

  logic [MID_WIDTH-1:0]       mid_barreled;

  always_comb begin
    mid_barreled = mid;

    if(LEFT_BARREL) begin
      if (barrel == 1) mid_barreled = {mid[MID_WIDTH-2:0],mid[MID_WIDTH-1]};
      if (barrel == 2) mid_barreled = {mid[MID_WIDTH-3:0],mid[MID_WIDTH-1:MID_WIDTH-2]};
    end
    else begin
      if (barrel == 1) mid_barreled = {mid[0],mid[MID_WIDTH-1:1]};
      if (barrel == 2) mid_barreled = {mid[1:0],mid[MID_WIDTH-1:2]};
    end

    out = {in,mid_barreled};
    if (base == 0) out = {in,mid_barreled};
    else if (base == 1) out = {in[WIDTH-MID_WIDTH-1:1],mid_barreled,in[0]};
    else if (base == 2) out = {in[WIDTH-MID_WIDTH-1:2],mid_barreled,in[1:0]};
    else if (base == 3) out = {in[WIDTH-MID_WIDTH-1:3],mid_barreled,in[2:0]};
    else if (base == 4) out = {in[WIDTH-MID_WIDTH-1:4],mid_barreled,in[3:0]};
    else if (base == 5) out = {in[WIDTH-MID_WIDTH-1:5],mid_barreled,in[4:0]};
    else if (base == 6) out = {in[WIDTH-MID_WIDTH-1:6],mid_barreled,in[5:0]};
    else if (base == 7) out = {in[WIDTH-MID_WIDTH-1:7],mid_barreled,in[6:0]};
    else if (base == 8) out = {in[WIDTH-MID_WIDTH-1],mid_barreled,in[7:0]};
    else out = {mid_barreled,in};
  end
endmodule


module BitRevControl_v1 #(
		parameter WIDTH     = 3		
	) (	
		input logic	clk,		    		
		input logic rstn,			

		input logic start_bitRev,

    input logic start_transpose,
    input logic [$clog2(logN-logE)-1:0] transpose_base,
    input logic [$clog2(logE)-1:0] barrel_store,
    input logic [$clog2(logE)-1:0] barrel_load,
    
		output logic bitRev_working,

    output BufferRAMTEFsizeInputs ram_inputs,
    input logic [E*FSIZE-1:0] ram_outputs_rdata
  );
 
  localparam MID_BITS = logN-logE-logE;

  typedef struct packed {
    logic state_STATE_BITREVERSE;
    logic state_STATE_BITREVERSE_WAIT;
    logic state_STATE_TRANSPOSE;
    logic state_STATE_TRANSPOSE_WAIT;

    logic [MID_BITS-1:0] load_mid_bits_idx;
    logic [logE-1:0] load_idx;
    logic [logE-1:0] store_idx;

    logic load_mid_bits_idx_use_reversed;
    logic [MID_BITS-1:0]load_mid_bits_idx_reversed;

    logic [logN-logE-logE-1:0] load_non_tr_idx;
    logic [$clog2(logN-logE):0] transpose_base;
    logic [$clog2(logE)-1:0] barrel_store;
    logic [$clog2(logE)-1:0] barrel_load;

    logic [logN-logE-1:0] raddr_tr;
    logic [logN-logE-1:0] raddr_bitrev;
    logic [logN-logE-1:0] waddr_tr;
    logic [logN-logE-1:0] waddr_bitrev;

    logic [E*FSIZE-1:0] tr_out;  
  } Registers;

  Registers reg_current,reg_next;

  localparam STATE_BITREVERSE = 3;
  localparam STATE_BITREVERSE_WAIT = 4;
  localparam STATE_TRANSPOSE = 5;
  localparam STATE_TRANSPOSE_WAIT = 6;

  logic tr_in_valid_in, tr_in_valid;
  FifoBuffer #(.DATA_SIZE(1), .CYCLES(BUFFER_READ_LATENCY+1) )  tr_in_valid_fifo (.clk(clk), .rstn(1), .in(tr_in_valid_in), .out(tr_in_valid));

  logic tr_in_last_in, tr_in_last;
  FifoBuffer #(.DATA_SIZE(1), .CYCLES(BUFFER_READ_LATENCY+1) )  tr_in_last_fifo (.clk(clk), .rstn(1), .in(tr_in_last_in), .out(tr_in_last));

  logic [logE-1:0] reversed_load_idx_in, reversed_load_idx;
  BitReverser #(.WIDTH(logE))  reversed_load_idx_reverse (.in(reversed_load_idx_in), .out(reversed_load_idx));

  logic [logE-1:0] reversed_store_idx_in, reversed_store_idx;
  BitReverser #(.WIDTH(logE))  reversed_store_idx_reverse (.in(reversed_store_idx_in), .out(reversed_store_idx));

  logic [MID_BITS-1:0] reversed_load_mid_bits_idx_in, reversed_load_mid_bits_idx;
  BitReverser #(.WIDTH(MID_BITS))  reversed_load_mid_bits_idx_reverse (.in(reversed_load_mid_bits_idx_in), .out(reversed_load_mid_bits_idx));

  logic [MID_BITS-1:0] reversed_store_mid_bits_idx_in, reversed_store_mid_bits_idx;
  BitReverser #(.WIDTH(MID_BITS))  reversed_store_mid_bits_idx_reverse (.in(reversed_store_mid_bits_idx_in), .out(reversed_store_mid_bits_idx));

  logic  [MID_BITS-1:0] reversed_store_mid_bits_idx_delayed_in, reversed_store_mid_bits_idx_delayed;
  FifoBuffer #(.DATA_SIZE(MID_BITS), .CYCLES(BUFFER_READ_LATENCY+1+E+1) )  reversed_store_mid_bits_idx_delayed_fifo (.clk(clk), .rstn(1), .in(reversed_store_mid_bits_idx_delayed_in), .out(reversed_store_mid_bits_idx_delayed));

  logic [$clog2(logN-logE):0] tr_load_compose_base;
  logic [$clog2(logE)-1:0] tr_load_compose_barrel;
  logic [logN-logE-logE-1:0] tr_load_compose_in;
  logic [logE-1:0] tr_load_compose_mid;
  logic [logN-logE-1:0] tr_load_compose_out;
  BitCompose #(.WIDTH(logN-logE), .MID_WIDTH(logE), .LEFT_BARREL(1) )  tr_load_compose (.base(tr_load_compose_base), .barrel(tr_load_compose_barrel), .in(tr_load_compose_in), .mid(tr_load_compose_mid), .out(tr_load_compose_out));

  logic [$clog2(logN-logE):0] tr_store_compose_base;
  logic [$clog2(logE)-1:0] tr_store_compose_barrel;
  logic [logN-logE-logE-1:0] tr_store_compose_in;
  logic [logE-1:0] tr_store_compose_mid;
  logic [logN-logE-1:0] tr_store_compose_out;
  BitCompose #(.WIDTH(logN-logE), .MID_WIDTH(logE) )  tr_store_compose (.base(tr_store_compose_base), .barrel(tr_store_compose_barrel), .in(tr_store_compose_in), .mid(tr_store_compose_mid), .out(tr_store_compose_out));
  
  logic  [logN-logE-logE-1:0] tr_store_non_tr_idx_delayed_in, tr_store_non_tr_idx_delayed;
  FifoBuffer #(.DATA_SIZE(logN-logE-logE), .CYCLES(BUFFER_READ_LATENCY+1+E+1) )  tr_store_non_tr_idx_delayed_fifo (.clk(clk), .rstn(1), .in(tr_store_non_tr_idx_delayed_in), .out(tr_store_non_tr_idx_delayed));

  logic  raddr_select_transpose_in, raddr_select_transpose;
  FifoBuffer #(.DATA_SIZE(1), .CYCLES(1) )  raddr_select_transpose_in_fifo (.clk(clk), .rstn(1), .in(raddr_select_transpose_in), .out(raddr_select_transpose));
  logic  raddr_select_bitrev_in, raddr_select_bitrev;
  FifoBuffer #(.DATA_SIZE(1), .CYCLES(1) )  raddr_select_bitrev_in_fifo (.clk(clk), .rstn(1), .in(raddr_select_bitrev_in), .out(raddr_select_bitrev));
  logic  waddr_select_transpose_in, waddr_select_transpose;
  FifoBuffer #(.DATA_SIZE(1), .CYCLES(1) )  waddr_select_transpose_in_fifo (.clk(clk), .rstn(1), .in(waddr_select_transpose_in), .out(waddr_select_transpose));
  logic  waddr_select_bitrev_in, waddr_select_bitrev;
  FifoBuffer #(.DATA_SIZE(1), .CYCLES(1) )  waddr_select_bitrev_in_fifo (.clk(clk), .rstn(1), .in(waddr_select_bitrev_in), .out(waddr_select_bitrev));


  logic tr_out_valid;
  logic [E*FSIZE-1:0] tr_in, tr_out;  
  logic tr_out_last;

  Transposer #(.DATA_SIZE(FSIZE), .ELEMS(E) )  
  tr (
    .clk(clk), 
    .rstn(rstn), 
    .in(tr_in), 
    .in_valid(tr_in_valid), 
    .in_last(tr_in_last), 
    .out(tr_out), 
    .out_valid(tr_out_valid),
    .out_last(tr_out_last)
  );



  always_comb begin
    reg_next = reg_current;

    ram_inputs = '{default:'0};
    
    if(start_bitRev) begin        
      reg_next.state_STATE_BITREVERSE = 1;
      //reg_next.mid_bits_num = 1 << (logN - logE - logE);

      reg_next.load_mid_bits_idx = 0;
      reg_next.load_idx = 0;
      reg_next.store_idx = 0;
      reg_next.load_mid_bits_idx_use_reversed = 0;
    end


    if(start_transpose) begin
      reg_next.state_STATE_TRANSPOSE = 1;
      reg_next.load_idx = 0;
      reg_next.store_idx = 0;
      reg_next.load_non_tr_idx = 0;
      reg_next.transpose_base = transpose_base;      
      reg_next.barrel_store = barrel_store;      
      reg_next.barrel_load = barrel_load;      
    end


    tr_in = ram_outputs_rdata;
    tr_in_valid_in = 0;
    tr_in_last_in = 0;

    reversed_load_idx_in =reg_current.load_idx; 
    reversed_load_mid_bits_idx_in = reg_current.load_mid_bits_idx;
    reversed_store_mid_bits_idx_in = reg_current.load_mid_bits_idx; 
    raddr_select_bitrev_in = 0;
    if(reg_current.state_STATE_BITREVERSE) begin
      tr_in_valid_in = 1;
      reg_next.load_idx = reg_current.load_idx +1;

      if( reg_current.load_mid_bits_idx > (reversed_load_mid_bits_idx>>2) ) begin
        //skip
        tr_in_valid_in = 0;
        reg_next.load_mid_bits_idx = reg_current.load_mid_bits_idx + 1;
        reg_next.load_idx = 0;
      end

      if(reg_current.load_idx == E-1) begin
        reg_next.load_idx = 0;
    
        if(reg_current.load_mid_bits_idx_use_reversed == 1) begin
          reg_next.load_mid_bits_idx = reg_current.load_mid_bits_idx + 1;          
          reg_next.load_mid_bits_idx_use_reversed = 0;          
        end
        else if(reg_current.load_mid_bits_idx ==  7'b1111111) begin
          reg_next.load_mid_bits_idx = 0;
          reg_next.state_STATE_BITREVERSE = 0;
          reg_next.state_STATE_BITREVERSE_WAIT = 1;
          tr_in_last_in = 1;
        end
        else if((reversed_load_mid_bits_idx>>2) == reg_current.load_mid_bits_idx) begin  //symmetry
          reg_next.load_mid_bits_idx = reg_current.load_mid_bits_idx + 1;          
        end
        else begin
          reg_next.load_mid_bits_idx_use_reversed = 1;
          reg_next.load_mid_bits_idx_reversed = reversed_load_mid_bits_idx>>2;
        end
      end
      // reg_next.raddr_bitrev = {reversed_load_idx,reg_current.load_mid_bits_idx[MID_BITS-1:0]};  
      reg_next.raddr_bitrev = ((reversed_load_idx << (MID_BITS -2)) | reg_current.load_mid_bits_idx[MID_BITS-1:0]);  
      raddr_select_bitrev_in = 1; 
      
      if(reg_current.load_mid_bits_idx_use_reversed == 1) begin
        // reg_next.raddr_bitrev = ({reversed_load_idx,reg_current.load_mid_bits_idx_reversed[MID_BITS-1:0]}>>2);
        reg_next.raddr_bitrev = ((reversed_load_idx << (MID_BITS -2)) | (reg_current.load_mid_bits_idx_reversed[MID_BITS-1:0])); 
        reversed_store_mid_bits_idx_in = (reg_current.load_mid_bits_idx_reversed[MID_BITS-1:0]);
      end
    end

    reversed_store_idx_in =reg_current.store_idx; 
    reversed_store_mid_bits_idx_delayed_in = reversed_store_mid_bits_idx>>2;
    waddr_select_bitrev_in = 0;
    if(reg_current.state_STATE_BITREVERSE || reg_current.state_STATE_BITREVERSE_WAIT) begin
      if(tr_out_valid) begin
        reg_next.store_idx = reg_current.store_idx +1;
        if(reg_current.store_idx == E-1) begin
          reg_next.store_idx = 0;
          
        end

        if(tr_out_last) begin
          reg_next.state_STATE_BITREVERSE = 0;
          reg_next.state_STATE_BITREVERSE_WAIT = 0;
        end

        //reg_next.waddr_bitrev = ({reversed_store_idx,reversed_store_mid_bits_idx_delayed}>>2);
        reg_next.waddr_bitrev = ((reversed_store_idx << ( MID_BITS -2)) | (reversed_store_mid_bits_idx_delayed));
        waddr_select_bitrev_in = 1;
      end
    end


    //++transpose
    tr_load_compose_base = reg_current.transpose_base; 
    tr_load_compose_barrel = reg_current.barrel_load; 
    tr_load_compose_in = reg_current.load_non_tr_idx;
    tr_load_compose_mid = reg_current.load_idx; 
    raddr_select_transpose_in = 0; 
    tr_store_non_tr_idx_delayed_in = reg_current.load_non_tr_idx;
    if(reg_current.state_STATE_TRANSPOSE) begin
      tr_in_valid_in = 1;
      reg_next.load_idx = reg_current.load_idx +1;

      if(reg_current.load_idx == E-1) begin
        reg_next.load_idx = 0;
        reg_next.load_non_tr_idx = reg_current.load_non_tr_idx + 1;
    
        if(reg_current.load_non_tr_idx == 7'b1111111 ) begin
          reg_next.load_mid_bits_idx = 0;
          reg_next.state_STATE_TRANSPOSE = 0;
          reg_next.state_STATE_TRANSPOSE_WAIT = 1;
          tr_in_last_in = 1;
        end        
      end
      reg_next.raddr_tr = tr_load_compose_out;     
      raddr_select_transpose_in = 1; 
    end

    tr_store_compose_base = reg_current.transpose_base; 
    tr_store_compose_barrel = reg_current.barrel_store; 
    tr_store_compose_in = tr_store_non_tr_idx_delayed;
    tr_store_compose_mid = reg_current.store_idx; 
    waddr_select_transpose_in = 0;
    if(reg_current.state_STATE_TRANSPOSE || reg_current.state_STATE_TRANSPOSE_WAIT) begin
      if(tr_out_valid) begin
        reg_next.store_idx = reg_current.store_idx +1;
        if(reg_current.store_idx == E-1) begin
          reg_next.store_idx = 0;          
        end

        if(tr_out_last) begin
          reg_next.state_STATE_TRANSPOSE = 0;
          reg_next.state_STATE_TRANSPOSE_WAIT = 0;
        end

        reg_next.waddr_tr = tr_store_compose_out;
        waddr_select_transpose_in = 1;
      end
    end
    //--transpose

    if(raddr_select_transpose) ram_inputs.raddr = reg_current.raddr_tr; 
    if(raddr_select_bitrev) ram_inputs.raddr = reg_current.raddr_bitrev; 
    if(waddr_select_transpose) ram_inputs.waddr = reg_current.waddr_tr; 
    if(waddr_select_bitrev) ram_inputs.waddr = reg_current.waddr_bitrev; 
    
    if(waddr_select_transpose || waddr_select_bitrev) ram_inputs.wren = 1;
    
    reg_next.tr_out = tr_out;
    ram_inputs.wdata = reg_current.tr_out;
    
    bitRev_working = 0;
    if(reg_current.state_STATE_BITREVERSE || reg_current.state_STATE_BITREVERSE_WAIT|| waddr_select_bitrev) bitRev_working = 1;
    if(reg_current.state_STATE_TRANSPOSE || reg_current.state_STATE_TRANSPOSE_WAIT|| waddr_select_transpose) bitRev_working = 1;

    if(rstn == 0) begin
      reg_next.state_STATE_BITREVERSE = 0;      
      reg_next.state_STATE_BITREVERSE_WAIT = 0;      
      reg_next.state_STATE_TRANSPOSE = 0;      
      reg_next.state_STATE_TRANSPOSE_WAIT = 0;      
    end
  end
       
    
  always @ (posedge clk) begin  
    reg_current <= reg_next;
	end


endmodule
