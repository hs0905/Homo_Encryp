// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2.2 (lin64) Build 3118627 Tue Feb  9 05:13:49 MST 2021
// Date        : Sun Nov 19 03:01:40 2023
// Host        : baldur running 64-bit Ubuntu 18.04.6 LTS
// Command     : write_verilog -force -mode funcsim -rename_top deviceid903f_axi_lite_benes_0_0 -prefix
//               deviceid903f_axi_lite_benes_0_0_ XDMA_AXI_BENES_axi_lite_benes_0_0_sim_netlist.v
// Design      : XDMA_AXI_BENES_axi_lite_benes_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcu280-fsvh2892-2L-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module deviceid903f_axi_lite_benes_0_0_Axi_lite_v1_0
   (s00_axi_wready,
    S_AXI_AWREADY,
    S_AXI_ARREADY,
    s00_axi_rdata,
    s00_axi_rvalid,
    s00_axi_bvalid,
    s00_axi_wdata,
    s00_axi_aclk,
    s00_axi_aresetn,
    s00_axi_wvalid,
    s00_axi_awvalid,
    s00_axi_arvalid,
    s00_axi_bready,
    s00_axi_rready);
  output s00_axi_wready;
  output S_AXI_AWREADY;
  output S_AXI_ARREADY;
  output [31:0]s00_axi_rdata;
  output s00_axi_rvalid;
  output s00_axi_bvalid;
  input [19:0]s00_axi_wdata;
  input s00_axi_aclk;
  input s00_axi_aresetn;
  input s00_axi_wvalid;
  input s00_axi_awvalid;
  input s00_axi_arvalid;
  input s00_axi_bready;
  input s00_axi_rready;

  wire S_AXI_ARREADY;
  wire S_AXI_AWREADY;
  wire s00_axi_aclk;
  wire s00_axi_aresetn;
  wire s00_axi_arvalid;
  wire s00_axi_awvalid;
  wire s00_axi_bready;
  wire s00_axi_bvalid;
  wire [31:0]s00_axi_rdata;
  wire s00_axi_rready;
  wire s00_axi_rvalid;
  wire [19:0]s00_axi_wdata;
  wire s00_axi_wready;
  wire s00_axi_wvalid;

  deviceid903f_axi_lite_benes_0_0_Axi_lite_v1_0_S00_AXI Axi_lite_v1_0_S00_AXI_inst
       (.S_AXI_ARREADY(S_AXI_ARREADY),
        .S_AXI_AWREADY(S_AXI_AWREADY),
        .s00_axi_aclk(s00_axi_aclk),
        .s00_axi_aresetn(s00_axi_aresetn),
        .s00_axi_arvalid(s00_axi_arvalid),
        .s00_axi_awvalid(s00_axi_awvalid),
        .s00_axi_bready(s00_axi_bready),
        .s00_axi_bvalid(s00_axi_bvalid),
        .s00_axi_rdata(s00_axi_rdata),
        .s00_axi_rready(s00_axi_rready),
        .s00_axi_rvalid(s00_axi_rvalid),
        .s00_axi_wdata(s00_axi_wdata),
        .s00_axi_wready(s00_axi_wready),
        .s00_axi_wvalid(s00_axi_wvalid));
endmodule

module deviceid903f_axi_lite_benes_0_0_Axi_lite_v1_0_S00_AXI
   (s00_axi_wready,
    S_AXI_AWREADY,
    S_AXI_ARREADY,
    s00_axi_rdata,
    s00_axi_rvalid,
    s00_axi_bvalid,
    s00_axi_wdata,
    s00_axi_aclk,
    s00_axi_aresetn,
    s00_axi_wvalid,
    s00_axi_awvalid,
    s00_axi_arvalid,
    s00_axi_bready,
    s00_axi_rready);
  output s00_axi_wready;
  output S_AXI_AWREADY;
  output S_AXI_ARREADY;
  output [31:0]s00_axi_rdata;
  output s00_axi_rvalid;
  output s00_axi_bvalid;
  input [19:0]s00_axi_wdata;
  input s00_axi_aclk;
  input s00_axi_aresetn;
  input s00_axi_wvalid;
  input s00_axi_awvalid;
  input s00_axi_arvalid;
  input s00_axi_bready;
  input s00_axi_rready;

  wire S_AXI_ARREADY;
  wire S_AXI_AWREADY;
  wire aw_en_i_1_n_0;
  wire aw_en_reg_n_0;
  wire axi_arready0;
  wire axi_awready0__0;
  wire axi_bvalid_i_1_n_0;
  wire axi_rvalid_i_1_n_0;
  wire axi_wready0__0;
  wire p_0_in;
  wire [31:0]reg_data_out;
  wire s00_axi_aclk;
  wire s00_axi_aresetn;
  wire s00_axi_arvalid;
  wire s00_axi_awvalid;
  wire s00_axi_bready;
  wire s00_axi_bvalid;
  wire [31:0]s00_axi_rdata;
  wire s00_axi_rready;
  wire s00_axi_rvalid;
  wire [19:0]s00_axi_wdata;
  wire s00_axi_wready;
  wire s00_axi_wvalid;
  wire slv_reg_rden__0;

  LUT6 #(
    .INIT(64'hF7FFF700F700F700)) 
    aw_en_i_1
       (.I0(s00_axi_awvalid),
        .I1(s00_axi_wvalid),
        .I2(S_AXI_AWREADY),
        .I3(aw_en_reg_n_0),
        .I4(s00_axi_bready),
        .I5(s00_axi_bvalid),
        .O(aw_en_i_1_n_0));
  FDSE aw_en_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(aw_en_i_1_n_0),
        .Q(aw_en_reg_n_0),
        .S(p_0_in));
  (* SOFT_HLUTNM = "soft_lutpair94" *) 
  LUT2 #(
    .INIT(4'h2)) 
    axi_arready_i_1
       (.I0(s00_axi_arvalid),
        .I1(S_AXI_ARREADY),
        .O(axi_arready0));
  FDRE axi_arready_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_arready0),
        .Q(S_AXI_ARREADY),
        .R(p_0_in));
  (* SOFT_HLUTNM = "soft_lutpair93" *) 
  LUT4 #(
    .INIT(16'h2000)) 
    axi_awready0
       (.I0(aw_en_reg_n_0),
        .I1(S_AXI_AWREADY),
        .I2(s00_axi_wvalid),
        .I3(s00_axi_awvalid),
        .O(axi_awready0__0));
  FDRE axi_awready_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_awready0__0),
        .Q(S_AXI_AWREADY),
        .R(p_0_in));
  LUT6 #(
    .INIT(64'h0000FFFF80008000)) 
    axi_bvalid_i_1
       (.I0(S_AXI_AWREADY),
        .I1(s00_axi_wready),
        .I2(s00_axi_awvalid),
        .I3(s00_axi_wvalid),
        .I4(s00_axi_bready),
        .I5(s00_axi_bvalid),
        .O(axi_bvalid_i_1_n_0));
  FDRE axi_bvalid_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_bvalid_i_1_n_0),
        .Q(s00_axi_bvalid),
        .R(p_0_in));
  FDRE \axi_rdata_reg[0] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[0]),
        .Q(s00_axi_rdata[0]),
        .R(p_0_in));
  FDRE \axi_rdata_reg[10] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[10]),
        .Q(s00_axi_rdata[10]),
        .R(p_0_in));
  FDRE \axi_rdata_reg[11] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[11]),
        .Q(s00_axi_rdata[11]),
        .R(p_0_in));
  FDRE \axi_rdata_reg[12] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[12]),
        .Q(s00_axi_rdata[12]),
        .R(p_0_in));
  FDRE \axi_rdata_reg[13] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[13]),
        .Q(s00_axi_rdata[13]),
        .R(p_0_in));
  FDRE \axi_rdata_reg[14] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[14]),
        .Q(s00_axi_rdata[14]),
        .R(p_0_in));
  FDRE \axi_rdata_reg[15] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[15]),
        .Q(s00_axi_rdata[15]),
        .R(p_0_in));
  FDRE \axi_rdata_reg[16] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[16]),
        .Q(s00_axi_rdata[16]),
        .R(p_0_in));
  FDRE \axi_rdata_reg[17] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[17]),
        .Q(s00_axi_rdata[17]),
        .R(p_0_in));
  FDRE \axi_rdata_reg[18] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[18]),
        .Q(s00_axi_rdata[18]),
        .R(p_0_in));
  FDRE \axi_rdata_reg[19] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[19]),
        .Q(s00_axi_rdata[19]),
        .R(p_0_in));
  FDRE \axi_rdata_reg[1] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[1]),
        .Q(s00_axi_rdata[1]),
        .R(p_0_in));
  FDRE \axi_rdata_reg[20] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[20]),
        .Q(s00_axi_rdata[20]),
        .R(p_0_in));
  FDRE \axi_rdata_reg[21] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[21]),
        .Q(s00_axi_rdata[21]),
        .R(p_0_in));
  FDRE \axi_rdata_reg[22] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[22]),
        .Q(s00_axi_rdata[22]),
        .R(p_0_in));
  FDRE \axi_rdata_reg[23] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[23]),
        .Q(s00_axi_rdata[23]),
        .R(p_0_in));
  FDRE \axi_rdata_reg[24] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[24]),
        .Q(s00_axi_rdata[24]),
        .R(p_0_in));
  FDRE \axi_rdata_reg[25] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[25]),
        .Q(s00_axi_rdata[25]),
        .R(p_0_in));
  FDRE \axi_rdata_reg[26] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[26]),
        .Q(s00_axi_rdata[26]),
        .R(p_0_in));
  FDRE \axi_rdata_reg[27] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[27]),
        .Q(s00_axi_rdata[27]),
        .R(p_0_in));
  FDRE \axi_rdata_reg[28] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[28]),
        .Q(s00_axi_rdata[28]),
        .R(p_0_in));
  FDRE \axi_rdata_reg[29] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[29]),
        .Q(s00_axi_rdata[29]),
        .R(p_0_in));
  FDRE \axi_rdata_reg[2] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[2]),
        .Q(s00_axi_rdata[2]),
        .R(p_0_in));
  FDRE \axi_rdata_reg[30] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[30]),
        .Q(s00_axi_rdata[30]),
        .R(p_0_in));
  FDRE \axi_rdata_reg[31] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[31]),
        .Q(s00_axi_rdata[31]),
        .R(p_0_in));
  FDRE \axi_rdata_reg[3] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[3]),
        .Q(s00_axi_rdata[3]),
        .R(p_0_in));
  FDRE \axi_rdata_reg[4] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[4]),
        .Q(s00_axi_rdata[4]),
        .R(p_0_in));
  FDRE \axi_rdata_reg[5] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[5]),
        .Q(s00_axi_rdata[5]),
        .R(p_0_in));
  FDRE \axi_rdata_reg[6] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[6]),
        .Q(s00_axi_rdata[6]),
        .R(p_0_in));
  FDRE \axi_rdata_reg[7] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[7]),
        .Q(s00_axi_rdata[7]),
        .R(p_0_in));
  FDRE \axi_rdata_reg[8] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[8]),
        .Q(s00_axi_rdata[8]),
        .R(p_0_in));
  FDRE \axi_rdata_reg[9] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[9]),
        .Q(s00_axi_rdata[9]),
        .R(p_0_in));
  (* SOFT_HLUTNM = "soft_lutpair94" *) 
  LUT4 #(
    .INIT(16'h08F8)) 
    axi_rvalid_i_1
       (.I0(S_AXI_ARREADY),
        .I1(s00_axi_arvalid),
        .I2(s00_axi_rvalid),
        .I3(s00_axi_rready),
        .O(axi_rvalid_i_1_n_0));
  FDRE axi_rvalid_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_rvalid_i_1_n_0),
        .Q(s00_axi_rvalid),
        .R(p_0_in));
  (* SOFT_HLUTNM = "soft_lutpair93" *) 
  LUT4 #(
    .INIT(16'h2000)) 
    axi_wready0
       (.I0(aw_en_reg_n_0),
        .I1(s00_axi_wready),
        .I2(s00_axi_wvalid),
        .I3(s00_axi_awvalid),
        .O(axi_wready0__0));
  FDRE axi_wready_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_wready0__0),
        .Q(s00_axi_wready),
        .R(p_0_in));
  deviceid903f_axi_lite_benes_0_0_benes_top benes_inst
       (.D(reg_data_out),
        .p_0_in(p_0_in),
        .s00_axi_aclk(s00_axi_aclk),
        .s00_axi_aresetn(s00_axi_aresetn),
        .s00_axi_wdata(s00_axi_wdata));
  LUT3 #(
    .INIT(8'h20)) 
    slv_reg_rden
       (.I0(s00_axi_arvalid),
        .I1(s00_axi_rvalid),
        .I2(S_AXI_ARREADY),
        .O(slv_reg_rden__0));
endmodule

(* CHECK_LICENSE_TYPE = "XDMA_AXI_BENES_axi_lite_benes_0_0,Axi_lite_v1_0,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "package_project" *) 
(* X_CORE_INFO = "Axi_lite_v1_0,Vivado 2020.2.2" *) 
(* NotValidForBitStream *)
module deviceid903f_axi_lite_benes_0_0
   (s00_axi_aclk,
    s00_axi_aresetn,
    s00_axi_awaddr,
    s00_axi_awprot,
    s00_axi_awvalid,
    s00_axi_awready,
    s00_axi_wdata,
    s00_axi_wstrb,
    s00_axi_wvalid,
    s00_axi_wready,
    s00_axi_bresp,
    s00_axi_bvalid,
    s00_axi_bready,
    s00_axi_araddr,
    s00_axi_arprot,
    s00_axi_arvalid,
    s00_axi_arready,
    s00_axi_rdata,
    s00_axi_rresp,
    s00_axi_rvalid,
    s00_axi_rready);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 s00_axi_aclk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s00_axi_aclk, ASSOCIATED_BUSIF s00_axi, ASSOCIATED_RESET s00_axi_aresetn, FREQ_HZ 250000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN XDMA_AXI_BENES_xdma_0_1_axi_aclk, INSERT_VIP 0" *) input s00_axi_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 s00_axi_aresetn RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s00_axi_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input s00_axi_aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi AWADDR" *) input [4:0]s00_axi_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi AWPROT" *) input [2:0]s00_axi_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi AWVALID" *) input s00_axi_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi AWREADY" *) output s00_axi_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi WDATA" *) input [31:0]s00_axi_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi WSTRB" *) input [3:0]s00_axi_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi WVALID" *) input s00_axi_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi WREADY" *) output s00_axi_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi BRESP" *) output [1:0]s00_axi_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi BVALID" *) output s00_axi_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi BREADY" *) input s00_axi_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi ARADDR" *) input [4:0]s00_axi_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi ARPROT" *) input [2:0]s00_axi_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi ARVALID" *) input s00_axi_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi ARREADY" *) output s00_axi_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi RDATA" *) output [31:0]s00_axi_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi RRESP" *) output [1:0]s00_axi_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi RVALID" *) output s00_axi_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi RREADY" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s00_axi, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 250000000, ID_WIDTH 0, ADDR_WIDTH 5, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.000, CLK_DOMAIN XDMA_AXI_BENES_xdma_0_1_axi_aclk, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) input s00_axi_rready;

  wire \<const0> ;
  wire s00_axi_aclk;
  wire s00_axi_aresetn;
  wire s00_axi_arready;
  wire s00_axi_arvalid;
  wire s00_axi_awready;
  wire s00_axi_awvalid;
  wire s00_axi_bready;
  wire s00_axi_bvalid;
  wire [31:0]s00_axi_rdata;
  wire s00_axi_rready;
  wire s00_axi_rvalid;
  wire [31:0]s00_axi_wdata;
  wire s00_axi_wready;
  wire s00_axi_wvalid;

  assign s00_axi_bresp[1] = \<const0> ;
  assign s00_axi_bresp[0] = \<const0> ;
  assign s00_axi_rresp[1] = \<const0> ;
  assign s00_axi_rresp[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  deviceid903f_axi_lite_benes_0_0_Axi_lite_v1_0 inst
       (.S_AXI_ARREADY(s00_axi_arready),
        .S_AXI_AWREADY(s00_axi_awready),
        .s00_axi_aclk(s00_axi_aclk),
        .s00_axi_aresetn(s00_axi_aresetn),
        .s00_axi_arvalid(s00_axi_arvalid),
        .s00_axi_awvalid(s00_axi_awvalid),
        .s00_axi_bready(s00_axi_bready),
        .s00_axi_bvalid(s00_axi_bvalid),
        .s00_axi_rdata(s00_axi_rdata),
        .s00_axi_rready(s00_axi_rready),
        .s00_axi_rvalid(s00_axi_rvalid),
        .s00_axi_wdata(s00_axi_wdata[31:12]),
        .s00_axi_wready(s00_axi_wready),
        .s00_axi_wvalid(s00_axi_wvalid));
endmodule

module deviceid903f_axi_lite_benes_0_0_benes_top
   (p_0_in,
    D,
    s00_axi_wdata,
    s00_axi_aclk,
    s00_axi_aresetn);
  output p_0_in;
  output [31:0]D;
  input [19:0]s00_axi_wdata;
  input s00_axi_aclk;
  input s00_axi_aresetn;

  wire [31:0]D;
  wire counter0_n_0;
  wire counter2_n_2;
  wire counter2_n_3;
  wire counter4_n_0;
  wire counter6_n_0;
  wire counter6_n_1;
  wire [3:1]net_in0;
  wire [3:1]net_in1;
  wire [3:2]net_in2;
  wire [3:2]net_in3;
  wire [3:1]net_in4;
  wire [3:1]net_in5;
  wire [3:2]net_in6;
  wire [3:2]net_in7;
  wire p_0_in;
  wire s00_axi_aclk;
  wire s00_axi_aresetn;
  wire [19:0]s00_axi_wdata;
  wire [3:1]\stage_out_reg[0][0]_24 ;
  wire [3:0]\stage_out_reg[0][1]_25 ;
  wire [3:2]\stage_out_reg[0][2]_26 ;
  wire [3:0]\stage_out_reg[0][3]_27 ;
  wire [3:1]\stage_out_reg[0][4]_28 ;
  wire [3:0]\stage_out_reg[0][5]_29 ;
  wire [3:2]\stage_out_reg[0][6]_30 ;
  wire [3:0]\stage_out_reg[0][7]_31 ;

  deviceid903f_axi_lite_benes_0_0_test_counter_plus counter0
       (.D(counter0_n_0),
        .Q(net_in0),
        .\out_reg_reg[3]_0 (\stage_out_reg[0][1]_25 ),
        .s00_axi_aclk(s00_axi_aclk),
        .s00_axi_aresetn(s00_axi_aresetn),
        .s00_axi_aresetn_0(p_0_in),
        .s00_axi_wdata(s00_axi_wdata[16]),
        .\stage_in_reg_reg[0][4][3] (net_in1));
  deviceid903f_axi_lite_benes_0_0_test_counter_2plus counter1
       (.D(\stage_out_reg[0][0]_24 ),
        .Q(net_in1),
        .\out_reg_reg[4]_0 (p_0_in),
        .s00_axi_aclk(s00_axi_aclk),
        .s00_axi_wdata(s00_axi_wdata[16]),
        .\stage_in_reg_reg[0][0][3] (net_in0));
  deviceid903f_axi_lite_benes_0_0_test_counter_3plus counter2
       (.D({counter2_n_2,counter2_n_3}),
        .Q(net_in2),
        .\out_reg_reg[3]_0 (\stage_out_reg[0][3]_27 ),
        .\out_reg_reg[4]_0 (p_0_in),
        .s00_axi_aclk(s00_axi_aclk),
        .s00_axi_wdata(s00_axi_wdata[17]),
        .\stage_in_reg_reg[0][5][3] (net_in3));
  deviceid903f_axi_lite_benes_0_0_test_counter_4plus counter3
       (.D(\stage_out_reg[0][2]_26 ),
        .Q(net_in3),
        .\out_reg_reg[4]_0 (p_0_in),
        .s00_axi_aclk(s00_axi_aclk),
        .s00_axi_wdata(s00_axi_wdata[17]),
        .\stage_in_reg_reg[0][1][3] (net_in2));
  deviceid903f_axi_lite_benes_0_0_test_counter_minus counter4
       (.D(counter4_n_0),
        .Q(net_in4),
        .\out_reg_reg[3]_0 (\stage_out_reg[0][5]_29 ),
        .\out_reg_reg[4]_0 (p_0_in),
        .s00_axi_aclk(s00_axi_aclk),
        .s00_axi_wdata(s00_axi_wdata[18]),
        .\stage_in_reg_reg[0][6][3] (net_in5));
  deviceid903f_axi_lite_benes_0_0_test_counter_2minus counter5
       (.D(\stage_out_reg[0][4]_28 ),
        .Q(net_in5),
        .\out_reg_reg[3]_0 (p_0_in),
        .s00_axi_aclk(s00_axi_aclk),
        .s00_axi_wdata(s00_axi_wdata[18]),
        .\stage_in_reg_reg[0][2][3] (net_in4));
  deviceid903f_axi_lite_benes_0_0_test_counter_3minus counter6
       (.D({counter6_n_0,counter6_n_1}),
        .Q(net_in6),
        .\out_reg_reg[3]_0 (\stage_out_reg[0][7]_31 ),
        .\out_reg_reg[3]_1 (p_0_in),
        .s00_axi_aclk(s00_axi_aclk),
        .s00_axi_wdata(s00_axi_wdata[19]),
        .\stage_in_reg_reg[0][7][3] (net_in7));
  deviceid903f_axi_lite_benes_0_0_test_counter_4minus counter7
       (.D(\stage_out_reg[0][6]_30 ),
        .Q(net_in7),
        .\out_reg_reg[3]_0 (p_0_in),
        .s00_axi_aclk(s00_axi_aclk),
        .s00_axi_wdata(s00_axi_wdata[19]),
        .\stage_in_reg_reg[0][3][3] (net_in6));
  deviceid903f_axi_lite_benes_0_0_network_module network
       (.D({\stage_out_reg[0][0]_24 ,counter0_n_0}),
        .s00_axi_aclk(s00_axi_aclk),
        .s00_axi_wdata(s00_axi_wdata[15:0]),
        .\stage_in_reg_reg[0][1][3]_0 ({\stage_out_reg[0][2]_26 ,counter2_n_2,counter2_n_3}),
        .\stage_in_reg_reg[0][2][3]_0 ({\stage_out_reg[0][4]_28 ,counter4_n_0}),
        .\stage_in_reg_reg[0][3][3]_0 ({\stage_out_reg[0][6]_30 ,counter6_n_0,counter6_n_1}),
        .\stage_in_reg_reg[0][4][3]_0 (\stage_out_reg[0][1]_25 ),
        .\stage_in_reg_reg[0][5][3]_0 (\stage_out_reg[0][3]_27 ),
        .\stage_in_reg_reg[0][6][3]_0 (\stage_out_reg[0][5]_29 ),
        .\stage_in_reg_reg[0][7][3]_0 (\stage_out_reg[0][7]_31 ),
        .\stage_in_reg_reg[3][1][3]_0 (D));
endmodule

module deviceid903f_axi_lite_benes_0_0_network_module
   (\stage_in_reg_reg[3][1][3]_0 ,
    s00_axi_aclk,
    D,
    \stage_in_reg_reg[0][1][3]_0 ,
    \stage_in_reg_reg[0][2][3]_0 ,
    \stage_in_reg_reg[0][3][3]_0 ,
    \stage_in_reg_reg[0][4][3]_0 ,
    \stage_in_reg_reg[0][5][3]_0 ,
    \stage_in_reg_reg[0][6][3]_0 ,
    \stage_in_reg_reg[0][7][3]_0 ,
    s00_axi_wdata);
  output [31:0]\stage_in_reg_reg[3][1][3]_0 ;
  input s00_axi_aclk;
  input [3:0]D;
  input [3:0]\stage_in_reg_reg[0][1][3]_0 ;
  input [3:0]\stage_in_reg_reg[0][2][3]_0 ;
  input [3:0]\stage_in_reg_reg[0][3][3]_0 ;
  input [3:0]\stage_in_reg_reg[0][4][3]_0 ;
  input [3:0]\stage_in_reg_reg[0][5][3]_0 ;
  input [3:0]\stage_in_reg_reg[0][6][3]_0 ;
  input [3:0]\stage_in_reg_reg[0][7][3]_0 ;
  input [15:0]s00_axi_wdata;

  wire [3:0]D;
  wire s00_axi_aclk;
  wire [15:0]s00_axi_wdata;
  wire [3:0]\stage_in_reg_reg[0][1][3]_0 ;
  wire [3:0]\stage_in_reg_reg[0][2][3]_0 ;
  wire [3:0]\stage_in_reg_reg[0][3][3]_0 ;
  wire [3:0]\stage_in_reg_reg[0][4][3]_0 ;
  wire [3:0]\stage_in_reg_reg[0][5][3]_0 ;
  wire [3:0]\stage_in_reg_reg[0][6][3]_0 ;
  wire [3:0]\stage_in_reg_reg[0][7][3]_0 ;
  wire [31:0]\stage_in_reg_reg[3][1][3]_0 ;
  wire \stage_in_reg_reg_n_0_[0][0][0] ;
  wire \stage_in_reg_reg_n_0_[0][0][1] ;
  wire \stage_in_reg_reg_n_0_[0][0][2] ;
  wire \stage_in_reg_reg_n_0_[0][0][3] ;
  wire \stage_in_reg_reg_n_0_[0][1][0] ;
  wire \stage_in_reg_reg_n_0_[0][1][1] ;
  wire \stage_in_reg_reg_n_0_[0][1][2] ;
  wire \stage_in_reg_reg_n_0_[0][1][3] ;
  wire \stage_in_reg_reg_n_0_[0][2][0] ;
  wire \stage_in_reg_reg_n_0_[0][2][1] ;
  wire \stage_in_reg_reg_n_0_[0][2][2] ;
  wire \stage_in_reg_reg_n_0_[0][2][3] ;
  wire \stage_in_reg_reg_n_0_[0][3][0] ;
  wire \stage_in_reg_reg_n_0_[0][3][1] ;
  wire \stage_in_reg_reg_n_0_[0][3][2] ;
  wire \stage_in_reg_reg_n_0_[0][3][3] ;
  wire \stage_in_reg_reg_n_0_[0][4][0] ;
  wire \stage_in_reg_reg_n_0_[0][4][1] ;
  wire \stage_in_reg_reg_n_0_[0][4][2] ;
  wire \stage_in_reg_reg_n_0_[0][4][3] ;
  wire \stage_in_reg_reg_n_0_[0][5][0] ;
  wire \stage_in_reg_reg_n_0_[0][5][1] ;
  wire \stage_in_reg_reg_n_0_[0][5][2] ;
  wire \stage_in_reg_reg_n_0_[0][5][3] ;
  wire \stage_in_reg_reg_n_0_[0][6][0] ;
  wire \stage_in_reg_reg_n_0_[0][6][1] ;
  wire \stage_in_reg_reg_n_0_[0][6][2] ;
  wire \stage_in_reg_reg_n_0_[0][6][3] ;
  wire \stage_in_reg_reg_n_0_[0][7][0] ;
  wire \stage_in_reg_reg_n_0_[0][7][1] ;
  wire \stage_in_reg_reg_n_0_[0][7][2] ;
  wire \stage_in_reg_reg_n_0_[0][7][3] ;
  wire \stage_in_reg_reg_n_0_[1][0][0] ;
  wire \stage_in_reg_reg_n_0_[1][0][1] ;
  wire \stage_in_reg_reg_n_0_[1][0][2] ;
  wire \stage_in_reg_reg_n_0_[1][0][3] ;
  wire \stage_in_reg_reg_n_0_[1][1][0] ;
  wire \stage_in_reg_reg_n_0_[1][1][1] ;
  wire \stage_in_reg_reg_n_0_[1][1][2] ;
  wire \stage_in_reg_reg_n_0_[1][1][3] ;
  wire \stage_in_reg_reg_n_0_[1][2][0] ;
  wire \stage_in_reg_reg_n_0_[1][2][1] ;
  wire \stage_in_reg_reg_n_0_[1][2][2] ;
  wire \stage_in_reg_reg_n_0_[1][2][3] ;
  wire \stage_in_reg_reg_n_0_[1][3][0] ;
  wire \stage_in_reg_reg_n_0_[1][3][1] ;
  wire \stage_in_reg_reg_n_0_[1][3][2] ;
  wire \stage_in_reg_reg_n_0_[1][3][3] ;
  wire \stage_in_reg_reg_n_0_[1][4][0] ;
  wire \stage_in_reg_reg_n_0_[1][4][1] ;
  wire \stage_in_reg_reg_n_0_[1][4][2] ;
  wire \stage_in_reg_reg_n_0_[1][4][3] ;
  wire \stage_in_reg_reg_n_0_[1][5][0] ;
  wire \stage_in_reg_reg_n_0_[1][5][1] ;
  wire \stage_in_reg_reg_n_0_[1][5][2] ;
  wire \stage_in_reg_reg_n_0_[1][5][3] ;
  wire \stage_in_reg_reg_n_0_[1][6][0] ;
  wire \stage_in_reg_reg_n_0_[1][6][1] ;
  wire \stage_in_reg_reg_n_0_[1][6][2] ;
  wire \stage_in_reg_reg_n_0_[1][6][3] ;
  wire \stage_in_reg_reg_n_0_[1][7][0] ;
  wire \stage_in_reg_reg_n_0_[1][7][1] ;
  wire \stage_in_reg_reg_n_0_[1][7][2] ;
  wire \stage_in_reg_reg_n_0_[1][7][3] ;
  wire \stage_in_reg_reg_n_0_[2][0][0] ;
  wire \stage_in_reg_reg_n_0_[2][0][1] ;
  wire \stage_in_reg_reg_n_0_[2][0][2] ;
  wire \stage_in_reg_reg_n_0_[2][0][3] ;
  wire \stage_in_reg_reg_n_0_[2][1][0] ;
  wire \stage_in_reg_reg_n_0_[2][1][1] ;
  wire \stage_in_reg_reg_n_0_[2][1][2] ;
  wire \stage_in_reg_reg_n_0_[2][1][3] ;
  wire \stage_in_reg_reg_n_0_[2][2][0] ;
  wire \stage_in_reg_reg_n_0_[2][2][1] ;
  wire \stage_in_reg_reg_n_0_[2][2][2] ;
  wire \stage_in_reg_reg_n_0_[2][2][3] ;
  wire \stage_in_reg_reg_n_0_[2][3][0] ;
  wire \stage_in_reg_reg_n_0_[2][3][1] ;
  wire \stage_in_reg_reg_n_0_[2][3][2] ;
  wire \stage_in_reg_reg_n_0_[2][3][3] ;
  wire \stage_in_reg_reg_n_0_[2][4][0] ;
  wire \stage_in_reg_reg_n_0_[2][4][1] ;
  wire \stage_in_reg_reg_n_0_[2][4][2] ;
  wire \stage_in_reg_reg_n_0_[2][4][3] ;
  wire \stage_in_reg_reg_n_0_[2][5][0] ;
  wire \stage_in_reg_reg_n_0_[2][5][1] ;
  wire \stage_in_reg_reg_n_0_[2][5][2] ;
  wire \stage_in_reg_reg_n_0_[2][5][3] ;
  wire \stage_in_reg_reg_n_0_[2][6][0] ;
  wire \stage_in_reg_reg_n_0_[2][6][1] ;
  wire \stage_in_reg_reg_n_0_[2][6][2] ;
  wire \stage_in_reg_reg_n_0_[2][6][3] ;
  wire \stage_in_reg_reg_n_0_[2][7][0] ;
  wire \stage_in_reg_reg_n_0_[2][7][1] ;
  wire \stage_in_reg_reg_n_0_[2][7][2] ;
  wire \stage_in_reg_reg_n_0_[2][7][3] ;
  wire \stage_in_reg_reg_n_0_[3][0][0] ;
  wire \stage_in_reg_reg_n_0_[3][0][1] ;
  wire \stage_in_reg_reg_n_0_[3][0][2] ;
  wire \stage_in_reg_reg_n_0_[3][0][3] ;
  wire \stage_in_reg_reg_n_0_[3][1][0] ;
  wire \stage_in_reg_reg_n_0_[3][1][1] ;
  wire \stage_in_reg_reg_n_0_[3][1][2] ;
  wire \stage_in_reg_reg_n_0_[3][1][3] ;
  wire \stage_in_reg_reg_n_0_[3][2][0] ;
  wire \stage_in_reg_reg_n_0_[3][2][1] ;
  wire \stage_in_reg_reg_n_0_[3][2][2] ;
  wire \stage_in_reg_reg_n_0_[3][2][3] ;
  wire \stage_in_reg_reg_n_0_[3][3][0] ;
  wire \stage_in_reg_reg_n_0_[3][3][1] ;
  wire \stage_in_reg_reg_n_0_[3][3][2] ;
  wire \stage_in_reg_reg_n_0_[3][3][3] ;
  wire \stage_in_reg_reg_n_0_[3][4][0] ;
  wire \stage_in_reg_reg_n_0_[3][4][1] ;
  wire \stage_in_reg_reg_n_0_[3][4][2] ;
  wire \stage_in_reg_reg_n_0_[3][4][3] ;
  wire \stage_in_reg_reg_n_0_[3][5][0] ;
  wire \stage_in_reg_reg_n_0_[3][5][1] ;
  wire \stage_in_reg_reg_n_0_[3][5][2] ;
  wire \stage_in_reg_reg_n_0_[3][5][3] ;
  wire \stage_in_reg_reg_n_0_[3][6][0] ;
  wire \stage_in_reg_reg_n_0_[3][6][1] ;
  wire \stage_in_reg_reg_n_0_[3][6][2] ;
  wire \stage_in_reg_reg_n_0_[3][6][3] ;
  wire \stage_in_reg_reg_n_0_[3][7][0] ;
  wire \stage_in_reg_reg_n_0_[3][7][1] ;
  wire \stage_in_reg_reg_n_0_[3][7][2] ;
  wire \stage_in_reg_reg_n_0_[3][7][3] ;
  wire [3:0]\stage_out_reg[1][0]_0 ;
  wire [3:0]\stage_out_reg[1][1]_1 ;
  wire [3:0]\stage_out_reg[1][2]_2 ;
  wire [3:0]\stage_out_reg[1][3]_3 ;
  wire [3:0]\stage_out_reg[1][4]_4 ;
  wire [3:0]\stage_out_reg[1][5]_5 ;
  wire [3:0]\stage_out_reg[1][6]_6 ;
  wire [3:0]\stage_out_reg[1][7]_7 ;
  wire [3:0]\stage_out_reg[2][0]_8 ;
  wire [3:0]\stage_out_reg[2][1]_9 ;
  wire [3:0]\stage_out_reg[2][2]_10 ;
  wire [3:0]\stage_out_reg[2][3]_11 ;
  wire [3:0]\stage_out_reg[2][4]_12 ;
  wire [3:0]\stage_out_reg[2][5]_13 ;
  wire [3:0]\stage_out_reg[2][6]_14 ;
  wire [3:0]\stage_out_reg[2][7]_15 ;
  wire [3:0]\stage_out_reg[3][0]_16 ;
  wire [3:0]\stage_out_reg[3][1]_17 ;
  wire [3:0]\stage_out_reg[3][2]_18 ;
  wire [3:0]\stage_out_reg[3][3]_19 ;
  wire [3:0]\stage_out_reg[3][4]_20 ;
  wire [3:0]\stage_out_reg[3][5]_21 ;
  wire [3:0]\stage_out_reg[3][6]_22 ;
  wire [3:0]\stage_out_reg[3][7]_23 ;

  deviceid903f_axi_lite_benes_0_0_stage_module \genblk1[1].stage_inst 
       (.D(\stage_out_reg[1][0]_0 ),
        .Q({\stage_in_reg_reg_n_0_[0][1][3] ,\stage_in_reg_reg_n_0_[0][1][2] ,\stage_in_reg_reg_n_0_[0][1][1] ,\stage_in_reg_reg_n_0_[0][1][0] }),
        .s00_axi_wdata(s00_axi_wdata[15:12]),
        .\stage_in_reg_reg[0][0][3] (\stage_out_reg[1][1]_1 ),
        .\stage_in_reg_reg[0][2][3] (\stage_out_reg[1][3]_3 ),
        .\stage_in_reg_reg[0][3][3] (\stage_out_reg[1][2]_2 ),
        .\stage_in_reg_reg[0][4][3] (\stage_out_reg[1][5]_5 ),
        .\stage_in_reg_reg[0][5][3] (\stage_out_reg[1][4]_4 ),
        .\stage_in_reg_reg[0][6][3] (\stage_out_reg[1][7]_7 ),
        .\stage_in_reg_reg[0][7][3] (\stage_out_reg[1][6]_6 ),
        .\stage_in_reg_reg[1][2][3] ({\stage_in_reg_reg_n_0_[0][0][3] ,\stage_in_reg_reg_n_0_[0][0][2] ,\stage_in_reg_reg_n_0_[0][0][1] ,\stage_in_reg_reg_n_0_[0][0][0] }),
        .\stage_in_reg_reg[1][3][3] ({\stage_in_reg_reg_n_0_[0][3][3] ,\stage_in_reg_reg_n_0_[0][3][2] ,\stage_in_reg_reg_n_0_[0][3][1] ,\stage_in_reg_reg_n_0_[0][3][0] }),
        .\stage_in_reg_reg[1][3][3]_0 ({\stage_in_reg_reg_n_0_[0][2][3] ,\stage_in_reg_reg_n_0_[0][2][2] ,\stage_in_reg_reg_n_0_[0][2][1] ,\stage_in_reg_reg_n_0_[0][2][0] }),
        .\stage_in_reg_reg[1][6][3] ({\stage_in_reg_reg_n_0_[0][5][3] ,\stage_in_reg_reg_n_0_[0][5][2] ,\stage_in_reg_reg_n_0_[0][5][1] ,\stage_in_reg_reg_n_0_[0][5][0] }),
        .\stage_in_reg_reg[1][6][3]_0 ({\stage_in_reg_reg_n_0_[0][4][3] ,\stage_in_reg_reg_n_0_[0][4][2] ,\stage_in_reg_reg_n_0_[0][4][1] ,\stage_in_reg_reg_n_0_[0][4][0] }),
        .\stage_in_reg_reg[1][7][3] ({\stage_in_reg_reg_n_0_[0][7][3] ,\stage_in_reg_reg_n_0_[0][7][2] ,\stage_in_reg_reg_n_0_[0][7][1] ,\stage_in_reg_reg_n_0_[0][7][0] }),
        .\stage_in_reg_reg[1][7][3]_0 ({\stage_in_reg_reg_n_0_[0][6][3] ,\stage_in_reg_reg_n_0_[0][6][2] ,\stage_in_reg_reg_n_0_[0][6][1] ,\stage_in_reg_reg_n_0_[0][6][0] }));
  deviceid903f_axi_lite_benes_0_0_stage_module_0 \genblk1[2].stage_inst 
       (.D(\stage_out_reg[2][0]_8 ),
        .Q({\stage_in_reg_reg_n_0_[1][1][3] ,\stage_in_reg_reg_n_0_[1][1][2] ,\stage_in_reg_reg_n_0_[1][1][1] ,\stage_in_reg_reg_n_0_[1][1][0] }),
        .s00_axi_wdata(s00_axi_wdata[11:8]),
        .\stage_in_reg_reg[1][0][3] (\stage_out_reg[2][1]_9 ),
        .\stage_in_reg_reg[1][2][3] (\stage_out_reg[2][3]_11 ),
        .\stage_in_reg_reg[1][3][3] (\stage_out_reg[2][2]_10 ),
        .\stage_in_reg_reg[1][4][3] (\stage_out_reg[2][5]_13 ),
        .\stage_in_reg_reg[1][5][3] (\stage_out_reg[2][4]_12 ),
        .\stage_in_reg_reg[1][6][3] (\stage_out_reg[2][7]_15 ),
        .\stage_in_reg_reg[1][7][3] (\stage_out_reg[2][6]_14 ),
        .\stage_in_reg_reg[2][2][3] ({\stage_in_reg_reg_n_0_[1][0][3] ,\stage_in_reg_reg_n_0_[1][0][2] ,\stage_in_reg_reg_n_0_[1][0][1] ,\stage_in_reg_reg_n_0_[1][0][0] }),
        .\stage_in_reg_reg[2][3][3] ({\stage_in_reg_reg_n_0_[1][3][3] ,\stage_in_reg_reg_n_0_[1][3][2] ,\stage_in_reg_reg_n_0_[1][3][1] ,\stage_in_reg_reg_n_0_[1][3][0] }),
        .\stage_in_reg_reg[2][3][3]_0 ({\stage_in_reg_reg_n_0_[1][2][3] ,\stage_in_reg_reg_n_0_[1][2][2] ,\stage_in_reg_reg_n_0_[1][2][1] ,\stage_in_reg_reg_n_0_[1][2][0] }),
        .\stage_in_reg_reg[2][6][3] ({\stage_in_reg_reg_n_0_[1][5][3] ,\stage_in_reg_reg_n_0_[1][5][2] ,\stage_in_reg_reg_n_0_[1][5][1] ,\stage_in_reg_reg_n_0_[1][5][0] }),
        .\stage_in_reg_reg[2][6][3]_0 ({\stage_in_reg_reg_n_0_[1][4][3] ,\stage_in_reg_reg_n_0_[1][4][2] ,\stage_in_reg_reg_n_0_[1][4][1] ,\stage_in_reg_reg_n_0_[1][4][0] }),
        .\stage_in_reg_reg[2][7][3] ({\stage_in_reg_reg_n_0_[1][7][3] ,\stage_in_reg_reg_n_0_[1][7][2] ,\stage_in_reg_reg_n_0_[1][7][1] ,\stage_in_reg_reg_n_0_[1][7][0] }),
        .\stage_in_reg_reg[2][7][3]_0 ({\stage_in_reg_reg_n_0_[1][6][3] ,\stage_in_reg_reg_n_0_[1][6][2] ,\stage_in_reg_reg_n_0_[1][6][1] ,\stage_in_reg_reg_n_0_[1][6][0] }));
  deviceid903f_axi_lite_benes_0_0_stage_module_1 \genblk1[3].stage_inst 
       (.D(\stage_out_reg[3][0]_16 ),
        .Q({\stage_in_reg_reg_n_0_[2][1][3] ,\stage_in_reg_reg_n_0_[2][1][2] ,\stage_in_reg_reg_n_0_[2][1][1] ,\stage_in_reg_reg_n_0_[2][1][0] }),
        .s00_axi_wdata(s00_axi_wdata[7:4]),
        .\stage_in_reg_reg[2][0][3] (\stage_out_reg[3][1]_17 ),
        .\stage_in_reg_reg[2][2][3] (\stage_out_reg[3][3]_19 ),
        .\stage_in_reg_reg[2][3][3] (\stage_out_reg[3][2]_18 ),
        .\stage_in_reg_reg[2][4][3] (\stage_out_reg[3][5]_21 ),
        .\stage_in_reg_reg[2][5][3] (\stage_out_reg[3][4]_20 ),
        .\stage_in_reg_reg[2][6][3] (\stage_out_reg[3][7]_23 ),
        .\stage_in_reg_reg[2][7][3] (\stage_out_reg[3][6]_22 ),
        .\stage_in_reg_reg[3][2][3] ({\stage_in_reg_reg_n_0_[2][0][3] ,\stage_in_reg_reg_n_0_[2][0][2] ,\stage_in_reg_reg_n_0_[2][0][1] ,\stage_in_reg_reg_n_0_[2][0][0] }),
        .\stage_in_reg_reg[3][3][3] ({\stage_in_reg_reg_n_0_[2][5][3] ,\stage_in_reg_reg_n_0_[2][5][2] ,\stage_in_reg_reg_n_0_[2][5][1] ,\stage_in_reg_reg_n_0_[2][5][0] }),
        .\stage_in_reg_reg[3][3][3]_0 ({\stage_in_reg_reg_n_0_[2][4][3] ,\stage_in_reg_reg_n_0_[2][4][2] ,\stage_in_reg_reg_n_0_[2][4][1] ,\stage_in_reg_reg_n_0_[2][4][0] }),
        .\stage_in_reg_reg[3][6][3] ({\stage_in_reg_reg_n_0_[2][3][3] ,\stage_in_reg_reg_n_0_[2][3][2] ,\stage_in_reg_reg_n_0_[2][3][1] ,\stage_in_reg_reg_n_0_[2][3][0] }),
        .\stage_in_reg_reg[3][6][3]_0 ({\stage_in_reg_reg_n_0_[2][2][3] ,\stage_in_reg_reg_n_0_[2][2][2] ,\stage_in_reg_reg_n_0_[2][2][1] ,\stage_in_reg_reg_n_0_[2][2][0] }),
        .\stage_in_reg_reg[3][7][3] ({\stage_in_reg_reg_n_0_[2][7][3] ,\stage_in_reg_reg_n_0_[2][7][2] ,\stage_in_reg_reg_n_0_[2][7][1] ,\stage_in_reg_reg_n_0_[2][7][0] }),
        .\stage_in_reg_reg[3][7][3]_0 ({\stage_in_reg_reg_n_0_[2][6][3] ,\stage_in_reg_reg_n_0_[2][6][2] ,\stage_in_reg_reg_n_0_[2][6][1] ,\stage_in_reg_reg_n_0_[2][6][0] }));
  deviceid903f_axi_lite_benes_0_0_stage_module_2 stage_8
       (.Q({\stage_in_reg_reg_n_0_[3][1][3] ,\stage_in_reg_reg_n_0_[3][1][2] ,\stage_in_reg_reg_n_0_[3][1][1] ,\stage_in_reg_reg_n_0_[3][1][0] }),
        .\axi_rdata_reg[11] ({\stage_in_reg_reg_n_0_[3][5][3] ,\stage_in_reg_reg_n_0_[3][5][2] ,\stage_in_reg_reg_n_0_[3][5][1] ,\stage_in_reg_reg_n_0_[3][5][0] }),
        .\axi_rdata_reg[11]_0 ({\stage_in_reg_reg_n_0_[3][4][3] ,\stage_in_reg_reg_n_0_[3][4][2] ,\stage_in_reg_reg_n_0_[3][4][1] ,\stage_in_reg_reg_n_0_[3][4][0] }),
        .\axi_rdata_reg[19] ({\stage_in_reg_reg_n_0_[3][3][3] ,\stage_in_reg_reg_n_0_[3][3][2] ,\stage_in_reg_reg_n_0_[3][3][1] ,\stage_in_reg_reg_n_0_[3][3][0] }),
        .\axi_rdata_reg[19]_0 ({\stage_in_reg_reg_n_0_[3][2][3] ,\stage_in_reg_reg_n_0_[3][2][2] ,\stage_in_reg_reg_n_0_[3][2][1] ,\stage_in_reg_reg_n_0_[3][2][0] }),
        .\axi_rdata_reg[27] ({\stage_in_reg_reg_n_0_[3][0][3] ,\stage_in_reg_reg_n_0_[3][0][2] ,\stage_in_reg_reg_n_0_[3][0][1] ,\stage_in_reg_reg_n_0_[3][0][0] }),
        .\axi_rdata_reg[3] ({\stage_in_reg_reg_n_0_[3][7][3] ,\stage_in_reg_reg_n_0_[3][7][2] ,\stage_in_reg_reg_n_0_[3][7][1] ,\stage_in_reg_reg_n_0_[3][7][0] }),
        .\axi_rdata_reg[3]_0 ({\stage_in_reg_reg_n_0_[3][6][3] ,\stage_in_reg_reg_n_0_[3][6][2] ,\stage_in_reg_reg_n_0_[3][6][1] ,\stage_in_reg_reg_n_0_[3][6][0] }),
        .s00_axi_wdata(s00_axi_wdata[3:0]),
        .\stage_in_reg_reg[3][1][3] (\stage_in_reg_reg[3][1][3]_0 ));
  FDRE \stage_in_reg_reg[0][0][0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(D[0]),
        .Q(\stage_in_reg_reg_n_0_[0][0][0] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[0][0][1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(D[1]),
        .Q(\stage_in_reg_reg_n_0_[0][0][1] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[0][0][2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(D[2]),
        .Q(\stage_in_reg_reg_n_0_[0][0][2] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[0][0][3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(D[3]),
        .Q(\stage_in_reg_reg_n_0_[0][0][3] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[0][1][0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_in_reg_reg[0][1][3]_0 [0]),
        .Q(\stage_in_reg_reg_n_0_[0][1][0] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[0][1][1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_in_reg_reg[0][1][3]_0 [1]),
        .Q(\stage_in_reg_reg_n_0_[0][1][1] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[0][1][2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_in_reg_reg[0][1][3]_0 [2]),
        .Q(\stage_in_reg_reg_n_0_[0][1][2] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[0][1][3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_in_reg_reg[0][1][3]_0 [3]),
        .Q(\stage_in_reg_reg_n_0_[0][1][3] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[0][2][0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_in_reg_reg[0][2][3]_0 [0]),
        .Q(\stage_in_reg_reg_n_0_[0][2][0] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[0][2][1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_in_reg_reg[0][2][3]_0 [1]),
        .Q(\stage_in_reg_reg_n_0_[0][2][1] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[0][2][2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_in_reg_reg[0][2][3]_0 [2]),
        .Q(\stage_in_reg_reg_n_0_[0][2][2] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[0][2][3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_in_reg_reg[0][2][3]_0 [3]),
        .Q(\stage_in_reg_reg_n_0_[0][2][3] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[0][3][0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_in_reg_reg[0][3][3]_0 [0]),
        .Q(\stage_in_reg_reg_n_0_[0][3][0] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[0][3][1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_in_reg_reg[0][3][3]_0 [1]),
        .Q(\stage_in_reg_reg_n_0_[0][3][1] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[0][3][2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_in_reg_reg[0][3][3]_0 [2]),
        .Q(\stage_in_reg_reg_n_0_[0][3][2] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[0][3][3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_in_reg_reg[0][3][3]_0 [3]),
        .Q(\stage_in_reg_reg_n_0_[0][3][3] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[0][4][0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_in_reg_reg[0][4][3]_0 [0]),
        .Q(\stage_in_reg_reg_n_0_[0][4][0] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[0][4][1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_in_reg_reg[0][4][3]_0 [1]),
        .Q(\stage_in_reg_reg_n_0_[0][4][1] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[0][4][2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_in_reg_reg[0][4][3]_0 [2]),
        .Q(\stage_in_reg_reg_n_0_[0][4][2] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[0][4][3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_in_reg_reg[0][4][3]_0 [3]),
        .Q(\stage_in_reg_reg_n_0_[0][4][3] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[0][5][0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_in_reg_reg[0][5][3]_0 [0]),
        .Q(\stage_in_reg_reg_n_0_[0][5][0] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[0][5][1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_in_reg_reg[0][5][3]_0 [1]),
        .Q(\stage_in_reg_reg_n_0_[0][5][1] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[0][5][2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_in_reg_reg[0][5][3]_0 [2]),
        .Q(\stage_in_reg_reg_n_0_[0][5][2] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[0][5][3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_in_reg_reg[0][5][3]_0 [3]),
        .Q(\stage_in_reg_reg_n_0_[0][5][3] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[0][6][0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_in_reg_reg[0][6][3]_0 [0]),
        .Q(\stage_in_reg_reg_n_0_[0][6][0] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[0][6][1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_in_reg_reg[0][6][3]_0 [1]),
        .Q(\stage_in_reg_reg_n_0_[0][6][1] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[0][6][2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_in_reg_reg[0][6][3]_0 [2]),
        .Q(\stage_in_reg_reg_n_0_[0][6][2] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[0][6][3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_in_reg_reg[0][6][3]_0 [3]),
        .Q(\stage_in_reg_reg_n_0_[0][6][3] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[0][7][0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_in_reg_reg[0][7][3]_0 [0]),
        .Q(\stage_in_reg_reg_n_0_[0][7][0] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[0][7][1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_in_reg_reg[0][7][3]_0 [1]),
        .Q(\stage_in_reg_reg_n_0_[0][7][1] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[0][7][2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_in_reg_reg[0][7][3]_0 [2]),
        .Q(\stage_in_reg_reg_n_0_[0][7][2] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[0][7][3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_in_reg_reg[0][7][3]_0 [3]),
        .Q(\stage_in_reg_reg_n_0_[0][7][3] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[1][0][0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[1][0]_0 [0]),
        .Q(\stage_in_reg_reg_n_0_[1][0][0] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[1][0][1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[1][0]_0 [1]),
        .Q(\stage_in_reg_reg_n_0_[1][0][1] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[1][0][2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[1][0]_0 [2]),
        .Q(\stage_in_reg_reg_n_0_[1][0][2] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[1][0][3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[1][0]_0 [3]),
        .Q(\stage_in_reg_reg_n_0_[1][0][3] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[1][1][0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[1][2]_2 [0]),
        .Q(\stage_in_reg_reg_n_0_[1][1][0] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[1][1][1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[1][2]_2 [1]),
        .Q(\stage_in_reg_reg_n_0_[1][1][1] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[1][1][2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[1][2]_2 [2]),
        .Q(\stage_in_reg_reg_n_0_[1][1][2] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[1][1][3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[1][2]_2 [3]),
        .Q(\stage_in_reg_reg_n_0_[1][1][3] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[1][2][0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[1][1]_1 [0]),
        .Q(\stage_in_reg_reg_n_0_[1][2][0] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[1][2][1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[1][1]_1 [1]),
        .Q(\stage_in_reg_reg_n_0_[1][2][1] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[1][2][2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[1][1]_1 [2]),
        .Q(\stage_in_reg_reg_n_0_[1][2][2] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[1][2][3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[1][1]_1 [3]),
        .Q(\stage_in_reg_reg_n_0_[1][2][3] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[1][3][0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[1][3]_3 [0]),
        .Q(\stage_in_reg_reg_n_0_[1][3][0] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[1][3][1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[1][3]_3 [1]),
        .Q(\stage_in_reg_reg_n_0_[1][3][1] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[1][3][2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[1][3]_3 [2]),
        .Q(\stage_in_reg_reg_n_0_[1][3][2] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[1][3][3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[1][3]_3 [3]),
        .Q(\stage_in_reg_reg_n_0_[1][3][3] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[1][4][0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[1][4]_4 [0]),
        .Q(\stage_in_reg_reg_n_0_[1][4][0] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[1][4][1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[1][4]_4 [1]),
        .Q(\stage_in_reg_reg_n_0_[1][4][1] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[1][4][2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[1][4]_4 [2]),
        .Q(\stage_in_reg_reg_n_0_[1][4][2] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[1][4][3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[1][4]_4 [3]),
        .Q(\stage_in_reg_reg_n_0_[1][4][3] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[1][5][0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[1][6]_6 [0]),
        .Q(\stage_in_reg_reg_n_0_[1][5][0] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[1][5][1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[1][6]_6 [1]),
        .Q(\stage_in_reg_reg_n_0_[1][5][1] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[1][5][2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[1][6]_6 [2]),
        .Q(\stage_in_reg_reg_n_0_[1][5][2] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[1][5][3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[1][6]_6 [3]),
        .Q(\stage_in_reg_reg_n_0_[1][5][3] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[1][6][0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[1][5]_5 [0]),
        .Q(\stage_in_reg_reg_n_0_[1][6][0] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[1][6][1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[1][5]_5 [1]),
        .Q(\stage_in_reg_reg_n_0_[1][6][1] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[1][6][2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[1][5]_5 [2]),
        .Q(\stage_in_reg_reg_n_0_[1][6][2] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[1][6][3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[1][5]_5 [3]),
        .Q(\stage_in_reg_reg_n_0_[1][6][3] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[1][7][0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[1][7]_7 [0]),
        .Q(\stage_in_reg_reg_n_0_[1][7][0] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[1][7][1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[1][7]_7 [1]),
        .Q(\stage_in_reg_reg_n_0_[1][7][1] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[1][7][2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[1][7]_7 [2]),
        .Q(\stage_in_reg_reg_n_0_[1][7][2] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[1][7][3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[1][7]_7 [3]),
        .Q(\stage_in_reg_reg_n_0_[1][7][3] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[2][0][0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[2][0]_8 [0]),
        .Q(\stage_in_reg_reg_n_0_[2][0][0] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[2][0][1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[2][0]_8 [1]),
        .Q(\stage_in_reg_reg_n_0_[2][0][1] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[2][0][2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[2][0]_8 [2]),
        .Q(\stage_in_reg_reg_n_0_[2][0][2] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[2][0][3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[2][0]_8 [3]),
        .Q(\stage_in_reg_reg_n_0_[2][0][3] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[2][1][0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[2][2]_10 [0]),
        .Q(\stage_in_reg_reg_n_0_[2][1][0] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[2][1][1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[2][2]_10 [1]),
        .Q(\stage_in_reg_reg_n_0_[2][1][1] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[2][1][2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[2][2]_10 [2]),
        .Q(\stage_in_reg_reg_n_0_[2][1][2] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[2][1][3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[2][2]_10 [3]),
        .Q(\stage_in_reg_reg_n_0_[2][1][3] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[2][2][0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[2][1]_9 [0]),
        .Q(\stage_in_reg_reg_n_0_[2][2][0] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[2][2][1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[2][1]_9 [1]),
        .Q(\stage_in_reg_reg_n_0_[2][2][1] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[2][2][2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[2][1]_9 [2]),
        .Q(\stage_in_reg_reg_n_0_[2][2][2] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[2][2][3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[2][1]_9 [3]),
        .Q(\stage_in_reg_reg_n_0_[2][2][3] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[2][3][0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[2][3]_11 [0]),
        .Q(\stage_in_reg_reg_n_0_[2][3][0] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[2][3][1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[2][3]_11 [1]),
        .Q(\stage_in_reg_reg_n_0_[2][3][1] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[2][3][2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[2][3]_11 [2]),
        .Q(\stage_in_reg_reg_n_0_[2][3][2] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[2][3][3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[2][3]_11 [3]),
        .Q(\stage_in_reg_reg_n_0_[2][3][3] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[2][4][0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[2][4]_12 [0]),
        .Q(\stage_in_reg_reg_n_0_[2][4][0] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[2][4][1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[2][4]_12 [1]),
        .Q(\stage_in_reg_reg_n_0_[2][4][1] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[2][4][2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[2][4]_12 [2]),
        .Q(\stage_in_reg_reg_n_0_[2][4][2] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[2][4][3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[2][4]_12 [3]),
        .Q(\stage_in_reg_reg_n_0_[2][4][3] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[2][5][0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[2][6]_14 [0]),
        .Q(\stage_in_reg_reg_n_0_[2][5][0] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[2][5][1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[2][6]_14 [1]),
        .Q(\stage_in_reg_reg_n_0_[2][5][1] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[2][5][2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[2][6]_14 [2]),
        .Q(\stage_in_reg_reg_n_0_[2][5][2] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[2][5][3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[2][6]_14 [3]),
        .Q(\stage_in_reg_reg_n_0_[2][5][3] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[2][6][0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[2][5]_13 [0]),
        .Q(\stage_in_reg_reg_n_0_[2][6][0] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[2][6][1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[2][5]_13 [1]),
        .Q(\stage_in_reg_reg_n_0_[2][6][1] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[2][6][2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[2][5]_13 [2]),
        .Q(\stage_in_reg_reg_n_0_[2][6][2] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[2][6][3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[2][5]_13 [3]),
        .Q(\stage_in_reg_reg_n_0_[2][6][3] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[2][7][0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[2][7]_15 [0]),
        .Q(\stage_in_reg_reg_n_0_[2][7][0] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[2][7][1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[2][7]_15 [1]),
        .Q(\stage_in_reg_reg_n_0_[2][7][1] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[2][7][2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[2][7]_15 [2]),
        .Q(\stage_in_reg_reg_n_0_[2][7][2] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[2][7][3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[2][7]_15 [3]),
        .Q(\stage_in_reg_reg_n_0_[2][7][3] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[3][0][0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[3][0]_16 [0]),
        .Q(\stage_in_reg_reg_n_0_[3][0][0] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[3][0][1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[3][0]_16 [1]),
        .Q(\stage_in_reg_reg_n_0_[3][0][1] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[3][0][2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[3][0]_16 [2]),
        .Q(\stage_in_reg_reg_n_0_[3][0][2] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[3][0][3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[3][0]_16 [3]),
        .Q(\stage_in_reg_reg_n_0_[3][0][3] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[3][1][0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[3][4]_20 [0]),
        .Q(\stage_in_reg_reg_n_0_[3][1][0] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[3][1][1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[3][4]_20 [1]),
        .Q(\stage_in_reg_reg_n_0_[3][1][1] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[3][1][2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[3][4]_20 [2]),
        .Q(\stage_in_reg_reg_n_0_[3][1][2] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[3][1][3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[3][4]_20 [3]),
        .Q(\stage_in_reg_reg_n_0_[3][1][3] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[3][2][0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[3][1]_17 [0]),
        .Q(\stage_in_reg_reg_n_0_[3][2][0] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[3][2][1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[3][1]_17 [1]),
        .Q(\stage_in_reg_reg_n_0_[3][2][1] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[3][2][2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[3][1]_17 [2]),
        .Q(\stage_in_reg_reg_n_0_[3][2][2] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[3][2][3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[3][1]_17 [3]),
        .Q(\stage_in_reg_reg_n_0_[3][2][3] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[3][3][0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[3][5]_21 [0]),
        .Q(\stage_in_reg_reg_n_0_[3][3][0] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[3][3][1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[3][5]_21 [1]),
        .Q(\stage_in_reg_reg_n_0_[3][3][1] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[3][3][2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[3][5]_21 [2]),
        .Q(\stage_in_reg_reg_n_0_[3][3][2] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[3][3][3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[3][5]_21 [3]),
        .Q(\stage_in_reg_reg_n_0_[3][3][3] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[3][4][0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[3][2]_18 [0]),
        .Q(\stage_in_reg_reg_n_0_[3][4][0] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[3][4][1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[3][2]_18 [1]),
        .Q(\stage_in_reg_reg_n_0_[3][4][1] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[3][4][2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[3][2]_18 [2]),
        .Q(\stage_in_reg_reg_n_0_[3][4][2] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[3][4][3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[3][2]_18 [3]),
        .Q(\stage_in_reg_reg_n_0_[3][4][3] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[3][5][0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[3][6]_22 [0]),
        .Q(\stage_in_reg_reg_n_0_[3][5][0] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[3][5][1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[3][6]_22 [1]),
        .Q(\stage_in_reg_reg_n_0_[3][5][1] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[3][5][2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[3][6]_22 [2]),
        .Q(\stage_in_reg_reg_n_0_[3][5][2] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[3][5][3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[3][6]_22 [3]),
        .Q(\stage_in_reg_reg_n_0_[3][5][3] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[3][6][0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[3][3]_19 [0]),
        .Q(\stage_in_reg_reg_n_0_[3][6][0] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[3][6][1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[3][3]_19 [1]),
        .Q(\stage_in_reg_reg_n_0_[3][6][1] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[3][6][2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[3][3]_19 [2]),
        .Q(\stage_in_reg_reg_n_0_[3][6][2] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[3][6][3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[3][3]_19 [3]),
        .Q(\stage_in_reg_reg_n_0_[3][6][3] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[3][7][0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[3][7]_23 [0]),
        .Q(\stage_in_reg_reg_n_0_[3][7][0] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[3][7][1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[3][7]_23 [1]),
        .Q(\stage_in_reg_reg_n_0_[3][7][1] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[3][7][2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[3][7]_23 [2]),
        .Q(\stage_in_reg_reg_n_0_[3][7][2] ),
        .R(1'b0));
  FDRE \stage_in_reg_reg[3][7][3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\stage_out_reg[3][7]_23 [3]),
        .Q(\stage_in_reg_reg_n_0_[3][7][3] ),
        .R(1'b0));
endmodule

module deviceid903f_axi_lite_benes_0_0_stage_module
   (D,
    \stage_in_reg_reg[0][0][3] ,
    \stage_in_reg_reg[0][3][3] ,
    \stage_in_reg_reg[0][2][3] ,
    \stage_in_reg_reg[0][5][3] ,
    \stage_in_reg_reg[0][4][3] ,
    \stage_in_reg_reg[0][7][3] ,
    \stage_in_reg_reg[0][6][3] ,
    Q,
    s00_axi_wdata,
    \stage_in_reg_reg[1][2][3] ,
    \stage_in_reg_reg[1][3][3] ,
    \stage_in_reg_reg[1][3][3]_0 ,
    \stage_in_reg_reg[1][6][3] ,
    \stage_in_reg_reg[1][6][3]_0 ,
    \stage_in_reg_reg[1][7][3] ,
    \stage_in_reg_reg[1][7][3]_0 );
  output [3:0]D;
  output [3:0]\stage_in_reg_reg[0][0][3] ;
  output [3:0]\stage_in_reg_reg[0][3][3] ;
  output [3:0]\stage_in_reg_reg[0][2][3] ;
  output [3:0]\stage_in_reg_reg[0][5][3] ;
  output [3:0]\stage_in_reg_reg[0][4][3] ;
  output [3:0]\stage_in_reg_reg[0][7][3] ;
  output [3:0]\stage_in_reg_reg[0][6][3] ;
  input [3:0]Q;
  input [3:0]s00_axi_wdata;
  input [3:0]\stage_in_reg_reg[1][2][3] ;
  input [3:0]\stage_in_reg_reg[1][3][3] ;
  input [3:0]\stage_in_reg_reg[1][3][3]_0 ;
  input [3:0]\stage_in_reg_reg[1][6][3] ;
  input [3:0]\stage_in_reg_reg[1][6][3]_0 ;
  input [3:0]\stage_in_reg_reg[1][7][3] ;
  input [3:0]\stage_in_reg_reg[1][7][3]_0 ;

  wire [3:0]D;
  wire [3:0]Q;
  wire [3:0]s00_axi_wdata;
  wire [3:0]\stage_in_reg_reg[0][0][3] ;
  wire [3:0]\stage_in_reg_reg[0][2][3] ;
  wire [3:0]\stage_in_reg_reg[0][3][3] ;
  wire [3:0]\stage_in_reg_reg[0][4][3] ;
  wire [3:0]\stage_in_reg_reg[0][5][3] ;
  wire [3:0]\stage_in_reg_reg[0][6][3] ;
  wire [3:0]\stage_in_reg_reg[0][7][3] ;
  wire [3:0]\stage_in_reg_reg[1][2][3] ;
  wire [3:0]\stage_in_reg_reg[1][3][3] ;
  wire [3:0]\stage_in_reg_reg[1][3][3]_0 ;
  wire [3:0]\stage_in_reg_reg[1][6][3] ;
  wire [3:0]\stage_in_reg_reg[1][6][3]_0 ;
  wire [3:0]\stage_in_reg_reg[1][7][3] ;
  wire [3:0]\stage_in_reg_reg[1][7][3]_0 ;

  deviceid903f_axi_lite_benes_0_0_switch_module_14 \switch_instance[0].s 
       (.D(D),
        .Q(Q),
        .s00_axi_wdata(s00_axi_wdata[0]),
        .\stage_in_reg_reg[0][0][3] (\stage_in_reg_reg[0][0][3] ),
        .\stage_in_reg_reg[1][2][3] (\stage_in_reg_reg[1][2][3] ));
  deviceid903f_axi_lite_benes_0_0_switch_module_15 \switch_instance[1].s 
       (.s00_axi_wdata(s00_axi_wdata[1]),
        .\stage_in_reg_reg[0][2][3] (\stage_in_reg_reg[0][2][3] ),
        .\stage_in_reg_reg[0][3][3] (\stage_in_reg_reg[0][3][3] ),
        .\stage_in_reg_reg[1][3][3] (\stage_in_reg_reg[1][3][3] ),
        .\stage_in_reg_reg[1][3][3]_0 (\stage_in_reg_reg[1][3][3]_0 ));
  deviceid903f_axi_lite_benes_0_0_switch_module_16 \switch_instance[2].s 
       (.s00_axi_wdata(s00_axi_wdata[2]),
        .\stage_in_reg_reg[0][4][3] (\stage_in_reg_reg[0][4][3] ),
        .\stage_in_reg_reg[0][5][3] (\stage_in_reg_reg[0][5][3] ),
        .\stage_in_reg_reg[1][6][3] (\stage_in_reg_reg[1][6][3] ),
        .\stage_in_reg_reg[1][6][3]_0 (\stage_in_reg_reg[1][6][3]_0 ));
  deviceid903f_axi_lite_benes_0_0_switch_module_17 \switch_instance[3].s 
       (.s00_axi_wdata(s00_axi_wdata[3]),
        .\stage_in_reg_reg[0][6][3] (\stage_in_reg_reg[0][6][3] ),
        .\stage_in_reg_reg[0][7][3] (\stage_in_reg_reg[0][7][3] ),
        .\stage_in_reg_reg[1][7][3] (\stage_in_reg_reg[1][7][3] ),
        .\stage_in_reg_reg[1][7][3]_0 (\stage_in_reg_reg[1][7][3]_0 ));
endmodule

(* ORIG_REF_NAME = "stage_module" *) 
module deviceid903f_axi_lite_benes_0_0_stage_module_0
   (D,
    \stage_in_reg_reg[1][0][3] ,
    \stage_in_reg_reg[1][3][3] ,
    \stage_in_reg_reg[1][2][3] ,
    \stage_in_reg_reg[1][5][3] ,
    \stage_in_reg_reg[1][4][3] ,
    \stage_in_reg_reg[1][7][3] ,
    \stage_in_reg_reg[1][6][3] ,
    Q,
    s00_axi_wdata,
    \stage_in_reg_reg[2][2][3] ,
    \stage_in_reg_reg[2][3][3] ,
    \stage_in_reg_reg[2][3][3]_0 ,
    \stage_in_reg_reg[2][6][3] ,
    \stage_in_reg_reg[2][6][3]_0 ,
    \stage_in_reg_reg[2][7][3] ,
    \stage_in_reg_reg[2][7][3]_0 );
  output [3:0]D;
  output [3:0]\stage_in_reg_reg[1][0][3] ;
  output [3:0]\stage_in_reg_reg[1][3][3] ;
  output [3:0]\stage_in_reg_reg[1][2][3] ;
  output [3:0]\stage_in_reg_reg[1][5][3] ;
  output [3:0]\stage_in_reg_reg[1][4][3] ;
  output [3:0]\stage_in_reg_reg[1][7][3] ;
  output [3:0]\stage_in_reg_reg[1][6][3] ;
  input [3:0]Q;
  input [3:0]s00_axi_wdata;
  input [3:0]\stage_in_reg_reg[2][2][3] ;
  input [3:0]\stage_in_reg_reg[2][3][3] ;
  input [3:0]\stage_in_reg_reg[2][3][3]_0 ;
  input [3:0]\stage_in_reg_reg[2][6][3] ;
  input [3:0]\stage_in_reg_reg[2][6][3]_0 ;
  input [3:0]\stage_in_reg_reg[2][7][3] ;
  input [3:0]\stage_in_reg_reg[2][7][3]_0 ;

  wire [3:0]D;
  wire [3:0]Q;
  wire [3:0]s00_axi_wdata;
  wire [3:0]\stage_in_reg_reg[1][0][3] ;
  wire [3:0]\stage_in_reg_reg[1][2][3] ;
  wire [3:0]\stage_in_reg_reg[1][3][3] ;
  wire [3:0]\stage_in_reg_reg[1][4][3] ;
  wire [3:0]\stage_in_reg_reg[1][5][3] ;
  wire [3:0]\stage_in_reg_reg[1][6][3] ;
  wire [3:0]\stage_in_reg_reg[1][7][3] ;
  wire [3:0]\stage_in_reg_reg[2][2][3] ;
  wire [3:0]\stage_in_reg_reg[2][3][3] ;
  wire [3:0]\stage_in_reg_reg[2][3][3]_0 ;
  wire [3:0]\stage_in_reg_reg[2][6][3] ;
  wire [3:0]\stage_in_reg_reg[2][6][3]_0 ;
  wire [3:0]\stage_in_reg_reg[2][7][3] ;
  wire [3:0]\stage_in_reg_reg[2][7][3]_0 ;

  deviceid903f_axi_lite_benes_0_0_switch_module_10 \switch_instance[0].s 
       (.D(D),
        .Q(Q),
        .s00_axi_wdata(s00_axi_wdata[0]),
        .\stage_in_reg_reg[1][0][3] (\stage_in_reg_reg[1][0][3] ),
        .\stage_in_reg_reg[2][2][3] (\stage_in_reg_reg[2][2][3] ));
  deviceid903f_axi_lite_benes_0_0_switch_module_11 \switch_instance[1].s 
       (.s00_axi_wdata(s00_axi_wdata[1]),
        .\stage_in_reg_reg[1][2][3] (\stage_in_reg_reg[1][2][3] ),
        .\stage_in_reg_reg[1][3][3] (\stage_in_reg_reg[1][3][3] ),
        .\stage_in_reg_reg[2][3][3] (\stage_in_reg_reg[2][3][3] ),
        .\stage_in_reg_reg[2][3][3]_0 (\stage_in_reg_reg[2][3][3]_0 ));
  deviceid903f_axi_lite_benes_0_0_switch_module_12 \switch_instance[2].s 
       (.s00_axi_wdata(s00_axi_wdata[2]),
        .\stage_in_reg_reg[1][4][3] (\stage_in_reg_reg[1][4][3] ),
        .\stage_in_reg_reg[1][5][3] (\stage_in_reg_reg[1][5][3] ),
        .\stage_in_reg_reg[2][6][3] (\stage_in_reg_reg[2][6][3] ),
        .\stage_in_reg_reg[2][6][3]_0 (\stage_in_reg_reg[2][6][3]_0 ));
  deviceid903f_axi_lite_benes_0_0_switch_module_13 \switch_instance[3].s 
       (.s00_axi_wdata(s00_axi_wdata[3]),
        .\stage_in_reg_reg[1][6][3] (\stage_in_reg_reg[1][6][3] ),
        .\stage_in_reg_reg[1][7][3] (\stage_in_reg_reg[1][7][3] ),
        .\stage_in_reg_reg[2][7][3] (\stage_in_reg_reg[2][7][3] ),
        .\stage_in_reg_reg[2][7][3]_0 (\stage_in_reg_reg[2][7][3]_0 ));
endmodule

(* ORIG_REF_NAME = "stage_module" *) 
module deviceid903f_axi_lite_benes_0_0_stage_module_1
   (D,
    \stage_in_reg_reg[2][0][3] ,
    \stage_in_reg_reg[2][3][3] ,
    \stage_in_reg_reg[2][2][3] ,
    \stage_in_reg_reg[2][5][3] ,
    \stage_in_reg_reg[2][4][3] ,
    \stage_in_reg_reg[2][7][3] ,
    \stage_in_reg_reg[2][6][3] ,
    Q,
    s00_axi_wdata,
    \stage_in_reg_reg[3][2][3] ,
    \stage_in_reg_reg[3][6][3] ,
    \stage_in_reg_reg[3][6][3]_0 ,
    \stage_in_reg_reg[3][3][3] ,
    \stage_in_reg_reg[3][3][3]_0 ,
    \stage_in_reg_reg[3][7][3] ,
    \stage_in_reg_reg[3][7][3]_0 );
  output [3:0]D;
  output [3:0]\stage_in_reg_reg[2][0][3] ;
  output [3:0]\stage_in_reg_reg[2][3][3] ;
  output [3:0]\stage_in_reg_reg[2][2][3] ;
  output [3:0]\stage_in_reg_reg[2][5][3] ;
  output [3:0]\stage_in_reg_reg[2][4][3] ;
  output [3:0]\stage_in_reg_reg[2][7][3] ;
  output [3:0]\stage_in_reg_reg[2][6][3] ;
  input [3:0]Q;
  input [3:0]s00_axi_wdata;
  input [3:0]\stage_in_reg_reg[3][2][3] ;
  input [3:0]\stage_in_reg_reg[3][6][3] ;
  input [3:0]\stage_in_reg_reg[3][6][3]_0 ;
  input [3:0]\stage_in_reg_reg[3][3][3] ;
  input [3:0]\stage_in_reg_reg[3][3][3]_0 ;
  input [3:0]\stage_in_reg_reg[3][7][3] ;
  input [3:0]\stage_in_reg_reg[3][7][3]_0 ;

  wire [3:0]D;
  wire [3:0]Q;
  wire [3:0]s00_axi_wdata;
  wire [3:0]\stage_in_reg_reg[2][0][3] ;
  wire [3:0]\stage_in_reg_reg[2][2][3] ;
  wire [3:0]\stage_in_reg_reg[2][3][3] ;
  wire [3:0]\stage_in_reg_reg[2][4][3] ;
  wire [3:0]\stage_in_reg_reg[2][5][3] ;
  wire [3:0]\stage_in_reg_reg[2][6][3] ;
  wire [3:0]\stage_in_reg_reg[2][7][3] ;
  wire [3:0]\stage_in_reg_reg[3][2][3] ;
  wire [3:0]\stage_in_reg_reg[3][3][3] ;
  wire [3:0]\stage_in_reg_reg[3][3][3]_0 ;
  wire [3:0]\stage_in_reg_reg[3][6][3] ;
  wire [3:0]\stage_in_reg_reg[3][6][3]_0 ;
  wire [3:0]\stage_in_reg_reg[3][7][3] ;
  wire [3:0]\stage_in_reg_reg[3][7][3]_0 ;

  deviceid903f_axi_lite_benes_0_0_switch_module_6 \switch_instance[0].s 
       (.D(D),
        .Q(Q),
        .s00_axi_wdata(s00_axi_wdata[0]),
        .\stage_in_reg_reg[2][0][3] (\stage_in_reg_reg[2][0][3] ),
        .\stage_in_reg_reg[3][2][3] (\stage_in_reg_reg[3][2][3] ));
  deviceid903f_axi_lite_benes_0_0_switch_module_7 \switch_instance[1].s 
       (.s00_axi_wdata(s00_axi_wdata[1]),
        .\stage_in_reg_reg[2][2][3] (\stage_in_reg_reg[2][2][3] ),
        .\stage_in_reg_reg[2][3][3] (\stage_in_reg_reg[2][3][3] ),
        .\stage_in_reg_reg[3][6][3] (\stage_in_reg_reg[3][6][3] ),
        .\stage_in_reg_reg[3][6][3]_0 (\stage_in_reg_reg[3][6][3]_0 ));
  deviceid903f_axi_lite_benes_0_0_switch_module_8 \switch_instance[2].s 
       (.s00_axi_wdata(s00_axi_wdata[2]),
        .\stage_in_reg_reg[2][4][3] (\stage_in_reg_reg[2][4][3] ),
        .\stage_in_reg_reg[2][5][3] (\stage_in_reg_reg[2][5][3] ),
        .\stage_in_reg_reg[3][3][3] (\stage_in_reg_reg[3][3][3] ),
        .\stage_in_reg_reg[3][3][3]_0 (\stage_in_reg_reg[3][3][3]_0 ));
  deviceid903f_axi_lite_benes_0_0_switch_module_9 \switch_instance[3].s 
       (.s00_axi_wdata(s00_axi_wdata[3]),
        .\stage_in_reg_reg[2][6][3] (\stage_in_reg_reg[2][6][3] ),
        .\stage_in_reg_reg[2][7][3] (\stage_in_reg_reg[2][7][3] ),
        .\stage_in_reg_reg[3][7][3] (\stage_in_reg_reg[3][7][3] ),
        .\stage_in_reg_reg[3][7][3]_0 (\stage_in_reg_reg[3][7][3]_0 ));
endmodule

(* ORIG_REF_NAME = "stage_module" *) 
module deviceid903f_axi_lite_benes_0_0_stage_module_2
   (\stage_in_reg_reg[3][1][3] ,
    Q,
    s00_axi_wdata,
    \axi_rdata_reg[27] ,
    \axi_rdata_reg[19] ,
    \axi_rdata_reg[19]_0 ,
    \axi_rdata_reg[11] ,
    \axi_rdata_reg[11]_0 ,
    \axi_rdata_reg[3] ,
    \axi_rdata_reg[3]_0 );
  output [31:0]\stage_in_reg_reg[3][1][3] ;
  input [3:0]Q;
  input [3:0]s00_axi_wdata;
  input [3:0]\axi_rdata_reg[27] ;
  input [3:0]\axi_rdata_reg[19] ;
  input [3:0]\axi_rdata_reg[19]_0 ;
  input [3:0]\axi_rdata_reg[11] ;
  input [3:0]\axi_rdata_reg[11]_0 ;
  input [3:0]\axi_rdata_reg[3] ;
  input [3:0]\axi_rdata_reg[3]_0 ;

  wire [3:0]Q;
  wire [3:0]\axi_rdata_reg[11] ;
  wire [3:0]\axi_rdata_reg[11]_0 ;
  wire [3:0]\axi_rdata_reg[19] ;
  wire [3:0]\axi_rdata_reg[19]_0 ;
  wire [3:0]\axi_rdata_reg[27] ;
  wire [3:0]\axi_rdata_reg[3] ;
  wire [3:0]\axi_rdata_reg[3]_0 ;
  wire [3:0]s00_axi_wdata;
  wire [31:0]\stage_in_reg_reg[3][1][3] ;

  deviceid903f_axi_lite_benes_0_0_switch_module \switch_instance[0].s 
       (.Q(Q),
        .\axi_rdata_reg[27] (\axi_rdata_reg[27] ),
        .s00_axi_wdata(s00_axi_wdata[0]),
        .\stage_in_reg_reg[3][1][3] (\stage_in_reg_reg[3][1][3] [31:24]));
  deviceid903f_axi_lite_benes_0_0_switch_module_3 \switch_instance[1].s 
       (.\axi_rdata_reg[19] (\axi_rdata_reg[19] ),
        .\axi_rdata_reg[19]_0 (\axi_rdata_reg[19]_0 ),
        .s00_axi_wdata(s00_axi_wdata[1]),
        .\stage_in_reg_reg[3][3][3] (\stage_in_reg_reg[3][1][3] [23:16]));
  deviceid903f_axi_lite_benes_0_0_switch_module_4 \switch_instance[2].s 
       (.\axi_rdata_reg[11] (\axi_rdata_reg[11] ),
        .\axi_rdata_reg[11]_0 (\axi_rdata_reg[11]_0 ),
        .s00_axi_wdata(s00_axi_wdata[2]),
        .\stage_in_reg_reg[3][5][3] (\stage_in_reg_reg[3][1][3] [15:8]));
  deviceid903f_axi_lite_benes_0_0_switch_module_5 \switch_instance[3].s 
       (.\axi_rdata_reg[3] (\axi_rdata_reg[3] ),
        .\axi_rdata_reg[3]_0 (\axi_rdata_reg[3]_0 ),
        .s00_axi_wdata(s00_axi_wdata[3]),
        .\stage_in_reg_reg[3][7][3] (\stage_in_reg_reg[3][1][3] [7:0]));
endmodule

module deviceid903f_axi_lite_benes_0_0_switch_module
   (\stage_in_reg_reg[3][1][3] ,
    Q,
    s00_axi_wdata,
    \axi_rdata_reg[27] );
  output [7:0]\stage_in_reg_reg[3][1][3] ;
  input [3:0]Q;
  input [0:0]s00_axi_wdata;
  input [3:0]\axi_rdata_reg[27] ;

  wire [3:0]Q;
  wire [3:0]\axi_rdata_reg[27] ;
  wire [0:0]s00_axi_wdata;
  wire [7:0]\stage_in_reg_reg[3][1][3] ;

  (* SOFT_HLUTNM = "soft_lutpair77" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axi_rdata[24]_i_1 
       (.I0(\axi_rdata_reg[27] [0]),
        .I1(s00_axi_wdata),
        .I2(Q[0]),
        .O(\stage_in_reg_reg[3][1][3] [0]));
  (* SOFT_HLUTNM = "soft_lutpair78" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axi_rdata[25]_i_1 
       (.I0(\axi_rdata_reg[27] [1]),
        .I1(s00_axi_wdata),
        .I2(Q[1]),
        .O(\stage_in_reg_reg[3][1][3] [1]));
  (* SOFT_HLUTNM = "soft_lutpair79" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axi_rdata[26]_i_1 
       (.I0(\axi_rdata_reg[27] [2]),
        .I1(s00_axi_wdata),
        .I2(Q[2]),
        .O(\stage_in_reg_reg[3][1][3] [2]));
  (* SOFT_HLUTNM = "soft_lutpair80" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axi_rdata[27]_i_1 
       (.I0(\axi_rdata_reg[27] [3]),
        .I1(s00_axi_wdata),
        .I2(Q[3]),
        .O(\stage_in_reg_reg[3][1][3] [3]));
  (* SOFT_HLUTNM = "soft_lutpair77" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axi_rdata[28]_i_1 
       (.I0(Q[0]),
        .I1(s00_axi_wdata),
        .I2(\axi_rdata_reg[27] [0]),
        .O(\stage_in_reg_reg[3][1][3] [4]));
  (* SOFT_HLUTNM = "soft_lutpair78" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axi_rdata[29]_i_1 
       (.I0(Q[1]),
        .I1(s00_axi_wdata),
        .I2(\axi_rdata_reg[27] [1]),
        .O(\stage_in_reg_reg[3][1][3] [5]));
  (* SOFT_HLUTNM = "soft_lutpair79" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axi_rdata[30]_i_1 
       (.I0(Q[2]),
        .I1(s00_axi_wdata),
        .I2(\axi_rdata_reg[27] [2]),
        .O(\stage_in_reg_reg[3][1][3] [6]));
  (* SOFT_HLUTNM = "soft_lutpair80" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axi_rdata[31]_i_1 
       (.I0(Q[3]),
        .I1(s00_axi_wdata),
        .I2(\axi_rdata_reg[27] [3]),
        .O(\stage_in_reg_reg[3][1][3] [7]));
endmodule

(* ORIG_REF_NAME = "switch_module" *) 
module deviceid903f_axi_lite_benes_0_0_switch_module_10
   (D,
    \stage_in_reg_reg[1][0][3] ,
    Q,
    s00_axi_wdata,
    \stage_in_reg_reg[2][2][3] );
  output [3:0]D;
  output [3:0]\stage_in_reg_reg[1][0][3] ;
  input [3:0]Q;
  input [0:0]s00_axi_wdata;
  input [3:0]\stage_in_reg_reg[2][2][3] ;

  wire [3:0]D;
  wire [3:0]Q;
  wire [0:0]s00_axi_wdata;
  wire [3:0]\stage_in_reg_reg[1][0][3] ;
  wire [3:0]\stage_in_reg_reg[2][2][3] ;

  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[2][0][0]_i_1 
       (.I0(Q[0]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[2][2][3] [0]),
        .O(D[0]));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[2][0][1]_i_1 
       (.I0(Q[1]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[2][2][3] [1]),
        .O(D[1]));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[2][0][2]_i_1 
       (.I0(Q[2]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[2][2][3] [2]),
        .O(D[2]));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[2][0][3]_i_1 
       (.I0(Q[3]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[2][2][3] [3]),
        .O(D[3]));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[2][2][0]_i_1 
       (.I0(\stage_in_reg_reg[2][2][3] [0]),
        .I1(s00_axi_wdata),
        .I2(Q[0]),
        .O(\stage_in_reg_reg[1][0][3] [0]));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[2][2][1]_i_1 
       (.I0(\stage_in_reg_reg[2][2][3] [1]),
        .I1(s00_axi_wdata),
        .I2(Q[1]),
        .O(\stage_in_reg_reg[1][0][3] [1]));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[2][2][2]_i_1 
       (.I0(\stage_in_reg_reg[2][2][3] [2]),
        .I1(s00_axi_wdata),
        .I2(Q[2]),
        .O(\stage_in_reg_reg[1][0][3] [2]));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[2][2][3]_i_1 
       (.I0(\stage_in_reg_reg[2][2][3] [3]),
        .I1(s00_axi_wdata),
        .I2(Q[3]),
        .O(\stage_in_reg_reg[1][0][3] [3]));
endmodule

(* ORIG_REF_NAME = "switch_module" *) 
module deviceid903f_axi_lite_benes_0_0_switch_module_11
   (\stage_in_reg_reg[1][3][3] ,
    \stage_in_reg_reg[1][2][3] ,
    \stage_in_reg_reg[2][3][3] ,
    s00_axi_wdata,
    \stage_in_reg_reg[2][3][3]_0 );
  output [3:0]\stage_in_reg_reg[1][3][3] ;
  output [3:0]\stage_in_reg_reg[1][2][3] ;
  input [3:0]\stage_in_reg_reg[2][3][3] ;
  input [0:0]s00_axi_wdata;
  input [3:0]\stage_in_reg_reg[2][3][3]_0 ;

  wire [0:0]s00_axi_wdata;
  wire [3:0]\stage_in_reg_reg[1][2][3] ;
  wire [3:0]\stage_in_reg_reg[1][3][3] ;
  wire [3:0]\stage_in_reg_reg[2][3][3] ;
  wire [3:0]\stage_in_reg_reg[2][3][3]_0 ;

  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[2][1][0]_i_1 
       (.I0(\stage_in_reg_reg[2][3][3] [0]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[2][3][3]_0 [0]),
        .O(\stage_in_reg_reg[1][3][3] [0]));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[2][1][1]_i_1 
       (.I0(\stage_in_reg_reg[2][3][3] [1]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[2][3][3]_0 [1]),
        .O(\stage_in_reg_reg[1][3][3] [1]));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[2][1][2]_i_1 
       (.I0(\stage_in_reg_reg[2][3][3] [2]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[2][3][3]_0 [2]),
        .O(\stage_in_reg_reg[1][3][3] [2]));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[2][1][3]_i_1 
       (.I0(\stage_in_reg_reg[2][3][3] [3]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[2][3][3]_0 [3]),
        .O(\stage_in_reg_reg[1][3][3] [3]));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[2][3][0]_i_1 
       (.I0(\stage_in_reg_reg[2][3][3]_0 [0]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[2][3][3] [0]),
        .O(\stage_in_reg_reg[1][2][3] [0]));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[2][3][1]_i_1 
       (.I0(\stage_in_reg_reg[2][3][3]_0 [1]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[2][3][3] [1]),
        .O(\stage_in_reg_reg[1][2][3] [1]));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[2][3][2]_i_1 
       (.I0(\stage_in_reg_reg[2][3][3]_0 [2]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[2][3][3] [2]),
        .O(\stage_in_reg_reg[1][2][3] [2]));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[2][3][3]_i_1 
       (.I0(\stage_in_reg_reg[2][3][3]_0 [3]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[2][3][3] [3]),
        .O(\stage_in_reg_reg[1][2][3] [3]));
endmodule

(* ORIG_REF_NAME = "switch_module" *) 
module deviceid903f_axi_lite_benes_0_0_switch_module_12
   (\stage_in_reg_reg[1][5][3] ,
    \stage_in_reg_reg[1][4][3] ,
    \stage_in_reg_reg[2][6][3] ,
    s00_axi_wdata,
    \stage_in_reg_reg[2][6][3]_0 );
  output [3:0]\stage_in_reg_reg[1][5][3] ;
  output [3:0]\stage_in_reg_reg[1][4][3] ;
  input [3:0]\stage_in_reg_reg[2][6][3] ;
  input [0:0]s00_axi_wdata;
  input [3:0]\stage_in_reg_reg[2][6][3]_0 ;

  wire [0:0]s00_axi_wdata;
  wire [3:0]\stage_in_reg_reg[1][4][3] ;
  wire [3:0]\stage_in_reg_reg[1][5][3] ;
  wire [3:0]\stage_in_reg_reg[2][6][3] ;
  wire [3:0]\stage_in_reg_reg[2][6][3]_0 ;

  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[2][4][0]_i_1 
       (.I0(\stage_in_reg_reg[2][6][3] [0]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[2][6][3]_0 [0]),
        .O(\stage_in_reg_reg[1][5][3] [0]));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[2][4][1]_i_1 
       (.I0(\stage_in_reg_reg[2][6][3] [1]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[2][6][3]_0 [1]),
        .O(\stage_in_reg_reg[1][5][3] [1]));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[2][4][2]_i_1 
       (.I0(\stage_in_reg_reg[2][6][3] [2]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[2][6][3]_0 [2]),
        .O(\stage_in_reg_reg[1][5][3] [2]));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[2][4][3]_i_1 
       (.I0(\stage_in_reg_reg[2][6][3] [3]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[2][6][3]_0 [3]),
        .O(\stage_in_reg_reg[1][5][3] [3]));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[2][6][0]_i_1 
       (.I0(\stage_in_reg_reg[2][6][3]_0 [0]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[2][6][3] [0]),
        .O(\stage_in_reg_reg[1][4][3] [0]));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[2][6][1]_i_1 
       (.I0(\stage_in_reg_reg[2][6][3]_0 [1]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[2][6][3] [1]),
        .O(\stage_in_reg_reg[1][4][3] [1]));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[2][6][2]_i_1 
       (.I0(\stage_in_reg_reg[2][6][3]_0 [2]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[2][6][3] [2]),
        .O(\stage_in_reg_reg[1][4][3] [2]));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[2][6][3]_i_1 
       (.I0(\stage_in_reg_reg[2][6][3]_0 [3]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[2][6][3] [3]),
        .O(\stage_in_reg_reg[1][4][3] [3]));
endmodule

(* ORIG_REF_NAME = "switch_module" *) 
module deviceid903f_axi_lite_benes_0_0_switch_module_13
   (\stage_in_reg_reg[1][7][3] ,
    \stage_in_reg_reg[1][6][3] ,
    \stage_in_reg_reg[2][7][3] ,
    s00_axi_wdata,
    \stage_in_reg_reg[2][7][3]_0 );
  output [3:0]\stage_in_reg_reg[1][7][3] ;
  output [3:0]\stage_in_reg_reg[1][6][3] ;
  input [3:0]\stage_in_reg_reg[2][7][3] ;
  input [0:0]s00_axi_wdata;
  input [3:0]\stage_in_reg_reg[2][7][3]_0 ;

  wire [0:0]s00_axi_wdata;
  wire [3:0]\stage_in_reg_reg[1][6][3] ;
  wire [3:0]\stage_in_reg_reg[1][7][3] ;
  wire [3:0]\stage_in_reg_reg[2][7][3] ;
  wire [3:0]\stage_in_reg_reg[2][7][3]_0 ;

  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[2][5][0]_i_1 
       (.I0(\stage_in_reg_reg[2][7][3] [0]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[2][7][3]_0 [0]),
        .O(\stage_in_reg_reg[1][7][3] [0]));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[2][5][1]_i_1 
       (.I0(\stage_in_reg_reg[2][7][3] [1]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[2][7][3]_0 [1]),
        .O(\stage_in_reg_reg[1][7][3] [1]));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[2][5][2]_i_1 
       (.I0(\stage_in_reg_reg[2][7][3] [2]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[2][7][3]_0 [2]),
        .O(\stage_in_reg_reg[1][7][3] [2]));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[2][5][3]_i_1 
       (.I0(\stage_in_reg_reg[2][7][3] [3]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[2][7][3]_0 [3]),
        .O(\stage_in_reg_reg[1][7][3] [3]));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[2][7][0]_i_1 
       (.I0(\stage_in_reg_reg[2][7][3]_0 [0]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[2][7][3] [0]),
        .O(\stage_in_reg_reg[1][6][3] [0]));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[2][7][1]_i_1 
       (.I0(\stage_in_reg_reg[2][7][3]_0 [1]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[2][7][3] [1]),
        .O(\stage_in_reg_reg[1][6][3] [1]));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[2][7][2]_i_1 
       (.I0(\stage_in_reg_reg[2][7][3]_0 [2]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[2][7][3] [2]),
        .O(\stage_in_reg_reg[1][6][3] [2]));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[2][7][3]_i_1 
       (.I0(\stage_in_reg_reg[2][7][3]_0 [3]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[2][7][3] [3]),
        .O(\stage_in_reg_reg[1][6][3] [3]));
endmodule

(* ORIG_REF_NAME = "switch_module" *) 
module deviceid903f_axi_lite_benes_0_0_switch_module_14
   (D,
    \stage_in_reg_reg[0][0][3] ,
    Q,
    s00_axi_wdata,
    \stage_in_reg_reg[1][2][3] );
  output [3:0]D;
  output [3:0]\stage_in_reg_reg[0][0][3] ;
  input [3:0]Q;
  input [0:0]s00_axi_wdata;
  input [3:0]\stage_in_reg_reg[1][2][3] ;

  wire [3:0]D;
  wire [3:0]Q;
  wire [0:0]s00_axi_wdata;
  wire [3:0]\stage_in_reg_reg[0][0][3] ;
  wire [3:0]\stage_in_reg_reg[1][2][3] ;

  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[1][0][0]_i_1 
       (.I0(Q[0]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[1][2][3] [0]),
        .O(D[0]));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[1][0][1]_i_1 
       (.I0(Q[1]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[1][2][3] [1]),
        .O(D[1]));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[1][0][2]_i_1 
       (.I0(Q[2]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[1][2][3] [2]),
        .O(D[2]));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[1][0][3]_i_1 
       (.I0(Q[3]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[1][2][3] [3]),
        .O(D[3]));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[1][2][0]_i_1 
       (.I0(\stage_in_reg_reg[1][2][3] [0]),
        .I1(s00_axi_wdata),
        .I2(Q[0]),
        .O(\stage_in_reg_reg[0][0][3] [0]));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[1][2][1]_i_1 
       (.I0(\stage_in_reg_reg[1][2][3] [1]),
        .I1(s00_axi_wdata),
        .I2(Q[1]),
        .O(\stage_in_reg_reg[0][0][3] [1]));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[1][2][2]_i_1 
       (.I0(\stage_in_reg_reg[1][2][3] [2]),
        .I1(s00_axi_wdata),
        .I2(Q[2]),
        .O(\stage_in_reg_reg[0][0][3] [2]));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[1][2][3]_i_1 
       (.I0(\stage_in_reg_reg[1][2][3] [3]),
        .I1(s00_axi_wdata),
        .I2(Q[3]),
        .O(\stage_in_reg_reg[0][0][3] [3]));
endmodule

(* ORIG_REF_NAME = "switch_module" *) 
module deviceid903f_axi_lite_benes_0_0_switch_module_15
   (\stage_in_reg_reg[0][3][3] ,
    \stage_in_reg_reg[0][2][3] ,
    \stage_in_reg_reg[1][3][3] ,
    s00_axi_wdata,
    \stage_in_reg_reg[1][3][3]_0 );
  output [3:0]\stage_in_reg_reg[0][3][3] ;
  output [3:0]\stage_in_reg_reg[0][2][3] ;
  input [3:0]\stage_in_reg_reg[1][3][3] ;
  input [0:0]s00_axi_wdata;
  input [3:0]\stage_in_reg_reg[1][3][3]_0 ;

  wire [0:0]s00_axi_wdata;
  wire [3:0]\stage_in_reg_reg[0][2][3] ;
  wire [3:0]\stage_in_reg_reg[0][3][3] ;
  wire [3:0]\stage_in_reg_reg[1][3][3] ;
  wire [3:0]\stage_in_reg_reg[1][3][3]_0 ;

  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[1][1][0]_i_1 
       (.I0(\stage_in_reg_reg[1][3][3] [0]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[1][3][3]_0 [0]),
        .O(\stage_in_reg_reg[0][3][3] [0]));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[1][1][1]_i_1 
       (.I0(\stage_in_reg_reg[1][3][3] [1]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[1][3][3]_0 [1]),
        .O(\stage_in_reg_reg[0][3][3] [1]));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[1][1][2]_i_1 
       (.I0(\stage_in_reg_reg[1][3][3] [2]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[1][3][3]_0 [2]),
        .O(\stage_in_reg_reg[0][3][3] [2]));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[1][1][3]_i_1 
       (.I0(\stage_in_reg_reg[1][3][3] [3]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[1][3][3]_0 [3]),
        .O(\stage_in_reg_reg[0][3][3] [3]));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[1][3][0]_i_1 
       (.I0(\stage_in_reg_reg[1][3][3]_0 [0]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[1][3][3] [0]),
        .O(\stage_in_reg_reg[0][2][3] [0]));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[1][3][1]_i_1 
       (.I0(\stage_in_reg_reg[1][3][3]_0 [1]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[1][3][3] [1]),
        .O(\stage_in_reg_reg[0][2][3] [1]));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[1][3][2]_i_1 
       (.I0(\stage_in_reg_reg[1][3][3]_0 [2]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[1][3][3] [2]),
        .O(\stage_in_reg_reg[0][2][3] [2]));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[1][3][3]_i_1 
       (.I0(\stage_in_reg_reg[1][3][3]_0 [3]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[1][3][3] [3]),
        .O(\stage_in_reg_reg[0][2][3] [3]));
endmodule

(* ORIG_REF_NAME = "switch_module" *) 
module deviceid903f_axi_lite_benes_0_0_switch_module_16
   (\stage_in_reg_reg[0][5][3] ,
    \stage_in_reg_reg[0][4][3] ,
    \stage_in_reg_reg[1][6][3] ,
    s00_axi_wdata,
    \stage_in_reg_reg[1][6][3]_0 );
  output [3:0]\stage_in_reg_reg[0][5][3] ;
  output [3:0]\stage_in_reg_reg[0][4][3] ;
  input [3:0]\stage_in_reg_reg[1][6][3] ;
  input [0:0]s00_axi_wdata;
  input [3:0]\stage_in_reg_reg[1][6][3]_0 ;

  wire [0:0]s00_axi_wdata;
  wire [3:0]\stage_in_reg_reg[0][4][3] ;
  wire [3:0]\stage_in_reg_reg[0][5][3] ;
  wire [3:0]\stage_in_reg_reg[1][6][3] ;
  wire [3:0]\stage_in_reg_reg[1][6][3]_0 ;

  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[1][4][0]_i_1 
       (.I0(\stage_in_reg_reg[1][6][3] [0]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[1][6][3]_0 [0]),
        .O(\stage_in_reg_reg[0][5][3] [0]));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[1][4][1]_i_1 
       (.I0(\stage_in_reg_reg[1][6][3] [1]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[1][6][3]_0 [1]),
        .O(\stage_in_reg_reg[0][5][3] [1]));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[1][4][2]_i_1 
       (.I0(\stage_in_reg_reg[1][6][3] [2]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[1][6][3]_0 [2]),
        .O(\stage_in_reg_reg[0][5][3] [2]));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[1][4][3]_i_1 
       (.I0(\stage_in_reg_reg[1][6][3] [3]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[1][6][3]_0 [3]),
        .O(\stage_in_reg_reg[0][5][3] [3]));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[1][6][0]_i_1 
       (.I0(\stage_in_reg_reg[1][6][3]_0 [0]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[1][6][3] [0]),
        .O(\stage_in_reg_reg[0][4][3] [0]));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[1][6][1]_i_1 
       (.I0(\stage_in_reg_reg[1][6][3]_0 [1]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[1][6][3] [1]),
        .O(\stage_in_reg_reg[0][4][3] [1]));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[1][6][2]_i_1 
       (.I0(\stage_in_reg_reg[1][6][3]_0 [2]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[1][6][3] [2]),
        .O(\stage_in_reg_reg[0][4][3] [2]));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[1][6][3]_i_1 
       (.I0(\stage_in_reg_reg[1][6][3]_0 [3]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[1][6][3] [3]),
        .O(\stage_in_reg_reg[0][4][3] [3]));
endmodule

(* ORIG_REF_NAME = "switch_module" *) 
module deviceid903f_axi_lite_benes_0_0_switch_module_17
   (\stage_in_reg_reg[0][7][3] ,
    \stage_in_reg_reg[0][6][3] ,
    \stage_in_reg_reg[1][7][3] ,
    s00_axi_wdata,
    \stage_in_reg_reg[1][7][3]_0 );
  output [3:0]\stage_in_reg_reg[0][7][3] ;
  output [3:0]\stage_in_reg_reg[0][6][3] ;
  input [3:0]\stage_in_reg_reg[1][7][3] ;
  input [0:0]s00_axi_wdata;
  input [3:0]\stage_in_reg_reg[1][7][3]_0 ;

  wire [0:0]s00_axi_wdata;
  wire [3:0]\stage_in_reg_reg[0][6][3] ;
  wire [3:0]\stage_in_reg_reg[0][7][3] ;
  wire [3:0]\stage_in_reg_reg[1][7][3] ;
  wire [3:0]\stage_in_reg_reg[1][7][3]_0 ;

  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[1][5][0]_i_1 
       (.I0(\stage_in_reg_reg[1][7][3] [0]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[1][7][3]_0 [0]),
        .O(\stage_in_reg_reg[0][7][3] [0]));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[1][5][1]_i_1 
       (.I0(\stage_in_reg_reg[1][7][3] [1]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[1][7][3]_0 [1]),
        .O(\stage_in_reg_reg[0][7][3] [1]));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[1][5][2]_i_1 
       (.I0(\stage_in_reg_reg[1][7][3] [2]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[1][7][3]_0 [2]),
        .O(\stage_in_reg_reg[0][7][3] [2]));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[1][5][3]_i_1 
       (.I0(\stage_in_reg_reg[1][7][3] [3]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[1][7][3]_0 [3]),
        .O(\stage_in_reg_reg[0][7][3] [3]));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[1][7][0]_i_1 
       (.I0(\stage_in_reg_reg[1][7][3]_0 [0]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[1][7][3] [0]),
        .O(\stage_in_reg_reg[0][6][3] [0]));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[1][7][1]_i_1 
       (.I0(\stage_in_reg_reg[1][7][3]_0 [1]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[1][7][3] [1]),
        .O(\stage_in_reg_reg[0][6][3] [1]));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[1][7][2]_i_1 
       (.I0(\stage_in_reg_reg[1][7][3]_0 [2]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[1][7][3] [2]),
        .O(\stage_in_reg_reg[0][6][3] [2]));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[1][7][3]_i_1 
       (.I0(\stage_in_reg_reg[1][7][3]_0 [3]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[1][7][3] [3]),
        .O(\stage_in_reg_reg[0][6][3] [3]));
endmodule

(* ORIG_REF_NAME = "switch_module" *) 
module deviceid903f_axi_lite_benes_0_0_switch_module_3
   (\stage_in_reg_reg[3][3][3] ,
    \axi_rdata_reg[19] ,
    s00_axi_wdata,
    \axi_rdata_reg[19]_0 );
  output [7:0]\stage_in_reg_reg[3][3][3] ;
  input [3:0]\axi_rdata_reg[19] ;
  input [0:0]s00_axi_wdata;
  input [3:0]\axi_rdata_reg[19]_0 ;

  wire [3:0]\axi_rdata_reg[19] ;
  wire [3:0]\axi_rdata_reg[19]_0 ;
  wire [0:0]s00_axi_wdata;
  wire [7:0]\stage_in_reg_reg[3][3][3] ;

  (* SOFT_HLUTNM = "soft_lutpair81" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axi_rdata[16]_i_1 
       (.I0(\axi_rdata_reg[19]_0 [0]),
        .I1(s00_axi_wdata),
        .I2(\axi_rdata_reg[19] [0]),
        .O(\stage_in_reg_reg[3][3][3] [0]));
  (* SOFT_HLUTNM = "soft_lutpair82" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axi_rdata[17]_i_1 
       (.I0(\axi_rdata_reg[19]_0 [1]),
        .I1(s00_axi_wdata),
        .I2(\axi_rdata_reg[19] [1]),
        .O(\stage_in_reg_reg[3][3][3] [1]));
  (* SOFT_HLUTNM = "soft_lutpair83" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axi_rdata[18]_i_1 
       (.I0(\axi_rdata_reg[19]_0 [2]),
        .I1(s00_axi_wdata),
        .I2(\axi_rdata_reg[19] [2]),
        .O(\stage_in_reg_reg[3][3][3] [2]));
  (* SOFT_HLUTNM = "soft_lutpair84" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axi_rdata[19]_i_1 
       (.I0(\axi_rdata_reg[19]_0 [3]),
        .I1(s00_axi_wdata),
        .I2(\axi_rdata_reg[19] [3]),
        .O(\stage_in_reg_reg[3][3][3] [3]));
  (* SOFT_HLUTNM = "soft_lutpair81" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axi_rdata[20]_i_1 
       (.I0(\axi_rdata_reg[19] [0]),
        .I1(s00_axi_wdata),
        .I2(\axi_rdata_reg[19]_0 [0]),
        .O(\stage_in_reg_reg[3][3][3] [4]));
  (* SOFT_HLUTNM = "soft_lutpair82" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axi_rdata[21]_i_1 
       (.I0(\axi_rdata_reg[19] [1]),
        .I1(s00_axi_wdata),
        .I2(\axi_rdata_reg[19]_0 [1]),
        .O(\stage_in_reg_reg[3][3][3] [5]));
  (* SOFT_HLUTNM = "soft_lutpair83" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axi_rdata[22]_i_1 
       (.I0(\axi_rdata_reg[19] [2]),
        .I1(s00_axi_wdata),
        .I2(\axi_rdata_reg[19]_0 [2]),
        .O(\stage_in_reg_reg[3][3][3] [6]));
  (* SOFT_HLUTNM = "soft_lutpair84" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axi_rdata[23]_i_1 
       (.I0(\axi_rdata_reg[19] [3]),
        .I1(s00_axi_wdata),
        .I2(\axi_rdata_reg[19]_0 [3]),
        .O(\stage_in_reg_reg[3][3][3] [7]));
endmodule

(* ORIG_REF_NAME = "switch_module" *) 
module deviceid903f_axi_lite_benes_0_0_switch_module_4
   (\stage_in_reg_reg[3][5][3] ,
    \axi_rdata_reg[11] ,
    s00_axi_wdata,
    \axi_rdata_reg[11]_0 );
  output [7:0]\stage_in_reg_reg[3][5][3] ;
  input [3:0]\axi_rdata_reg[11] ;
  input [0:0]s00_axi_wdata;
  input [3:0]\axi_rdata_reg[11]_0 ;

  wire [3:0]\axi_rdata_reg[11] ;
  wire [3:0]\axi_rdata_reg[11]_0 ;
  wire [0:0]s00_axi_wdata;
  wire [7:0]\stage_in_reg_reg[3][5][3] ;

  (* SOFT_HLUTNM = "soft_lutpair87" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axi_rdata[10]_i_1 
       (.I0(\axi_rdata_reg[11]_0 [2]),
        .I1(s00_axi_wdata),
        .I2(\axi_rdata_reg[11] [2]),
        .O(\stage_in_reg_reg[3][5][3] [2]));
  (* SOFT_HLUTNM = "soft_lutpair88" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axi_rdata[11]_i_1 
       (.I0(\axi_rdata_reg[11]_0 [3]),
        .I1(s00_axi_wdata),
        .I2(\axi_rdata_reg[11] [3]),
        .O(\stage_in_reg_reg[3][5][3] [3]));
  (* SOFT_HLUTNM = "soft_lutpair85" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axi_rdata[12]_i_1 
       (.I0(\axi_rdata_reg[11] [0]),
        .I1(s00_axi_wdata),
        .I2(\axi_rdata_reg[11]_0 [0]),
        .O(\stage_in_reg_reg[3][5][3] [4]));
  (* SOFT_HLUTNM = "soft_lutpair86" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axi_rdata[13]_i_1 
       (.I0(\axi_rdata_reg[11] [1]),
        .I1(s00_axi_wdata),
        .I2(\axi_rdata_reg[11]_0 [1]),
        .O(\stage_in_reg_reg[3][5][3] [5]));
  (* SOFT_HLUTNM = "soft_lutpair87" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axi_rdata[14]_i_1 
       (.I0(\axi_rdata_reg[11] [2]),
        .I1(s00_axi_wdata),
        .I2(\axi_rdata_reg[11]_0 [2]),
        .O(\stage_in_reg_reg[3][5][3] [6]));
  (* SOFT_HLUTNM = "soft_lutpair88" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axi_rdata[15]_i_1 
       (.I0(\axi_rdata_reg[11] [3]),
        .I1(s00_axi_wdata),
        .I2(\axi_rdata_reg[11]_0 [3]),
        .O(\stage_in_reg_reg[3][5][3] [7]));
  (* SOFT_HLUTNM = "soft_lutpair85" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axi_rdata[8]_i_1 
       (.I0(\axi_rdata_reg[11]_0 [0]),
        .I1(s00_axi_wdata),
        .I2(\axi_rdata_reg[11] [0]),
        .O(\stage_in_reg_reg[3][5][3] [0]));
  (* SOFT_HLUTNM = "soft_lutpair86" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axi_rdata[9]_i_1 
       (.I0(\axi_rdata_reg[11]_0 [1]),
        .I1(s00_axi_wdata),
        .I2(\axi_rdata_reg[11] [1]),
        .O(\stage_in_reg_reg[3][5][3] [1]));
endmodule

(* ORIG_REF_NAME = "switch_module" *) 
module deviceid903f_axi_lite_benes_0_0_switch_module_5
   (\stage_in_reg_reg[3][7][3] ,
    \axi_rdata_reg[3] ,
    s00_axi_wdata,
    \axi_rdata_reg[3]_0 );
  output [7:0]\stage_in_reg_reg[3][7][3] ;
  input [3:0]\axi_rdata_reg[3] ;
  input [0:0]s00_axi_wdata;
  input [3:0]\axi_rdata_reg[3]_0 ;

  wire [3:0]\axi_rdata_reg[3] ;
  wire [3:0]\axi_rdata_reg[3]_0 ;
  wire [0:0]s00_axi_wdata;
  wire [7:0]\stage_in_reg_reg[3][7][3] ;

  (* SOFT_HLUTNM = "soft_lutpair89" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axi_rdata[0]_i_1 
       (.I0(\axi_rdata_reg[3]_0 [0]),
        .I1(s00_axi_wdata),
        .I2(\axi_rdata_reg[3] [0]),
        .O(\stage_in_reg_reg[3][7][3] [0]));
  (* SOFT_HLUTNM = "soft_lutpair90" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axi_rdata[1]_i_1 
       (.I0(\axi_rdata_reg[3]_0 [1]),
        .I1(s00_axi_wdata),
        .I2(\axi_rdata_reg[3] [1]),
        .O(\stage_in_reg_reg[3][7][3] [1]));
  (* SOFT_HLUTNM = "soft_lutpair91" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axi_rdata[2]_i_1 
       (.I0(\axi_rdata_reg[3]_0 [2]),
        .I1(s00_axi_wdata),
        .I2(\axi_rdata_reg[3] [2]),
        .O(\stage_in_reg_reg[3][7][3] [2]));
  (* SOFT_HLUTNM = "soft_lutpair92" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axi_rdata[3]_i_1 
       (.I0(\axi_rdata_reg[3]_0 [3]),
        .I1(s00_axi_wdata),
        .I2(\axi_rdata_reg[3] [3]),
        .O(\stage_in_reg_reg[3][7][3] [3]));
  (* SOFT_HLUTNM = "soft_lutpair89" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axi_rdata[4]_i_1 
       (.I0(\axi_rdata_reg[3] [0]),
        .I1(s00_axi_wdata),
        .I2(\axi_rdata_reg[3]_0 [0]),
        .O(\stage_in_reg_reg[3][7][3] [4]));
  (* SOFT_HLUTNM = "soft_lutpair90" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axi_rdata[5]_i_1 
       (.I0(\axi_rdata_reg[3] [1]),
        .I1(s00_axi_wdata),
        .I2(\axi_rdata_reg[3]_0 [1]),
        .O(\stage_in_reg_reg[3][7][3] [5]));
  (* SOFT_HLUTNM = "soft_lutpair91" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axi_rdata[6]_i_1 
       (.I0(\axi_rdata_reg[3] [2]),
        .I1(s00_axi_wdata),
        .I2(\axi_rdata_reg[3]_0 [2]),
        .O(\stage_in_reg_reg[3][7][3] [6]));
  (* SOFT_HLUTNM = "soft_lutpair92" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \axi_rdata[7]_i_1 
       (.I0(\axi_rdata_reg[3] [3]),
        .I1(s00_axi_wdata),
        .I2(\axi_rdata_reg[3]_0 [3]),
        .O(\stage_in_reg_reg[3][7][3] [7]));
endmodule

(* ORIG_REF_NAME = "switch_module" *) 
module deviceid903f_axi_lite_benes_0_0_switch_module_6
   (D,
    \stage_in_reg_reg[2][0][3] ,
    Q,
    s00_axi_wdata,
    \stage_in_reg_reg[3][2][3] );
  output [3:0]D;
  output [3:0]\stage_in_reg_reg[2][0][3] ;
  input [3:0]Q;
  input [0:0]s00_axi_wdata;
  input [3:0]\stage_in_reg_reg[3][2][3] ;

  wire [3:0]D;
  wire [3:0]Q;
  wire [0:0]s00_axi_wdata;
  wire [3:0]\stage_in_reg_reg[2][0][3] ;
  wire [3:0]\stage_in_reg_reg[3][2][3] ;

  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[3][0][0]_i_1 
       (.I0(Q[0]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[3][2][3] [0]),
        .O(D[0]));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[3][0][1]_i_1 
       (.I0(Q[1]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[3][2][3] [1]),
        .O(D[1]));
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[3][0][2]_i_1 
       (.I0(Q[2]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[3][2][3] [2]),
        .O(D[2]));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[3][0][3]_i_1 
       (.I0(Q[3]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[3][2][3] [3]),
        .O(D[3]));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[3][2][0]_i_1 
       (.I0(\stage_in_reg_reg[3][2][3] [0]),
        .I1(s00_axi_wdata),
        .I2(Q[0]),
        .O(\stage_in_reg_reg[2][0][3] [0]));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[3][2][1]_i_1 
       (.I0(\stage_in_reg_reg[3][2][3] [1]),
        .I1(s00_axi_wdata),
        .I2(Q[1]),
        .O(\stage_in_reg_reg[2][0][3] [1]));
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[3][2][2]_i_1 
       (.I0(\stage_in_reg_reg[3][2][3] [2]),
        .I1(s00_axi_wdata),
        .I2(Q[2]),
        .O(\stage_in_reg_reg[2][0][3] [2]));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[3][2][3]_i_1 
       (.I0(\stage_in_reg_reg[3][2][3] [3]),
        .I1(s00_axi_wdata),
        .I2(Q[3]),
        .O(\stage_in_reg_reg[2][0][3] [3]));
endmodule

(* ORIG_REF_NAME = "switch_module" *) 
module deviceid903f_axi_lite_benes_0_0_switch_module_7
   (\stage_in_reg_reg[2][3][3] ,
    \stage_in_reg_reg[2][2][3] ,
    \stage_in_reg_reg[3][6][3] ,
    s00_axi_wdata,
    \stage_in_reg_reg[3][6][3]_0 );
  output [3:0]\stage_in_reg_reg[2][3][3] ;
  output [3:0]\stage_in_reg_reg[2][2][3] ;
  input [3:0]\stage_in_reg_reg[3][6][3] ;
  input [0:0]s00_axi_wdata;
  input [3:0]\stage_in_reg_reg[3][6][3]_0 ;

  wire [0:0]s00_axi_wdata;
  wire [3:0]\stage_in_reg_reg[2][2][3] ;
  wire [3:0]\stage_in_reg_reg[2][3][3] ;
  wire [3:0]\stage_in_reg_reg[3][6][3] ;
  wire [3:0]\stage_in_reg_reg[3][6][3]_0 ;

  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[3][4][0]_i_1 
       (.I0(\stage_in_reg_reg[3][6][3] [0]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[3][6][3]_0 [0]),
        .O(\stage_in_reg_reg[2][3][3] [0]));
  (* SOFT_HLUTNM = "soft_lutpair66" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[3][4][1]_i_1 
       (.I0(\stage_in_reg_reg[3][6][3] [1]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[3][6][3]_0 [1]),
        .O(\stage_in_reg_reg[2][3][3] [1]));
  (* SOFT_HLUTNM = "soft_lutpair67" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[3][4][2]_i_1 
       (.I0(\stage_in_reg_reg[3][6][3] [2]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[3][6][3]_0 [2]),
        .O(\stage_in_reg_reg[2][3][3] [2]));
  (* SOFT_HLUTNM = "soft_lutpair68" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[3][4][3]_i_1 
       (.I0(\stage_in_reg_reg[3][6][3] [3]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[3][6][3]_0 [3]),
        .O(\stage_in_reg_reg[2][3][3] [3]));
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[3][6][0]_i_1 
       (.I0(\stage_in_reg_reg[3][6][3]_0 [0]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[3][6][3] [0]),
        .O(\stage_in_reg_reg[2][2][3] [0]));
  (* SOFT_HLUTNM = "soft_lutpair66" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[3][6][1]_i_1 
       (.I0(\stage_in_reg_reg[3][6][3]_0 [1]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[3][6][3] [1]),
        .O(\stage_in_reg_reg[2][2][3] [1]));
  (* SOFT_HLUTNM = "soft_lutpair67" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[3][6][2]_i_1 
       (.I0(\stage_in_reg_reg[3][6][3]_0 [2]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[3][6][3] [2]),
        .O(\stage_in_reg_reg[2][2][3] [2]));
  (* SOFT_HLUTNM = "soft_lutpair68" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[3][6][3]_i_1 
       (.I0(\stage_in_reg_reg[3][6][3]_0 [3]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[3][6][3] [3]),
        .O(\stage_in_reg_reg[2][2][3] [3]));
endmodule

(* ORIG_REF_NAME = "switch_module" *) 
module deviceid903f_axi_lite_benes_0_0_switch_module_8
   (\stage_in_reg_reg[2][5][3] ,
    \stage_in_reg_reg[2][4][3] ,
    \stage_in_reg_reg[3][3][3] ,
    s00_axi_wdata,
    \stage_in_reg_reg[3][3][3]_0 );
  output [3:0]\stage_in_reg_reg[2][5][3] ;
  output [3:0]\stage_in_reg_reg[2][4][3] ;
  input [3:0]\stage_in_reg_reg[3][3][3] ;
  input [0:0]s00_axi_wdata;
  input [3:0]\stage_in_reg_reg[3][3][3]_0 ;

  wire [0:0]s00_axi_wdata;
  wire [3:0]\stage_in_reg_reg[2][4][3] ;
  wire [3:0]\stage_in_reg_reg[2][5][3] ;
  wire [3:0]\stage_in_reg_reg[3][3][3] ;
  wire [3:0]\stage_in_reg_reg[3][3][3]_0 ;

  (* SOFT_HLUTNM = "soft_lutpair69" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[3][1][0]_i_1 
       (.I0(\stage_in_reg_reg[3][3][3] [0]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[3][3][3]_0 [0]),
        .O(\stage_in_reg_reg[2][5][3] [0]));
  (* SOFT_HLUTNM = "soft_lutpair70" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[3][1][1]_i_1 
       (.I0(\stage_in_reg_reg[3][3][3] [1]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[3][3][3]_0 [1]),
        .O(\stage_in_reg_reg[2][5][3] [1]));
  (* SOFT_HLUTNM = "soft_lutpair71" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[3][1][2]_i_1 
       (.I0(\stage_in_reg_reg[3][3][3] [2]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[3][3][3]_0 [2]),
        .O(\stage_in_reg_reg[2][5][3] [2]));
  (* SOFT_HLUTNM = "soft_lutpair72" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[3][1][3]_i_1 
       (.I0(\stage_in_reg_reg[3][3][3] [3]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[3][3][3]_0 [3]),
        .O(\stage_in_reg_reg[2][5][3] [3]));
  (* SOFT_HLUTNM = "soft_lutpair69" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[3][3][0]_i_1 
       (.I0(\stage_in_reg_reg[3][3][3]_0 [0]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[3][3][3] [0]),
        .O(\stage_in_reg_reg[2][4][3] [0]));
  (* SOFT_HLUTNM = "soft_lutpair70" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[3][3][1]_i_1 
       (.I0(\stage_in_reg_reg[3][3][3]_0 [1]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[3][3][3] [1]),
        .O(\stage_in_reg_reg[2][4][3] [1]));
  (* SOFT_HLUTNM = "soft_lutpair71" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[3][3][2]_i_1 
       (.I0(\stage_in_reg_reg[3][3][3]_0 [2]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[3][3][3] [2]),
        .O(\stage_in_reg_reg[2][4][3] [2]));
  (* SOFT_HLUTNM = "soft_lutpair72" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[3][3][3]_i_1 
       (.I0(\stage_in_reg_reg[3][3][3]_0 [3]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[3][3][3] [3]),
        .O(\stage_in_reg_reg[2][4][3] [3]));
endmodule

(* ORIG_REF_NAME = "switch_module" *) 
module deviceid903f_axi_lite_benes_0_0_switch_module_9
   (\stage_in_reg_reg[2][7][3] ,
    \stage_in_reg_reg[2][6][3] ,
    \stage_in_reg_reg[3][7][3] ,
    s00_axi_wdata,
    \stage_in_reg_reg[3][7][3]_0 );
  output [3:0]\stage_in_reg_reg[2][7][3] ;
  output [3:0]\stage_in_reg_reg[2][6][3] ;
  input [3:0]\stage_in_reg_reg[3][7][3] ;
  input [0:0]s00_axi_wdata;
  input [3:0]\stage_in_reg_reg[3][7][3]_0 ;

  wire [0:0]s00_axi_wdata;
  wire [3:0]\stage_in_reg_reg[2][6][3] ;
  wire [3:0]\stage_in_reg_reg[2][7][3] ;
  wire [3:0]\stage_in_reg_reg[3][7][3] ;
  wire [3:0]\stage_in_reg_reg[3][7][3]_0 ;

  (* SOFT_HLUTNM = "soft_lutpair73" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[3][5][0]_i_1 
       (.I0(\stage_in_reg_reg[3][7][3] [0]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[3][7][3]_0 [0]),
        .O(\stage_in_reg_reg[2][7][3] [0]));
  (* SOFT_HLUTNM = "soft_lutpair74" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[3][5][1]_i_1 
       (.I0(\stage_in_reg_reg[3][7][3] [1]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[3][7][3]_0 [1]),
        .O(\stage_in_reg_reg[2][7][3] [1]));
  (* SOFT_HLUTNM = "soft_lutpair75" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[3][5][2]_i_1 
       (.I0(\stage_in_reg_reg[3][7][3] [2]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[3][7][3]_0 [2]),
        .O(\stage_in_reg_reg[2][7][3] [2]));
  (* SOFT_HLUTNM = "soft_lutpair76" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[3][5][3]_i_1 
       (.I0(\stage_in_reg_reg[3][7][3] [3]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[3][7][3]_0 [3]),
        .O(\stage_in_reg_reg[2][7][3] [3]));
  (* SOFT_HLUTNM = "soft_lutpair73" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[3][7][0]_i_1 
       (.I0(\stage_in_reg_reg[3][7][3]_0 [0]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[3][7][3] [0]),
        .O(\stage_in_reg_reg[2][6][3] [0]));
  (* SOFT_HLUTNM = "soft_lutpair74" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[3][7][1]_i_1 
       (.I0(\stage_in_reg_reg[3][7][3]_0 [1]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[3][7][3] [1]),
        .O(\stage_in_reg_reg[2][6][3] [1]));
  (* SOFT_HLUTNM = "soft_lutpair75" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[3][7][2]_i_1 
       (.I0(\stage_in_reg_reg[3][7][3]_0 [2]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[3][7][3] [2]),
        .O(\stage_in_reg_reg[2][6][3] [2]));
  (* SOFT_HLUTNM = "soft_lutpair76" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[3][7][3]_i_1 
       (.I0(\stage_in_reg_reg[3][7][3]_0 [3]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[3][7][3] [3]),
        .O(\stage_in_reg_reg[2][6][3] [3]));
endmodule

module deviceid903f_axi_lite_benes_0_0_test_counter_2minus
   (Q,
    D,
    s00_axi_wdata,
    \stage_in_reg_reg[0][2][3] ,
    s00_axi_aclk,
    \out_reg_reg[3]_0 );
  output [2:0]Q;
  output [2:0]D;
  input [0:0]s00_axi_wdata;
  input [2:0]\stage_in_reg_reg[0][2][3] ;
  input s00_axi_aclk;
  input \out_reg_reg[3]_0 ;

  wire [2:0]D;
  wire [2:0]Q;
  wire [3:1]out_reg0;
  wire \out_reg_reg[3]_0 ;
  wire s00_axi_aclk;
  wire [0:0]s00_axi_wdata;
  wire [2:0]\stage_in_reg_reg[0][2][3] ;

  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \out_reg[1]_i_1 
       (.I0(Q[0]),
        .O(out_reg0[1]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \out_reg[2]_i_1 
       (.I0(Q[1]),
        .I1(Q[0]),
        .O(out_reg0[2]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'hE1)) 
    \out_reg[3]_i_1 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(Q[2]),
        .O(out_reg0[3]));
  FDCE \out_reg_reg[1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(\out_reg_reg[3]_0 ),
        .D(out_reg0[1]),
        .Q(Q[0]));
  FDCE \out_reg_reg[2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(\out_reg_reg[3]_0 ),
        .D(out_reg0[2]),
        .Q(Q[1]));
  FDCE \out_reg_reg[3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(\out_reg_reg[3]_0 ),
        .D(out_reg0[3]),
        .Q(Q[2]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[0][2][1]_i_1 
       (.I0(Q[0]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[0][2][3] [0]),
        .O(D[0]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[0][2][2]_i_1 
       (.I0(Q[1]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[0][2][3] [1]),
        .O(D[1]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[0][2][3]_i_1 
       (.I0(Q[2]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[0][2][3] [2]),
        .O(D[2]));
endmodule

module deviceid903f_axi_lite_benes_0_0_test_counter_2plus
   (Q,
    D,
    s00_axi_wdata,
    \stage_in_reg_reg[0][0][3] ,
    s00_axi_aclk,
    \out_reg_reg[4]_0 );
  output [2:0]Q;
  output [2:0]D;
  input [0:0]s00_axi_wdata;
  input [2:0]\stage_in_reg_reg[0][0][3] ;
  input s00_axi_aclk;
  input \out_reg_reg[4]_0 ;

  wire [2:0]D;
  wire [2:0]Q;
  wire \out_reg[1]_i_1__4_n_0 ;
  wire \out_reg[4]_i_1__1_n_0 ;
  wire [4:4]out_reg_reg;
  wire \out_reg_reg[4]_0 ;
  wire [3:2]p_0_in__0;
  wire s00_axi_aclk;
  wire [0:0]s00_axi_wdata;
  wire [2:0]\stage_in_reg_reg[0][0][3] ;

  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \out_reg[1]_i_1__4 
       (.I0(out_reg_reg),
        .I1(Q[0]),
        .O(\out_reg[1]_i_1__4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'h14)) 
    \out_reg[2]_i_1__2 
       (.I0(out_reg_reg),
        .I1(Q[0]),
        .I2(Q[1]),
        .O(p_0_in__0[2]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h1540)) 
    \out_reg[3]_i_1__2 
       (.I0(out_reg_reg),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(Q[2]),
        .O(p_0_in__0[3]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h0080)) 
    \out_reg[4]_i_1__1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(Q[2]),
        .I3(out_reg_reg),
        .O(\out_reg[4]_i_1__1_n_0 ));
  FDCE \out_reg_reg[1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(\out_reg_reg[4]_0 ),
        .D(\out_reg[1]_i_1__4_n_0 ),
        .Q(Q[0]));
  FDCE \out_reg_reg[2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(\out_reg_reg[4]_0 ),
        .D(p_0_in__0[2]),
        .Q(Q[1]));
  FDCE \out_reg_reg[3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(\out_reg_reg[4]_0 ),
        .D(p_0_in__0[3]),
        .Q(Q[2]));
  FDCE \out_reg_reg[4] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(\out_reg_reg[4]_0 ),
        .D(\out_reg[4]_i_1__1_n_0 ),
        .Q(out_reg_reg));
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[0][0][1]_i_1 
       (.I0(Q[0]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[0][0][3] [0]),
        .O(D[0]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[0][0][2]_i_1 
       (.I0(Q[1]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[0][0][3] [1]),
        .O(D[1]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[0][0][3]_i_1 
       (.I0(Q[2]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[0][0][3] [2]),
        .O(D[2]));
endmodule

module deviceid903f_axi_lite_benes_0_0_test_counter_3minus
   (D,
    Q,
    \out_reg_reg[3]_0 ,
    s00_axi_wdata,
    \stage_in_reg_reg[0][7][3] ,
    s00_axi_aclk,
    \out_reg_reg[3]_1 );
  output [1:0]D;
  output [1:0]Q;
  output [3:0]\out_reg_reg[3]_0 ;
  input [0:0]s00_axi_wdata;
  input [1:0]\stage_in_reg_reg[0][7][3] ;
  input s00_axi_aclk;
  input \out_reg_reg[3]_1 ;

  wire [1:0]D;
  wire [1:0]Q;
  wire [1:0]net_in6;
  wire [3:0]out_reg0__0;
  wire [3:0]\out_reg_reg[3]_0 ;
  wire \out_reg_reg[3]_1 ;
  wire s00_axi_aclk;
  wire [0:0]s00_axi_wdata;
  wire [1:0]\stage_in_reg_reg[0][7][3] ;

  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \out_reg[0]_i_1 
       (.I0(net_in6[0]),
        .O(out_reg0__0[0]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \out_reg[1]_i_1__0 
       (.I0(net_in6[0]),
        .I1(net_in6[1]),
        .O(out_reg0__0[1]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'h87)) 
    \out_reg[2]_i_1__0 
       (.I0(net_in6[0]),
        .I1(net_in6[1]),
        .I2(Q[0]),
        .O(out_reg0__0[2]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT4 #(
    .INIT(16'hF807)) 
    \out_reg[3]_i_1__0 
       (.I0(net_in6[0]),
        .I1(net_in6[1]),
        .I2(Q[0]),
        .I3(Q[1]),
        .O(out_reg0__0[3]));
  FDCE \out_reg_reg[0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(\out_reg_reg[3]_1 ),
        .D(out_reg0__0[0]),
        .Q(net_in6[0]));
  FDCE \out_reg_reg[1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(\out_reg_reg[3]_1 ),
        .D(out_reg0__0[1]),
        .Q(net_in6[1]));
  FDCE \out_reg_reg[2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(\out_reg_reg[3]_1 ),
        .D(out_reg0__0[2]),
        .Q(Q[0]));
  FDCE \out_reg_reg[3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(\out_reg_reg[3]_1 ),
        .D(out_reg0__0[3]),
        .Q(Q[1]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \stage_in_reg[0][3][0]_i_1 
       (.I0(net_in6[0]),
        .I1(s00_axi_wdata),
        .O(D[0]));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \stage_in_reg[0][3][1]_i_1 
       (.I0(net_in6[1]),
        .I1(s00_axi_wdata),
        .O(D[1]));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \stage_in_reg[0][7][0]_i_1 
       (.I0(s00_axi_wdata),
        .I1(net_in6[0]),
        .O(\out_reg_reg[3]_0 [0]));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \stage_in_reg[0][7][1]_i_1 
       (.I0(s00_axi_wdata),
        .I1(net_in6[1]),
        .O(\out_reg_reg[3]_0 [1]));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[0][7][2]_i_1 
       (.I0(Q[0]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[0][7][3] [0]),
        .O(\out_reg_reg[3]_0 [2]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[0][7][3]_i_1 
       (.I0(Q[1]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[0][7][3] [1]),
        .O(\out_reg_reg[3]_0 [3]));
endmodule

module deviceid903f_axi_lite_benes_0_0_test_counter_3plus
   (Q,
    D,
    \out_reg_reg[3]_0 ,
    s00_axi_wdata,
    \stage_in_reg_reg[0][5][3] ,
    s00_axi_aclk,
    \out_reg_reg[4]_0 );
  output [1:0]Q;
  output [1:0]D;
  output [3:0]\out_reg_reg[3]_0 ;
  input [0:0]s00_axi_wdata;
  input [1:0]\stage_in_reg_reg[0][5][3] ;
  input s00_axi_aclk;
  input \out_reg_reg[4]_0 ;

  wire [1:0]D;
  wire [1:0]Q;
  wire [1:0]net_in2;
  wire \out_reg[4]_i_1__2_n_0 ;
  wire [4:4]out_reg_reg;
  wire [3:0]\out_reg_reg[3]_0 ;
  wire \out_reg_reg[4]_0 ;
  wire [3:0]p_0_in__1;
  wire s00_axi_aclk;
  wire [0:0]s00_axi_wdata;
  wire [1:0]\stage_in_reg_reg[0][5][3] ;

  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT5 #(
    .INIT(32'h00001333)) 
    \out_reg[0]_i_1__0 
       (.I0(net_in2[1]),
        .I1(out_reg_reg),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(net_in2[0]),
        .O(p_0_in__1[0]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT5 #(
    .INIT(32'h01414141)) 
    \out_reg[1]_i_1__1 
       (.I0(out_reg_reg),
        .I1(net_in2[1]),
        .I2(net_in2[0]),
        .I3(Q[1]),
        .I4(Q[0]),
        .O(p_0_in__1[1]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'h0154)) 
    \out_reg[2]_i_1__3 
       (.I0(out_reg_reg),
        .I1(net_in2[1]),
        .I2(net_in2[0]),
        .I3(Q[0]),
        .O(p_0_in__1[2]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT5 #(
    .INIT(32'h001F00E0)) 
    \out_reg[3]_i_1__3 
       (.I0(net_in2[1]),
        .I1(net_in2[0]),
        .I2(Q[0]),
        .I3(out_reg_reg),
        .I4(Q[1]),
        .O(p_0_in__1[3]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT5 #(
    .INIT(32'h00000080)) 
    \out_reg[4]_i_1__2 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(net_in2[0]),
        .I3(net_in2[1]),
        .I4(out_reg_reg),
        .O(\out_reg[4]_i_1__2_n_0 ));
  FDCE \out_reg_reg[0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(\out_reg_reg[4]_0 ),
        .D(p_0_in__1[0]),
        .Q(net_in2[0]));
  FDCE \out_reg_reg[1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(\out_reg_reg[4]_0 ),
        .D(p_0_in__1[1]),
        .Q(net_in2[1]));
  FDCE \out_reg_reg[2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(\out_reg_reg[4]_0 ),
        .D(p_0_in__1[2]),
        .Q(Q[0]));
  FDCE \out_reg_reg[3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(\out_reg_reg[4]_0 ),
        .D(p_0_in__1[3]),
        .Q(Q[1]));
  FDCE \out_reg_reg[4] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(\out_reg_reg[4]_0 ),
        .D(\out_reg[4]_i_1__2_n_0 ),
        .Q(out_reg_reg));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \stage_in_reg[0][1][0]_i_1 
       (.I0(net_in2[0]),
        .I1(s00_axi_wdata),
        .O(D[0]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \stage_in_reg[0][1][1]_i_1 
       (.I0(net_in2[1]),
        .I1(s00_axi_wdata),
        .O(D[1]));
  LUT2 #(
    .INIT(4'h8)) 
    \stage_in_reg[0][5][0]_i_1 
       (.I0(s00_axi_wdata),
        .I1(net_in2[0]),
        .O(\out_reg_reg[3]_0 [0]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \stage_in_reg[0][5][1]_i_1 
       (.I0(s00_axi_wdata),
        .I1(net_in2[1]),
        .O(\out_reg_reg[3]_0 [1]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[0][5][2]_i_1 
       (.I0(Q[0]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[0][5][3] [0]),
        .O(\out_reg_reg[3]_0 [2]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[0][5][3]_i_1 
       (.I0(Q[1]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[0][5][3] [1]),
        .O(\out_reg_reg[3]_0 [3]));
endmodule

module deviceid903f_axi_lite_benes_0_0_test_counter_4minus
   (Q,
    D,
    s00_axi_wdata,
    \stage_in_reg_reg[0][3][3] ,
    s00_axi_aclk,
    \out_reg_reg[3]_0 );
  output [1:0]Q;
  output [1:0]D;
  input [0:0]s00_axi_wdata;
  input [1:0]\stage_in_reg_reg[0][3][3] ;
  input s00_axi_aclk;
  input \out_reg_reg[3]_0 ;

  wire [1:0]D;
  wire [1:0]Q;
  wire [3:2]out_reg0__1;
  wire \out_reg_reg[3]_0 ;
  wire s00_axi_aclk;
  wire [0:0]s00_axi_wdata;
  wire [1:0]\stage_in_reg_reg[0][3][3] ;

  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \out_reg[2]_i_1__1 
       (.I0(Q[0]),
        .O(out_reg0__1[2]));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \out_reg[3]_i_1__1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .O(out_reg0__1[3]));
  FDCE \out_reg_reg[2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(\out_reg_reg[3]_0 ),
        .D(out_reg0__1[2]),
        .Q(Q[0]));
  FDCE \out_reg_reg[3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(\out_reg_reg[3]_0 ),
        .D(out_reg0__1[3]),
        .Q(Q[1]));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[0][3][2]_i_1 
       (.I0(Q[0]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[0][3][3] [0]),
        .O(D[0]));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[0][3][3]_i_1 
       (.I0(Q[1]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[0][3][3] [1]),
        .O(D[1]));
endmodule

module deviceid903f_axi_lite_benes_0_0_test_counter_4plus
   (Q,
    D,
    s00_axi_wdata,
    \stage_in_reg_reg[0][1][3] ,
    s00_axi_aclk,
    \out_reg_reg[4]_0 );
  output [1:0]Q;
  output [1:0]D;
  input [0:0]s00_axi_wdata;
  input [1:0]\stage_in_reg_reg[0][1][3] ;
  input s00_axi_aclk;
  input \out_reg_reg[4]_0 ;

  wire [1:0]D;
  wire [1:0]Q;
  wire \out_reg[2]_i_1__6_n_0 ;
  wire \out_reg[3]_i_1__6_n_0 ;
  wire \out_reg[4]_i_1__3_n_0 ;
  wire [4:4]out_reg_reg;
  wire \out_reg_reg[4]_0 ;
  wire s00_axi_aclk;
  wire [0:0]s00_axi_wdata;
  wire [1:0]\stage_in_reg_reg[0][1][3] ;

  LUT2 #(
    .INIT(4'h1)) 
    \out_reg[2]_i_1__6 
       (.I0(out_reg_reg),
        .I1(Q[0]),
        .O(\out_reg[2]_i_1__6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'h06)) 
    \out_reg[3]_i_1__6 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(out_reg_reg),
        .O(\out_reg[3]_i_1__6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \out_reg[4]_i_1__3 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(out_reg_reg),
        .O(\out_reg[4]_i_1__3_n_0 ));
  FDCE \out_reg_reg[2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(\out_reg_reg[4]_0 ),
        .D(\out_reg[2]_i_1__6_n_0 ),
        .Q(Q[0]));
  FDCE \out_reg_reg[3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(\out_reg_reg[4]_0 ),
        .D(\out_reg[3]_i_1__6_n_0 ),
        .Q(Q[1]));
  FDCE \out_reg_reg[4] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(\out_reg_reg[4]_0 ),
        .D(\out_reg[4]_i_1__3_n_0 ),
        .Q(out_reg_reg));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[0][1][2]_i_1 
       (.I0(Q[0]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[0][1][3] [0]),
        .O(D[0]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[0][1][3]_i_1 
       (.I0(Q[1]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[0][1][3] [1]),
        .O(D[1]));
endmodule

module deviceid903f_axi_lite_benes_0_0_test_counter_minus
   (D,
    Q,
    \out_reg_reg[3]_0 ,
    s00_axi_wdata,
    \stage_in_reg_reg[0][6][3] ,
    s00_axi_aclk,
    \out_reg_reg[4]_0 );
  output [0:0]D;
  output [2:0]Q;
  output [3:0]\out_reg_reg[3]_0 ;
  input [0:0]s00_axi_wdata;
  input [2:0]\stage_in_reg_reg[0][6][3] ;
  input s00_axi_aclk;
  input \out_reg_reg[4]_0 ;

  wire [0:0]D;
  wire [2:0]Q;
  wire [0:0]net_in4;
  wire [4:0]out_reg;
  wire [4:4]out_reg__0;
  wire [3:0]\out_reg_reg[3]_0 ;
  wire \out_reg_reg[4]_0 ;
  wire s00_axi_aclk;
  wire [0:0]s00_axi_wdata;
  wire [2:0]\stage_in_reg_reg[0][6][3] ;

  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT5 #(
    .INIT(32'h33333332)) 
    \out_reg[0]_i_1__2 
       (.I0(Q[0]),
        .I1(net_in4),
        .I2(Q[2]),
        .I3(out_reg__0),
        .I4(Q[1]),
        .O(out_reg[0]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT5 #(
    .INIT(32'h99999998)) 
    \out_reg[1]_i_1__2 
       (.I0(net_in4),
        .I1(Q[0]),
        .I2(Q[2]),
        .I3(out_reg__0),
        .I4(Q[1]),
        .O(out_reg[1]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT5 #(
    .INIT(32'hE1E1E1E0)) 
    \out_reg[2]_i_1__5 
       (.I0(Q[0]),
        .I1(net_in4),
        .I2(Q[1]),
        .I3(out_reg__0),
        .I4(Q[2]),
        .O(out_reg[2]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT5 #(
    .INIT(32'hFE01FE00)) 
    \out_reg[3]_i_1__5 
       (.I0(Q[1]),
        .I1(net_in4),
        .I2(Q[0]),
        .I3(Q[2]),
        .I4(out_reg__0),
        .O(out_reg[3]));
  LUT5 #(
    .INIT(32'hAAAAAAA9)) 
    \out_reg[4]_i_1__0 
       (.I0(out_reg__0),
        .I1(Q[1]),
        .I2(net_in4),
        .I3(Q[0]),
        .I4(Q[2]),
        .O(out_reg[4]));
  FDCE \out_reg_reg[0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(\out_reg_reg[4]_0 ),
        .D(out_reg[0]),
        .Q(net_in4));
  FDCE \out_reg_reg[1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(\out_reg_reg[4]_0 ),
        .D(out_reg[1]),
        .Q(Q[0]));
  FDCE \out_reg_reg[2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(\out_reg_reg[4]_0 ),
        .D(out_reg[2]),
        .Q(Q[1]));
  FDCE \out_reg_reg[3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(\out_reg_reg[4]_0 ),
        .D(out_reg[3]),
        .Q(Q[2]));
  FDPE \out_reg_reg[4] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(out_reg[4]),
        .PRE(\out_reg_reg[4]_0 ),
        .Q(out_reg__0));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \stage_in_reg[0][2][0]_i_1 
       (.I0(net_in4),
        .I1(s00_axi_wdata),
        .O(D));
  LUT2 #(
    .INIT(4'h8)) 
    \stage_in_reg[0][6][0]_i_1 
       (.I0(s00_axi_wdata),
        .I1(net_in4),
        .O(\out_reg_reg[3]_0 [0]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[0][6][1]_i_1 
       (.I0(Q[0]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[0][6][3] [0]),
        .O(\out_reg_reg[3]_0 [1]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[0][6][2]_i_1 
       (.I0(Q[1]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[0][6][3] [1]),
        .O(\out_reg_reg[3]_0 [2]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[0][6][3]_i_1 
       (.I0(Q[2]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[0][6][3] [2]),
        .O(\out_reg_reg[3]_0 [3]));
endmodule

module deviceid903f_axi_lite_benes_0_0_test_counter_plus
   (D,
    Q,
    s00_axi_aresetn_0,
    \out_reg_reg[3]_0 ,
    s00_axi_wdata,
    s00_axi_aresetn,
    \stage_in_reg_reg[0][4][3] ,
    s00_axi_aclk);
  output [0:0]D;
  output [2:0]Q;
  output s00_axi_aresetn_0;
  output [3:0]\out_reg_reg[3]_0 ;
  input [0:0]s00_axi_wdata;
  input s00_axi_aresetn;
  input [2:0]\stage_in_reg_reg[0][4][3] ;
  input s00_axi_aclk;

  wire [0:0]D;
  wire [2:0]Q;
  wire [0:0]net_in0;
  wire [7:4]out_reg;
  wire \out_reg[4]_i_2_n_0 ;
  wire \out_reg[7]_i_2_n_0 ;
  wire [7:0]out_reg_0;
  wire [3:0]\out_reg_reg[3]_0 ;
  wire s00_axi_aclk;
  wire s00_axi_aresetn;
  wire s00_axi_aresetn_0;
  wire [0:0]s00_axi_wdata;
  wire [2:0]\stage_in_reg_reg[0][4][3] ;

  LUT1 #(
    .INIT(2'h1)) 
    axi_awready_i_1
       (.I0(s00_axi_aresetn),
        .O(s00_axi_aresetn_0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h0F0B)) 
    \out_reg[0]_i_1__1 
       (.I0(Q[0]),
        .I1(out_reg[4]),
        .I2(net_in0),
        .I3(\out_reg[4]_i_2_n_0 ),
        .O(out_reg_0[0]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \out_reg[1]_i_1__3 
       (.I0(net_in0),
        .I1(Q[0]),
        .O(out_reg_0[1]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \out_reg[2]_i_1__4 
       (.I0(Q[0]),
        .I1(net_in0),
        .I2(Q[1]),
        .O(out_reg_0[2]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \out_reg[3]_i_1__4 
       (.I0(Q[0]),
        .I1(net_in0),
        .I2(Q[1]),
        .I3(Q[2]),
        .O(out_reg_0[3]));
  LUT6 #(
    .INIT(64'h3CCCC8C8CCCCC8C8)) 
    \out_reg[4]_i_1 
       (.I0(\out_reg[4]_i_2_n_0 ),
        .I1(out_reg[4]),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(net_in0),
        .I5(Q[2]),
        .O(out_reg_0[4]));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \out_reg[4]_i_2 
       (.I0(Q[1]),
        .I1(out_reg[6]),
        .I2(out_reg[7]),
        .I3(out_reg[5]),
        .I4(Q[2]),
        .O(\out_reg[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \out_reg[5]_i_1 
       (.I0(Q[1]),
        .I1(net_in0),
        .I2(Q[2]),
        .I3(Q[0]),
        .I4(out_reg[4]),
        .I5(out_reg[5]),
        .O(out_reg_0[5]));
  LUT5 #(
    .INIT(32'hFF7F0080)) 
    \out_reg[6]_i_1 
       (.I0(out_reg[5]),
        .I1(out_reg[4]),
        .I2(Q[0]),
        .I3(\out_reg[7]_i_2_n_0 ),
        .I4(out_reg[6]),
        .O(out_reg_0[6]));
  LUT6 #(
    .INIT(64'hDFFFFFFF20000000)) 
    \out_reg[7]_i_1 
       (.I0(out_reg[6]),
        .I1(\out_reg[7]_i_2_n_0 ),
        .I2(Q[0]),
        .I3(out_reg[4]),
        .I4(out_reg[5]),
        .I5(out_reg[7]),
        .O(out_reg_0[7]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h7F)) 
    \out_reg[7]_i_2 
       (.I0(Q[1]),
        .I1(net_in0),
        .I2(Q[2]),
        .O(\out_reg[7]_i_2_n_0 ));
  FDCE \out_reg_reg[0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(s00_axi_aresetn_0),
        .D(out_reg_0[0]),
        .Q(net_in0));
  FDCE \out_reg_reg[1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(s00_axi_aresetn_0),
        .D(out_reg_0[1]),
        .Q(Q[0]));
  FDCE \out_reg_reg[2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(s00_axi_aresetn_0),
        .D(out_reg_0[2]),
        .Q(Q[1]));
  FDCE \out_reg_reg[3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(s00_axi_aresetn_0),
        .D(out_reg_0[3]),
        .Q(Q[2]));
  FDCE \out_reg_reg[4] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(s00_axi_aresetn_0),
        .D(out_reg_0[4]),
        .Q(out_reg[4]));
  FDCE \out_reg_reg[5] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(s00_axi_aresetn_0),
        .D(out_reg_0[5]),
        .Q(out_reg[5]));
  FDCE \out_reg_reg[6] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(s00_axi_aresetn_0),
        .D(out_reg_0[6]),
        .Q(out_reg[6]));
  FDCE \out_reg_reg[7] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .CLR(s00_axi_aresetn_0),
        .D(out_reg_0[7]),
        .Q(out_reg[7]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \stage_in_reg[0][0][0]_i_1 
       (.I0(net_in0),
        .I1(s00_axi_wdata),
        .O(D));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \stage_in_reg[0][4][0]_i_1 
       (.I0(s00_axi_wdata),
        .I1(net_in0),
        .O(\out_reg_reg[3]_0 [0]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[0][4][1]_i_1 
       (.I0(Q[0]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[0][4][3] [0]),
        .O(\out_reg_reg[3]_0 [1]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[0][4][2]_i_1 
       (.I0(Q[1]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[0][4][3] [1]),
        .O(\out_reg_reg[3]_0 [2]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \stage_in_reg[0][4][3]_i_1 
       (.I0(Q[2]),
        .I1(s00_axi_wdata),
        .I2(\stage_in_reg_reg[0][4][3] [2]),
        .O(\out_reg_reg[3]_0 [3]));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
