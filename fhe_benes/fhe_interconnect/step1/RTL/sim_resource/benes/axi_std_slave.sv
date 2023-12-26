
`timescale 1 ns / 1 ps

import USER_PKG::*;
import FHE_ALU_PKG::*;
`include "defines.vh"

module axi_std_slave #(
  parameter integer C_S_AXI_ID_WIDTH			= 1,
	parameter integer C_S_AXI_DATA_WIDTH		= 512,
	parameter integer C_S_AXI_ADDR_WIDTH		= 6,
	parameter integer C_S_AXI_AWUSER_WIDTH	= 0,
	parameter integer C_S_AXI_ARUSER_WIDTH	= 0,
	parameter integer C_S_AXI_WUSER_WIDTH		= 0,
	parameter integer C_S_AXI_RUSER_WIDTH		= 0,
	parameter integer C_S_AXI_BUSER_WIDTH		= 0
  )
(
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
	input 	IntcBenesInputs 										S_AXI_WDATA,
  input 	logic  															S_AXI_WVALID, // write valid
	output 	logic  															S_AXI_WREADY,
  //<<SUB>>
	input 	logic [(C_S_AXI_DATA_WIDTH/8)-1 : 0]S_AXI_WSTRB, 	// write strb(bit verification)
	input 	logic  															S_AXI_WLAST, 	// last signal in write transaction(burst type)
	input 	logic [C_S_AXI_WUSER_WIDTH-1 : 0] 	S_AXI_WUSER, 	// user defined write transaction(non-essential)

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
	output 	IntcBenesOutputs 										S_AXI_RDATA,
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
  IntcBenesInputs 									axi_wdata;
  logic  														axi_wready;
  // <<B>>
	logic [1 : 0] 										axi_bresp;
	logic [C_S_AXI_BUSER_WIDTH-1 : 0] axi_buser;
	logic  														axi_bvalid;
  // <<AR>>
	logic [C_S_AXI_ADDR_WIDTH-1 : 0] 	axi_araddr;
	logic  														axi_arready;
  // <<R>>
	IntcBenesOutputs 									axi_rdata;
	logic [1 : 0] 										axi_rresp;
	logic  														axi_rlast;
	logic [C_S_AXI_RUSER_WIDTH-1 : 0] axi_ruser;
	logic  														axi_rvalid;
  // <<SUB_Signals>>
  //burst type wrapping enable
  logic 				aw_wrap_en;
  logic 				ar_wrap_en;
  //burst type wrapping size
  logic [31:0]  aw_wrap_size ;
  logic [31:0]  ar_wrap_size ;
  //Ready/Valid Flag
  logic 				axi_awv_awr_flag;
  logic 				axi_arv_arr_flag;
  //burst type
	logic [1:0] 	axi_arburst;
	logic [1:0] 	axi_awburst;
  // ar/aw burst transaction lenth
  logic [7:0] 	axi_arlen;
	logic [7:0] 	axi_awlen;
  //count Read/Write Num in a burst transaction (if len_cntr == len, last = 1)
  logic [7:0] 	axi_awlen_cntr;
  logic [7:0] 	axi_arlen_cntr;

	localparam integer ADDR_LSB          = (C_S_AXI_DATA_WIDTH/32)+ 1; // LSB of address bus 
	localparam integer OPT_MEM_ADDR_BITS = 3; // additonal address bits for addressing memory
	localparam integer USER_NUM_MEM      = 1; // Number of using memory

	// I/O Connections assignments (capital letters = module I/O, minuscule = Register)
	// <<AW>>
  assign S_AXI_AWREADY	= axi_awready;
	// <<W>>
  assign S_AXI_WREADY		= axi_wready;
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
  
  // AW channel logic
  always_ff@(posedge S_AXI_ACLK)
  begin
    if(!S_AXI_ARESETN) begin
      axi_awready      <= 1'b0;
      axi_awv_awr_flag <= 1'b0; // address write valid/ready handshake flag
    end else begin
      if (~axi_awready && S_AXI_AWVALID && ~axi_awv_awr_flag && ~axi_arv_arr_flag) 
      // before handshake => handshake가 0이지만, awvalid가 0이고, 
      begin
        axi_awready      <= 1'b1;
        axi_awv_awr_flag <= 1'b1;
      end else if (S_AXI_WLAST && axi_wready) // S_AXI_WLAST & axi_wready = 1 => handshake occured
      begin
        axi_awv_awr_flag <= 1'b0;
      end else 
      begin
        axi_awready      <= 1'b0;
      end
    end
  end

  localparam Fixed_Burst = 2'b00;
  localparam Incr_Burst  = 2'b01;
  localparam Wrap_Burst  = 2'b10;

	logic [OPT_MEM_ADDR_BITS:0] 	 mem_address;
	logic [USER_NUM_MEM-1:0] 			 mem_select;
	logic [C_S_AXI_DATA_WIDTH-1:0] mem_data_out[0 : USER_NUM_MEM-1];


  // AW channel burst type logic
  always_ff@(posedge S_AXI_ACLK) begin
    if(!S_AXI_ARESETN) begin
      axi_awaddr      <= 0;
      axi_awlen_cntr  <= 0;
      axi_awburst     <= 0;
      axi_awlen       <= 0;
    end else begin
      if (~axi_awready && S_AXI_AWVALID && ~axi_awv_awr_flag) // before handhshake(AWVALID => high)
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

  // W channel logic
  always_ff@(posedge S_AXI_ACLK) begin
    if(!S_AXI_ARESETN) begin
      axi_wready <= 0;
    end else begin
      if ( ~axi_wready && S_AXI_WVALID && axi_awv_awr_flag)
        // before handhshake(WVALID => high), awr_flag is high => address is ready to write
        axi_wready <= 1'b1;
      else if (S_AXI_WLAST && axi_wready)
        axi_wready <= 1'b0;
    end
  end

  // B channel logic(write response)
  always_ff@(posedge S_AXI_ACLK) begin
    if(!S_AXI_ARESETN) begin
      axi_bvalid <= 0;
      axi_bresp  <= 0;
      axi_buser  <= 0;
    end else begin
      if (axi_awv_awr_flag && axi_wready && S_AXI_WVALID && ~axi_bvalid && S_AXI_WLAST) begin
        axi_bvalid <= 1'b1;
        axi_bresp  <= 2'b0;
      end else begin
        if(S_AXI_BREADY && axi_bvalid) begin
          axi_bvalid <= 1'b0;
        end
      end
    end
  end

  // AR channel logic(Read address) (about Ready / Valid handshake)
  always_ff@(posedge S_AXI_ACLK) begin
    if(!S_AXI_ARESETN) begin
      axi_arready      <= 0;
      axi_arv_arr_flag <= 0;
    end else begin
      if (!axi_arready && S_AXI_ARVALID && !axi_awv_awr_flag && !axi_arv_arr_flag) begin // before handshake , ARVALID => high
          axi_arready      <= 1'b1;
          axi_arv_arr_flag <= 1'b1;
        end else if (axi_rvalid && S_AXI_RREADY && (axi_arlen_cntr == axi_arlen)) begin
          axi_arv_arr_flag <= 1'b0;
        end else
          axi_arready      <= 1'b0;
    end
  end
  // AR channel logic(Read address) (about burst type)
  always_ff@(posedge S_AXI_ACLK) begin
    if(!S_AXI_ARESETN)begin
    	axi_araddr     <= 0;
	    axi_arlen_cntr <= 0;
	    axi_arburst    <= 0;
	    axi_arlen      <= 0;
	    axi_rlast      <= 0;
	    axi_ruser      <= 0;
    end else begin
      if(!axi_arready && S_AXI_ARVALID && !axi_arv_arr_flag) begin
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
      end else if((axi_arlen_cntr == axi_arlen) && !axi_rlast && axi_arv_arr_flag) begin
        axi_rlast <= 1'b1;
      end else if(S_AXI_RREADY) begin
        axi_rlast <= 1'b0;
      end
    end
  end

// R channel logic(Read response)
  always_ff@(posedge S_AXI_ACLK) begin
    if(S_AXI_ARESETN) begin
      axi_rvalid <= 0;
      axi_rresp  <= 0;
    end else begin
	    if (axi_arv_arr_flag && ~axi_rvalid) begin
	      axi_rvalid <= 1'b1;
	      axi_rresp  <= 2'b0; 
	    end else if (axi_rvalid && S_AXI_RREADY) begin
	      axi_rvalid <= 1'b0;
	    end      
    end
  end

  // memory interface

    generate
      if(USER_NUM_MEM >= 1)
      begin 
        assign mem_select = 1;
        assign mem_address = (axi_arv_arr_flag?axi_araddr[ADDR_LSB+OPT_MEM_ADDR_BITS:ADDR_LSB]:(axi_awv_awr_flag? axi_awaddr[ADDR_LSB+OPT_MEM_ADDR_BITS:ADDR_LSB]:0));
        // if read flag is high => mem_address = read address
        // if read flag is low and write flag is high => mem_address = write address
        // else => mem_address = 0
      end
    endgenerate

  // implement Block RAM(s)
  generate
    for(genvar i = 0; i< USER_NUM_MEM; i++) begin : BRAM_GEN
      logic mem_rden;
      logic mem_wren;
      localparam RAM_DEPTH = 16;
      assign mem_wren = axi_wready && S_AXI_WVALID; // write enable
      assign mem_rden = axi_arv_arr_flag;          // read enable

      for(genvar mem_byte_index = 0; mem_byte_index < RAM_DEPTH; mem_byte_index++) begin : BYTE_BRAM_GEN
        IntcBenesInputs   input_ram_data_in;
        IntcBenesInputs   input_ram_data_out;
        IntcBenesInputs   input_byte_ram [0:RAM_DEPTH - 1];
        
        IntcBenesOutputs output_ram_data_in;
        IntcBenesOutputs output_ram_data_out;
        IntcBenesOutputs output_byte_ram  [0:RAM_DEPTH - 1];

        assign input_ram_data_in  = S_AXI_WDATA; // combination logic(everytime updat)
        // ram_write transaction
        always_ff@(posedge S_AXI_ACLK) begin
          if (mem_wren) begin
            if(mem_byte_index == 0)
            begin
              input_byte_ram[mem_byte_index] <= input_ram_data_in;
            end else begin
              input_byte_ram[mem_byte_index] <= input_ram_data_in;
              input_ram_data_out             <= input_byte_ram[mem_byte_index - 1];
            end 
          end
        end
        // ram_read transaction
        always_ff@(posedge S_AXI_ACLK) begin
          if(mem_rden) 
          begin
            if(mem_byte_index == 0) 
              begin
                output_byte_ram[mem_byte_index] <= output_ram_data_in;
              end 
            else begin
              output_byte_ram[mem_byte_index]   <= output_ram_data_in;
              output_ram_data_out               <= output_byte_ram[mem_byte_index - 1];
            end
          end
        end
      end
    end
  endgenerate

  // assign read data

// instantiate DUT

Interconnect_benes DUT(
	.clk(S_AXI_ACLK),
	.rst_n(S_AXI_ARESETN),
	.i_ram_outputs(input_ram_data_out.i_ram_outputs),
	.i_module_outputs(input_ram_data_out.i_module_outputs),
	.i_module_select(input_ram_data_out.i_module_select),
	.i_slot_select(input_ram_data_out.i_slot_select),
	.o_ram_inputs(output_ram_data_out.o_ram_inputs),
	.o_module_inputs(output_ram_data_out.o_module_inputs)
);




endmodule