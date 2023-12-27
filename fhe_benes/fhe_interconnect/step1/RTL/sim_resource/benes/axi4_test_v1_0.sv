	`timescale 1 ns/ 1 ns
	`include "defines.vh"
	//import USER_PKG::*;
	import FHE_ALU_PKG::*;

	module axi4_test_v1_0 #
	(
		// Parameters of Axi Slave Bus Interface S00_AXI
		parameter integer C_S00_AXI_ID_WIDTH			= 1,
		parameter integer C_S00_AXI_DATA_WIDTH		= 512,
		parameter integer C_S00_AXI_ADDR_WIDTH		= 6,
		parameter integer C_S00_AXI_AWUSER_WIDTH	= 0,
		parameter integer C_S00_AXI_ARUSER_WIDTH	= 0,
		parameter integer C_S00_AXI_WUSER_WIDTH		= 0,
		parameter integer C_S00_AXI_RUSER_WIDTH		= 0,
		parameter integer C_S00_AXI_BUSER_WIDTH		= 0
	)
	(
		// Ports of Axi Slave Bus Interface S00_AXI
		input logic  																s00_axi_aclk,
		input logic  																s00_axi_aresetn,
		//================================================
		//aw channel(address write)
		//================================================
		input logic 	[C_S00_AXI_ID_WIDTH-1 	: 0]		s00_axi_awid, 	 // address write id
		input logic 	[C_S00_AXI_ADDR_WIDTH-1 : 0]		s00_axi_awaddr,  // address write address
		input logic 	[7 : 0] 												s00_axi_awlen,   //한번의 write transaction에서 write할 data의 갯수
		input logic 	[2 : 0] 												s00_axi_awsize,  //data의 크기(2의 지수 표현)(pow(2,awsize) = data의 크기))
		input logic 	[1 : 0] 												s00_axi_awburst, //address write burst type(0:fix,1:incr,2:wrap,3:reserved)
		input logic  																	s00_axi_awlock,  //address write lock type (not use)
		input logic 	[3 : 0] 												s00_axi_awcache, //address write cache type(not use)
		input logic 	[2 : 0] 												s00_axi_awprot,  //address write protection type(not use)
		input logic 	[3 : 0] 												s00_axi_awqos,   //address write qos type(not use)
		input logic 	[3 : 0] 												s00_axi_awregion,//address write region type(not use)
		input logic [C_S00_AXI_AWUSER_WIDTH-1:0] 			s00_axi_awuser,  //address write user type(not use)
		input logic  																	s00_axi_awvalid, //address write valid
		output logic  															 	s00_axi_awready, //address write ready
		//================================================
		//w channel(write)
		//================================================
		input logic [C_S00_AXI_DATA_WIDTH-1 : 0] 	 	s00_axi_wdata,
		input logic [(C_S00_AXI_DATA_WIDTH/8)-1: 0] s00_axi_wstrb,
		input logic  																s00_axi_wlast,
		input logic [C_S00_AXI_WUSER_WIDTH-1 : 0] 	s00_axi_wuser,
		input logic  																s00_axi_wvalid,
		output logic  															s00_axi_wready,
		//================================================
		//b channel(write response)
		//================================================
		output logic [C_S00_AXI_ID_WIDTH-1 : 0] 		s00_axi_bid,
		output logic [1 : 0] 												s00_axi_bresp,
		output logic [C_S00_AXI_BUSER_WIDTH-1 : 0] 	s00_axi_buser,
		output logic  															s00_axi_bvalid,
		input logic  																s00_axi_bready,
		//================================================
		//ar channel(address read)
		//================================================
		input logic [C_S00_AXI_ID_WIDTH-1 : 0] 			s00_axi_arid,
		input logic [C_S00_AXI_ADDR_WIDTH-1 : 0] 		s00_axi_araddr,
		input logic [7 : 0] 												s00_axi_arlen,
		input logic [2 : 0] 												s00_axi_arsize,
		input logic [1 : 0] 												s00_axi_arburst,
		input logic  																s00_axi_arlock,
		input logic [3 : 0] 												s00_axi_arcache,
		input logic [2 : 0] 												s00_axi_arprot,
		input logic [3 : 0] 												s00_axi_arqos,
		input logic [3 : 0] 												s00_axi_arregion,
		input logic [C_S00_AXI_ARUSER_WIDTH-1 : 0] 	s00_axi_aruser,
		input logic  																s00_axi_arvalid,
		output logic  															s00_axi_arready,
		//================================================
		//r channel(read response)
		//================================================
		output logic [C_S00_AXI_ID_WIDTH-1 : 0] 		s00_axi_rid,
		output logic [C_S00_AXI_DATA_WIDTH-1 : 0] 	s00_axi_rdata,
		output logic [1 : 0] 												s00_axi_rresp,
		output logic  															s00_axi_rlast,
		output logic [C_S00_AXI_RUSER_WIDTH-1 : 0] 	s00_axi_ruser,
		output logic  															s00_axi_rvalid,
		input logic  																s00_axi_rready
	);
// Instantiation of Axi Bus Interface S00_AXI
	axi4_test_v1_0_S00_AXI # ( 
		.C_S_AXI_ID_WIDTH			(C_S00_AXI_ID_WIDTH),
		.C_S_AXI_DATA_WIDTH		(C_S00_AXI_DATA_WIDTH),
		.C_S_AXI_ADDR_WIDTH		(C_S00_AXI_ADDR_WIDTH),
		.C_S_AXI_AWUSER_WIDTH	(C_S00_AXI_AWUSER_WIDTH),
		.C_S_AXI_ARUSER_WIDTH	(C_S00_AXI_ARUSER_WIDTH),
		.C_S_AXI_WUSER_WIDTH	(C_S00_AXI_WUSER_WIDTH),
		.C_S_AXI_RUSER_WIDTH	(C_S00_AXI_RUSER_WIDTH),
		.C_S_AXI_BUSER_WIDTH	(C_S00_AXI_BUSER_WIDTH)
	) axi4_test_v1_0_S00_AXI_inst (
		.S_AXI_ACLK						(s00_axi_aclk),
		.S_AXI_ARESETN				(s00_axi_aresetn),
		.S_AXI_AWID						(s00_axi_awid),
		.S_AXI_AWADDR					(s00_axi_awaddr),
		.S_AXI_AWLEN					(s00_axi_awlen),
		.S_AXI_AWSIZE					(s00_axi_awsize),
		.S_AXI_AWBURST				(s00_axi_awburst),
		.S_AXI_AWLOCK					(s00_axi_awlock),
		.S_AXI_AWCACHE				(s00_axi_awcache),
		.S_AXI_AWPROT					(s00_axi_awprot),
		.S_AXI_AWQOS					(s00_axi_awqos),
		.S_AXI_AWREGION				(s00_axi_awregion),
		.S_AXI_AWUSER					(s00_axi_awuser),
		.S_AXI_AWVALID				(s00_axi_awvalid),
		.S_AXI_AWREADY				(s00_axi_awready),
		.S_AXI_WDATA					(s00_axi_wdata),
		.S_AXI_WSTRB					(s00_axi_wstrb),
		.S_AXI_WLAST					(s00_axi_wlast),
		.S_AXI_WUSER					(s00_axi_wuser),
		.S_AXI_WVALID					(s00_axi_wvalid),
		.S_AXI_WREADY					(s00_axi_wready),
		.S_AXI_BID						(s00_axi_bid),
		.S_AXI_BRESP					(s00_axi_bresp),
		.S_AXI_BUSER					(s00_axi_buser),
		.S_AXI_BVALID					(s00_axi_bvalid),
		.S_AXI_BREADY					(s00_axi_bready),
		.S_AXI_ARID						(s00_axi_arid),
		.S_AXI_ARADDR					(s00_axi_araddr),
		.S_AXI_ARLEN					(s00_axi_arlen),
		.S_AXI_ARSIZE					(s00_axi_arsize),
		.S_AXI_ARBURST				(s00_axi_arburst),
		.S_AXI_ARLOCK					(s00_axi_arlock),
		.S_AXI_ARCACHE				(s00_axi_arcache),
		.S_AXI_ARPROT					(s00_axi_arprot),
		.S_AXI_ARQOS					(s00_axi_arqos),
		.S_AXI_ARREGION				(s00_axi_arregion),
		.S_AXI_ARUSER					(s00_axi_aruser),
		.S_AXI_ARVALID				(s00_axi_arvalid),
		.S_AXI_ARREADY				(s00_axi_arready),
		.S_AXI_RID						(s00_axi_rid),
		.S_AXI_RDATA					(s00_axi_rdata),
		.S_AXI_RRESP					(s00_axi_rresp),
		.S_AXI_RLAST					(s00_axi_rlast),
		.S_AXI_RUSER					(s00_axi_ruser),
		.S_AXI_RVALID					(s00_axi_rvalid),
		.S_AXI_RREADY					(s00_axi_rready)
	);
	endmodule
