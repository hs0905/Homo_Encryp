`timescale 1 ns / 1 ns

`include "defines.vh"
import FHE_ALU_PKG::*;

module VectorControl_Decomp #(
		parameter WIDTH     = logN-logE	
	) (	
		input logic	clk,		    		
		input logic rstn,	

    // input logic [logE-1:0] diff_logN,		////////////////////////////

    input logic start_vector,
    input logic [3:0] operation,
		output logic vector_working,

    input logic [FSIZE-1:0] p,
    input logic [FSIZE-1:0] pq0,
    // input logic [FSIZE-1:0] pq1,
    // input logic [FSIZE-1:0] scalar,

    output BufferRAMTEFsizeInputs ram_inputs_op1,
    // output BufferRAMTEFsizeInputs ram_inputs_op2,
    // output BufferRAMTEFsizeInputs ram_inputs_op3, //lazy reduction
    // output BufferRAMTEFsizeInputs ram_inputs_op4, //lazy reduction
    input logic [E*FSIZE-1:0] op1
    // input logic [E*FSIZE-1:0] op2,
    // input logic [E*FSIZE-1:0] op3, //lazy reduction
    // input logic [E*FSIZE-1:0] op4  //lazy reduction
  );
  
  localparam N_ITEMS = 1 << WIDTH;

  localparam VECTOR_SPLIT = 2;

  typedef struct packed {
    logic state_STATE_VECTOR_WAIT;
    logic state_STATE_VECTOR;

    // logic [logE-1:0] diff_logN;
    logic [3:0] operation;
    logic [FSIZE-1:0] p;
    logic [FSIZE-1:0] pq0;
    // logic [FSIZE-1:0] pq1,
    // logic [FSIZE-1:0] scalar,


    logic [E/VECTOR_SPLIT-1:0][FSIZE-1:0] rdata0;
    // logic [E/VECTOR_SPLIT-1:0][FSIZE-1:0] rdata1;
    // logic [E/VECTOR_SPLIT-1:0][FSIZE-1:0] rdata2; //lazy
    // logic [E/VECTOR_SPLIT-1:0][FSIZE-1:0] rdata3; //lazy
    logic wren;
    logic [WIDTH-1:0] waddr;
    logic [E-1:0][FSIZE-1:0] wdata1;
    // logic [E-1:0][FSIZE-1:0] wdata2;

    logic [WIDTH-1+$clog2(VECTOR_SPLIT):0] vector_load_idx;
    logic [WIDTH-1+$clog2(VECTOR_SPLIT):0] vector_store_idx;
    logic vector_last;
  } Registers;

  Registers reg_current,reg_next;

  // logic vector_mult_in_valid_in, vector_mult_in_valid;
  // FifoBuffer #(.DATA_SIZE(1), .CYCLES(BUFFER_READ_LATENCY+1) )  vector_mult_in_valid_fifo (.clk(clk), .rstn(1), .in(vector_mult_in_valid_in), .out(vector_mult_in_valid));

  // logic vector_barrett_in_valid_in, vector_barrett_in_valid;
  // FifoBuffer #(.DATA_SIZE(1), .CYCLES(BUFFER_READ_LATENCY+1) )  vector_barrett_in_valid_fifo (.clk(clk), .rstn(1), .in(vector_barrett_in_valid_in), .out(vector_barrett_in_valid));

  // //lazy
  // logic vector_lazy_in_valid_in, vector_lazy_in_valid;
  // FifoBuffer #(.DATA_SIZE(1), .CYCLES(BUFFER_READ_LATENCY+1) )  vector_lazy_in_valid_fifo (.clk(clk), .rstn(1), .in(vector_lazy_in_valid_in), .out(vector_lazy_in_valid));

  //decomp
  logic vector_decomp_in_valid_in, vector_decomp_in_valid;
  FifoBuffer #(.DATA_SIZE(1), .CYCLES(BUFFER_READ_LATENCY+1 + STAGE_MODULE_DELAY + STAGE_SLOT_DELAY + RING_ROUTER_DELAY) )  vector_decomp_in_valid_fifo (.clk(clk), .rstn(1), .in(vector_decomp_in_valid_in), .out(vector_decomp_in_valid));

  // logic vector_add_in_valid_in, vector_add_in_valid;
  // FifoBuffer #(.DATA_SIZE(1), .CYCLES(BUFFER_READ_LATENCY+1) )  vector_add_in_valid_fifo (.clk(clk), .rstn(1), .in(vector_add_in_valid_in), .out(vector_add_in_valid));

  logic vector_in_last_in, vector_in_last;
  FifoBuffer #(.DATA_SIZE(1), .CYCLES(BUFFER_READ_LATENCY+1 + STAGE_MODULE_DELAY + STAGE_SLOT_DELAY + RING_ROUTER_DELAY) )  vector_in_last_fifo (.clk(clk), .rstn(1), .in(vector_in_last_in), .out(vector_in_last));

  logic[$clog2(VECTOR_SPLIT)-1:0] read_split_id_in, read_split_id;
  FifoBuffer #(.DATA_SIZE($clog2(VECTOR_SPLIT)), .CYCLES(BUFFER_READ_LATENCY + STAGE_MODULE_DELAY + STAGE_SLOT_DELAY + RING_ROUTER_DELAY) )  read_split_id_fifo (.clk(clk), .rstn(1), .in(read_split_id_in), .out(read_split_id));

  logic wren_in, wren_out;
  FifoBuffer #(.DATA_SIZE(1), .CYCLES(1) )  wren_fifo (.clk(clk), .rstn(1), .in(wren_in), .out(wren_out));
  logic [WIDTH-1:0] waddr_in, waddr_out;
  FifoBuffer #(.DATA_SIZE(WIDTH), .CYCLES(1) )  waddr_fifo (.clk(clk), .rstn(1), .in(waddr_in), .out(waddr_out));

  //raddr_delay in module
  logic [logN-logE-1:0] op1_raddr_in, op1_raddr_out; 
  assign op1_raddr_out = op1_raddr_in;
  // FifoBuffer #(.DATA_SIZE(logN-logE), .CYCLES(BUFFER_READ_DELAY) )  op1_raddr_in_fifo (.clk(clk), .rstn(1), .in(op1_raddr_in), .out(op1_raddr_out));

  logic [E-1:0][FSIZE-1:0] wdata_in, wdata_out;
  genvar k;
  generate
    for(k = 0; k < E; k++) begin : wdata_fifo
      // FifoBuffer #(.DATA_SIZE(FSIZE), .CYCLES(BUFFER_WRITE_DELAY) ) wdata_fifo (.clk(clk), .rstn(1), .in(reg_current.wdata1[k]),.out(wdata_out[k]));
      assign wdata_out[k] = reg_current.wdata1[k];
    end
  endgenerate

  logic [E/VECTOR_SPLIT-1:0][FSIZE-1:0] vector_decomp_in_op1;
  logic [E/VECTOR_SPLIT-1:0][FSIZE-1:0] vector_decomp_out;
  logic [E/VECTOR_SPLIT-1:0] vector_decomp_out_valid;
  logic [E/VECTOR_SPLIT-1:0] vector_decomp_out_last;
 
  genvar gj,gk;
  generate  
  // for(gj = 0; gj < E/VECTOR_SPLIT; gj++) begin : blk_mult
  //   ElemMultiplier #(
  //     .ID(gj)
  //   ) mult(
  //     .clk(clk), 
  //     .rstn(1), 
  //     .in_valid(vector_mult_in_valid), 
  //     .in_last(vector_in_last), 
  //     .in_barrett(vector_barrett_in_valid),
  //     .op1(vector_mult_in_op1[gj]), 
  //     .op2(vector_mult_in_op2[gj]), 
  //     .p(reg_current.p),
  //     .pq0(reg_current.pq0),
  //     .pq1(reg_current.pq1),
  //     .out(vector_mult_out[gj]),
  //     .out_valid(vector_mult_out_valid[gj]),
  //     .out_last(vector_mult_out_last[gj])
  //   );
  // end

  // for(gj = 0; gj < E/VECTOR_SPLIT; gj++) begin : blk_add
  //   ElemAdder #(
  //     .ID(gj)
  //   ) add(
  //     .clk(clk), 
  //     .rstn(1), 
  //     .in_valid(vector_add_in_valid), 
  //     .in_last(vector_in_last), 
  //     .op1(vector_add_in_op1[gj]), 
  //     .op2(vector_add_in_op2[gj]), 
  //     .p(reg_current.p),
  //     .out(vector_add_out[gj]),
  //     .out_valid(vector_add_out_valid[gj]),
  //     .out_last(vector_add_out_last[gj])
  //   );
  // end

  // for(gj = 0; gj < E/VECTOR_SPLIT; gj++) begin : blk_lazy
  //   ElemLazy #(
  //     .ID(gj)
  //   ) lazy(
  //     .clk(clk), 
  //     .rstn(1), 
  //     .in_valid(vector_lazy_in_valid), 
  //     .in_last(vector_in_last), 
  //     .op1(vector_lazy_in_op1[gj]), 
  //     .op2(vector_lazy_in_op2[gj]), 
  //     .op3(vector_lazy_in_op3[gj]), 
  //     .op4(vector_lazy_in_op4[gj]), 
  //     .out1(vector_lazy_out1[gj]),
  //     .out2(vector_lazy_out2[gj]),
  //     .out_valid(vector_lazy_out_valid[gj]),
  //     .out_last(vector_lazy_out_last[gj])
  //   );
  // end

  for(gj = 0; gj < E/VECTOR_SPLIT; gj++) begin : blk_decomp
  ElemDecomp #(
    .ID(gj)
  ) decomp(
    .clk(clk), 
    .rstn(1), 
    .in_valid(vector_decomp_in_valid), 
    .in_last(vector_in_last), 
    .shift(reg_current.p), //shift -> p
    .decomp_bit_cnt(reg_current.pq0),  //decomp_bit_cnt -> pq0
    .op(vector_decomp_in_op1[gj]),
    .out(vector_decomp_out[gj]),
    .out_valid(vector_decomp_out_valid[gj]),
    .out_last(vector_decomp_out_last[gj])
  );
  end

  endgenerate


  always_comb begin
    reg_next = reg_current;

    ram_inputs_op1 = '{default:'0};
    // ram_inputs_op2 = '{default:'0};
    // ram_inputs_op3 = '{default:'0}; //lazy reduciont
    // ram_inputs_op4 = '{default:'0}; //lazy reduciont

    if(start_vector) begin
      reg_next.state_STATE_VECTOR = 1;
      reg_next.vector_load_idx = 0;
      reg_next.vector_store_idx = 0;

      // reg_next.diff_logN = diff_logN;
      reg_next.operation = operation;
      reg_next.p = p;
      reg_next.pq0 = pq0;
      // reg_next.pq1 = pq1;
      // reg_next.scalar =scalar;
    end

    // ram_inputs_op1.raddr = reg_current.vector_load_idx[WIDTH-1+$clog2(VECTOR_SPLIT):$clog2(VECTOR_SPLIT)];    //  ex) 15-13 -> 11 -1 => 10bit address
    op1_raddr_in = 0;    //  ex) 15-13 -> 11 -1 => 10bit address
    ram_inputs_op1.raddr = op1_raddr_out;

    // ram_inputs_op2.raddr = reg_current.vector_load_idx[WIDTH-1+$clog2(VECTOR_SPLIT):$clog2(VECTOR_SPLIT)];    
    // ram_inputs_op3.raddr = reg_current.vector_load_idx[WIDTH-1+$clog2(VECTOR_SPLIT):$clog2(VECTOR_SPLIT)]; //lazy reduction    
    // ram_inputs_op4.raddr = reg_current.vector_load_idx[WIDTH-1+$clog2(VECTOR_SPLIT):$clog2(VECTOR_SPLIT)]; //lazy reduction    

    read_split_id_in = 0;
    // vector_mult_in_valid_in = 0;
    // vector_add_in_valid_in = 0;
    // vector_barrett_in_valid_in = 0;
    // vector_lazy_in_valid_in = 0;     
    vector_decomp_in_valid_in = 0;  
    vector_in_last_in = 0;
    if(reg_current.state_STATE_VECTOR) begin
      // if(reg_current.operation == VECTOR_OPERATION_MULT || reg_current.operation == VECTOR_OPERATION_SCALAR_MULT || reg_current.operation == VECTOR_VECTOR_BARRETT_REDUCTION) begin
      //   vector_mult_in_valid_in = 1;         
      //   if(reg_current.operation == VECTOR_VECTOR_BARRETT_REDUCTION) vector_barrett_in_valid_in = 1;  
      // end
      // else if(reg_current.operation == VECTOR_OPERATION_ADD || reg_current.operation == VECTOR_OPERATION_SCALAR_ADD) begin
      //   vector_add_in_valid_in = 1;         
      // end
      // else if(reg_current.operation == VECTOR_OPERATION_LAZY_REDUCTION) begin //lazy reduction 
      //   vector_lazy_in_valid_in = 1;         
      // end
      if(reg_current.operation == VECTOR_OPERATION_DECOMP_REDUCTION) begin //decomp
        vector_decomp_in_valid_in = 1;         
      end

      reg_next.vector_load_idx = reg_current.vector_load_idx + 1;
      read_split_id_in = reg_current.vector_load_idx[$clog2(VECTOR_SPLIT)-1:0];
      op1_raddr_in = reg_current.vector_load_idx[WIDTH-1+$clog2(VECTOR_SPLIT):$clog2(VECTOR_SPLIT)];

      if(reg_current.vector_load_idx == ( ( 1 <<  (logN -logE +$clog2(VECTOR_SPLIT) - 2))-1 )) begin //logic [WIDTH-1+$clog2(VECTOR_SPLIT):0] vector_load_idx; [12 -1 + 1 : 0] [12:0] 13bit
                                  //(( 1 <<  (logN -logE +$clog2(VECTOR_SPLIT)))-1)
        vector_in_last_in = 1;
        reg_next.state_STATE_VECTOR = 0;
        reg_next.state_STATE_VECTOR_WAIT = 1;
      end
    end

    for(int i = 0; i < E/VECTOR_SPLIT; i ++) begin // 8/2 = 4
      for(int si = 0; si < VECTOR_SPLIT; si ++) begin // 2 
        if(si == read_split_id) begin
          reg_next.rdata0[i] = op1[(si*(E/VECTOR_SPLIT)+i)*FSIZE +: FSIZE];    
          // reg_next.rdata1[i] = op2[(si*(E/VECTOR_SPLIT)+i)*FSIZE +: FSIZE];  
          // reg_next.rdata2[i] = op3[(si*(E/VECTOR_SPLIT)+i)*FSIZE +: FSIZE]; //lazy   
          // reg_next.rdata3[i] = op4[(si*(E/VECTOR_SPLIT)+i)*FSIZE +: FSIZE]; //lazy        
        end
      end
      
      // vector_mult_in_op1[i] = reg_current.rdata0[i];
      // vector_mult_in_op2[i] = reg_current.rdata1[i];
      // if(reg_current.operation == VECTOR_OPERATION_SCALAR_MULT) 
      //   vector_mult_in_op2[i] = reg_current.scalar;

      // vector_add_in_op1[i] = reg_current.rdata0[i];
      // vector_add_in_op2[i] = reg_current.rdata1[i];
      // if(reg_current.operation == VECTOR_OPERATION_SCALAR_ADD) 
      //   vector_add_in_op2[i] = reg_current.scalar;

      // //lazy reduciton
      // vector_lazy_in_op1[i] = reg_current.rdata0[i];
      // vector_lazy_in_op2[i] = reg_current.rdata1[i];
      // vector_lazy_in_op3[i] = reg_current.rdata2[i];
      // vector_lazy_in_op4[i] = reg_current.rdata3[i];

      //decomp
      vector_decomp_in_op1[i] = reg_current.rdata0[i];

    end

    // reg_next.wren = 0;
    // reg_next.waddr = reg_current.vector_store_idx[WIDTH-1+$clog2(VECTOR_SPLIT):$clog2(VECTOR_SPLIT)];
    wren_in = 0;
    waddr_in = 0;
    if( ( reg_current.operation == VECTOR_OPERATION_DECOMP_REDUCTION) && vector_decomp_out_valid[0] )  begin
      // reg_next.wren = (reg_current.vector_store_idx[$clog2(VECTOR_SPLIT)-1:0] == '1 ) ? 1: 0;
      wren_in = (reg_current.vector_store_idx[$clog2(VECTOR_SPLIT)-1:0] == '1 ) ? 1: 0;
      reg_next.vector_store_idx = reg_current.vector_store_idx + 1;
      waddr_in = reg_current.vector_store_idx[WIDTH-1+$clog2(VECTOR_SPLIT):$clog2(VECTOR_SPLIT)];
    end
    reg_next.vector_last = 0;
    if( ( reg_current.operation == VECTOR_OPERATION_DECOMP_REDUCTION) && vector_decomp_out_last[0] )  begin
      reg_next.vector_last = 1;
    end

    // ram_inputs_op1.wren = reg_current.wren;    
    // ram_inputs_op1.waddr = reg_current.waddr;   
    ram_inputs_op1.wren = wren_out;    
    ram_inputs_op1.waddr = waddr_out;  
    for(int i = 0; i < E; i ++) begin
      ram_inputs_op1.wdata[i*FSIZE +: FSIZE] = wdata_out[i];//reg_current.wdata1
    end

    for(int i = 0; i < E/VECTOR_SPLIT; i ++) begin        
      for(int si = 0; si < VECTOR_SPLIT; si ++) begin
        // wdata_in[si*(E/VECTOR_SPLIT)+i] = 0;
        if(si == reg_current.vector_store_idx[$clog2(VECTOR_SPLIT)-1:0] ) begin
          // if( reg_current.operation == VECTOR_OPERATION_MULT || reg_current.operation == VECTOR_OPERATION_SCALAR_MULT || reg_current.operation == VECTOR_VECTOR_BARRETT_REDUCTION ) begin
          //   reg_next.wdata1[si*(E/VECTOR_SPLIT)+i] = vector_mult_out[i];   
          // end
          // else if( reg_current.operation == VECTOR_OPERATION_ADD || reg_current.operation == VECTOR_OPERATION_SCALAR_ADD  ) begin
          //   reg_next.wdata1[si*(E/VECTOR_SPLIT)+i] = vector_add_out[i];   
          // end
          // else if( reg_current.operation == VECTOR_OPERATION_LAZY_REDUCTION  ) begin  //lazy 
          //   reg_next.wdata1[si*(E/VECTOR_SPLIT)+i] = vector_lazy_out1[i];  
          //   reg_next.wdata2[si*(E/VECTOR_SPLIT)+i] = vector_lazy_out2[i]; 
          // end
          if( reg_current.operation == VECTOR_OPERATION_DECOMP_REDUCTION  ) begin  //decomp
            reg_next.wdata1[si*(E/VECTOR_SPLIT)+i] = vector_decomp_out[i]; //reg_next.wdata1  
          end
        end
      end
    end
    if(reg_current.vector_last) begin
      reg_next.state_STATE_VECTOR = 0;
      reg_next.state_STATE_VECTOR_WAIT = 0;
    end

    vector_working = 0;
    if( reg_current.state_STATE_VECTOR_WAIT  || reg_current.state_STATE_VECTOR || wren_out) vector_working = 1;

    if(rstn == 0) begin
      reg_next.state_STATE_VECTOR_WAIT = 0;      
      reg_next.state_STATE_VECTOR = 0;      
    end
  end
       
    
  always @ (posedge clk) begin  
    reg_current <= reg_next;
	end


endmodule
