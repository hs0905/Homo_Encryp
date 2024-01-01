`timescale 1 ns / 1 ns

`include "defines.vh"
import FHE_ALU_PKG::*;

module IdxComposeRev #(
		parameter WIDTH_H      = logN-1,
		parameter WIDTH_L      = logE-1
	) (	
    input logic   [$clog2(WIDTH_H+1)-1:0] h_bits,
    input logic   [WIDTH_H-1:0]           h,
    input logic   [$clog2(WIDTH_L+1)-1:0] l_bits,
    input logic   [WIDTH_L-1:0]           l,
    input logic   [$clog2(WIDTH_H+WIDTH_L+1)-1:0] out_bits,
    output logic  [WIDTH_H+WIDTH_L-1:0]   out
  );

  logic  [WIDTH_H+WIDTH_L-1:0]   out_h,out_l,out_r;

  always_comb begin
    out_l = ((1 << (l_bits)) -1) & l;
    out_h = (((1 << (h_bits)) -1) & h) << l_bits;
    out_r  = out_h | out_l;    

    for(int i = 0; i < out_bits; i ++) begin
      out[out_bits-1-i] = out_r[i];
    end
    for(int i = 0; i < WIDTH_H+WIDTH_L; i ++) begin
      if(i>=out_bits)
        out[i] = 0;
    end
  end
endmodule


module NTTControl_v2  (	
		input logic	clk,		    		
		input logic rstn,			

		input logic start_NTT,    
    input logic [FSIZE-1:0] p,
    input logic [(logE)-1:0] NTT_levels,
    input logic [(logN)-1:0] NTT_base_level,
    
    input logic [logE-1:0] diff_logN,

		output logic NTT_working,

    output BufferRAMTEFsizeInputs ram_inputs,
    input logic [E*FSIZE-1:0] ram_outputs_rdata,
    
    output logic [logE-1:0][$clog2(N/(E/2))-1:0] W_ram_raddr,
    input  logic [logE-1:0][E/2-1:0][FSIZE-1:0]  W_ram_rdata,
    input  logic [logE-1:0][E/2-1:0][FSIZE-1:0]  WQ_ram_rdata
  );

  typedef struct packed {
    logic [31:0] state;

    logic [logN-logE-1:0] load_idx;
    logic [logN-logE-1:0] store_idx;

    logic [(logE)-1:0] NTT_levels;
    logic [(logN)-1:0] NTT_base_level;
    logic [FSIZE-1:0] p;

    logic [logE-1:0] diff_logN;

    logic [logN-logE-1:0] load_idx_rev;

  } Registers;

  Registers reg_current,reg_next;

  localparam STATE_RUNNING = 1;
  localparam STATE_RUNNING_WAIT = 2;


  logic [FSIZE-1:0] butt_in[logE-1:0][E-1:0];
  logic [FSIZE-1:0] butt_out[logE-1:0][E-1:0];
  logic in_valid [logE-1:0][E/2-1:0];
  logic skip_level [logE-1:0];
  logic out_valid [logE-1:0][E/2-1:0];

  logic [FSIZE*E-1:0] butt_out_flat[logE-1:0];

  logic wren_in, wren_out;
  assign wren_out = wren_in;
  // FifoBuffer #(.DATA_SIZE(1), .CYCLES(BUFFER_WRITE_DELAY) )  wren_fifo (.clk(clk), .rstn(1), .in(wren_in), .out(wren_out));

  logic [logN-logE-1:0] waddr_in, waddr_out;
  assign waddr_out = waddr_in;
  // FifoBuffer #(.DATA_SIZE(logN-logE), .CYCLES(BUFFER_WRITE_DELAY) )  waddr_fifo (.clk(clk), .rstn(1), .in(waddr_in), .out(waddr_out));

  logic [FSIZE*E-1:0] butt_out_flat_in,butt_out_flat_out;
  assign butt_out_flat_out = butt_out_flat_in;
  // FifoBuffer #(.DATA_SIZE(FSIZE*E), .CYCLES(BUFFER_WRITE_DELAY) )  butt_fifo (.clk(clk), .rstn(1), .in(butt_out_flat_in), .out(butt_out_flat_out));

  logic in_valid_s_in, in_valid_s;
  FifoBuffer #(.DATA_SIZE(1), .CYCLES(1+BUFFER_READ_LATENCY+1 + STAGE_MODULE_DELAY + STAGE_SLOT_DELAY + RING_ROUTER_DELAY) )  in_valid_s_fifo (.clk(clk), .rstn(1), .in(in_valid_s_in), .out(in_valid_s));
  
  logic [logN-logE-1:0] raddr_in, raddr_out; 
  assign raddr_out = raddr_in;
  // FifoBuffer #(.DATA_SIZE(logN-logE), .CYCLES(BUFFER_READ_DELAY) )  raddr_in_fifo (.clk(clk), .rstn(1), .in(raddr_in), .out(raddr_out));


  logic [logN-logE-1:0] load_idx_rev;
  BitReverser #(.WIDTH(logN-logE))  load_idx_reverse (.in(reg_current.load_idx), .out(load_idx_rev));
  logic [logN-logE-1:0] store_idx_rev;//store_idx_rev_delayed
  BitReverser #(.WIDTH(logN-logE))  store_idx_reverse (.in(reg_current.store_idx), .out(store_idx_rev));
  // FifoBuffer #(.DATA_SIZE(logN-logE), .CYCLES(BUFFER_WRITE_DELAY) )  store_idx_rev_fifo (.clk(clk), .rstn(1), .in(store_idx_rev), .out(store_idx_rev_delayed));
    
  logic [logN-logE-1:0] gap_idx_reverse_base;
  logic [logE-1:0][logN-logE-1:0] gap_idx_reverse_base_delay;
  logic [logE-1:0][logN-logE-1:0] a_gap_idx_reverse_base_delay;
  logic [logE-1:0][logN-logE-1:0] a_gap_idx_reverse_base_delay_skip;
  FifoBuffer #(.DATA_SIZE(logN-logE), .CYCLES(1+BUFFER_READ_LATENCY+1) )  gap_idx_delay_fifo (.clk(clk), .rstn(1), .in(gap_idx_reverse_base), .out(gap_idx_reverse_base_delay[0]));
  logic [logN-logE-1:0] chunk_idx_reverse_base;
  logic [logE-1:0][logN-logE-1:0] chunk_idx_reverse_base_delay;
  logic [logE-1:0][logN-logE-1:0] a_chunk_idx_reverse_base_delay;
  logic [logE-1:0][logN-logE-1:0] a_chunk_idx_reverse_base_delay_skip;
  FifoBuffer #(.DATA_SIZE(logN-logE), .CYCLES(1+BUFFER_READ_LATENCY+1) )  chunk_idx_delay_fifo (.clk(clk), .rstn(1), .in(chunk_idx_reverse_base), .out(chunk_idx_reverse_base_delay[0]));
  
  logic [$clog2(N/(E/2))-1:0] W_ram_raddr_0_in;
  FifoBuffer #(.DATA_SIZE($clog2(N/(E/2))), .CYCLES(1 + STAGE_MODULE_DELAY + STAGE_SLOT_DELAY - (STAGE_NTT_INTT_DELAY + STAGE_ROOT_POWER_DELAY) + RING_ROUTER_DELAY) )              W_ram_raddr_0_fifo  (.clk(clk), .rstn(1), .in(W_ram_raddr_0_in), .out(W_ram_raddr[0]));


  logic [logN-logE-1:0] chunk_idx_base;
  BitReverser #(.WIDTH(logN-logE))  chunk_idx_reverse (.in(chunk_idx_reverse_base), .out(chunk_idx_base));  

  genvar gi,gj,gk;
  generate

  for(gi = 0; gi < logE-1; gi++) begin : gap_idx_rev_delay_fifo_gen
    FifoBuffer #(.DATA_SIZE(logN-logE), .CYCLES(BUTTER_CYCLES_60) )  gap_idx_rev_delay_fifo       (.clk(clk), .rstn(1), .in(gap_idx_reverse_base_delay[gi]),   .out(a_gap_idx_reverse_base_delay[gi+1]));
    FifoBuffer #(.DATA_SIZE(logN-logE), .CYCLES(1) )              gap_idx_rev_skipdelay_fifo   (.clk(clk), .rstn(1), .in(gap_idx_reverse_base_delay[gi]),   .out(a_gap_idx_reverse_base_delay_skip[gi+1]));
    FifoBuffer #(.DATA_SIZE(logN-logE), .CYCLES(BUTTER_CYCLES_60) )  chunk_idx_rev_delay_fifo     (.clk(clk), .rstn(1), .in(chunk_idx_reverse_base_delay[gi]), .out(a_chunk_idx_reverse_base_delay[gi+1]));
    FifoBuffer #(.DATA_SIZE(logN-logE), .CYCLES(1) )              chunk_idx_rev_skipdelay_fifo (.clk(clk), .rstn(1), .in(chunk_idx_reverse_base_delay[gi]), .out(a_chunk_idx_reverse_base_delay_skip[gi+1]));
    assign gap_idx_reverse_base_delay[gi+1] = skip_level[gi] ?  a_gap_idx_reverse_base_delay_skip[gi+1] : a_gap_idx_reverse_base_delay[gi+1];
    assign chunk_idx_reverse_base_delay[gi+1] = skip_level[gi] ?  a_chunk_idx_reverse_base_delay_skip[gi+1] : a_chunk_idx_reverse_base_delay[gi+1];
  end

  
  logic [logE-1:0][$clog2(N/(E/2))-1:0] a_W_ram_raddr_delay;
  logic [logE-1:0][$clog2(N/(E/2))-1:0] a_W_ram_raddr_delay_skip;
  
  

  for(gi = 0; gi < logE-1; gi++) begin
    FifoBuffer #(.DATA_SIZE($clog2(N/(E/2))), .CYCLES(BUTTER_CYCLES_60) )  W_ram_raddr_delay_fifo      (.clk(clk), .rstn(1), .in(W_ram_raddr[gi]), .out(a_W_ram_raddr_delay[gi+1]));
    FifoBuffer #(.DATA_SIZE($clog2(N/(E/2))), .CYCLES(1) )              W_ram_raddr_skip_delayfifo  (.clk(clk), .rstn(1), .in(W_ram_raddr[gi]), .out(a_W_ram_raddr_delay_skip[gi+1]));
    assign W_ram_raddr[gi+1] = skip_level[gi] ?  a_W_ram_raddr_delay_skip[gi+1] : a_W_ram_raddr_delay[gi+1];
  end
  

  for(gi = 0; gi < logE; gi++) begin : blk1
    logic [(logN)-1:0] level;
    assign level = reg_current.NTT_base_level + (gi+reg_current.NTT_levels-logE); // level offset = (gi-logE+NTT_levels)
    logic [logN-1:0] gap_size;
    assign gap_size = 1 << (logN -1 - level );               //gap size :  1 << (logN-level-1)
   
    for(gj = 0; gj < E/2; gj++) begin : blk2
      
      //for verification
      logic [logE-2:0] rev_gj;
      BitReverser #(.WIDTH(logE-1))  rev_gj_reverse (.in(gj), .out(rev_gj));

      logic [logN-2:0] gap_idx;
      IdxComposeRev #(.WIDTH_H(logN-logE),.WIDTH_L(logE-1))  gap_idx_compose (
            .h_bits(logN-logE-reg_current.NTT_base_level), 
            .h(gap_idx_reverse_base_delay[gi]), 
            .l_bits(logE-1-gi), 
            .l(gj>>gi), 
            .out_bits(logN-reg_current.NTT_base_level-gi-1),
            .out(gap_idx)
          );


      logic [logN-2:0] chunk_idx;
      IdxComposeRev #(.WIDTH_H(logE-1),.WIDTH_L(logN-logE))  chunk_idx_compose (
            .h_bits(gi), 
            .h(rev_gj >> (logE-1-gi)), 
            .l_bits(reg_current.NTT_base_level-(logE-reg_current.NTT_levels)), 
            .l(chunk_idx_reverse_base_delay[gi]), 
            .out_bits(reg_current.NTT_base_level-(logE-reg_current.NTT_levels)+gi),
            .out(chunk_idx)
          );

      // dummy_butt #(
      butt #(
        .LEVEL_OFFSET(gi),
        .BUTT_ID(gj),
        .FSIZE(FSIZE_60),
        .MULT_CYCLES(MULT_CYCLES_60)
      )
      butt (
        .clk(clk), 
        .rstn(1), 
        .in_valid(in_valid[gi][gj]), 
        .skip_level(skip_level[gi]), 
        .a(butt_in[gi][gj*2+0][FSIZE_60-1:0]), //[FSIZE_60-1:0]
        .b(butt_in[gi][gj*2+1][FSIZE_60-1:0]), 
        .p(reg_current.p[FSIZE_60-1:0]),
        .W(W_ram_rdata_delayed[gi][gj & ( (1<<gi) -1 ) ]),
        .WQ(WQ_ram_rdata_delayed[gi][gj & ( (1<<gi) -1 ) ]),
        .a_out(butt_out[gi][gj*2+0]), 
        .b_out(butt_out[gi][gj*2+1]), 
        .out_valid(out_valid[gi][gj])        
        
        //for verification
        ,
        .NTT_level( level ), 
        .chunk_idx( chunk_idx ),  
        .num_chunk( 1 << level ),                                           //num chunks : 1 << level // increasing
        .gap_idx( gap_idx ),
        .gap_size(  gap_size ),                                             
        .x(  gap_size * chunk_idx * 2 + gap_idx ),                                             
        .y(  gap_size * chunk_idx * 2 + gap_idx + gap_size ),                                             
        .root_idx((1 << level) + chunk_idx)    //(1 << level) + chunk_idx
      );    
    end
  end

  logic [E*FSIZE-1:0] ram_outputs_rdata_delayed;
  FifoBuffer #(.DATA_SIZE(E*FSIZE), .CYCLES(1) ) ram_outputs_rdata_fifo (.clk(clk), .rstn(1), .in(ram_outputs_rdata), .out(ram_outputs_rdata_delayed));
  logic [logE-1:0][E/2-1:0][FSIZE-1:0]  W_ram_rdata_delayed;
  logic [logE-1:0][E/2-1:0][FSIZE-1:0]  WQ_ram_rdata_delayed;
  for(gi = 0; gi < logE; gi++) begin: gen_W_ram_rdata_delayed_logE;
    for(gj = 0; gj < E/2; gj++) begin: gen_W_ram_rdata_delayed_E;
      FifoBuffer #(.DATA_SIZE(FSIZE), .CYCLES(1) ) W_ram_rdata_fifo (.clk(clk), .rstn(1), .in(W_ram_rdata[gi][gj]), .out(W_ram_rdata_delayed[gi][gj]));
      FifoBuffer #(.DATA_SIZE(FSIZE), .CYCLES(1) ) WQ_ram_rdata_fifo (.clk(clk), .rstn(1), .in(WQ_ram_rdata[gi][gj]), .out(WQ_ram_rdata_delayed[gi][gj]));
    end
  end

  for(gj = 0; gj < E; gj++) begin
    assign butt_in[0][gj] = ram_outputs_rdata_delayed[FSIZE*gj +: FSIZE];
  end

  for(gi = 1; gi < logE; gi++) begin
    for(gj = 0; gj < (1<<gi); gj++) begin
      for(gk = 0; gk < (1<<(logE-gi-1)); gk++) begin
        assign butt_in[gi][ (gk << (gi+1))| gj << 1 | 0 ]  = butt_out [gi-1][  (gk << (gi+1)) | (0<<gi) | gj ];
        assign butt_in[gi][ (gk << (gi+1))| gj << 1 | 1 ]  = butt_out [gi-1][  (gk << (gi+1)) | (1<<gi) | gj ];
      end
    end
  end

  // logic [logE-1:0] rev_gj[E-1:0];
  // for(gj = 0; gj < E; gj++) begin
  //   logic [logE-1:0] rev_gj;
  //   BitReverser #(.WIDTH(logE))  rev_gj_reverse (.in(gj), .out(rev_gj));
  //   assign butt_out_flat[logE-1][FSIZE*rev_gj +: FSIZE] = butt_out[logE-1][gj];
  // end

  // assign ram_inputs.wdata = butt_out_flat[logE-1];

  assign butt_out_flat_in[FSIZE*0 +: FSIZE] = butt_out[2][0];
  assign butt_out_flat_in[FSIZE*4 +: FSIZE] = butt_out[2][1];
  assign butt_out_flat_in[FSIZE*2 +: FSIZE] = butt_out[2][2];
  assign butt_out_flat_in[FSIZE*6 +: FSIZE] = butt_out[2][3];
  assign butt_out_flat_in[FSIZE*1 +: FSIZE] = butt_out[2][4];
  assign butt_out_flat_in[FSIZE*5 +: FSIZE] = butt_out[2][5];
  assign butt_out_flat_in[FSIZE*3 +: FSIZE] = butt_out[2][6];
  assign butt_out_flat_in[FSIZE*7 +: FSIZE] = butt_out[2][7];

  assign ram_inputs.wdata = butt_out_flat_out;

  
  for(gj = 0; gj < E/2; gj++) begin
    assign in_valid[0][gj] = in_valid_s;
  end
  for(gi = 1; gi < logE; gi++) begin
    for(gj = 0; gj < E/2; gj++) begin
      assign in_valid[gi][gj] = out_valid[gi-1][0] ;
    end
    assign skip_level[gi] = gi < (logE - reg_current.NTT_levels) ; 
  end
  for(gi = 0; gi < logE; gi++) begin
    assign skip_level[gi] = gi < (logE - reg_current.NTT_levels) ; 
  end
 
  logic out_valid_s;
  assign out_valid_s = out_valid[logE-1][0];
  endgenerate

  logic [$clog2(N/(E/2))-1:0] W_ram_raddr_pattern;
  logic [$clog2(N/(E/2))-1:0] W_ram_raddr_pattern_mask;

  always_comb begin
    reg_next = reg_current;

    ram_inputs.raddr = '0;
    ram_inputs.waddr = '0;
    ram_inputs.wren = '0;
    // ram_inputs.wdata = '0;


    if(start_NTT) begin        
      reg_next.state = STATE_RUNNING;
      reg_next.load_idx = 0;
      reg_next.store_idx = 0;      
      
      reg_next.NTT_levels = NTT_levels;      
      reg_next.NTT_base_level = NTT_base_level;      
      reg_next.p = p;

      reg_next.diff_logN = diff_logN;
    end

    in_valid_s_in = 0;
    if(reg_current.state == STATE_RUNNING) begin
      reg_next.load_idx = reg_current.load_idx +1;
      in_valid_s_in = 1;
      if(reg_current.load_idx == ((N/E) >> reg_current.diff_logN)-1) begin /////////////////////////////////////////////
        reg_next.load_idx = 0;
        reg_next.state = STATE_RUNNING_WAIT;
      end

      gap_idx_reverse_base = (load_idx_rev >> reg_current.diff_logN) >> (reg_current.NTT_base_level - logE + reg_current.NTT_levels); /////////////////////////////////////////////// [logN-logE-1:0] -> [logN-logE-1:reg_current.NTT_base_level]
      chunk_idx_reverse_base = (load_idx_rev >> reg_current.diff_logN) & ( (1 << (reg_current.NTT_base_level - logE + reg_current.NTT_levels)) -1)  ; /////////////////////////////////////////////// [logN-logE-1:0] -> [reg_current.NTT_base_level-1:0]


      // if($time()%2 == 1)
      //   $display("NTT_levels:%d base level:%d gap_idx_reverse_base:%d chunk_idx_reverse_base:%d"
      //         ,reg_current.NTT_levels
      //         ,reg_current.NTT_base_level
      //         ,gap_idx_reverse_base
      //         ,chunk_idx_reverse_base
      //         );//,offset,x,y,root_idx);

    end
    reg_next.load_idx_rev = load_idx_rev >> reg_current.diff_logN;/////////////////////////////////////////////
    // ram_inputs.raddr = reg_current.load_idx_rev;
    raddr_in = reg_current.load_idx_rev;
    ram_inputs.raddr = raddr_out;
    
    W_ram_raddr_pattern = 0;
    for(int i = 0; i < logN-logE ;i += logE) begin
      W_ram_raddr_pattern = W_ram_raddr_pattern << logE;
      W_ram_raddr_pattern = W_ram_raddr_pattern | 1'b1;
    end
    // W_ram_raddr_pattern = 'b001001001001001001001001; //? 1 should apper every 
    W_ram_raddr_pattern_mask  = ((1 << (reg_current.NTT_base_level - logE + reg_current.NTT_levels)) -1 );
    W_ram_raddr_0_in = (W_ram_raddr_pattern  & W_ram_raddr_pattern_mask) + ((chunk_idx_base >> reg_current.diff_logN)  >> (logN -reg_current.diff_logN -logE - reg_current.NTT_base_level + logE - reg_current.NTT_levels)); /////////////////////////////////////////////

    ram_inputs.wren = wren_out;
    ram_inputs.waddr = waddr_out;
    wren_in = 0;
    if(out_valid_s) begin
      reg_next.store_idx = reg_current.store_idx +1;
      if(reg_current.store_idx == ((N/E) >> reg_current.diff_logN)-1) begin /////////////////////////////////////////////
        reg_next.store_idx = 0;
        reg_next.state = STATE_IDLE;
      end       
      // ram_inputs.wren = 1;
      wren_in = 1;
    end
    waddr_in = store_idx_rev >> reg_current.diff_logN; /////////////////////////////////////////////
    
    NTT_working = 0;
    if(reg_current.state==STATE_RUNNING || reg_current.state==STATE_RUNNING_WAIT || wren_out) NTT_working = 1;

    if(rstn == 0) begin
      reg_next.state = STATE_IDLE;      
    end
  end
       
    
  always @ (posedge clk) begin  
    reg_current <= reg_next;
	end


endmodule
