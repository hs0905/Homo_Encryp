
`timescale 1 ns / 1 ps

import USER_PKG::*;
import FHE_ALU_PKG::*;
`include "defines.vh"

	module axi4_test_v1_0_S00_AXI #
	(
		parameter integer C_S_AXI_ID_WIDTH			= 1,
		parameter integer C_S_AXI_DATA_WIDTH		= 32,
		parameter integer C_S_AXI_ADDR_WIDTH		= 6,
		parameter integer C_S_AXI_AWUSER_WIDTH	= 0,
		parameter integer C_S_AXI_ARUSER_WIDTH	= 0,
		parameter integer C_S_AXI_WUSER_WIDTH		= 0,
		parameter integer C_S_AXI_RUSER_WIDTH		= 0,
		parameter integer C_S_AXI_BUSER_WIDTH		= 0
	)
	(
		// Clock and Reset Ports
		input 	logic  S_AXI_ACLK,
		input 	logic  S_AXI_ARESETN,

		//=============================================================================
		// AW channel(address write)
		//=============================================================================
		input 	logic [C_S_AXI_ID_WIDTH-1:0] 				S_AXI_AWID,
		input 	logic [C_S_AXI_ADDR_WIDTH-1:0] 			S_AXI_AWADDR,
		input 	logic [7 : 0] 											S_AXI_AWLEN,
		input 	logic [2 : 0] 											S_AXI_AWSIZE,
		input 	logic [1 : 0] 											S_AXI_AWBURST,
		input 	logic  															S_AXI_AWLOCK,
		input 	logic [3 : 0] 											S_AXI_AWCACHE,
		input 	logic [2 : 0] 											S_AXI_AWPROT,
		input 	logic [3 : 0] 											S_AXI_AWQOS,
		input 	logic [3 : 0] 											S_AXI_AWREGION,
		input 	logic [C_S_AXI_AWUSER_WIDTH-1 : 0] 	S_AXI_AWUSER,
		input 	logic  															S_AXI_AWVALID,
		output 	logic  															S_AXI_AWREADY,
		//=============================================================================
		// W channel(data write)
		//=============================================================================
		input 	IntcBenesInputs 										S_AXI_WDATA,
		input 	logic [(C_S_AXI_DATA_WIDTH/8)-1 : 0]S_AXI_WSTRB, 	// write strb(bit verification)
		input 	logic  															S_AXI_WLAST, 	// last signal in write transaction(burst type)
		input 	logic [C_S_AXI_WUSER_WIDTH-1 : 0] 	S_AXI_WUSER, 	// user defined write transaction(non-essential)
		input 	logic  															S_AXI_WVALID, // write valid
		output 	logic  															S_AXI_WREADY,
		
		//=============================================================================
		// B channel(write response)
		//=============================================================================
		output 	logic [C_S_AXI_ID_WIDTH-1 : 0] 			S_AXI_BID,
		output 	logic [1 : 0] 											S_AXI_BRESP,
		output 	logic [C_S_AXI_BUSER_WIDTH-1 : 0] 	S_AXI_BUSER,
		output 	logic  															S_AXI_BVALID,
		input  	logic  															S_AXI_BREADY,
		//=============================================================================
		// AR channel(address read)
		//=============================================================================
		input 	logic [C_S_AXI_ID_WIDTH-1 : 0] 			S_AXI_ARID,
		input 	logic [C_S_AXI_ADDR_WIDTH-1 : 0] 		S_AXI_ARADDR,
		input 	logic [7 : 0] 											S_AXI_ARLEN,
		input 	logic [2 : 0] 											S_AXI_ARSIZE,
		input 	logic [1 : 0] 											S_AXI_ARBURST,
		input 	logic  															S_AXI_ARLOCK,
		input 	logic [3 : 0] 											S_AXI_ARCACHE,
		input 	logic [2 : 0] 											S_AXI_ARPROT,
		input 	logic [3 : 0] 											S_AXI_ARQOS,
		input 	logic [3 : 0] 											S_AXI_ARREGION,
		input 	logic [C_S_AXI_ARUSER_WIDTH-1 : 0] 	S_AXI_ARUSER,
		input 	logic  															S_AXI_ARVALID,
		output 	logic  															S_AXI_ARREADY,
		//=============================================================================
		// R channel(read data channel)
		//=============================================================================
		output 	logic [C_S_AXI_ID_WIDTH-1 : 0] 			S_AXI_RID,
		output 	IntcBenesOutputs 										S_AXI_RDATA,
		output 	logic [1 : 0] 											S_AXI_RRESP,
		output 	logic  															S_AXI_RLAST,
		output 	logic [C_S_AXI_RUSER_WIDTH-1 : 0] 	S_AXI_RUSER,
		output 	logic  															S_AXI_RVALID,
		input 	logic  															S_AXI_RREADY
	);

	// AXI4 standard register
	logic [C_S_AXI_ADDR_WIDTH-1 : 0] 	axi_awaddr;
	logic  														axi_awready;

	logic  														axi_wready;

	logic [1 : 0] 										axi_bresp;
	logic [C_S_AXI_BUSER_WIDTH-1 : 0] axi_buser;
	logic  														axi_bvalid;

	logic [C_S_AXI_ADDR_WIDTH-1 : 0] 	axi_araddr;
	logic  														axi_arready;

	IntcBenesOutputs 									axi_rdata;
	logic [1 : 0] 										axi_rresp;
	logic  														axi_rlast;
	logic [C_S_AXI_RUSER_WIDTH-1 : 0] axi_ruser;
	logic  														axi_rvalid;

	logic 				aw_wrap_en;
	logic 				ar_wrap_en;
	logic [31:0]  aw_wrap_size ;
	logic [31:0]  ar_wrap_size ;
	logic 				axi_awv_awr_flag;
	logic 				axi_arv_arr_flag;
	logic [7:0] 	axi_awlen_cntr;
	logic [7:0] 	axi_arlen_cntr;
	logic [1:0] 	axi_arburst;
	logic [1:0] 	axi_awburst;
	logic [7:0] 	axi_arlen;
	logic [7:0] 	axi_awlen;

	localparam integer ADDR_LSB = (C_S_AXI_DATA_WIDTH/32)+ 1;
	localparam integer OPT_MEM_ADDR_BITS = 3;
	localparam integer USER_NUM_MEM = 1;
	//----------------------------------------------
	//-- Signals for user logic memory space example
	//------------------------------------------------
	logic [OPT_MEM_ADDR_BITS:0] 	 mem_address;
	logic [USER_NUM_MEM-1:0] 			 mem_select;
	logic [C_S_AXI_DATA_WIDTH-1:0] mem_data_out[0 : USER_NUM_MEM-1];

	genvar i;
	genvar j;
	genvar mem_byte_index;

	// I/O Connections assignments

	assign S_AXI_AWREADY	= axi_awready;
	assign S_AXI_WREADY		= axi_wready;
	assign S_AXI_BRESP		= axi_bresp;
	assign S_AXI_BUSER		= axi_buser;
	assign S_AXI_BVALID		= axi_bvalid;
	assign S_AXI_ARREADY	= axi_arready;
	assign S_AXI_RDATA		= axi_rdata;
	assign S_AXI_RRESP		= axi_rresp;
	assign S_AXI_RLAST		= axi_rlast;
	assign S_AXI_RUSER		= axi_ruser;
	assign S_AXI_RVALID		= axi_rvalid;
	assign S_AXI_BID 			= S_AXI_AWID;
	assign S_AXI_RID 			= S_AXI_ARID;
	assign aw_wrap_size 	= (C_S_AXI_DATA_WIDTH/8 * (axi_awlen)); 
	assign ar_wrap_size 	= (C_S_AXI_DATA_WIDTH/8 * (axi_arlen)); 
	assign aw_wrap_en 		= ((axi_awaddr & aw_wrap_size) == aw_wrap_size)? 1'b1: 1'b0;
	assign ar_wrap_en 		= ((axi_araddr & ar_wrap_size) == ar_wrap_size)? 1'b1: 1'b0;
	
	always_ff@( posedge S_AXI_ACLK )
	begin
	  if (!S_AXI_ARESETN)
	    begin
	      axi_awready 		 <= 1'b0;
	      axi_awv_awr_flag <= 1'b0;
	    end else begin    
	      if (~axi_awready && S_AXI_AWVALID && ~axi_awv_awr_flag && ~axi_arv_arr_flag)
	        begin
	          axi_awready 			<= 1'b1;
	          axi_awv_awr_flag  <= 1'b1; 
	        end else if (S_AXI_WLAST && axi_wready) begin
	          axi_awv_awr_flag  <= 1'b0;
	        end else begin
	          axi_awready <= 1'b0;
	        end
	    end 
	end       

	always_ff@( posedge S_AXI_ACLK ) begin
	  if (!S_AXI_ARESETN) begin
	      axi_awaddr <= 0;
	      axi_awlen_cntr <= 0;
	      axi_awburst <= 0;
	      axi_awlen <= 0;
	    end else begin    
	      if (~axi_awready && S_AXI_AWVALID && ~axi_awv_awr_flag)
	        begin
	          // address latching 
	          axi_awaddr <= S_AXI_AWADDR[C_S_AXI_ADDR_WIDTH - 1:0];  
	           axi_awburst <= S_AXI_AWBURST; 
	           axi_awlen <= S_AXI_AWLEN;     
	          // start address of transfer
	          axi_awlen_cntr <= 0;
	        end   
	      else if((axi_awlen_cntr <= axi_awlen) && axi_wready && S_AXI_WVALID)        
	        begin

	          axi_awlen_cntr <= axi_awlen_cntr + 1;

	          case (axi_awburst)
	            2'b00: // fixed burst
	            // The write address for all the beats in the transaction are fixed
	              begin
	                axi_awaddr <= axi_awaddr;          
	                //for awsize = 4 bytes (010)
	              end   
	            2'b01: //incremental burst
	            // The write address for all the beats in the transaction are increments by awsize
	              begin
	                axi_awaddr[C_S_AXI_ADDR_WIDTH - 1:ADDR_LSB] <= axi_awaddr[C_S_AXI_ADDR_WIDTH - 1:ADDR_LSB] + 1;
	                //awaddr aligned to 4 byte boundary
	                axi_awaddr[ADDR_LSB-1:0]  <= {ADDR_LSB{1'b0}};   
	                //for awsize = 4 bytes (010)
	              end   
	            2'b10: //Wrapping burst
	            // The write address wraps when the address reaches wrap boundary 
	              if (aw_wrap_en)
	                begin
	                  axi_awaddr <= (axi_awaddr - aw_wrap_size); 
	                end
	              else 
	                begin
	                  axi_awaddr[C_S_AXI_ADDR_WIDTH - 1:ADDR_LSB] <= axi_awaddr[C_S_AXI_ADDR_WIDTH - 1:ADDR_LSB] + 1;
	                  axi_awaddr[ADDR_LSB-1:0]  <= {ADDR_LSB{1'b0}}; 
	                end                      
	            default: //reserved (incremental burst for example)
	              begin
	                axi_awaddr <= axi_awaddr[C_S_AXI_ADDR_WIDTH - 1:ADDR_LSB] + 1;
	                //for awsize = 4 bytes (010)
	              end
	          endcase              
	        end
	    end 
	end       
	// Implement axi_wready generation

	// axi_wready is asserted for one S_AXI_ACLK clock cycle when both
	// S_AXI_AWVALID and S_AXI_WVALID are asserted. axi_wready is 
	// de-asserted when reset is low. 

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_wready <= 1'b0;
	    end 
	  else
	    begin    
	      if ( ~axi_wready && S_AXI_WVALID && axi_awv_awr_flag)
	        begin
	          // slave can accept the write data
	          axi_wready <= 1'b1;
	        end
	      //else if (~axi_awv_awr_flag)
	      else if (S_AXI_WLAST && axi_wready)
	        begin
	          axi_wready <= 1'b0;
	        end
	    end 
	end       
	// Implement write response logic generation

	// The write response and response valid signals are asserted by the slave 
	// when axi_wready, S_AXI_WVALID, axi_wready and S_AXI_WVALID are asserted.  
	// This marks the acceptance of address and indicates the status of 
	// write transaction.

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_bvalid <= 0;
	      axi_bresp <= 2'b0;
	      axi_buser <= 0;
	    end 
	  else
	    begin    
	      if (axi_awv_awr_flag && axi_wready && S_AXI_WVALID && ~axi_bvalid && S_AXI_WLAST )
	        begin
	          axi_bvalid <= 1'b1;
	          axi_bresp  <= 2'b0; 
	          // 'OKAY' response 
	        end                   
	      else
	        begin
	          if (S_AXI_BREADY && axi_bvalid) 
	          //check if bready is asserted while bvalid is high) 
	          //(there is a possibility that bready is always asserted high)   
	            begin
	              axi_bvalid <= 1'b0; 
	            end  
	        end
	    end
	 end   
	// Implement axi_arready generation

	// axi_arready is asserted for one S_AXI_ACLK clock cycle when
	// S_AXI_ARVALID is asserted. axi_awready is 
	// de-asserted when reset (active low) is asserted. 
	// The read address is also latched when S_AXI_ARVALID is 
	// asserted. axi_araddr is reset to zero on reset assertion.

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_arready <= 1'b0;
	      axi_arv_arr_flag <= 1'b0;
	    end 
	  else
	    begin    
	      if (~axi_arready && S_AXI_ARVALID && ~axi_awv_awr_flag && ~axi_arv_arr_flag)
	        begin
	          axi_arready <= 1'b1;
	          axi_arv_arr_flag <= 1'b1;
	        end
	      else if (axi_rvalid && S_AXI_RREADY && axi_arlen_cntr == axi_arlen)
	      // preparing to accept next address after current read completion
	        begin
	          axi_arv_arr_flag  <= 1'b0;
	        end
	      else        
	        begin
	          axi_arready <= 1'b0;
	        end
	    end 
	end       
	// Implement axi_araddr latching

	//This process is used to latch the address when both 
	//S_AXI_ARVALID and S_AXI_RVALID are valid. 
	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_araddr <= 0;
	      axi_arlen_cntr <= 0;
	      axi_arburst <= 0;
	      axi_arlen <= 0;
	      axi_rlast <= 1'b0;
	      axi_ruser <= 0;
	    end 
	  else
	    begin    
	      if (~axi_arready && S_AXI_ARVALID && ~axi_arv_arr_flag)
	        begin
	          // address latching 
	          axi_araddr <= S_AXI_ARADDR[C_S_AXI_ADDR_WIDTH - 1:0]; 
	          axi_arburst <= S_AXI_ARBURST; 
	          axi_arlen <= S_AXI_ARLEN;     
	          // start address of transfer
	          axi_arlen_cntr <= 0;
	          axi_rlast <= 1'b0;
	        end   
	      else if((axi_arlen_cntr <= axi_arlen) && axi_rvalid && S_AXI_RREADY)        
	        begin
	         
	          axi_arlen_cntr <= axi_arlen_cntr + 1;
	          axi_rlast <= 1'b0;
	        
	          case (axi_arburst)
	            2'b00: // fixed burst
	             // The read address for all the beats in the transaction are fixed
	              begin
	                axi_araddr       <= axi_araddr;        
	                //for arsize = 4 bytes (010)
	              end   
	            2'b01: //incremental burst
	            // The read address for all the beats in the transaction are increments by awsize
	              begin
	                axi_araddr[C_S_AXI_ADDR_WIDTH - 1:ADDR_LSB] <= axi_araddr[C_S_AXI_ADDR_WIDTH - 1:ADDR_LSB] + 1; 
	                //araddr aligned to 4 byte boundary
	                axi_araddr[ADDR_LSB-1:0]  <= {ADDR_LSB{1'b0}};   
	                //for awsize = 4 bytes (010)
	              end   
	            2'b10: //Wrapping burst
	            // The read address wraps when the address reaches wrap boundary 
	              if (ar_wrap_en) 
	                begin
	                  axi_araddr <= (axi_araddr - ar_wrap_size); 
	                end
	              else 
	                begin
	                axi_araddr[C_S_AXI_ADDR_WIDTH - 1:ADDR_LSB] <= axi_araddr[C_S_AXI_ADDR_WIDTH - 1:ADDR_LSB] + 1; 
	                //araddr aligned to 4 byte boundary
	                axi_araddr[ADDR_LSB-1:0]  <= {ADDR_LSB{1'b0}};   
	                end                      
	            default: //reserved (incremental burst for example)
	              begin
	                axi_araddr <= axi_araddr[C_S_AXI_ADDR_WIDTH - 1:ADDR_LSB]+1;
	                //for arsize = 4 bytes (010)
	              end
	          endcase              
	        end
	      else if((axi_arlen_cntr == axi_arlen) && ~axi_rlast && axi_arv_arr_flag )   
	        begin
	          axi_rlast <= 1'b1;
	        end          
	      else if (S_AXI_RREADY)   
	        begin
	          axi_rlast <= 1'b0;
	        end          
	    end 
	end       
	// Implement axi_arvalid generation

	// axi_rvalid is asserted for one S_AXI_ACLK clock cycle when both 
	// S_AXI_ARVALID and axi_arready are asserted. The slave registers 
	// data are available on the axi_rdata bus at this instance. The 
	// assertion of axi_rvalid marks the validity of read data on the 
	// bus and axi_rresp indicates the status of read transaction.axi_rvalid 
	// is deasserted on reset (active low). axi_rresp and axi_rdata are 
	// cleared to zero on reset (active low).  

	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_rvalid <= 0;
	      axi_rresp  <= 0;
	    end 
	  else
	    begin    
	      if (axi_arv_arr_flag && ~axi_rvalid)
	        begin
	          axi_rvalid <= 1'b1;
	          axi_rresp  <= 2'b0; 
	          // 'OKAY' response
	        end   
	      else if (axi_rvalid && S_AXI_RREADY)
	        begin
	          axi_rvalid <= 1'b0;
	        end            
	    end
	end    
	// ------------------------------------------
	// -- Example code to access user logic memory region
	// ------------------------------------------

	generate
	  if (USER_NUM_MEM >= 1)
	    begin
	      assign mem_select  = 1;
	      assign mem_address = (axi_arv_arr_flag? axi_araddr[ADDR_LSB+OPT_MEM_ADDR_BITS:ADDR_LSB]:(axi_awv_awr_flag? axi_awaddr[ADDR_LSB+OPT_MEM_ADDR_BITS:ADDR_LSB]:0));
	    end
	endgenerate
	     
	// implement Block RAM(s)
	generate 
	  for(i=0; i<= USER_NUM_MEM-1; i=i+1)
	    begin:BRAM_GEN
	      logic mem_rden;
	      logic mem_wren;
	
	      assign mem_wren = axi_wready && S_AXI_WVALID ;
	
	      assign mem_rden = axi_arv_arr_flag ; //& ~axi_rvalid
	     
	      for(mem_byte_index=0; mem_byte_index<= (C_S_AXI_DATA_WIDTH/8-1); mem_byte_index=mem_byte_index+1)
	      begin:BYTE_BRAM_GEN
	        logic [8-1:0] data_in ;
	        logic [8-1:0] data_out;
	        logic  [8-1:0] byte_ram [0 : 15];
	        integer  j;
	     
	        //assigning 8 bit data
	        assign data_in  = S_AXI_WDATA[(mem_byte_index*8+7) -: 8];
	        assign data_out = byte_ram[mem_address];
	     
	        always @( posedge S_AXI_ACLK )
	        begin
	          if (mem_wren && S_AXI_WSTRB[mem_byte_index])
	            begin
	              byte_ram[mem_address] <= data_in;
	            end   
	        end    
	      
	        always @( posedge S_AXI_ACLK )
	        begin
	          if (mem_rden)
	            begin
	              mem_data_out[i][(mem_byte_index*8+7) -: 8] <= data_out;
	            end   
	        end    
	               
	    end
	  end       
	endgenerate
	//Output register or memory read data

	always_comb	begin
	  if (axi_rvalid) 
	    begin
	      // Read address mux
	      axi_rdata <= mem_data_out[0];
	    end   
	  else
	    begin
	      axi_rdata <= 32'h00000000;
	    end       
	end    

	Interconnect_benes under_test(
		.clk(S_AXI_ACLK),
		.rst_n(S_AXI_ARESETN),
		.i_ram_outputs(),
		.i_module_outputs(),
		.i_module_select(),
		.i_slot_select(),
		.o_ram_inputs(),
		.o_module_inputs()
	);
	endmodule
