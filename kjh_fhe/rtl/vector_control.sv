`timescale 1 ns / 1 ns

`include "defines.vh"
import FHE_ALU_PKG::*;

module VectorControl #(
		parameter WIDTH     = logN-logE	
	) (	
		input logic	clk,		    		
		input logic rstn,			

    input logic start_vector,
    input logic [3:0] operation,
		output logic vector_working,

    input logic [FSIZE-1:0] p,
    input logic [FSIZE-1:0] pq0,
    input logic [FSIZE-1:0] pq1,
    input logic [FSIZE-1:0] scalar,

    output BufferRAMTEFsizeInputs ram_inputs_op1,
    output BufferRAMTEFsizeInputs ram_inputs_op2,
    output BufferRAMTEFsizeInputs ram_inputs_op3,
    output BufferRAMTEFsizeInputs ram_inputs_op4,
    input logic [E*FSIZE-1:0] op1,
    input logic [E*FSIZE-1:0] op2,
    input logic [E*FSIZE-1:0] op3,
    input logic [E*FSIZE-1:0] op4
  );
  
  localparam N_ITEMS = 1 << WIDTH;

  localparam VECTOR_SPLIT = 2;

  typedef struct packed {
    logic state_STATE_VECTOR_WAIT;
    logic state_STATE_VECTOR;

    logic [E/VECTOR_SPLIT-1:0][FSIZE-1:0] rdata0;
    logic [E/VECTOR_SPLIT-1:0][FSIZE-1:0] rdata1;
    logic [E/VECTOR_SPLIT-1:0][FSIZE-1:0] rdata2; //lazy
    logic [E/VECTOR_SPLIT-1:0][FSIZE-1:0] rdata3; //lazy
    logic wren;
    logic [WIDTH-1:0] waddr;
    logic [E-1:0][FSIZE-1:0] wdata1;
    logic [E-1:0][FSIZE-1:0] wdata2;

    logic [WIDTH-1+$clog2(VECTOR_SPLIT):0] vector_load_idx;
    logic [WIDTH-1+$clog2(VECTOR_SPLIT):0] vector_store_idx;
    logic vector_last;
  } Registers;

  Registers reg_current,reg_next;

  logic vector_mult_in_valid_in, vector_mult_in_valid;
  FifoBuffer #(.DATA_SIZE(1), .CYCLES(BUFFER_READ_LATENCY+1) )  vector_mult_in_valid_fifo (.clk(clk), .rstn(1), .in(vector_mult_in_valid_in), .out(vector_mult_in_valid));

  logic vector_barrett_in_valid_in, vector_barrett_in_valid;
  FifoBuffer #(.DATA_SIZE(1), .CYCLES(BUFFER_READ_LATENCY+1) )  vector_barrett_in_valid_fifo (.clk(clk), .rstn(1), .in(vector_barrett_in_valid_in), .out(vector_barrett_in_valid));

  //lazy
  logic vector_lazy_in_valid_in, vector_lazy_in_valid;
  FifoBuffer #(.DATA_SIZE(1), .CYCLES(BUFFER_READ_LATENCY+1) )  vector_lazy_in_valid_fifo (.clk(clk), .rstn(1), .in(vector_lazy_in_valid_in), .out(vector_lazy_in_valid));

  //decomp
  logic vector_decomp_in_valid_in, vector_decomp_in_valid;
  FifoBuffer #(.DATA_SIZE(1), .CYCLES(BUFFER_READ_LATENCY+1) )  vector_decomp_in_valid_fifo (.clk(clk), .rstn(1), .in(vector_decomp_in_valid_in), .out(vector_decomp_in_valid));

  logic vector_add_in_valid_in, vector_add_in_valid;
  FifoBuffer #(.DATA_SIZE(1), .CYCLES(BUFFER_READ_LATENCY+1) )  vector_add_in_valid_fifo (.clk(clk), .rstn(1), .in(vector_add_in_valid_in), .out(vector_add_in_valid));

  logic vector_in_last_in, vector_in_last;
  FifoBuffer #(.DATA_SIZE(1), .CYCLES(BUFFER_READ_LATENCY+1) )  vector_in_last_fifo (.clk(clk), .rstn(1), .in(vector_in_last_in), .out(vector_in_last));

  logic[$clog2(VECTOR_SPLIT)-1:0] read_split_id_in, read_split_id;
  FifoBuffer #(.DATA_SIZE($clog2(VECTOR_SPLIT)), .CYCLES(BUFFER_READ_LATENCY) )  read_split_id_fifo (.clk(clk), .rstn(1), .in(read_split_id_in), .out(read_split_id));

  logic [E/VECTOR_SPLIT-1:0][FSIZE-1:0] vector_mult_in_op1;
  logic [E/VECTOR_SPLIT-1:0][FSIZE-1:0] vector_mult_in_op2;
  logic [E/VECTOR_SPLIT-1:0][FSIZE-1:0] vector_mult_out;
  logic [E/VECTOR_SPLIT-1:0] vector_mult_out_valid;
  logic [E/VECTOR_SPLIT-1:0] vector_mult_out_last;
 
  logic [E/VECTOR_SPLIT-1:0][FSIZE-1:0] vector_add_in_op1;
  logic [E/VECTOR_SPLIT-1:0][FSIZE-1:0] vector_add_in_op2;
  logic [E/VECTOR_SPLIT-1:0][FSIZE-1:0] vector_add_out;
  logic [E/VECTOR_SPLIT-1:0] vector_add_out_valid;
  logic [E/VECTOR_SPLIT-1:0] vector_add_out_last;

  logic [E/VECTOR_SPLIT-1:0][FSIZE-1:0] vector_lazy_in_op1;
  logic [E/VECTOR_SPLIT-1:0][FSIZE-1:0] vector_lazy_in_op2;
  logic [E/VECTOR_SPLIT-1:0][FSIZE-1:0] vector_lazy_in_op3;
  logic [E/VECTOR_SPLIT-1:0][FSIZE-1:0] vector_lazy_in_op4;
  logic [E/VECTOR_SPLIT-1:0][FSIZE-1:0] vector_lazy_out1;
  logic [E/VECTOR_SPLIT-1:0][FSIZE-1:0] vector_lazy_out2;
  logic [E/VECTOR_SPLIT-1:0] vector_lazy_out_valid;
  logic [E/VECTOR_SPLIT-1:0] vector_lazy_out_last;

  logic [E/VECTOR_SPLIT-1:0][FSIZE-1:0] vector_decomp_in_op1;
  logic [E/VECTOR_SPLIT-1:0][FSIZE-1:0] vector_decomp_out;
  logic [E/VECTOR_SPLIT-1:0] vector_decomp_out_valid;
  logic [E/VECTOR_SPLIT-1:0] vector_decomp_out_last;
 
  genvar gi,gj,gk;
  generate  
  for(gj = 0; gj < E/VECTOR_SPLIT; gj++) begin : blk_mult
    ElemMultiplier #(
      .ID(gj)
    ) mult(
      .clk(clk), 
      .rstn(1), 
      .in_valid(vector_mult_in_valid), 
      .in_last(vector_in_last), 
      .in_barrett(vector_barrett_in_valid),
      .op1(vector_mult_in_op1[gj]), 
      .op2(vector_mult_in_op2[gj]), 
      .p(p),
      .pq0(pq0),
      .pq1(pq1),
      .out(vector_mult_out[gj]),
      .out_valid(vector_mult_out_valid[gj]),
      .out_last(vector_mult_out_last[gj])
    );
  end

  for(gj = 0; gj < E/VECTOR_SPLIT; gj++) begin : blk_add
    ElemAdder #(
      .ID(gj)
    ) add(
      .clk(clk), 
      .rstn(1), 
      .in_valid(vector_add_in_valid), 
      .in_last(vector_in_last), 
      .op1(vector_add_in_op1[gj]), 
      .op2(vector_add_in_op2[gj]), 
      .p(p),
      .out(vector_add_out[gj]),
      .out_valid(vector_add_out_valid[gj]),
      .out_last(vector_add_out_last[gj])
    );
  end

  for(gj = 0; gj < E/VECTOR_SPLIT; gj++) begin : blk_lazy
    ElemLazy #(
      .ID(gj)
    ) lazy(
      .clk(clk), 
      .rstn(1), 
      .in_valid(vector_lazy_in_valid), 
      .in_last(vector_in_last), 
      .op1(vector_lazy_in_op1[gj]), 
      .op2(vector_lazy_in_op2[gj]), 
      .op3(vector_lazy_in_op3[gj]), 
      .op4(vector_lazy_in_op4[gj]), 
      .out1(vector_lazy_out1[gj]),
      .out2(vector_lazy_out2[gj]),
      .out_valid(vector_lazy_out_valid[gj]),
      .out_last(vector_lazy_out_last[gj])
    );
  end

  for(gj = 0; gj < E/VECTOR_SPLIT; gj++) begin : blk_decomp
    ElemDecomp #(
      .ID(gj)
    ) decomp(
      .clk(clk), 
      .rstn(1), 
      .in_valid(vector_decomp_in_valid), 
      .in_last(vector_in_last), 
      .shift(p), //shift -> p
      .decomp_bit_cnt(pq0),  //decomp_bit_cnt -> pq0
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
    ram_inputs_op2 = '{default:'0};
    ram_inputs_op3 = '{default:'0}; //lazy reduciont
    ram_inputs_op4 = '{default:'0}; //lazy reduciont

    if(start_vector) begin
      reg_next.state_STATE_VECTOR = 1;
      reg_next.vector_load_idx = 0;
      reg_next.vector_store_idx = 0;
    end

    //load -> raddr
    ram_inputs_op1.raddr = reg_current.vector_load_idx[WIDTH-1+$clog2(VECTOR_SPLIT):$clog2(VECTOR_SPLIT)];    
    ram_inputs_op2.raddr = reg_current.vector_load_idx[WIDTH-1+$clog2(VECTOR_SPLIT):$clog2(VECTOR_SPLIT)];    
    ram_inputs_op3.raddr = reg_current.vector_load_idx[WIDTH-1+$clog2(VECTOR_SPLIT):$clog2(VECTOR_SPLIT)]; //lazy reduction    
    ram_inputs_op4.raddr = reg_current.vector_load_idx[WIDTH-1+$clog2(VECTOR_SPLIT):$clog2(VECTOR_SPLIT)]; //lazy reduction    
    read_split_id_in = reg_current.vector_load_idx[$clog2(VECTOR_SPLIT)-1:0];
    vector_mult_in_valid_in = 0;
    vector_add_in_valid_in = 0;
    vector_barrett_in_valid_in = 0;
    vector_lazy_in_valid_in = 0;    
    vector_decomp_in_valid_in = 0;  
    vector_in_last_in = 0;
    if(reg_current.state_STATE_VECTOR) begin
      if(operation == VECTOR_OPERATION_MULT || operation == VECTOR_OPERATION_SCALAR_MULT || operation == VECTOR_VECTOR_BARRETT_REDUCTION ) begin
        vector_mult_in_valid_in = 1;
        if(operation == VECTOR_VECTOR_BARRETT_REDUCTION) vector_barrett_in_valid_in = 1;        
      end

      else if(operation == VECTOR_OPERATION_ADD || operation == VECTOR_OPERATION_SCALAR_ADD) begin
        vector_add_in_valid_in = 1;         
      end

      else if(operation == VECTOR_OPERATION_LAZY_REDUCTION) begin //lazy reduction 
        vector_lazy_in_valid_in = 1;         
      end

      else if(operation == VECTOR_OPERATION_DECOMP_REDUCTION) begin //lazy reduction 
        vector_decomp_in_valid_in = 1;         
      end

      reg_next.vector_load_idx = reg_current.vector_load_idx + 1;
      if(reg_current.vector_load_idx == '1) begin
        vector_in_last_in = 1;
        reg_next.state_STATE_VECTOR = 0;
        reg_next.state_STATE_VECTOR_WAIT = 1;
      end
    end

    for(int i = 0; i < E/VECTOR_SPLIT; i ++) begin
      for(int si = 0; si < VECTOR_SPLIT; si ++) begin
        if(si == read_split_id) begin
          reg_next.rdata0[i] = op1[(si*(E/VECTOR_SPLIT)+i)*FSIZE +: FSIZE];    
          reg_next.rdata1[i] = op2[(si*(E/VECTOR_SPLIT)+i)*FSIZE +: FSIZE];
          reg_next.rdata2[i] = op3[(si*(E/VECTOR_SPLIT)+i)*FSIZE +: FSIZE];    
          reg_next.rdata3[i] = op4[(si*(E/VECTOR_SPLIT)+i)*FSIZE +: FSIZE];       
        end
      end
      
      vector_mult_in_op1[i] = reg_current.rdata0[i];
      vector_mult_in_op2[i] = reg_current.rdata1[i];
      if(operation == VECTOR_OPERATION_SCALAR_MULT) 
        vector_mult_in_op2[i] = scalar;

      vector_add_in_op1[i] = reg_current.rdata0[i];
      vector_add_in_op2[i] = reg_current.rdata1[i];
      if(operation == VECTOR_OPERATION_SCALAR_ADD) 
        vector_add_in_op2[i] = scalar;

      //lazy reduciton
      vector_lazy_in_op1[i] = reg_current.rdata0[i];
      vector_lazy_in_op2[i] = reg_current.rdata1[i];
      vector_lazy_in_op3[i] = reg_current.rdata2[i];
      vector_lazy_in_op4[i] = reg_current.rdata3[i];

      vector_decomp_in_op1[i] = reg_current.rdata0[i];
    end

    //store -> wren, waddr, wdata1, wdata2
    reg_next.wren = 0;
    reg_next.waddr = reg_current.vector_store_idx[WIDTH-1+$clog2(VECTOR_SPLIT):$clog2(VECTOR_SPLIT)];
    if( ( ( operation == VECTOR_OPERATION_MULT || operation == VECTOR_OPERATION_SCALAR_MULT || operation == VECTOR_VECTOR_BARRETT_REDUCTION ) && vector_mult_out_valid[0])
        || ( ( operation == VECTOR_OPERATION_ADD || operation == VECTOR_OPERATION_SCALAR_ADD  ) && vector_add_out_valid[0])
        || ( ( operation == VECTOR_OPERATION_LAZY_REDUCTION) && vector_lazy_out_valid[0])
        || ( ( operation == VECTOR_OPERATION_DECOMP_REDUCTION) && vector_decomp_out_valid[0])
        )  begin
      reg_next.wren = (reg_current.vector_store_idx[$clog2(VECTOR_SPLIT)-1:0] == '1 ) ? 1: 0;
      reg_next.vector_store_idx = reg_current.vector_store_idx + 1;
    end
    reg_next.vector_last = 0;
    if( (( operation == VECTOR_OPERATION_MULT || operation == VECTOR_OPERATION_SCALAR_MULT || operation == VECTOR_VECTOR_BARRETT_REDUCTION ) && vector_mult_out_last[0])
         || (( operation == VECTOR_OPERATION_ADD || operation == VECTOR_OPERATION_SCALAR_ADD  ) && vector_add_out_last[0])
         || ( ( operation == VECTOR_OPERATION_LAZY_REDUCTION) && vector_lazy_out_last[0])
         || ( ( operation == VECTOR_OPERATION_DECOMP_REDUCTION) && vector_decomp_out_last[0])
        )  begin
      reg_next.vector_last = 1;
    end

    ram_inputs_op1.wren = reg_current.wren;    
    ram_inputs_op1.waddr = reg_current.waddr;     
    ram_inputs_op2.wren = reg_current.wren;    //lazy
    ram_inputs_op2.waddr = reg_current.waddr;     
    for(int i = 0; i < E; i ++) begin
      ram_inputs_op1.wdata[i*FSIZE +: FSIZE] = reg_current.wdata1[i];
      ram_inputs_op2.wdata[i*FSIZE +: FSIZE] = reg_current.wdata2[i];//lazy
    end

    for(int i = 0; i < E/VECTOR_SPLIT; i ++) begin        
      for(int si = 0; si < VECTOR_SPLIT; si ++) begin
        if(si == reg_current.vector_store_idx[$clog2(VECTOR_SPLIT)-1:0] ) begin
          if( operation == VECTOR_OPERATION_MULT || operation == VECTOR_OPERATION_SCALAR_MULT || operation == VECTOR_VECTOR_BARRETT_REDUCTION ) begin
            reg_next.wdata1[si*(E/VECTOR_SPLIT)+i] = vector_mult_out[i];   
          end
          else if( operation == VECTOR_OPERATION_ADD || operation == VECTOR_OPERATION_SCALAR_ADD  ) begin
            reg_next.wdata1[si*(E/VECTOR_SPLIT)+i] = vector_add_out[i];   
          end
          else if( operation == VECTOR_OPERATION_LAZY_REDUCTION  ) begin  //lazy 
            reg_next.wdata1[si*(E/VECTOR_SPLIT)+i] = vector_lazy_out1[i];  
            reg_next.wdata2[si*(E/VECTOR_SPLIT)+i] = vector_lazy_out2[i]; 
          end
          else if( operation == VECTOR_OPERATION_DECOMP_REDUCTION  ) begin  //decomp
            reg_next.wdata1[si*(E/VECTOR_SPLIT)+i] = vector_decomp_out[i];  
          end
        end
      end
    end
    if(reg_current.vector_last) begin
      reg_next.state_STATE_VECTOR = 0;
      reg_next.state_STATE_VECTOR_WAIT = 0;
    end

    vector_working = 0;
    if( reg_current.state_STATE_VECTOR_WAIT  || reg_current.state_STATE_VECTOR ) vector_working = 1;

    if(rstn == 0) begin
      reg_next.state_STATE_VECTOR_WAIT = 0;      
      reg_next.state_STATE_VECTOR = 0;      
    end
  end
       
    
  always @ (posedge clk) begin  
    reg_current <= reg_next;
	end


endmodule
