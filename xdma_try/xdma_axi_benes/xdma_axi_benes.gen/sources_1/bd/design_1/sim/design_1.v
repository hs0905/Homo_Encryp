//Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.2.2 (lin64) Build 3118627 Tue Feb  9 05:13:49 MST 2021
//Date        : Wed Nov 15 21:41:26 2023
//Host        : baldur running 64-bit Ubuntu 18.04.6 LTS
//Command     : generate_target design_1.bd
//Design      : design_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=8,numReposBlks=6,numNonXlnxBlks=1,numHierBlks=2,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,da_axi4_cnt=2,da_board_cnt=18,da_clkrst_cnt=4,da_xdma_cnt=2,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "design_1.hwdef" *) 
module design_1
   (clk_100MHz,
    clk_100MHz_1,
    pci_express_x1_rxn,
    pci_express_x1_rxp,
    pci_express_x1_txn,
    pci_express_x1_txp,
    pcie_perstn,
    resetn,
    resetn_0);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK_100MHZ CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK_100MHZ, CLK_DOMAIN design_1_clk_100MHz, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.000" *) input clk_100MHz;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK_100MHZ_1 CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK_100MHZ_1, CLK_DOMAIN design_1_clk_100MHz_1, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.000" *) input clk_100MHz_1;
  (* X_INTERFACE_INFO = "xilinx.com:interface:pcie_7x_mgt:1.0 pci_express_x1 rxn" *) input pci_express_x1_rxn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:pcie_7x_mgt:1.0 pci_express_x1 rxp" *) input pci_express_x1_rxp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:pcie_7x_mgt:1.0 pci_express_x1 txn" *) output pci_express_x1_txn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:pcie_7x_mgt:1.0 pci_express_x1 txp" *) output pci_express_x1_txp;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.PCIE_PERSTN RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.PCIE_PERSTN, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input pcie_perstn;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RESETN RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RESETN, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input resetn;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RESETN_0 RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RESETN_0, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input resetn_0;

  wire \^clk_100MHz_1 ;
  wire clk_100MHz_1_1;
  wire clk_wiz_1_clk_out1;
  wire clk_wiz_clk_out1;
  wire pcie_perstn_1;
  wire resetn_0_1;
  wire resetn_1;
  wire [0:0]resetn_inv_0_Res;
  wire [0:0]resetn_inv_1_Res;
  wire [31:0]xdma_0_M_AXI_LITE_ARADDR;
  wire [2:0]xdma_0_M_AXI_LITE_ARPROT;
  wire xdma_0_M_AXI_LITE_ARREADY;
  wire xdma_0_M_AXI_LITE_ARVALID;
  wire [31:0]xdma_0_M_AXI_LITE_AWADDR;
  wire [2:0]xdma_0_M_AXI_LITE_AWPROT;
  wire xdma_0_M_AXI_LITE_AWREADY;
  wire xdma_0_M_AXI_LITE_AWVALID;
  wire xdma_0_M_AXI_LITE_BREADY;
  wire [1:0]xdma_0_M_AXI_LITE_BRESP;
  wire xdma_0_M_AXI_LITE_BVALID;
  wire [31:0]xdma_0_M_AXI_LITE_RDATA;
  wire xdma_0_M_AXI_LITE_RREADY;
  wire [1:0]xdma_0_M_AXI_LITE_RRESP;
  wire xdma_0_M_AXI_LITE_RVALID;
  wire [31:0]xdma_0_M_AXI_LITE_WDATA;
  wire xdma_0_M_AXI_LITE_WREADY;
  wire [3:0]xdma_0_M_AXI_LITE_WSTRB;
  wire xdma_0_M_AXI_LITE_WVALID;
  wire xdma_0_axi_aclk;
  wire xdma_0_axi_aresetn;
  wire [31:0]xdma_0_axi_periph_M00_AXI_ARADDR;
  wire [2:0]xdma_0_axi_periph_M00_AXI_ARPROT;
  wire xdma_0_axi_periph_M00_AXI_ARREADY;
  wire xdma_0_axi_periph_M00_AXI_ARVALID;
  wire [31:0]xdma_0_axi_periph_M00_AXI_AWADDR;
  wire [2:0]xdma_0_axi_periph_M00_AXI_AWPROT;
  wire xdma_0_axi_periph_M00_AXI_AWREADY;
  wire xdma_0_axi_periph_M00_AXI_AWVALID;
  wire xdma_0_axi_periph_M00_AXI_BREADY;
  wire [1:0]xdma_0_axi_periph_M00_AXI_BRESP;
  wire xdma_0_axi_periph_M00_AXI_BVALID;
  wire [31:0]xdma_0_axi_periph_M00_AXI_RDATA;
  wire xdma_0_axi_periph_M00_AXI_RREADY;
  wire [1:0]xdma_0_axi_periph_M00_AXI_RRESP;
  wire xdma_0_axi_periph_M00_AXI_RVALID;
  wire [31:0]xdma_0_axi_periph_M00_AXI_WDATA;
  wire xdma_0_axi_periph_M00_AXI_WREADY;
  wire [3:0]xdma_0_axi_periph_M00_AXI_WSTRB;
  wire xdma_0_axi_periph_M00_AXI_WVALID;
  wire xdma_0_pcie_mgt_rxn;
  wire xdma_0_pcie_mgt_rxp;
  wire [0:0]xdma_0_pcie_mgt_txn;
  wire [0:0]xdma_0_pcie_mgt_txp;

  assign \^clk_100MHz_1  = clk_100MHz;
  assign clk_100MHz_1_1 = clk_100MHz_1;
  assign pci_express_x1_txn = xdma_0_pcie_mgt_txn;
  assign pci_express_x1_txp = xdma_0_pcie_mgt_txp;
  assign pcie_perstn_1 = pcie_perstn;
  assign resetn_0_1 = resetn_0;
  assign resetn_1 = resetn;
  assign xdma_0_pcie_mgt_rxn = pci_express_x1_rxn;
  assign xdma_0_pcie_mgt_rxp = pci_express_x1_rxp;
  design_1_Axi_lite_v1_0_0_0 Axi_lite_v1_0_0
       (.s00_axi_aclk(xdma_0_axi_aclk),
        .s00_axi_araddr(xdma_0_axi_periph_M00_AXI_ARADDR[4:0]),
        .s00_axi_aresetn(xdma_0_axi_aresetn),
        .s00_axi_arprot(xdma_0_axi_periph_M00_AXI_ARPROT),
        .s00_axi_arready(xdma_0_axi_periph_M00_AXI_ARREADY),
        .s00_axi_arvalid(xdma_0_axi_periph_M00_AXI_ARVALID),
        .s00_axi_awaddr(xdma_0_axi_periph_M00_AXI_AWADDR[4:0]),
        .s00_axi_awprot(xdma_0_axi_periph_M00_AXI_AWPROT),
        .s00_axi_awready(xdma_0_axi_periph_M00_AXI_AWREADY),
        .s00_axi_awvalid(xdma_0_axi_periph_M00_AXI_AWVALID),
        .s00_axi_bready(xdma_0_axi_periph_M00_AXI_BREADY),
        .s00_axi_bresp(xdma_0_axi_periph_M00_AXI_BRESP),
        .s00_axi_bvalid(xdma_0_axi_periph_M00_AXI_BVALID),
        .s00_axi_rdata(xdma_0_axi_periph_M00_AXI_RDATA),
        .s00_axi_rready(xdma_0_axi_periph_M00_AXI_RREADY),
        .s00_axi_rresp(xdma_0_axi_periph_M00_AXI_RRESP),
        .s00_axi_rvalid(xdma_0_axi_periph_M00_AXI_RVALID),
        .s00_axi_wdata(xdma_0_axi_periph_M00_AXI_WDATA),
        .s00_axi_wready(xdma_0_axi_periph_M00_AXI_WREADY),
        .s00_axi_wstrb(xdma_0_axi_periph_M00_AXI_WSTRB),
        .s00_axi_wvalid(xdma_0_axi_periph_M00_AXI_WVALID));
  design_1_clk_wiz_2 clk_wiz
       (.clk_in1(\^clk_100MHz_1 ),
        .clk_out1(clk_wiz_clk_out1),
        .reset(resetn_inv_0_Res));
  design_1_clk_wiz_1_1 clk_wiz_1
       (.clk_in1(clk_100MHz_1_1),
        .clk_out1(clk_wiz_1_clk_out1),
        .reset(resetn_inv_1_Res));
  design_1_resetn_inv_0_1 resetn_inv_0
       (.Op1(resetn_1),
        .Res(resetn_inv_0_Res));
  design_1_resetn_inv_1_1 resetn_inv_1
       (.Op1(resetn_0_1),
        .Res(resetn_inv_1_Res));
  design_1_xdma_0_0 xdma_0
       (.axi_aclk(xdma_0_axi_aclk),
        .axi_aresetn(xdma_0_axi_aresetn),
        .cfg_mgmt_addr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .cfg_mgmt_byte_enable({1'b0,1'b0,1'b0,1'b0}),
        .cfg_mgmt_read(1'b0),
        .cfg_mgmt_write(1'b0),
        .cfg_mgmt_write_data({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .m_axil_araddr(xdma_0_M_AXI_LITE_ARADDR),
        .m_axil_arprot(xdma_0_M_AXI_LITE_ARPROT),
        .m_axil_arready(xdma_0_M_AXI_LITE_ARREADY),
        .m_axil_arvalid(xdma_0_M_AXI_LITE_ARVALID),
        .m_axil_awaddr(xdma_0_M_AXI_LITE_AWADDR),
        .m_axil_awprot(xdma_0_M_AXI_LITE_AWPROT),
        .m_axil_awready(xdma_0_M_AXI_LITE_AWREADY),
        .m_axil_awvalid(xdma_0_M_AXI_LITE_AWVALID),
        .m_axil_bready(xdma_0_M_AXI_LITE_BREADY),
        .m_axil_bresp(xdma_0_M_AXI_LITE_BRESP),
        .m_axil_bvalid(xdma_0_M_AXI_LITE_BVALID),
        .m_axil_rdata(xdma_0_M_AXI_LITE_RDATA),
        .m_axil_rready(xdma_0_M_AXI_LITE_RREADY),
        .m_axil_rresp(xdma_0_M_AXI_LITE_RRESP),
        .m_axil_rvalid(xdma_0_M_AXI_LITE_RVALID),
        .m_axil_wdata(xdma_0_M_AXI_LITE_WDATA),
        .m_axil_wready(xdma_0_M_AXI_LITE_WREADY),
        .m_axil_wstrb(xdma_0_M_AXI_LITE_WSTRB),
        .m_axil_wvalid(xdma_0_M_AXI_LITE_WVALID),
        .m_axis_h2c_tready_0(1'b1),
        .pci_exp_rxn(xdma_0_pcie_mgt_rxn),
        .pci_exp_rxp(xdma_0_pcie_mgt_rxp),
        .pci_exp_txn(xdma_0_pcie_mgt_txn),
        .pci_exp_txp(xdma_0_pcie_mgt_txp),
        .s_axil_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axil_arprot({1'b0,1'b0,1'b0}),
        .s_axil_arvalid(1'b0),
        .s_axil_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axil_awprot({1'b0,1'b0,1'b0}),
        .s_axil_awvalid(1'b0),
        .s_axil_bready(1'b0),
        .s_axil_rready(1'b0),
        .s_axil_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axil_wstrb({1'b1,1'b1,1'b1,1'b1}),
        .s_axil_wvalid(1'b0),
        .s_axis_c2h_tdata_0({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axis_c2h_tkeep_0({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .s_axis_c2h_tlast_0(1'b0),
        .s_axis_c2h_tvalid_0(1'b0),
        .sys_clk(clk_wiz_clk_out1),
        .sys_clk_gt(clk_wiz_1_clk_out1),
        .sys_rst_n(pcie_perstn_1),
        .usr_irq_req(1'b0));
  design_1_xdma_0_axi_periph_1 xdma_0_axi_periph
       (.ACLK(xdma_0_axi_aclk),
        .ARESETN(xdma_0_axi_aresetn),
        .M00_ACLK(xdma_0_axi_aclk),
        .M00_ARESETN(xdma_0_axi_aresetn),
        .M00_AXI_araddr(xdma_0_axi_periph_M00_AXI_ARADDR),
        .M00_AXI_arprot(xdma_0_axi_periph_M00_AXI_ARPROT),
        .M00_AXI_arready(xdma_0_axi_periph_M00_AXI_ARREADY),
        .M00_AXI_arvalid(xdma_0_axi_periph_M00_AXI_ARVALID),
        .M00_AXI_awaddr(xdma_0_axi_periph_M00_AXI_AWADDR),
        .M00_AXI_awprot(xdma_0_axi_periph_M00_AXI_AWPROT),
        .M00_AXI_awready(xdma_0_axi_periph_M00_AXI_AWREADY),
        .M00_AXI_awvalid(xdma_0_axi_periph_M00_AXI_AWVALID),
        .M00_AXI_bready(xdma_0_axi_periph_M00_AXI_BREADY),
        .M00_AXI_bresp(xdma_0_axi_periph_M00_AXI_BRESP),
        .M00_AXI_bvalid(xdma_0_axi_periph_M00_AXI_BVALID),
        .M00_AXI_rdata(xdma_0_axi_periph_M00_AXI_RDATA),
        .M00_AXI_rready(xdma_0_axi_periph_M00_AXI_RREADY),
        .M00_AXI_rresp(xdma_0_axi_periph_M00_AXI_RRESP),
        .M00_AXI_rvalid(xdma_0_axi_periph_M00_AXI_RVALID),
        .M00_AXI_wdata(xdma_0_axi_periph_M00_AXI_WDATA),
        .M00_AXI_wready(xdma_0_axi_periph_M00_AXI_WREADY),
        .M00_AXI_wstrb(xdma_0_axi_periph_M00_AXI_WSTRB),
        .M00_AXI_wvalid(xdma_0_axi_periph_M00_AXI_WVALID),
        .S00_ACLK(xdma_0_axi_aclk),
        .S00_ARESETN(xdma_0_axi_aresetn),
        .S00_AXI_araddr(xdma_0_M_AXI_LITE_ARADDR),
        .S00_AXI_arprot(xdma_0_M_AXI_LITE_ARPROT),
        .S00_AXI_arready(xdma_0_M_AXI_LITE_ARREADY),
        .S00_AXI_arvalid(xdma_0_M_AXI_LITE_ARVALID),
        .S00_AXI_awaddr(xdma_0_M_AXI_LITE_AWADDR),
        .S00_AXI_awprot(xdma_0_M_AXI_LITE_AWPROT),
        .S00_AXI_awready(xdma_0_M_AXI_LITE_AWREADY),
        .S00_AXI_awvalid(xdma_0_M_AXI_LITE_AWVALID),
        .S00_AXI_bready(xdma_0_M_AXI_LITE_BREADY),
        .S00_AXI_bresp(xdma_0_M_AXI_LITE_BRESP),
        .S00_AXI_bvalid(xdma_0_M_AXI_LITE_BVALID),
        .S00_AXI_rdata(xdma_0_M_AXI_LITE_RDATA),
        .S00_AXI_rready(xdma_0_M_AXI_LITE_RREADY),
        .S00_AXI_rresp(xdma_0_M_AXI_LITE_RRESP),
        .S00_AXI_rvalid(xdma_0_M_AXI_LITE_RVALID),
        .S00_AXI_wdata(xdma_0_M_AXI_LITE_WDATA),
        .S00_AXI_wready(xdma_0_M_AXI_LITE_WREADY),
        .S00_AXI_wstrb(xdma_0_M_AXI_LITE_WSTRB),
        .S00_AXI_wvalid(xdma_0_M_AXI_LITE_WVALID));
endmodule

module design_1_xdma_0_axi_periph_1
   (ACLK,
    ARESETN,
    M00_ACLK,
    M00_ARESETN,
    M00_AXI_araddr,
    M00_AXI_arprot,
    M00_AXI_arready,
    M00_AXI_arvalid,
    M00_AXI_awaddr,
    M00_AXI_awprot,
    M00_AXI_awready,
    M00_AXI_awvalid,
    M00_AXI_bready,
    M00_AXI_bresp,
    M00_AXI_bvalid,
    M00_AXI_rdata,
    M00_AXI_rready,
    M00_AXI_rresp,
    M00_AXI_rvalid,
    M00_AXI_wdata,
    M00_AXI_wready,
    M00_AXI_wstrb,
    M00_AXI_wvalid,
    S00_ACLK,
    S00_ARESETN,
    S00_AXI_araddr,
    S00_AXI_arprot,
    S00_AXI_arready,
    S00_AXI_arvalid,
    S00_AXI_awaddr,
    S00_AXI_awprot,
    S00_AXI_awready,
    S00_AXI_awvalid,
    S00_AXI_bready,
    S00_AXI_bresp,
    S00_AXI_bvalid,
    S00_AXI_rdata,
    S00_AXI_rready,
    S00_AXI_rresp,
    S00_AXI_rvalid,
    S00_AXI_wdata,
    S00_AXI_wready,
    S00_AXI_wstrb,
    S00_AXI_wvalid);
  input ACLK;
  input ARESETN;
  input M00_ACLK;
  input M00_ARESETN;
  output [31:0]M00_AXI_araddr;
  output [2:0]M00_AXI_arprot;
  input M00_AXI_arready;
  output M00_AXI_arvalid;
  output [31:0]M00_AXI_awaddr;
  output [2:0]M00_AXI_awprot;
  input M00_AXI_awready;
  output M00_AXI_awvalid;
  output M00_AXI_bready;
  input [1:0]M00_AXI_bresp;
  input M00_AXI_bvalid;
  input [31:0]M00_AXI_rdata;
  output M00_AXI_rready;
  input [1:0]M00_AXI_rresp;
  input M00_AXI_rvalid;
  output [31:0]M00_AXI_wdata;
  input M00_AXI_wready;
  output [3:0]M00_AXI_wstrb;
  output M00_AXI_wvalid;
  input S00_ACLK;
  input S00_ARESETN;
  input [31:0]S00_AXI_araddr;
  input [2:0]S00_AXI_arprot;
  output S00_AXI_arready;
  input S00_AXI_arvalid;
  input [31:0]S00_AXI_awaddr;
  input [2:0]S00_AXI_awprot;
  output S00_AXI_awready;
  input S00_AXI_awvalid;
  input S00_AXI_bready;
  output [1:0]S00_AXI_bresp;
  output S00_AXI_bvalid;
  output [31:0]S00_AXI_rdata;
  input S00_AXI_rready;
  output [1:0]S00_AXI_rresp;
  output S00_AXI_rvalid;
  input [31:0]S00_AXI_wdata;
  output S00_AXI_wready;
  input [3:0]S00_AXI_wstrb;
  input S00_AXI_wvalid;

  wire S00_ACLK_1;
  wire S00_ARESETN_1;
  wire [31:0]s00_couplers_to_xdma_0_axi_periph_ARADDR;
  wire [2:0]s00_couplers_to_xdma_0_axi_periph_ARPROT;
  wire s00_couplers_to_xdma_0_axi_periph_ARREADY;
  wire s00_couplers_to_xdma_0_axi_periph_ARVALID;
  wire [31:0]s00_couplers_to_xdma_0_axi_periph_AWADDR;
  wire [2:0]s00_couplers_to_xdma_0_axi_periph_AWPROT;
  wire s00_couplers_to_xdma_0_axi_periph_AWREADY;
  wire s00_couplers_to_xdma_0_axi_periph_AWVALID;
  wire s00_couplers_to_xdma_0_axi_periph_BREADY;
  wire [1:0]s00_couplers_to_xdma_0_axi_periph_BRESP;
  wire s00_couplers_to_xdma_0_axi_periph_BVALID;
  wire [31:0]s00_couplers_to_xdma_0_axi_periph_RDATA;
  wire s00_couplers_to_xdma_0_axi_periph_RREADY;
  wire [1:0]s00_couplers_to_xdma_0_axi_periph_RRESP;
  wire s00_couplers_to_xdma_0_axi_periph_RVALID;
  wire [31:0]s00_couplers_to_xdma_0_axi_periph_WDATA;
  wire s00_couplers_to_xdma_0_axi_periph_WREADY;
  wire [3:0]s00_couplers_to_xdma_0_axi_periph_WSTRB;
  wire s00_couplers_to_xdma_0_axi_periph_WVALID;
  wire xdma_0_axi_periph_ACLK_net;
  wire xdma_0_axi_periph_ARESETN_net;
  wire [31:0]xdma_0_axi_periph_to_s00_couplers_ARADDR;
  wire [2:0]xdma_0_axi_periph_to_s00_couplers_ARPROT;
  wire xdma_0_axi_periph_to_s00_couplers_ARREADY;
  wire xdma_0_axi_periph_to_s00_couplers_ARVALID;
  wire [31:0]xdma_0_axi_periph_to_s00_couplers_AWADDR;
  wire [2:0]xdma_0_axi_periph_to_s00_couplers_AWPROT;
  wire xdma_0_axi_periph_to_s00_couplers_AWREADY;
  wire xdma_0_axi_periph_to_s00_couplers_AWVALID;
  wire xdma_0_axi_periph_to_s00_couplers_BREADY;
  wire [1:0]xdma_0_axi_periph_to_s00_couplers_BRESP;
  wire xdma_0_axi_periph_to_s00_couplers_BVALID;
  wire [31:0]xdma_0_axi_periph_to_s00_couplers_RDATA;
  wire xdma_0_axi_periph_to_s00_couplers_RREADY;
  wire [1:0]xdma_0_axi_periph_to_s00_couplers_RRESP;
  wire xdma_0_axi_periph_to_s00_couplers_RVALID;
  wire [31:0]xdma_0_axi_periph_to_s00_couplers_WDATA;
  wire xdma_0_axi_periph_to_s00_couplers_WREADY;
  wire [3:0]xdma_0_axi_periph_to_s00_couplers_WSTRB;
  wire xdma_0_axi_periph_to_s00_couplers_WVALID;

  assign M00_AXI_araddr[31:0] = s00_couplers_to_xdma_0_axi_periph_ARADDR;
  assign M00_AXI_arprot[2:0] = s00_couplers_to_xdma_0_axi_periph_ARPROT;
  assign M00_AXI_arvalid = s00_couplers_to_xdma_0_axi_periph_ARVALID;
  assign M00_AXI_awaddr[31:0] = s00_couplers_to_xdma_0_axi_periph_AWADDR;
  assign M00_AXI_awprot[2:0] = s00_couplers_to_xdma_0_axi_periph_AWPROT;
  assign M00_AXI_awvalid = s00_couplers_to_xdma_0_axi_periph_AWVALID;
  assign M00_AXI_bready = s00_couplers_to_xdma_0_axi_periph_BREADY;
  assign M00_AXI_rready = s00_couplers_to_xdma_0_axi_periph_RREADY;
  assign M00_AXI_wdata[31:0] = s00_couplers_to_xdma_0_axi_periph_WDATA;
  assign M00_AXI_wstrb[3:0] = s00_couplers_to_xdma_0_axi_periph_WSTRB;
  assign M00_AXI_wvalid = s00_couplers_to_xdma_0_axi_periph_WVALID;
  assign S00_ACLK_1 = S00_ACLK;
  assign S00_ARESETN_1 = S00_ARESETN;
  assign S00_AXI_arready = xdma_0_axi_periph_to_s00_couplers_ARREADY;
  assign S00_AXI_awready = xdma_0_axi_periph_to_s00_couplers_AWREADY;
  assign S00_AXI_bresp[1:0] = xdma_0_axi_periph_to_s00_couplers_BRESP;
  assign S00_AXI_bvalid = xdma_0_axi_periph_to_s00_couplers_BVALID;
  assign S00_AXI_rdata[31:0] = xdma_0_axi_periph_to_s00_couplers_RDATA;
  assign S00_AXI_rresp[1:0] = xdma_0_axi_periph_to_s00_couplers_RRESP;
  assign S00_AXI_rvalid = xdma_0_axi_periph_to_s00_couplers_RVALID;
  assign S00_AXI_wready = xdma_0_axi_periph_to_s00_couplers_WREADY;
  assign s00_couplers_to_xdma_0_axi_periph_ARREADY = M00_AXI_arready;
  assign s00_couplers_to_xdma_0_axi_periph_AWREADY = M00_AXI_awready;
  assign s00_couplers_to_xdma_0_axi_periph_BRESP = M00_AXI_bresp[1:0];
  assign s00_couplers_to_xdma_0_axi_periph_BVALID = M00_AXI_bvalid;
  assign s00_couplers_to_xdma_0_axi_periph_RDATA = M00_AXI_rdata[31:0];
  assign s00_couplers_to_xdma_0_axi_periph_RRESP = M00_AXI_rresp[1:0];
  assign s00_couplers_to_xdma_0_axi_periph_RVALID = M00_AXI_rvalid;
  assign s00_couplers_to_xdma_0_axi_periph_WREADY = M00_AXI_wready;
  assign xdma_0_axi_periph_ACLK_net = M00_ACLK;
  assign xdma_0_axi_periph_ARESETN_net = M00_ARESETN;
  assign xdma_0_axi_periph_to_s00_couplers_ARADDR = S00_AXI_araddr[31:0];
  assign xdma_0_axi_periph_to_s00_couplers_ARPROT = S00_AXI_arprot[2:0];
  assign xdma_0_axi_periph_to_s00_couplers_ARVALID = S00_AXI_arvalid;
  assign xdma_0_axi_periph_to_s00_couplers_AWADDR = S00_AXI_awaddr[31:0];
  assign xdma_0_axi_periph_to_s00_couplers_AWPROT = S00_AXI_awprot[2:0];
  assign xdma_0_axi_periph_to_s00_couplers_AWVALID = S00_AXI_awvalid;
  assign xdma_0_axi_periph_to_s00_couplers_BREADY = S00_AXI_bready;
  assign xdma_0_axi_periph_to_s00_couplers_RREADY = S00_AXI_rready;
  assign xdma_0_axi_periph_to_s00_couplers_WDATA = S00_AXI_wdata[31:0];
  assign xdma_0_axi_periph_to_s00_couplers_WSTRB = S00_AXI_wstrb[3:0];
  assign xdma_0_axi_periph_to_s00_couplers_WVALID = S00_AXI_wvalid;
  s00_couplers_imp_4M2UOV s00_couplers
       (.M_ACLK(xdma_0_axi_periph_ACLK_net),
        .M_ARESETN(xdma_0_axi_periph_ARESETN_net),
        .M_AXI_araddr(s00_couplers_to_xdma_0_axi_periph_ARADDR),
        .M_AXI_arprot(s00_couplers_to_xdma_0_axi_periph_ARPROT),
        .M_AXI_arready(s00_couplers_to_xdma_0_axi_periph_ARREADY),
        .M_AXI_arvalid(s00_couplers_to_xdma_0_axi_periph_ARVALID),
        .M_AXI_awaddr(s00_couplers_to_xdma_0_axi_periph_AWADDR),
        .M_AXI_awprot(s00_couplers_to_xdma_0_axi_periph_AWPROT),
        .M_AXI_awready(s00_couplers_to_xdma_0_axi_periph_AWREADY),
        .M_AXI_awvalid(s00_couplers_to_xdma_0_axi_periph_AWVALID),
        .M_AXI_bready(s00_couplers_to_xdma_0_axi_periph_BREADY),
        .M_AXI_bresp(s00_couplers_to_xdma_0_axi_periph_BRESP),
        .M_AXI_bvalid(s00_couplers_to_xdma_0_axi_periph_BVALID),
        .M_AXI_rdata(s00_couplers_to_xdma_0_axi_periph_RDATA),
        .M_AXI_rready(s00_couplers_to_xdma_0_axi_periph_RREADY),
        .M_AXI_rresp(s00_couplers_to_xdma_0_axi_periph_RRESP),
        .M_AXI_rvalid(s00_couplers_to_xdma_0_axi_periph_RVALID),
        .M_AXI_wdata(s00_couplers_to_xdma_0_axi_periph_WDATA),
        .M_AXI_wready(s00_couplers_to_xdma_0_axi_periph_WREADY),
        .M_AXI_wstrb(s00_couplers_to_xdma_0_axi_periph_WSTRB),
        .M_AXI_wvalid(s00_couplers_to_xdma_0_axi_periph_WVALID),
        .S_ACLK(S00_ACLK_1),
        .S_ARESETN(S00_ARESETN_1),
        .S_AXI_araddr(xdma_0_axi_periph_to_s00_couplers_ARADDR),
        .S_AXI_arprot(xdma_0_axi_periph_to_s00_couplers_ARPROT),
        .S_AXI_arready(xdma_0_axi_periph_to_s00_couplers_ARREADY),
        .S_AXI_arvalid(xdma_0_axi_periph_to_s00_couplers_ARVALID),
        .S_AXI_awaddr(xdma_0_axi_periph_to_s00_couplers_AWADDR),
        .S_AXI_awprot(xdma_0_axi_periph_to_s00_couplers_AWPROT),
        .S_AXI_awready(xdma_0_axi_periph_to_s00_couplers_AWREADY),
        .S_AXI_awvalid(xdma_0_axi_periph_to_s00_couplers_AWVALID),
        .S_AXI_bready(xdma_0_axi_periph_to_s00_couplers_BREADY),
        .S_AXI_bresp(xdma_0_axi_periph_to_s00_couplers_BRESP),
        .S_AXI_bvalid(xdma_0_axi_periph_to_s00_couplers_BVALID),
        .S_AXI_rdata(xdma_0_axi_periph_to_s00_couplers_RDATA),
        .S_AXI_rready(xdma_0_axi_periph_to_s00_couplers_RREADY),
        .S_AXI_rresp(xdma_0_axi_periph_to_s00_couplers_RRESP),
        .S_AXI_rvalid(xdma_0_axi_periph_to_s00_couplers_RVALID),
        .S_AXI_wdata(xdma_0_axi_periph_to_s00_couplers_WDATA),
        .S_AXI_wready(xdma_0_axi_periph_to_s00_couplers_WREADY),
        .S_AXI_wstrb(xdma_0_axi_periph_to_s00_couplers_WSTRB),
        .S_AXI_wvalid(xdma_0_axi_periph_to_s00_couplers_WVALID));
endmodule

module s00_couplers_imp_4M2UOV
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arprot,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awprot,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arprot,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awprot,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  output [2:0]M_AXI_arprot;
  input M_AXI_arready;
  output M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  output [2:0]M_AXI_awprot;
  input M_AXI_awready;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  input [2:0]S_AXI_arprot;
  output S_AXI_arready;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  input [2:0]S_AXI_awprot;
  output S_AXI_awready;
  input S_AXI_awvalid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire [31:0]s00_couplers_to_s00_couplers_ARADDR;
  wire [2:0]s00_couplers_to_s00_couplers_ARPROT;
  wire s00_couplers_to_s00_couplers_ARREADY;
  wire s00_couplers_to_s00_couplers_ARVALID;
  wire [31:0]s00_couplers_to_s00_couplers_AWADDR;
  wire [2:0]s00_couplers_to_s00_couplers_AWPROT;
  wire s00_couplers_to_s00_couplers_AWREADY;
  wire s00_couplers_to_s00_couplers_AWVALID;
  wire s00_couplers_to_s00_couplers_BREADY;
  wire [1:0]s00_couplers_to_s00_couplers_BRESP;
  wire s00_couplers_to_s00_couplers_BVALID;
  wire [31:0]s00_couplers_to_s00_couplers_RDATA;
  wire s00_couplers_to_s00_couplers_RREADY;
  wire [1:0]s00_couplers_to_s00_couplers_RRESP;
  wire s00_couplers_to_s00_couplers_RVALID;
  wire [31:0]s00_couplers_to_s00_couplers_WDATA;
  wire s00_couplers_to_s00_couplers_WREADY;
  wire [3:0]s00_couplers_to_s00_couplers_WSTRB;
  wire s00_couplers_to_s00_couplers_WVALID;

  assign M_AXI_araddr[31:0] = s00_couplers_to_s00_couplers_ARADDR;
  assign M_AXI_arprot[2:0] = s00_couplers_to_s00_couplers_ARPROT;
  assign M_AXI_arvalid = s00_couplers_to_s00_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = s00_couplers_to_s00_couplers_AWADDR;
  assign M_AXI_awprot[2:0] = s00_couplers_to_s00_couplers_AWPROT;
  assign M_AXI_awvalid = s00_couplers_to_s00_couplers_AWVALID;
  assign M_AXI_bready = s00_couplers_to_s00_couplers_BREADY;
  assign M_AXI_rready = s00_couplers_to_s00_couplers_RREADY;
  assign M_AXI_wdata[31:0] = s00_couplers_to_s00_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = s00_couplers_to_s00_couplers_WSTRB;
  assign M_AXI_wvalid = s00_couplers_to_s00_couplers_WVALID;
  assign S_AXI_arready = s00_couplers_to_s00_couplers_ARREADY;
  assign S_AXI_awready = s00_couplers_to_s00_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = s00_couplers_to_s00_couplers_BRESP;
  assign S_AXI_bvalid = s00_couplers_to_s00_couplers_BVALID;
  assign S_AXI_rdata[31:0] = s00_couplers_to_s00_couplers_RDATA;
  assign S_AXI_rresp[1:0] = s00_couplers_to_s00_couplers_RRESP;
  assign S_AXI_rvalid = s00_couplers_to_s00_couplers_RVALID;
  assign S_AXI_wready = s00_couplers_to_s00_couplers_WREADY;
  assign s00_couplers_to_s00_couplers_ARADDR = S_AXI_araddr[31:0];
  assign s00_couplers_to_s00_couplers_ARPROT = S_AXI_arprot[2:0];
  assign s00_couplers_to_s00_couplers_ARREADY = M_AXI_arready;
  assign s00_couplers_to_s00_couplers_ARVALID = S_AXI_arvalid;
  assign s00_couplers_to_s00_couplers_AWADDR = S_AXI_awaddr[31:0];
  assign s00_couplers_to_s00_couplers_AWPROT = S_AXI_awprot[2:0];
  assign s00_couplers_to_s00_couplers_AWREADY = M_AXI_awready;
  assign s00_couplers_to_s00_couplers_AWVALID = S_AXI_awvalid;
  assign s00_couplers_to_s00_couplers_BREADY = S_AXI_bready;
  assign s00_couplers_to_s00_couplers_BRESP = M_AXI_bresp[1:0];
  assign s00_couplers_to_s00_couplers_BVALID = M_AXI_bvalid;
  assign s00_couplers_to_s00_couplers_RDATA = M_AXI_rdata[31:0];
  assign s00_couplers_to_s00_couplers_RREADY = S_AXI_rready;
  assign s00_couplers_to_s00_couplers_RRESP = M_AXI_rresp[1:0];
  assign s00_couplers_to_s00_couplers_RVALID = M_AXI_rvalid;
  assign s00_couplers_to_s00_couplers_WDATA = S_AXI_wdata[31:0];
  assign s00_couplers_to_s00_couplers_WREADY = M_AXI_wready;
  assign s00_couplers_to_s00_couplers_WSTRB = S_AXI_wstrb[3:0];
  assign s00_couplers_to_s00_couplers_WVALID = S_AXI_wvalid;
endmodule
