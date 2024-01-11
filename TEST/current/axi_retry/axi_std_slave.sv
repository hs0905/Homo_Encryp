
`timescale 1 ns / 1 ps

//import USER_PKG::*;
import FHE_ALU_PKG::*;
`include "defines.vh"

module axi_std_slave #(
  parameter integer C_S_AXI_ID_WIDTH			= 1,
	parameter integer C_S_AXI_DATA_WIDTH		= 512,
	parameter integer C_S_AXI_ADDR_WIDTH		= 10,
	parameter integer C_S_AXI_AWUSER_WIDTH	= 0,
	parameter integer C_S_AXI_ARUSER_WIDTH	= 0,
	parameter integer C_S_AXI_WUSER_WIDTH		= 0,
	parameter integer C_S_AXI_RUSER_WIDTH		= 0,
	parameter integer C_S_AXI_BUSER_WIDTH		= 0
  )(
  input logic S_AXI_ACLK,
  input logic S_AXI_ARESETN,

  /*----------------------------
    AW channel(address write)
  ----------------------------*/
  //<<MAIN>>
	input logic [C_S_AXI_ADDR_WIDTH-1:0] 			S_AXI_AWADDR,
  input logic  															S_AXI_AWVALID,
  output logic  														S_AXI_AWREADY,
  //<<SUB>>
  input logic [7 : 0] 											S_AXI_AWLEN,
	input logic [2 : 0] 											S_AXI_AWSIZE,
  input logic [C_S_AXI_ID_WIDTH-1:0] 				S_AXI_AWID,
	input logic [1 : 0] 											S_AXI_AWBURST,
	input logic  															S_AXI_AWLOCK,
	input logic [3 : 0] 											S_AXI_AWCACHE,
	input logic [2 : 0] 											S_AXI_AWPROT,
	input logic [3 : 0] 											S_AXI_AWQOS,
	input logic [3 : 0] 											S_AXI_AWREGION,
	input logic [C_S_AXI_AWUSER_WIDTH-1:0]   	S_AXI_AWUSER,
 
  /*----------------------------
    W channel(write)
  ----------------------------*/
  //<<MAIN>>
	input 	logic [C_S_AXI_DATA_WIDTH -1 : 0]	  S_AXI_WDATA,
  input 	logic  															S_AXI_WVALID,
	output 	logic  															S_AXI_WREADY,
  //<<SUB>>
	input 	logic [(C_S_AXI_DATA_WIDTH/8)-1 : 0]S_AXI_WSTRB,
	input 	logic  															S_AXI_WLAST,
	input 	logic [C_S_AXI_WUSER_WIDTH-1 : 0] 	S_AXI_WUSER,

  /*----------------------------
    B channel(write response)
  ----------------------------*/
  //<<MAIN>>
  input  	logic  															S_AXI_BREADY,
  output 	logic  															S_AXI_BVALID,
  //<<SUB>>
  output 	logic [C_S_AXI_ID_WIDTH-1 : 0] 			S_AXI_BID,
  output 	logic [1 : 0] 											S_AXI_BRESP,
  output 	logic [C_S_AXI_BUSER_WIDTH-1 : 0] 	S_AXI_BUSER,

  /*----------------------------
    AR channel(address read)
  ----------------------------*/
  //<<MAIN>>
	input 	logic [C_S_AXI_ADDR_WIDTH-1 : 0] 		S_AXI_ARADDR,
  input 	logic  															S_AXI_ARVALID,
	output 	logic  															S_AXI_ARREADY,
  //<<SUB>>
	input 	logic [7 : 0] 											S_AXI_ARLEN,
	input 	logic [2 : 0] 											S_AXI_ARSIZE,
	input 	logic [C_S_AXI_ID_WIDTH-1 : 0] 			S_AXI_ARID,
  input 	logic [1 : 0] 											S_AXI_ARBURST,
	input 	logic  															S_AXI_ARLOCK,
	input 	logic [3 : 0] 											S_AXI_ARCACHE,
	input 	logic [2 : 0] 											S_AXI_ARPROT,
	input 	logic [3 : 0] 											S_AXI_ARQOS,
	input 	logic [3 : 0] 											S_AXI_ARREGION,
	input 	logic [C_S_AXI_ARUSER_WIDTH-1 : 0] 	S_AXI_ARUSER,
 
  /*----------------------------
    R channel(Read)
  ----------------------------*/
  //<<MAIN>>
	input 	logic  															S_AXI_RREADY,
  output 	logic  															S_AXI_RVALID,
	output 	logic [C_S_AXI_DATA_WIDTH -1 : 0]		S_AXI_RDATA,
  //<<SUB>>
	output 	logic [1 : 0] 											S_AXI_RRESP,
	output 	logic  															S_AXI_RLAST,
	output 	logic [C_S_AXI_RUSER_WIDTH-1 : 0] 	S_AXI_RUSER,
  output 	logic [C_S_AXI_ID_WIDTH-1 : 0] 			S_AXI_RID
);


  // Internal signals [Register]

  // <<AW>>
	logic [C_S_AXI_ADDR_WIDTH-1 : 0] 	axi_awaddr;
	logic  														axi_awready;
  // <<W>>
  logic [C_S_AXI_DATA_WIDTH -1 : 0] axi_wdata;
  logic  														axi_wready;
  // <<B>>
	logic [1 : 0] 										axi_bresp;
	logic [C_S_AXI_BUSER_WIDTH-1 : 0] axi_buser;
	logic  														axi_bvalid;
  // <<AR>>
	logic [C_S_AXI_ADDR_WIDTH-1 : 0] 	axi_araddr;
	logic  														axi_arready;
  // <<R>>
	logic [C_S_AXI_DATA_WIDTH -1 : 0]	axi_rdata;
	logic [1 : 0] 										axi_rresp;
	logic  														axi_rlast;
	logic [C_S_AXI_RUSER_WIDTH-1 : 0] axi_ruser;
	logic  														axi_rvalid;

  // <<SUB_Signals>>
  //burst type wrapping enable
  logic 			aw_wrap_en;
  logic 			ar_wrap_en;
  //burst type wrapping size
  logic [31:0] aw_wrap_size ;
  logic [31:0] ar_wrap_size ;
  //Ready/Valid Flag
  logic 		  aw_handshake;
  logic 			ar_handshake;
  //burst type
	logic [1:0] axi_arburst;
	logic [1:0] axi_awburst;
  // ar/aw burst transaction lenth
  logic [7:0] axi_arlen;
	logic [7:0] axi_awlen;
  //count Read/Write Num in a burst transaction (if len_cntr == len, last = 1)
  logic [7:0] axi_awlen_cntr;
  logic [7:0] axi_arlen_cntr;

 // Define state machine components
  logic [1:0] aw_current_state;
  logic [1:0] w_current_state;
  logic [1:0] b_current_state;
  logic [1:0] ar_current_state;
  logic [1:0] r_current_state;

  logic [1:0] aw_next_state;
  logic [1:0] w_next_state;
  logic [1:0] b_next_state;
  logic [1:0] ar_next_state;
  logic [1:0] r_next_state;

  localparam IDLE = 2'b00;
  localparam RUN  = 2'b01;
  localparam DONE = 2'b10;

  always_ff@(posedge S_AXI_ACLK) begin
    if(!S_AXI_ARESETN) begin
      aw_current_state <= IDLE;
      w_current_state  <= IDLE;
      b_current_state  <= IDLE;
      ar_current_state <= IDLE;
      r_current_state  <= IDLE;
    end else begin
      aw_current_state <= aw_next_state;
      w_current_state  <= w_next_state;
      b_current_state  <= b_next_state;
      ar_current_state <= ar_next_state;
      r_current_state  <= r_next_state;
    end
  end 

  always_ff@(posedge S_AXI_ACLK) begin
    if(aw_current_state == DONE) aw_next_state <= IDLE;
    if(w_current_state  == DONE) w_next_state  <= IDLE;
    if(b_current_state  == DONE) b_next_state  <= IDLE;
    if(ar_current_state == DONE) ar_next_state <= IDLE;
    if(r_current_state  == DONE) r_next_state  <= IDLE;
  end


	localparam integer ADDR_LSB          = $clog2(C_S_AXI_DATA_WIDTH/8);

	// <<AW>>
  assign S_AXI_AWREADY	= axi_awready;
	// <<W>>
  assign S_AXI_WREADY		= axi_wready;
  assign axi_wdata      = S_AXI_WDATA;
  // <<B>>
	assign S_AXI_BRESP		= axi_bresp;
	assign S_AXI_BUSER		= axi_buser;
	assign S_AXI_BVALID		= axi_bvalid;
  // <<AR>>
	assign S_AXI_ARREADY	= axi_arready;
  // <<R>>
	assign S_AXI_RDATA		= axi_rdata;
	assign S_AXI_RRESP		= axi_rresp;
	assign S_AXI_RLAST		= axi_rlast;
	assign S_AXI_RUSER		= axi_ruser;
	assign S_AXI_RVALID		= axi_rvalid;
  // <<B <-> AW/AR>>
	assign S_AXI_BID 			= S_AXI_AWID;
	assign S_AXI_RID 			= S_AXI_ARID;
  // <<wrap>>
	assign aw_wrap_size 	= (C_S_AXI_DATA_WIDTH/8 * (axi_awlen)); 
	assign ar_wrap_size 	= (C_S_AXI_DATA_WIDTH/8 * (axi_arlen)); 
	assign aw_wrap_en 		= ((axi_awaddr & aw_wrap_size) == aw_wrap_size)? 1'b1: 1'b0;
	assign ar_wrap_en 		= ((axi_araddr & ar_wrap_size) == ar_wrap_size)? 1'b1: 1'b0;







// AW channel FSM
  always_ff@(posedge S_AXI_ACLK)
  begin
    if(!S_AXI_ARESETN) begin
      axi_awready      <= 1'b0;
      aw_handshake     <= 1'b0; // address write valid/ready handshake flag
      //aw_next_state    <= IDLE;
    end else begin
      if (~axi_awready && S_AXI_AWVALID && ~aw_handshake && ~ar_handshake) begin
        axi_awready   <= 1'b1;
        aw_handshake  <= 1'b1;
        aw_next_state <= RUN;
      end else if (S_AXI_WLAST && axi_wready) begin
        aw_handshake <= 1'b0;
        aw_next_state <= DONE;
      end else begin // valid 신호가 0이라 IDLE 일경우 혹은 Wlast가 0이라 run이 지속될 경우
        axi_awready  <= 1'b0;
        aw_next_state <= aw_current_state;
      end
    end
  end

// AW channel burst type
  localparam Fixed_Burst = 2'b00;
  localparam Incr_Burst  = 2'b01;
  localparam Wrap_Burst  = 2'b10;

always_ff@(posedge S_AXI_ACLK) begin
    if(!S_AXI_ARESETN) begin
      axi_awaddr      <= 0;
      axi_awlen_cntr  <= 0;
      axi_awburst     <= 0;
      axi_awlen       <= 0;
    end else begin
      if (~axi_awready && S_AXI_AWVALID && ~aw_handshake) // before handhshake(AWVALID => high)
      begin
        axi_awaddr      <= S_AXI_AWADDR[C_S_AXI_ADDR_WIDTH -1 : 0]; // address 
        axi_awburst     <= S_AXI_AWBURST;
        axi_awlen       <= S_AXI_AWLEN;
        axi_awlen_cntr  <= 0;
      end else if((axi_awlen_cntr <= axi_awlen) && axi_wready && S_AXI_WVALID) begin // still in transaction
        axi_awlen_cntr <= axi_awlen_cntr + 1; // if ctrl is lower than awlen, count up
        case (axi_awburst)
          Fixed_Burst: axi_awaddr <= axi_awaddr;
          Incr_Burst:  
          begin
            axi_awaddr[C_S_AXI_ADDR_WIDTH - 1:ADDR_LSB] <= axi_awaddr[C_S_AXI_ADDR_WIDTH - 1:ADDR_LSB] + 1;
            axi_awaddr[ADDR_LSB-1:0]  <= {ADDR_LSB{1'b0}};
          end
          Wrap_Burst:
            if (aw_wrap_en)begin
              axi_awaddr <= (axi_awaddr - aw_wrap_size);
            end else begin
              axi_awaddr[C_S_AXI_ADDR_WIDTH - 1:ADDR_LSB] <= axi_awaddr[C_S_AXI_ADDR_WIDTH - 1:ADDR_LSB] + 1;
	            axi_awaddr[ADDR_LSB-1:0]  <= {ADDR_LSB{1'b0}};
          end
          default:
            begin
	            axi_awaddr <= axi_awaddr[C_S_AXI_ADDR_WIDTH - 1:ADDR_LSB] + 1;
	          end
        endcase
      end
    end
  end

 // w channel FSM
   always_ff@(posedge S_AXI_ACLK) begin
    if(!S_AXI_ARESETN) begin
      axi_wready <= 0;
    //w_next_state <= IDLE;
    end else begin
      if ( ~axi_wready && S_AXI_WVALID && aw_handshake)begin
        axi_wready <= 1'b1;
        w_next_state <= RUN;
      end else if (S_AXI_WLAST && axi_wready)begin
        axi_wready <= 1'b0;
        w_next_state <= DONE;
      end
    end
  end


  // B channel logic(write response)
  always_ff@(posedge S_AXI_ACLK) begin
    if(!S_AXI_ARESETN) begin
      axi_bvalid <= 0;
      axi_bresp  <= 0;
      axi_buser  <= 0;
    //b_next_state <= IDLE;
    end else begin
      if (aw_handshake && axi_wready && S_AXI_WVALID && ~axi_bvalid && S_AXI_WLAST) begin
        axi_bvalid <= 1'b1;
        axi_bresp  <= 2'b0;
        b_next_state <= RUN;
      end else begin
        if(S_AXI_BREADY && axi_bvalid) begin
          axi_bvalid <= 1'b0;
          b_next_state <= DONE;
        end
      end
    end
  end

  // AR channel FSM
  always_ff@(posedge S_AXI_ACLK) begin
    if(!S_AXI_ARESETN) begin
      axi_arready <= 0;
      ar_handshake <= 0;
    //ar_next_state <= IDLE;
    end else begin
      if (~axi_arready && S_AXI_ARVALID && ~ar_handshake && ~aw_handshake) begin
        axi_arready <= 1'b1;
        ar_handshake <= 1'b1;
        ar_next_state <= RUN;
      end else if (axi_rvalid && S_AXI_RREADY) begin
        ar_handshake <= 1'b0;
        ar_next_state <= DONE;
      end else begin
        axi_arready <= 1'b0;
        ar_next_state <= ar_current_state;
      end
    end
  end

  // AR channel burst type
  always_ff@(posedge S_AXI_ACLK) begin
    if(!S_AXI_ARESETN)begin
    	axi_araddr     <= 0;
	    axi_arlen_cntr <= 0;
	    axi_arburst    <= 0;
	    axi_arlen      <= 0;
	    axi_rlast      <= 0;
	    axi_ruser      <= 0;
    end else begin
      if(!axi_arready && S_AXI_ARVALID && !ar_handshake) begin
        // address latching 
	      axi_araddr  <= S_AXI_ARADDR[C_S_AXI_ADDR_WIDTH - 1:0]; 
	      axi_arburst <= S_AXI_ARBURST; 
	      axi_arlen   <= S_AXI_ARLEN;     
	      // start address of transfer
	      axi_arlen_cntr <= 0;
	      axi_rlast      <= 1'b0;
      end else if((axi_arlen_cntr <= axi_arlen) && axi_rvalid && S_AXI_RREADY) begin
        axi_arlen_cntr <= axi_arlen_cntr + 1;
        axi_rlast      <= 1'b0;
	        case (axi_arburst)
	          Fixed_Burst: axi_araddr <= axi_araddr;        
	          Incr_Burst:
	            begin
	              axi_araddr[C_S_AXI_ADDR_WIDTH - 1:ADDR_LSB] <= axi_araddr[C_S_AXI_ADDR_WIDTH - 1:ADDR_LSB] + 1; 
	              axi_araddr[ADDR_LSB-1:0]                    <= {ADDR_LSB{1'b0}};   
	            end   
	          Wrap_Burst:
	            if (ar_wrap_en) 
	              axi_araddr <= (axi_araddr - ar_wrap_size); 
	              else begin
	                axi_araddr[C_S_AXI_ADDR_WIDTH - 1:ADDR_LSB] <= axi_araddr[C_S_AXI_ADDR_WIDTH - 1:ADDR_LSB] + 1; 
	                axi_araddr[ADDR_LSB-1:0]                    <= {ADDR_LSB{1'b0}};   
	              end                      
	          default: 
	            axi_araddr <= axi_araddr[C_S_AXI_ADDR_WIDTH - 1:ADDR_LSB]+1;
	          endcase    
      end else if((axi_arlen_cntr == axi_arlen) && !axi_rlast && ar_handshake) begin
        axi_rlast <= 1'b1;
      end else if(S_AXI_RREADY) begin
        axi_rlast <= 1'b0;
      end
    end
  end

// R channel logic(Read response)
  always_ff@(posedge S_AXI_ACLK) begin
    if(!S_AXI_ARESETN) begin
      axi_rvalid <= 0;
      axi_rresp  <= 0;
    //r_next_state <= IDLE;
    end else begin
	    if (ar_handshake && ~axi_rvalid) begin
	      axi_rvalid    <= 1'b1;
	      axi_rresp     <= 2'b0; 
        r_next_state  <= RUN;
	    end else if (axi_rvalid && S_AXI_RREADY) begin
	      axi_rvalid <= 1'b0;
        r_next_state <= DONE;
	    end      
    end
  end

// make simple memory
// write data to memory

parameter integer WRITE_MEM_DPETH = SLOT_NUM_IN_BUFF + 1;
parameter integer READ_MEM_DEPTH = SLOT_NUM_IN_BUFF;

  logic [C_S_AXI_DATA_WIDTH-1:0]        write_data_storage      [0:WRITE_MEM_DPETH-1];
  logic [C_S_AXI_DATA_WIDTH-1:0]        write_real_transfer_data[0:WRITE_MEM_DPETH-1];
  logic [$clog2(WRITE_MEM_DPETH)-1:0]   write_cnt; 
  logic storage_full_flag;

always_ff @(posedge S_AXI_ACLK) begin
  if (!S_AXI_ARESETN) begin
    for(int i=0; i<WRITE_MEM_DPETH; i++)begin
      write_data_storage[i] <= 0;
    end
    write_cnt <= 0;
    storage_full_flag <= 0;
  end else begin
    if (w_current_state == RUN) begin
      write_data_storage[write_cnt] <= axi_wdata;
      if (write_cnt == WRITE_MEM_DPETH - 1) begin
        storage_full_flag <= 1;
        write_cnt <= 0;
      end else begin
        storage_full_flag <= 0;
        write_cnt <= write_cnt + 1;
      end
    end
  end
end

always_comb begin // 꽉 차면 write_data_storage를 write_real_transfer_data에 복사, 안찼을때는 항상 0
  if(storage_full_flag) begin
    write_real_transfer_data = write_data_storage;
  end else begin
    for(int i=0; i<WRITE_MEM_DPETH; i++)begin
      write_real_transfer_data[i] = 0;
    end
  end
end

// read data from memory
  logic [C_S_AXI_DATA_WIDTH-1:0]        read_data_storage      [0:READ_MEM_DEPTH-1];
  logic [C_S_AXI_DATA_WIDTH-1:0]        read_real_transfer_data[0:READ_MEM_DEPTH-1];
  logic [$clog2(READ_MEM_DEPTH)-1:0]    read_cnt;
  logic storage_empty_flag;
  assign read_data_storage = read_real_transfer_data;

always_ff @(posedge S_AXI_ACLK) begin
  if (!S_AXI_ARESETN) begin
    for(int i = 0; i<READ_MEM_DEPTH; i++)begin
    read_data_storage[i] = read_real_transfer_data[i];
    end
    read_cnt <= 0;
    storage_empty_flag <= 0;
  end else begin
    if(r_current_state == RUN) begin
      axi_rdata <= read_data_storage[read_cnt];
      if (read_cnt == READ_MEM_DEPTH-1) begin
        storage_empty_flag <= 1;
        read_cnt <= 0;
      end else begin
        storage_empty_flag <= 0;
        read_cnt <= read_cnt + 1;
      end
    end
  end
end

// memory to inst

logic [C_S_AXI_DATA_WIDTH/2 -1 : 0] i_ram_outputs    [0:SLOT_NUM_IN_BUFF - 1];
logic [C_S_AXI_DATA_WIDTH/2 -1 : 0] i_module_outputs [0:SLOT_NUM_IN_BUFF - 1];
logic [C_S_AXI_DATA_WIDTH/2 -1 : 0] o_ram_inputs     [0:SLOT_NUM_IN_BUFF - 1];
logic [C_S_AXI_DATA_WIDTH/2 -1 : 0] o_module_inputs  [0:SLOT_NUM_IN_BUFF - 1];

logic [SWITCH_NUM-1:0]	            i_module_select	 [0:STAGE_NUM-1];
logic [SWITCH_NUM-1:0]	            i_slot_select		 [0:STAGE_NUM-1];

BufferRAMTEFsizeInputs              real_module_outputs[0:MODULE_NUM_IN_BUFF-1];
BufferRAMTEFsizeInputs              real_ram_inputs    [0:SLOT_NUM_IN_BUFF-1];
// important part
always_comb
  for(int i = 0; i<STAGE_NUM; i++)begin
    i_module_select[i] =  write_real_transfer_data[WRITE_MEM_DPETH-1][(C_S_AXI_DATA_WIDTH/2 -1) -(SWITCH_NUM * i) -:SWITCH_NUM];
    i_slot_select[i]   =  write_real_transfer_data[WRITE_MEM_DPETH-1][(C_S_AXI_DATA_WIDTH-1)    -(SWITCH_NUM * i)  -:SWITCH_NUM];
  end


always_comb begin
    for(int i = 0; i<SLOT_NUM_IN_BUFF; i++)begin
    i_ram_outputs[i]    = write_real_transfer_data[i][C_S_AXI_DATA_WIDTH/2 -1 : 0];
    i_module_outputs[i] = write_real_transfer_data[i][C_S_AXI_DATA_WIDTH -1 : C_S_AXI_DATA_WIDTH/2];
  end
end

always_comb begin
  for(int i = 0; i<MODULE_NUM_IN_BUFF;i++)begin
    real_module_outputs[i].raddr = 0;
    real_module_outputs[i].waddr = 0;
    real_module_outputs[i].wdata = i_module_outputs[i];
    real_module_outputs[i].wren  = 1;
  end
end

always_comb begin

  for(int i = 0; i<SLOT_NUM_IN_BUFF; i++)begin
    o_ram_inputs[i] = real_ram_inputs[i].wdata;
  end

  for(int i = 0; i<SLOT_NUM_IN_BUFF; i++)begin
    read_real_transfer_data[i][C_S_AXI_DATA_WIDTH/2 -1 : 0]                  = o_ram_inputs[i];
    read_real_transfer_data[i][C_S_AXI_DATA_WIDTH -1 : C_S_AXI_DATA_WIDTH/2] = o_module_inputs[i];
  end
end

Interconnect_benes DUT(
	.clk(S_AXI_ACLK),
	.rst_n(S_AXI_ARESETN),
  .i_module_select  (i_module_select),      // 0
	.i_slot_select    (i_slot_select),        // 0
	.i_ram_outputs    (i_ram_outputs), 
	.i_module_outputs (real_module_outputs),
	.o_ram_inputs     (real_ram_inputs),
	.o_module_inputs  (o_module_inputs)
);

endmodule