`timescale 1 ns / 1 ps

import util_pack::*;

module axi_std_slave#(

  //axi_slave parameter
  parameter integer C_S_AXI_ID_WIDTH			= 1,
	parameter integer C_S_AXI_DATA_WIDTH		= 512,
	parameter integer C_S_AXI_ADDR_WIDTH		= 10,
	parameter integer C_S_AXI_AWUSER_WIDTH	= 0,
	parameter integer C_S_AXI_ARUSER_WIDTH	= 0,
	parameter integer C_S_AXI_WUSER_WIDTH		= 0,
	parameter integer C_S_AXI_RUSER_WIDTH		= 0,
	parameter integer C_S_AXI_BUSER_WIDTH		= 0,
  //user logic parameter
	parameter integer DATA_SIZE         = 256,
	parameter integer CYCLES            = 2,
  parameter integer MODULE_SLOTS      = 32,
  parameter integer NTT_SLOTS         = 32,
  parameter integer STAGE_MODULE      = 5,
  parameter integer STAGE_MODULE_POWER= 32,
  parameter integer SLOT_NUM    = 32,
  parameter integer MOD_NUM     = 32,
  parameter integer MEM_DEPTH   = 32
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
  logic 			aw_wrap_en;
  logic 			ar_wrap_en;

  logic [31:0] aw_wrap_size ;
  logic [31:0] ar_wrap_size ;

  logic 		  aw_handshake;
  logic 			ar_handshake;

	logic [1:0] axi_arburst;
	logic [1:0] axi_awburst;

  logic [7:0] axi_arlen;
	logic [7:0] axi_awlen;

  logic [7:0] axi_awlen_cntr;
  logic [7:0] axi_arlen_cntr;

	localparam integer ADDR_LSB = $clog2(C_S_AXI_DATA_WIDTH/8);

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

//assign aw_handshake = axi_awready && S_AXI_AWVALID;
//assign ar_handshake = axi_arready && S_AXI_ARVALID;

  // AW channel FSM
    always_ff@(posedge S_AXI_ACLK)
  begin
    if(!S_AXI_ARESETN) begin
      axi_awready       <= 1'b0;
      aw_handshake      <= 1'b0; 
    end else begin
      if (~axi_awready && S_AXI_AWVALID && ~aw_handshake && ~ar_handshake) begin
        axi_awready     <= 1'b1;
        aw_handshake    <= 1'b1;
      end else if (S_AXI_WLAST && axi_wready) begin // adress write run state일때, LAST 신호 수신 시
        aw_handshake <= 1'b0;
      end else begin // address write run state가 지속될때
        axi_awready  <= 1'b0;
      end
    end
  end

  // AW channel burst type
  localparam Fixed_Burst = 2'b00;
  localparam Incr_Burst  = 2'b01;
  localparam Wrap_Burst  = 2'b10;

    always_ff@(posedge S_AXI_ACLK)
  begin
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

logic write_run;
logic read_run;

 // w channel FSM
    always_ff@(posedge S_AXI_ACLK)
  begin
    if(!S_AXI_ARESETN) begin
      axi_wready <= 0;
      write_run <= 0;
    end else begin
      if ( ~axi_wready && S_AXI_WVALID && aw_handshake)begin
        axi_wready <= 1'b1;
        write_run <= 1'b1;
      end else if (S_AXI_WLAST && axi_wready)begin
        axi_wready <= 1'b0;
        write_run <= 1'b0;
      end
    end
  end

  // B channel logic(write response)
    always_ff@(posedge S_AXI_ACLK)
  begin
    if(!S_AXI_ARESETN) begin
      axi_bvalid <= 0;
      axi_bresp  <= 0;
      axi_buser  <= 0;
    end else begin
      if (aw_handshake && axi_wready && S_AXI_WVALID && ~axi_bvalid && S_AXI_WLAST) begin
        axi_bvalid <= 1'b1;
        axi_bresp  <= 2'b0;;
      end else begin
        if(S_AXI_BREADY && axi_bvalid) begin
          axi_bvalid <= 1'b0;
        end
      end
    end
  end

  // AR channel FSM
    always_ff@(posedge S_AXI_ACLK)
  begin
    if(!S_AXI_ARESETN) begin
      axi_arready <= 0;
      ar_handshake <= 0;
    end else begin
      if (~axi_arready && S_AXI_ARVALID && ~ar_handshake && ~aw_handshake) begin
        axi_arready <= 1'b1;
        ar_handshake <= 1'b1;
      end else if (axi_rvalid && S_AXI_RREADY) begin
        ar_handshake <= 1'b0;
      end else begin
        axi_arready <= 1'b0;
      end
    end
  end

  // AR channel burst type
    always_ff@(posedge S_AXI_ACLK)
  begin
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
    always_ff@(posedge S_AXI_ACLK)
  begin
    if(!S_AXI_ARESETN) begin
      axi_rvalid <= 0;
      axi_rresp  <= 0;
      read_run   <= 0;
    end else begin
	    if (ar_handshake && ~axi_rvalid) begin
	      axi_rvalid    <= 1'b1;
	      axi_rresp     <= 2'b0;
        read_run      <= 1'b1;
	    end else if (axi_rvalid && S_AXI_RREADY) begin
	      axi_rvalid <= 1'b0;
        read_run   <= 1'b0;
	    end      
    end
  end

// make simple memory
// write data to memory

  logic [0:MEM_DEPTH][C_S_AXI_DATA_WIDTH-1:0]   w_buff;
  logic [0:MEM_DEPTH-1][C_S_AXI_DATA_WIDTH-1:0] write_transfer_data;
  logic [$clog2(MEM_DEPTH)-1:0]                 w_buff_cnt;
  logic storage_full_flag;

  logic [0:MEM_DEPTH-1][(C_S_AXI_DATA_WIDTH/2)-1:0]i_ram_out_buff;
  logic [(C_S_AXI_DATA_WIDTH/2)-1:0]typeswitch_ram_out[0:MODULE_SLOTS-1];
  logic [(C_S_AXI_DATA_WIDTH/2)-1:0]i_ram_out_buff_wire[0:MODULE_SLOTS-1];


always_ff@(posedge S_AXI_ACLK) begin
  if(!S_AXI_ARESETN) begin
    for(int i = 0; i < MODULE_SLOTS; i++) begin
      typeswitch_ram_out[i] <= 0;
    end
  end else begin
    for(int i = 0; i< MODULE_SLOTS; i++) begin
      typeswitch_ram_out[i] <= i_ram_out_buff[i];
    end
  end
end





BufferRAMTEFsizeInputs  i_module_outputs_reg  [0:MODULE_SLOTS-1];
BufferRAMTEFsizeInputs  i_module_outputs_wire [0:MODULE_SLOTS-1];
assign i_module_outputs_wire = i_module_outputs_reg;
assign i_ram_out_buff_wire = typeswitch_ram_out;

always_ff@(posedge S_AXI_ACLK) begin
  if(!S_AXI_ARESETN) begin
    w_buff_cnt <= 0;
    storage_full_flag <= 0;
    w_buff <= 0;
  end else begin
    if(write_run) begin
      if(w_buff_cnt == MEM_DEPTH - 1) begin
      w_buff[w_buff_cnt] <= axi_wdata;
      w_buff_cnt <= 0;
      storage_full_flag <= 1;
      end else begin
        w_buff[w_buff_cnt] <= axi_wdata;
        w_buff_cnt <= w_buff_cnt + 1;
        storage_full_flag <= 0;
      end
    end else if(!write_run) begin
      w_buff <= w_buff;
      w_buff_cnt <= w_buff_cnt;
      storage_full_flag <= storage_full_flag;
    end
  end
end

always_ff@(posedge S_AXI_ACLK) begin
  if(!S_AXI_ARESETN) begin
    write_transfer_data <= 0;
  end else begin
    if(storage_full_flag) begin
      write_transfer_data <= w_buff;
    end else begin
      write_transfer_data <= 0;
    end
  end
end

always_ff@(posedge S_AXI_ACLK) begin
  if(!S_AXI_ARESETN) begin
    i_ram_out_buff    <= 0;
    for(int i=0; i<MODULE_SLOTS; i++)begin
      i_module_outputs_reg[i].wdata <= 0;
      i_module_outputs_reg[i].wren  <= 0;
      i_module_outputs_reg[i].waddr <= 0;
      i_module_outputs_reg[i].raddr <= 0;
    end
  end else begin
    for(int i = 0; i< MEM_DEPTH; i++) begin
      for(int j = 0; j<C_S_AXI_DATA_WIDTH/2; j++)begin
        i_ram_out_buff[i][j]    <= write_transfer_data[i][j];
        i_module_outputs_reg[i].wdata[j] <= write_transfer_data[i][j + C_S_AXI_DATA_WIDTH/2];
        i_module_outputs_reg[i].wren     <= 1;
        i_module_outputs_reg[i].waddr    <= i;
        i_module_outputs_reg[i].raddr    <= i;
      end
    end
  end
end

logic [C_S_AXI_DATA_WIDTH-1:0]       selection_signal;
logic [MODULE_SLOTS-1:0][$clog2(NTT_SLOTS)-1:0]i_module_selection_reg;
logic [MODULE_SLOTS-1:0][$clog2(NTT_SLOTS)-1:0]i_slot_selection_reg;
logic [MODULE_SLOTS-1:0][$clog2(NTT_SLOTS)-1:0]i_module_selection_wire;
logic [MODULE_SLOTS-1:0][$clog2(NTT_SLOTS)-1:0]i_slot_selection_wire;

assign i_module_selection_wire = i_module_selection_reg;
assign i_slot_selection_wire = i_slot_selection_reg;


// module/ram selection signal maker
always_ff@(posedge S_AXI_ACLK) begin
  if(!S_AXI_ARESETN) begin
    selection_signal <= 0;
  end else begin
    if(write_run) begin
      selection_signal <= w_buff[MEM_DEPTH];
    end else if(!write_run) begin
      selection_signal <= 0;
    end
  end
end

always_ff@(posedge S_AXI_ACLK) begin
  if(!S_AXI_ARESETN) begin
    i_module_selection_reg <= 0;
    i_slot_selection_reg   <= 0;
  end else begin
    for(int i = 0; i < MODULE_SLOTS; i++) begin
        i_slot_selection_reg  [i] <=  selection_signal[(C_S_AXI_DATA_WIDTH -1) -(i * $clog2(NTT_SLOTS)) -:$clog2(NTT_SLOTS) ];
        i_module_selection_reg[i] <=  selection_signal[((C_S_AXI_DATA_WIDTH/2)-1) -(i *$clog2(NTT_SLOTS)) -:$clog2(NTT_SLOTS) ];
      end
    end
  end






// read data from memory
  logic [0:MEM_DEPTH-1][C_S_AXI_DATA_WIDTH-1:0] r_buff;
  logic [0:MEM_DEPTH-1][C_S_AXI_DATA_WIDTH-1:0] read_transfer_data;
  logic [$clog2(MEM_DEPTH)-1:0]                 r_buff_cnt;
  logic storage_empty_flag;

  logic [0:MEM_DEPTH-1][(C_S_AXI_DATA_WIDTH/2)-1:0]o_module_in_buff;
    logic [0:MEM_DEPTH-1][(C_S_AXI_DATA_WIDTH/2)-1:0]type_module_in_buff;
  logic [(C_S_AXI_DATA_WIDTH/2)-1:0]o_module_in_buff_wire[0:MODULE_SLOTS-1];


  BufferRAMTEFsizeInputs  o_ram_inputs_reg      [0:MODULE_SLOTS-1];
  BufferRAMTEFsizeInputs  o_ram_inputs_wire     [0:MODULE_SLOTS-1];

assign o_ram_inputs_reg      = o_ram_inputs_wire;
assign o_module_in_buff      = type_module_in_buff;

always_ff@(posedge S_AXI_ACLK)begin
  if(!S_AXI_ARESETN) begin
    for(int i = 0; i < MODULE_SLOTS; i++) begin
      type_module_in_buff[i] <= 0;
    end
  end else begin
    for(int j = 0; j <C_S_AXI_DATA_WIDTH/2;j++)begin
      for(int i = 0; i< MODULE_SLOTS; i++) begin
        type_module_in_buff[i][j] <= o_module_in_buff_wire[i][j];
    end
  end
  end
end






always_ff@(posedge S_AXI_ACLK) begin
  if(!S_AXI_ARESETN) begin
    read_transfer_data <= 0;
  end else begin
    for(int i = 0; i< MEM_DEPTH; i++) begin
      for(int j = 0; j<C_S_AXI_DATA_WIDTH/2; j++)begin
        read_transfer_data[i][j]                        = o_ram_inputs_reg[i].wdata[j];
        read_transfer_data[i][j + C_S_AXI_DATA_WIDTH/2] = o_module_in_buff[i][j];
      end
    end
  end
end

always_ff@(posedge S_AXI_ACLK) begin
  if(!S_AXI_ARESETN) begin
    r_buff <= 0;
  end else begin
    r_buff <= read_transfer_data;    
  end
end

always_ff@(posedge S_AXI_ACLK) begin
  if(!S_AXI_ARESETN) begin
    r_buff_cnt         <= 0;
    storage_empty_flag <= 0;
    axi_rdata          <= 0;
  end else begin
    if(read_run) begin
      if(r_buff_cnt == MEM_DEPTH - 1)begin
        axi_rdata             <= r_buff[r_buff_cnt];
        r_buff_cnt            <= 0;
        storage_empty_flag    <= 1;
      end else begin
        axi_rdata             <= r_buff[r_buff_cnt];
        r_buff_cnt            <= r_buff_cnt + 1;
        storage_empty_flag    <= 0;
      end
    end else if(!read_run) begin
      axi_rdata               <= 0;
      r_buff_cnt              <= r_buff_cnt;
      storage_empty_flag      <= storage_empty_flag;
    end 
  end
end

BufferInterconnect_v2 #(.DATA_SIZE(DATA_SIZE), .CYCLES(CYCLES), .MODULE_SLOTS(MODULE_SLOTS), 
                        .NTT_SLOTS(NTT_SLOTS), .STAGE_MODULE(STAGE_MODULE), .STAGE_MODULE_POWER(STAGE_MODULE_POWER)
  )buffer_interconnect_v2_inst(
  .clk(S_AXI_ACLK),
  .rstn(S_AXI_ARESETN),
  .ram_outputs    (i_ram_out_buff_wire),
  .module_outputs (i_module_outputs_wire),
  .ram_inputs     (o_ram_inputs_wire),
  .module_inputs  (o_module_in_buff_wire),
  .module_slots   (i_module_selection_wire),
  .ram_slots      (i_slot_selection_wire)
);

endmodule