
`timescale 1 ns / 1 ps

	module AXI_interface_v1_0 #
	(
		// Users to add parameters here

		// User parameters ends
		// Do not modify the parameters beyond this line


		// Parameters of Axi Slave Bus Interface AXI_S_Stream
		parameter integer C_AXI_S_Stream_TDATA_WIDTH	= 32,

		// Parameters of Axi Slave Bus Interface AXI_S_lite
		parameter integer C_AXI_S_lite_DATA_WIDTH	= 32,
		parameter integer C_AXI_S_lite_ADDR_WIDTH	= 4,

		// Parameters of Axi Master Bus Interface AXI_M_Stream
		parameter integer C_AXI_M_Stream_TDATA_WIDTH	= 32,
		parameter integer C_AXI_M_Stream_START_COUNT	= 32
	)
	(
		// Users to add ports here

		// User ports ends
		// Do not modify the ports beyond this line


		// Ports of Axi Slave Bus Interface AXI_S_Stream
		input wire  axi_s_stream_aclk,
		input wire  axi_s_stream_aresetn,
		output wire  axi_s_stream_tready,
		input wire [C_AXI_S_Stream_TDATA_WIDTH-1 : 0] axi_s_stream_tdata,
		input wire [(C_AXI_S_Stream_TDATA_WIDTH/8)-1 : 0] axi_s_stream_tstrb,
		input wire  axi_s_stream_tlast,
		input wire  axi_s_stream_tvalid,

		// Ports of Axi Slave Bus Interface AXI_S_lite
		input wire  axi_s_lite_aclk,
		input wire  axi_s_lite_aresetn,
		input wire [C_AXI_S_lite_ADDR_WIDTH-1 : 0] axi_s_lite_awaddr,
		input wire [2 : 0] axi_s_lite_awprot,
		input wire  axi_s_lite_awvalid,
		output wire  axi_s_lite_awready,
		input wire [C_AXI_S_lite_DATA_WIDTH-1 : 0] axi_s_lite_wdata,
		input wire [(C_AXI_S_lite_DATA_WIDTH/8)-1 : 0] axi_s_lite_wstrb,
		input wire  axi_s_lite_wvalid,
		output wire  axi_s_lite_wready,
		output wire [1 : 0] axi_s_lite_bresp,
		output wire  axi_s_lite_bvalid,
		input wire  axi_s_lite_bready,
		input wire [C_AXI_S_lite_ADDR_WIDTH-1 : 0] axi_s_lite_araddr,
		input wire [2 : 0] axi_s_lite_arprot,
		input wire  axi_s_lite_arvalid,
		output wire  axi_s_lite_arready,
		output wire [C_AXI_S_lite_DATA_WIDTH-1 : 0] axi_s_lite_rdata,
		output wire [1 : 0] axi_s_lite_rresp,
		output wire  axi_s_lite_rvalid,
		input wire  axi_s_lite_rready,

		// Ports of Axi Master Bus Interface AXI_M_Stream
		input wire  axi_m_stream_aclk,
		input wire  axi_m_stream_aresetn,
		output wire  axi_m_stream_tvalid,
		output wire [C_AXI_M_Stream_TDATA_WIDTH-1 : 0] axi_m_stream_tdata,
		output wire [(C_AXI_M_Stream_TDATA_WIDTH/8)-1 : 0] axi_m_stream_tstrb,
		output wire  axi_m_stream_tlast,
		input wire  axi_m_stream_tready
	);
// Instantiation of Axi Bus Interface AXI_S_Stream
	AXI_interface_v1_0_AXI_S_Stream # ( 
		.C_S_AXIS_TDATA_WIDTH(C_AXI_S_Stream_TDATA_WIDTH)
	) AXI_interface_v1_0_AXI_S_Stream_inst (
		.S_AXIS_ACLK(axi_s_stream_aclk),
		.S_AXIS_ARESETN(axi_s_stream_aresetn),
		.S_AXIS_TREADY(axi_s_stream_tready),
		.S_AXIS_TDATA(axi_s_stream_tdata),
		.S_AXIS_TSTRB(axi_s_stream_tstrb),
		.S_AXIS_TLAST(axi_s_stream_tlast),
		.S_AXIS_TVALID(axi_s_stream_tvalid)
	);

// Instantiation of Axi Bus Interface AXI_S_lite
	AXI_interface_v1_0_AXI_S_lite # ( 
		.C_S_AXI_DATA_WIDTH(C_AXI_S_lite_DATA_WIDTH),
		.C_S_AXI_ADDR_WIDTH(C_AXI_S_lite_ADDR_WIDTH)
	) AXI_interface_v1_0_AXI_S_lite_inst (
		.S_AXI_ACLK(axi_s_lite_aclk),
		.S_AXI_ARESETN(axi_s_lite_aresetn),
		.S_AXI_AWADDR(axi_s_lite_awaddr),
		.S_AXI_AWPROT(axi_s_lite_awprot),
		.S_AXI_AWVALID(axi_s_lite_awvalid),
		.S_AXI_AWREADY(axi_s_lite_awready),
		.S_AXI_WDATA(axi_s_lite_wdata),
		.S_AXI_WSTRB(axi_s_lite_wstrb),
		.S_AXI_WVALID(axi_s_lite_wvalid),
		.S_AXI_WREADY(axi_s_lite_wready),
		.S_AXI_BRESP(axi_s_lite_bresp),
		.S_AXI_BVALID(axi_s_lite_bvalid),
		.S_AXI_BREADY(axi_s_lite_bready),
		.S_AXI_ARADDR(axi_s_lite_araddr),
		.S_AXI_ARPROT(axi_s_lite_arprot),
		.S_AXI_ARVALID(axi_s_lite_arvalid),
		.S_AXI_ARREADY(axi_s_lite_arready),
		.S_AXI_RDATA(axi_s_lite_rdata),
		.S_AXI_RRESP(axi_s_lite_rresp),
		.S_AXI_RVALID(axi_s_lite_rvalid),
		.S_AXI_RREADY(axi_s_lite_rready)
	);

// Instantiation of Axi Bus Interface AXI_M_Stream
	AXI_interface_v1_0_AXI_M_Stream # ( 
		.C_M_AXIS_TDATA_WIDTH(C_AXI_M_Stream_TDATA_WIDTH),
		.C_M_START_COUNT(C_AXI_M_Stream_START_COUNT)
	) AXI_interface_v1_0_AXI_M_Stream_inst (
		.M_AXIS_ACLK(axi_m_stream_aclk),
		.M_AXIS_ARESETN(axi_m_stream_aresetn),
		.M_AXIS_TVALID(axi_m_stream_tvalid),
		.M_AXIS_TDATA(axi_m_stream_tdata),
		.M_AXIS_TSTRB(axi_m_stream_tstrb),
		.M_AXIS_TLAST(axi_m_stream_tlast),
		.M_AXIS_TREADY(axi_m_stream_tready)
	);

	// Add user logic here

	// User logic ends

	endmodule
