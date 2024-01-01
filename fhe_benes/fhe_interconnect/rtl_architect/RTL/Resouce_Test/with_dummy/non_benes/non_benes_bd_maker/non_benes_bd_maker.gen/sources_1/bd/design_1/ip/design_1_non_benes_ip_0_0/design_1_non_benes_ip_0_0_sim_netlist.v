// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2.2 (lin64) Build 3118627 Tue Feb  9 05:13:49 MST 2021
// Date        : Thu Dec 28 14:07:36 2023
// Host        : baldur running 64-bit Ubuntu 18.04.6 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/hs/Desktop/FHE/fhe_benes/fhe_interconnect/step1/RTL/sim_resource/non_benes/non_benes_bd_maker/non_benes_bd_maker.gen/sources_1/bd/design_1/ip/design_1_non_benes_ip_0_0/design_1_non_benes_ip_0_0_sim_netlist.v
// Design      : design_1_non_benes_ip_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcu280-fsvh2892-2L-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_non_benes_ip_0_0,axi_std_interface,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "package_project" *) 
(* X_CORE_INFO = "axi_std_interface,Vivado 2020.2.2" *) 
(* NotValidForBitStream *)
module design_1_non_benes_ip_0_0
   (s00_axi_aclk,
    s00_axi_aresetn,
    s00_axi_awid,
    s00_axi_awaddr,
    s00_axi_awlen,
    s00_axi_awsize,
    s00_axi_awburst,
    s00_axi_awlock,
    s00_axi_awcache,
    s00_axi_awprot,
    s00_axi_awqos,
    s00_axi_awregion,
    s00_axi_awuser,
    s00_axi_awvalid,
    s00_axi_awready,
    s00_axi_wdata,
    s00_axi_wstrb,
    s00_axi_wlast,
    s00_axi_wuser,
    s00_axi_wvalid,
    s00_axi_wready,
    s00_axi_bid,
    s00_axi_bresp,
    s00_axi_buser,
    s00_axi_bvalid,
    s00_axi_bready,
    s00_axi_arid,
    s00_axi_araddr,
    s00_axi_arlen,
    s00_axi_arsize,
    s00_axi_arburst,
    s00_axi_arlock,
    s00_axi_arcache,
    s00_axi_arprot,
    s00_axi_arqos,
    s00_axi_arregion,
    s00_axi_aruser,
    s00_axi_arvalid,
    s00_axi_arready,
    s00_axi_rid,
    s00_axi_rdata,
    s00_axi_rresp,
    s00_axi_rlast,
    s00_axi_ruser,
    s00_axi_rvalid,
    s00_axi_rready);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 s00_axi_aclk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s00_axi_aclk, ASSOCIATED_BUSIF s00_axi, ASSOCIATED_RESET s00_axi_aresetn, FREQ_HZ 250000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN design_1_xdma_0_0_axi_aclk, INSERT_VIP 0" *) input s00_axi_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 s00_axi_aresetn RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s00_axi_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input s00_axi_aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi AWID" *) input [0:0]s00_axi_awid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi AWADDR" *) input [10:0]s00_axi_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi AWLEN" *) input [7:0]s00_axi_awlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi AWSIZE" *) input [2:0]s00_axi_awsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi AWBURST" *) input [1:0]s00_axi_awburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi AWLOCK" *) input s00_axi_awlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi AWCACHE" *) input [3:0]s00_axi_awcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi AWPROT" *) input [2:0]s00_axi_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi AWQOS" *) input [3:0]s00_axi_awqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi AWREGION" *) input [3:0]s00_axi_awregion;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi AWUSER" *) input [0:0]s00_axi_awuser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi AWVALID" *) input s00_axi_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi AWREADY" *) output s00_axi_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi WDATA" *) input [1023:0]s00_axi_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi WSTRB" *) input [127:0]s00_axi_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi WLAST" *) input s00_axi_wlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi WUSER" *) input [0:0]s00_axi_wuser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi WVALID" *) input s00_axi_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi WREADY" *) output s00_axi_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi BID" *) output [0:0]s00_axi_bid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi BRESP" *) output [1:0]s00_axi_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi BUSER" *) output [0:0]s00_axi_buser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi BVALID" *) output s00_axi_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi BREADY" *) input s00_axi_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi ARID" *) input [0:0]s00_axi_arid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi ARADDR" *) input [10:0]s00_axi_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi ARLEN" *) input [7:0]s00_axi_arlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi ARSIZE" *) input [2:0]s00_axi_arsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi ARBURST" *) input [1:0]s00_axi_arburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi ARLOCK" *) input s00_axi_arlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi ARCACHE" *) input [3:0]s00_axi_arcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi ARPROT" *) input [2:0]s00_axi_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi ARQOS" *) input [3:0]s00_axi_arqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi ARREGION" *) input [3:0]s00_axi_arregion;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi ARUSER" *) input [0:0]s00_axi_aruser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi ARVALID" *) input s00_axi_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi ARREADY" *) output s00_axi_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi RID" *) output [0:0]s00_axi_rid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi RDATA" *) output [1023:0]s00_axi_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi RRESP" *) output [1:0]s00_axi_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi RLAST" *) output s00_axi_rlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi RUSER" *) output [0:0]s00_axi_ruser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi RVALID" *) output s00_axi_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s00_axi RREADY" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s00_axi, DATA_WIDTH 1024, PROTOCOL AXI4, FREQ_HZ 250000000, ID_WIDTH 1, ADDR_WIDTH 11, AWUSER_WIDTH 1, ARUSER_WIDTH 1, WUSER_WIDTH 1, RUSER_WIDTH 1, BUSER_WIDTH 1, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 1, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 1, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 256, PHASE 0.000, CLK_DOMAIN design_1_xdma_0_0_axi_aclk, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) input s00_axi_rready;

  wire \<const0> ;
  wire s00_axi_aclk;
  wire s00_axi_aresetn;
  wire [0:0]s00_axi_arid;
  wire [7:0]s00_axi_arlen;
  wire s00_axi_arready;
  wire s00_axi_arvalid;
  wire [0:0]s00_axi_awid;
  wire s00_axi_awready;
  wire s00_axi_awvalid;
  wire s00_axi_bready;
  wire s00_axi_bvalid;
  wire s00_axi_rlast;
  wire s00_axi_rready;
  wire s00_axi_rvalid;
  wire s00_axi_wlast;
  wire s00_axi_wready;
  wire s00_axi_wvalid;

  assign s00_axi_bid[0] = s00_axi_awid;
  assign s00_axi_bresp[1] = \<const0> ;
  assign s00_axi_bresp[0] = \<const0> ;
  assign s00_axi_buser[0] = \<const0> ;
  assign s00_axi_rdata[1023] = \<const0> ;
  assign s00_axi_rdata[1022] = \<const0> ;
  assign s00_axi_rdata[1021] = \<const0> ;
  assign s00_axi_rdata[1020] = \<const0> ;
  assign s00_axi_rdata[1019] = \<const0> ;
  assign s00_axi_rdata[1018] = \<const0> ;
  assign s00_axi_rdata[1017] = \<const0> ;
  assign s00_axi_rdata[1016] = \<const0> ;
  assign s00_axi_rdata[1015] = \<const0> ;
  assign s00_axi_rdata[1014] = \<const0> ;
  assign s00_axi_rdata[1013] = \<const0> ;
  assign s00_axi_rdata[1012] = \<const0> ;
  assign s00_axi_rdata[1011] = \<const0> ;
  assign s00_axi_rdata[1010] = \<const0> ;
  assign s00_axi_rdata[1009] = \<const0> ;
  assign s00_axi_rdata[1008] = \<const0> ;
  assign s00_axi_rdata[1007] = \<const0> ;
  assign s00_axi_rdata[1006] = \<const0> ;
  assign s00_axi_rdata[1005] = \<const0> ;
  assign s00_axi_rdata[1004] = \<const0> ;
  assign s00_axi_rdata[1003] = \<const0> ;
  assign s00_axi_rdata[1002] = \<const0> ;
  assign s00_axi_rdata[1001] = \<const0> ;
  assign s00_axi_rdata[1000] = \<const0> ;
  assign s00_axi_rdata[999] = \<const0> ;
  assign s00_axi_rdata[998] = \<const0> ;
  assign s00_axi_rdata[997] = \<const0> ;
  assign s00_axi_rdata[996] = \<const0> ;
  assign s00_axi_rdata[995] = \<const0> ;
  assign s00_axi_rdata[994] = \<const0> ;
  assign s00_axi_rdata[993] = \<const0> ;
  assign s00_axi_rdata[992] = \<const0> ;
  assign s00_axi_rdata[991] = \<const0> ;
  assign s00_axi_rdata[990] = \<const0> ;
  assign s00_axi_rdata[989] = \<const0> ;
  assign s00_axi_rdata[988] = \<const0> ;
  assign s00_axi_rdata[987] = \<const0> ;
  assign s00_axi_rdata[986] = \<const0> ;
  assign s00_axi_rdata[985] = \<const0> ;
  assign s00_axi_rdata[984] = \<const0> ;
  assign s00_axi_rdata[983] = \<const0> ;
  assign s00_axi_rdata[982] = \<const0> ;
  assign s00_axi_rdata[981] = \<const0> ;
  assign s00_axi_rdata[980] = \<const0> ;
  assign s00_axi_rdata[979] = \<const0> ;
  assign s00_axi_rdata[978] = \<const0> ;
  assign s00_axi_rdata[977] = \<const0> ;
  assign s00_axi_rdata[976] = \<const0> ;
  assign s00_axi_rdata[975] = \<const0> ;
  assign s00_axi_rdata[974] = \<const0> ;
  assign s00_axi_rdata[973] = \<const0> ;
  assign s00_axi_rdata[972] = \<const0> ;
  assign s00_axi_rdata[971] = \<const0> ;
  assign s00_axi_rdata[970] = \<const0> ;
  assign s00_axi_rdata[969] = \<const0> ;
  assign s00_axi_rdata[968] = \<const0> ;
  assign s00_axi_rdata[967] = \<const0> ;
  assign s00_axi_rdata[966] = \<const0> ;
  assign s00_axi_rdata[965] = \<const0> ;
  assign s00_axi_rdata[964] = \<const0> ;
  assign s00_axi_rdata[963] = \<const0> ;
  assign s00_axi_rdata[962] = \<const0> ;
  assign s00_axi_rdata[961] = \<const0> ;
  assign s00_axi_rdata[960] = \<const0> ;
  assign s00_axi_rdata[959] = \<const0> ;
  assign s00_axi_rdata[958] = \<const0> ;
  assign s00_axi_rdata[957] = \<const0> ;
  assign s00_axi_rdata[956] = \<const0> ;
  assign s00_axi_rdata[955] = \<const0> ;
  assign s00_axi_rdata[954] = \<const0> ;
  assign s00_axi_rdata[953] = \<const0> ;
  assign s00_axi_rdata[952] = \<const0> ;
  assign s00_axi_rdata[951] = \<const0> ;
  assign s00_axi_rdata[950] = \<const0> ;
  assign s00_axi_rdata[949] = \<const0> ;
  assign s00_axi_rdata[948] = \<const0> ;
  assign s00_axi_rdata[947] = \<const0> ;
  assign s00_axi_rdata[946] = \<const0> ;
  assign s00_axi_rdata[945] = \<const0> ;
  assign s00_axi_rdata[944] = \<const0> ;
  assign s00_axi_rdata[943] = \<const0> ;
  assign s00_axi_rdata[942] = \<const0> ;
  assign s00_axi_rdata[941] = \<const0> ;
  assign s00_axi_rdata[940] = \<const0> ;
  assign s00_axi_rdata[939] = \<const0> ;
  assign s00_axi_rdata[938] = \<const0> ;
  assign s00_axi_rdata[937] = \<const0> ;
  assign s00_axi_rdata[936] = \<const0> ;
  assign s00_axi_rdata[935] = \<const0> ;
  assign s00_axi_rdata[934] = \<const0> ;
  assign s00_axi_rdata[933] = \<const0> ;
  assign s00_axi_rdata[932] = \<const0> ;
  assign s00_axi_rdata[931] = \<const0> ;
  assign s00_axi_rdata[930] = \<const0> ;
  assign s00_axi_rdata[929] = \<const0> ;
  assign s00_axi_rdata[928] = \<const0> ;
  assign s00_axi_rdata[927] = \<const0> ;
  assign s00_axi_rdata[926] = \<const0> ;
  assign s00_axi_rdata[925] = \<const0> ;
  assign s00_axi_rdata[924] = \<const0> ;
  assign s00_axi_rdata[923] = \<const0> ;
  assign s00_axi_rdata[922] = \<const0> ;
  assign s00_axi_rdata[921] = \<const0> ;
  assign s00_axi_rdata[920] = \<const0> ;
  assign s00_axi_rdata[919] = \<const0> ;
  assign s00_axi_rdata[918] = \<const0> ;
  assign s00_axi_rdata[917] = \<const0> ;
  assign s00_axi_rdata[916] = \<const0> ;
  assign s00_axi_rdata[915] = \<const0> ;
  assign s00_axi_rdata[914] = \<const0> ;
  assign s00_axi_rdata[913] = \<const0> ;
  assign s00_axi_rdata[912] = \<const0> ;
  assign s00_axi_rdata[911] = \<const0> ;
  assign s00_axi_rdata[910] = \<const0> ;
  assign s00_axi_rdata[909] = \<const0> ;
  assign s00_axi_rdata[908] = \<const0> ;
  assign s00_axi_rdata[907] = \<const0> ;
  assign s00_axi_rdata[906] = \<const0> ;
  assign s00_axi_rdata[905] = \<const0> ;
  assign s00_axi_rdata[904] = \<const0> ;
  assign s00_axi_rdata[903] = \<const0> ;
  assign s00_axi_rdata[902] = \<const0> ;
  assign s00_axi_rdata[901] = \<const0> ;
  assign s00_axi_rdata[900] = \<const0> ;
  assign s00_axi_rdata[899] = \<const0> ;
  assign s00_axi_rdata[898] = \<const0> ;
  assign s00_axi_rdata[897] = \<const0> ;
  assign s00_axi_rdata[896] = \<const0> ;
  assign s00_axi_rdata[895] = \<const0> ;
  assign s00_axi_rdata[894] = \<const0> ;
  assign s00_axi_rdata[893] = \<const0> ;
  assign s00_axi_rdata[892] = \<const0> ;
  assign s00_axi_rdata[891] = \<const0> ;
  assign s00_axi_rdata[890] = \<const0> ;
  assign s00_axi_rdata[889] = \<const0> ;
  assign s00_axi_rdata[888] = \<const0> ;
  assign s00_axi_rdata[887] = \<const0> ;
  assign s00_axi_rdata[886] = \<const0> ;
  assign s00_axi_rdata[885] = \<const0> ;
  assign s00_axi_rdata[884] = \<const0> ;
  assign s00_axi_rdata[883] = \<const0> ;
  assign s00_axi_rdata[882] = \<const0> ;
  assign s00_axi_rdata[881] = \<const0> ;
  assign s00_axi_rdata[880] = \<const0> ;
  assign s00_axi_rdata[879] = \<const0> ;
  assign s00_axi_rdata[878] = \<const0> ;
  assign s00_axi_rdata[877] = \<const0> ;
  assign s00_axi_rdata[876] = \<const0> ;
  assign s00_axi_rdata[875] = \<const0> ;
  assign s00_axi_rdata[874] = \<const0> ;
  assign s00_axi_rdata[873] = \<const0> ;
  assign s00_axi_rdata[872] = \<const0> ;
  assign s00_axi_rdata[871] = \<const0> ;
  assign s00_axi_rdata[870] = \<const0> ;
  assign s00_axi_rdata[869] = \<const0> ;
  assign s00_axi_rdata[868] = \<const0> ;
  assign s00_axi_rdata[867] = \<const0> ;
  assign s00_axi_rdata[866] = \<const0> ;
  assign s00_axi_rdata[865] = \<const0> ;
  assign s00_axi_rdata[864] = \<const0> ;
  assign s00_axi_rdata[863] = \<const0> ;
  assign s00_axi_rdata[862] = \<const0> ;
  assign s00_axi_rdata[861] = \<const0> ;
  assign s00_axi_rdata[860] = \<const0> ;
  assign s00_axi_rdata[859] = \<const0> ;
  assign s00_axi_rdata[858] = \<const0> ;
  assign s00_axi_rdata[857] = \<const0> ;
  assign s00_axi_rdata[856] = \<const0> ;
  assign s00_axi_rdata[855] = \<const0> ;
  assign s00_axi_rdata[854] = \<const0> ;
  assign s00_axi_rdata[853] = \<const0> ;
  assign s00_axi_rdata[852] = \<const0> ;
  assign s00_axi_rdata[851] = \<const0> ;
  assign s00_axi_rdata[850] = \<const0> ;
  assign s00_axi_rdata[849] = \<const0> ;
  assign s00_axi_rdata[848] = \<const0> ;
  assign s00_axi_rdata[847] = \<const0> ;
  assign s00_axi_rdata[846] = \<const0> ;
  assign s00_axi_rdata[845] = \<const0> ;
  assign s00_axi_rdata[844] = \<const0> ;
  assign s00_axi_rdata[843] = \<const0> ;
  assign s00_axi_rdata[842] = \<const0> ;
  assign s00_axi_rdata[841] = \<const0> ;
  assign s00_axi_rdata[840] = \<const0> ;
  assign s00_axi_rdata[839] = \<const0> ;
  assign s00_axi_rdata[838] = \<const0> ;
  assign s00_axi_rdata[837] = \<const0> ;
  assign s00_axi_rdata[836] = \<const0> ;
  assign s00_axi_rdata[835] = \<const0> ;
  assign s00_axi_rdata[834] = \<const0> ;
  assign s00_axi_rdata[833] = \<const0> ;
  assign s00_axi_rdata[832] = \<const0> ;
  assign s00_axi_rdata[831] = \<const0> ;
  assign s00_axi_rdata[830] = \<const0> ;
  assign s00_axi_rdata[829] = \<const0> ;
  assign s00_axi_rdata[828] = \<const0> ;
  assign s00_axi_rdata[827] = \<const0> ;
  assign s00_axi_rdata[826] = \<const0> ;
  assign s00_axi_rdata[825] = \<const0> ;
  assign s00_axi_rdata[824] = \<const0> ;
  assign s00_axi_rdata[823] = \<const0> ;
  assign s00_axi_rdata[822] = \<const0> ;
  assign s00_axi_rdata[821] = \<const0> ;
  assign s00_axi_rdata[820] = \<const0> ;
  assign s00_axi_rdata[819] = \<const0> ;
  assign s00_axi_rdata[818] = \<const0> ;
  assign s00_axi_rdata[817] = \<const0> ;
  assign s00_axi_rdata[816] = \<const0> ;
  assign s00_axi_rdata[815] = \<const0> ;
  assign s00_axi_rdata[814] = \<const0> ;
  assign s00_axi_rdata[813] = \<const0> ;
  assign s00_axi_rdata[812] = \<const0> ;
  assign s00_axi_rdata[811] = \<const0> ;
  assign s00_axi_rdata[810] = \<const0> ;
  assign s00_axi_rdata[809] = \<const0> ;
  assign s00_axi_rdata[808] = \<const0> ;
  assign s00_axi_rdata[807] = \<const0> ;
  assign s00_axi_rdata[806] = \<const0> ;
  assign s00_axi_rdata[805] = \<const0> ;
  assign s00_axi_rdata[804] = \<const0> ;
  assign s00_axi_rdata[803] = \<const0> ;
  assign s00_axi_rdata[802] = \<const0> ;
  assign s00_axi_rdata[801] = \<const0> ;
  assign s00_axi_rdata[800] = \<const0> ;
  assign s00_axi_rdata[799] = \<const0> ;
  assign s00_axi_rdata[798] = \<const0> ;
  assign s00_axi_rdata[797] = \<const0> ;
  assign s00_axi_rdata[796] = \<const0> ;
  assign s00_axi_rdata[795] = \<const0> ;
  assign s00_axi_rdata[794] = \<const0> ;
  assign s00_axi_rdata[793] = \<const0> ;
  assign s00_axi_rdata[792] = \<const0> ;
  assign s00_axi_rdata[791] = \<const0> ;
  assign s00_axi_rdata[790] = \<const0> ;
  assign s00_axi_rdata[789] = \<const0> ;
  assign s00_axi_rdata[788] = \<const0> ;
  assign s00_axi_rdata[787] = \<const0> ;
  assign s00_axi_rdata[786] = \<const0> ;
  assign s00_axi_rdata[785] = \<const0> ;
  assign s00_axi_rdata[784] = \<const0> ;
  assign s00_axi_rdata[783] = \<const0> ;
  assign s00_axi_rdata[782] = \<const0> ;
  assign s00_axi_rdata[781] = \<const0> ;
  assign s00_axi_rdata[780] = \<const0> ;
  assign s00_axi_rdata[779] = \<const0> ;
  assign s00_axi_rdata[778] = \<const0> ;
  assign s00_axi_rdata[777] = \<const0> ;
  assign s00_axi_rdata[776] = \<const0> ;
  assign s00_axi_rdata[775] = \<const0> ;
  assign s00_axi_rdata[774] = \<const0> ;
  assign s00_axi_rdata[773] = \<const0> ;
  assign s00_axi_rdata[772] = \<const0> ;
  assign s00_axi_rdata[771] = \<const0> ;
  assign s00_axi_rdata[770] = \<const0> ;
  assign s00_axi_rdata[769] = \<const0> ;
  assign s00_axi_rdata[768] = \<const0> ;
  assign s00_axi_rdata[767] = \<const0> ;
  assign s00_axi_rdata[766] = \<const0> ;
  assign s00_axi_rdata[765] = \<const0> ;
  assign s00_axi_rdata[764] = \<const0> ;
  assign s00_axi_rdata[763] = \<const0> ;
  assign s00_axi_rdata[762] = \<const0> ;
  assign s00_axi_rdata[761] = \<const0> ;
  assign s00_axi_rdata[760] = \<const0> ;
  assign s00_axi_rdata[759] = \<const0> ;
  assign s00_axi_rdata[758] = \<const0> ;
  assign s00_axi_rdata[757] = \<const0> ;
  assign s00_axi_rdata[756] = \<const0> ;
  assign s00_axi_rdata[755] = \<const0> ;
  assign s00_axi_rdata[754] = \<const0> ;
  assign s00_axi_rdata[753] = \<const0> ;
  assign s00_axi_rdata[752] = \<const0> ;
  assign s00_axi_rdata[751] = \<const0> ;
  assign s00_axi_rdata[750] = \<const0> ;
  assign s00_axi_rdata[749] = \<const0> ;
  assign s00_axi_rdata[748] = \<const0> ;
  assign s00_axi_rdata[747] = \<const0> ;
  assign s00_axi_rdata[746] = \<const0> ;
  assign s00_axi_rdata[745] = \<const0> ;
  assign s00_axi_rdata[744] = \<const0> ;
  assign s00_axi_rdata[743] = \<const0> ;
  assign s00_axi_rdata[742] = \<const0> ;
  assign s00_axi_rdata[741] = \<const0> ;
  assign s00_axi_rdata[740] = \<const0> ;
  assign s00_axi_rdata[739] = \<const0> ;
  assign s00_axi_rdata[738] = \<const0> ;
  assign s00_axi_rdata[737] = \<const0> ;
  assign s00_axi_rdata[736] = \<const0> ;
  assign s00_axi_rdata[735] = \<const0> ;
  assign s00_axi_rdata[734] = \<const0> ;
  assign s00_axi_rdata[733] = \<const0> ;
  assign s00_axi_rdata[732] = \<const0> ;
  assign s00_axi_rdata[731] = \<const0> ;
  assign s00_axi_rdata[730] = \<const0> ;
  assign s00_axi_rdata[729] = \<const0> ;
  assign s00_axi_rdata[728] = \<const0> ;
  assign s00_axi_rdata[727] = \<const0> ;
  assign s00_axi_rdata[726] = \<const0> ;
  assign s00_axi_rdata[725] = \<const0> ;
  assign s00_axi_rdata[724] = \<const0> ;
  assign s00_axi_rdata[723] = \<const0> ;
  assign s00_axi_rdata[722] = \<const0> ;
  assign s00_axi_rdata[721] = \<const0> ;
  assign s00_axi_rdata[720] = \<const0> ;
  assign s00_axi_rdata[719] = \<const0> ;
  assign s00_axi_rdata[718] = \<const0> ;
  assign s00_axi_rdata[717] = \<const0> ;
  assign s00_axi_rdata[716] = \<const0> ;
  assign s00_axi_rdata[715] = \<const0> ;
  assign s00_axi_rdata[714] = \<const0> ;
  assign s00_axi_rdata[713] = \<const0> ;
  assign s00_axi_rdata[712] = \<const0> ;
  assign s00_axi_rdata[711] = \<const0> ;
  assign s00_axi_rdata[710] = \<const0> ;
  assign s00_axi_rdata[709] = \<const0> ;
  assign s00_axi_rdata[708] = \<const0> ;
  assign s00_axi_rdata[707] = \<const0> ;
  assign s00_axi_rdata[706] = \<const0> ;
  assign s00_axi_rdata[705] = \<const0> ;
  assign s00_axi_rdata[704] = \<const0> ;
  assign s00_axi_rdata[703] = \<const0> ;
  assign s00_axi_rdata[702] = \<const0> ;
  assign s00_axi_rdata[701] = \<const0> ;
  assign s00_axi_rdata[700] = \<const0> ;
  assign s00_axi_rdata[699] = \<const0> ;
  assign s00_axi_rdata[698] = \<const0> ;
  assign s00_axi_rdata[697] = \<const0> ;
  assign s00_axi_rdata[696] = \<const0> ;
  assign s00_axi_rdata[695] = \<const0> ;
  assign s00_axi_rdata[694] = \<const0> ;
  assign s00_axi_rdata[693] = \<const0> ;
  assign s00_axi_rdata[692] = \<const0> ;
  assign s00_axi_rdata[691] = \<const0> ;
  assign s00_axi_rdata[690] = \<const0> ;
  assign s00_axi_rdata[689] = \<const0> ;
  assign s00_axi_rdata[688] = \<const0> ;
  assign s00_axi_rdata[687] = \<const0> ;
  assign s00_axi_rdata[686] = \<const0> ;
  assign s00_axi_rdata[685] = \<const0> ;
  assign s00_axi_rdata[684] = \<const0> ;
  assign s00_axi_rdata[683] = \<const0> ;
  assign s00_axi_rdata[682] = \<const0> ;
  assign s00_axi_rdata[681] = \<const0> ;
  assign s00_axi_rdata[680] = \<const0> ;
  assign s00_axi_rdata[679] = \<const0> ;
  assign s00_axi_rdata[678] = \<const0> ;
  assign s00_axi_rdata[677] = \<const0> ;
  assign s00_axi_rdata[676] = \<const0> ;
  assign s00_axi_rdata[675] = \<const0> ;
  assign s00_axi_rdata[674] = \<const0> ;
  assign s00_axi_rdata[673] = \<const0> ;
  assign s00_axi_rdata[672] = \<const0> ;
  assign s00_axi_rdata[671] = \<const0> ;
  assign s00_axi_rdata[670] = \<const0> ;
  assign s00_axi_rdata[669] = \<const0> ;
  assign s00_axi_rdata[668] = \<const0> ;
  assign s00_axi_rdata[667] = \<const0> ;
  assign s00_axi_rdata[666] = \<const0> ;
  assign s00_axi_rdata[665] = \<const0> ;
  assign s00_axi_rdata[664] = \<const0> ;
  assign s00_axi_rdata[663] = \<const0> ;
  assign s00_axi_rdata[662] = \<const0> ;
  assign s00_axi_rdata[661] = \<const0> ;
  assign s00_axi_rdata[660] = \<const0> ;
  assign s00_axi_rdata[659] = \<const0> ;
  assign s00_axi_rdata[658] = \<const0> ;
  assign s00_axi_rdata[657] = \<const0> ;
  assign s00_axi_rdata[656] = \<const0> ;
  assign s00_axi_rdata[655] = \<const0> ;
  assign s00_axi_rdata[654] = \<const0> ;
  assign s00_axi_rdata[653] = \<const0> ;
  assign s00_axi_rdata[652] = \<const0> ;
  assign s00_axi_rdata[651] = \<const0> ;
  assign s00_axi_rdata[650] = \<const0> ;
  assign s00_axi_rdata[649] = \<const0> ;
  assign s00_axi_rdata[648] = \<const0> ;
  assign s00_axi_rdata[647] = \<const0> ;
  assign s00_axi_rdata[646] = \<const0> ;
  assign s00_axi_rdata[645] = \<const0> ;
  assign s00_axi_rdata[644] = \<const0> ;
  assign s00_axi_rdata[643] = \<const0> ;
  assign s00_axi_rdata[642] = \<const0> ;
  assign s00_axi_rdata[641] = \<const0> ;
  assign s00_axi_rdata[640] = \<const0> ;
  assign s00_axi_rdata[639] = \<const0> ;
  assign s00_axi_rdata[638] = \<const0> ;
  assign s00_axi_rdata[637] = \<const0> ;
  assign s00_axi_rdata[636] = \<const0> ;
  assign s00_axi_rdata[635] = \<const0> ;
  assign s00_axi_rdata[634] = \<const0> ;
  assign s00_axi_rdata[633] = \<const0> ;
  assign s00_axi_rdata[632] = \<const0> ;
  assign s00_axi_rdata[631] = \<const0> ;
  assign s00_axi_rdata[630] = \<const0> ;
  assign s00_axi_rdata[629] = \<const0> ;
  assign s00_axi_rdata[628] = \<const0> ;
  assign s00_axi_rdata[627] = \<const0> ;
  assign s00_axi_rdata[626] = \<const0> ;
  assign s00_axi_rdata[625] = \<const0> ;
  assign s00_axi_rdata[624] = \<const0> ;
  assign s00_axi_rdata[623] = \<const0> ;
  assign s00_axi_rdata[622] = \<const0> ;
  assign s00_axi_rdata[621] = \<const0> ;
  assign s00_axi_rdata[620] = \<const0> ;
  assign s00_axi_rdata[619] = \<const0> ;
  assign s00_axi_rdata[618] = \<const0> ;
  assign s00_axi_rdata[617] = \<const0> ;
  assign s00_axi_rdata[616] = \<const0> ;
  assign s00_axi_rdata[615] = \<const0> ;
  assign s00_axi_rdata[614] = \<const0> ;
  assign s00_axi_rdata[613] = \<const0> ;
  assign s00_axi_rdata[612] = \<const0> ;
  assign s00_axi_rdata[611] = \<const0> ;
  assign s00_axi_rdata[610] = \<const0> ;
  assign s00_axi_rdata[609] = \<const0> ;
  assign s00_axi_rdata[608] = \<const0> ;
  assign s00_axi_rdata[607] = \<const0> ;
  assign s00_axi_rdata[606] = \<const0> ;
  assign s00_axi_rdata[605] = \<const0> ;
  assign s00_axi_rdata[604] = \<const0> ;
  assign s00_axi_rdata[603] = \<const0> ;
  assign s00_axi_rdata[602] = \<const0> ;
  assign s00_axi_rdata[601] = \<const0> ;
  assign s00_axi_rdata[600] = \<const0> ;
  assign s00_axi_rdata[599] = \<const0> ;
  assign s00_axi_rdata[598] = \<const0> ;
  assign s00_axi_rdata[597] = \<const0> ;
  assign s00_axi_rdata[596] = \<const0> ;
  assign s00_axi_rdata[595] = \<const0> ;
  assign s00_axi_rdata[594] = \<const0> ;
  assign s00_axi_rdata[593] = \<const0> ;
  assign s00_axi_rdata[592] = \<const0> ;
  assign s00_axi_rdata[591] = \<const0> ;
  assign s00_axi_rdata[590] = \<const0> ;
  assign s00_axi_rdata[589] = \<const0> ;
  assign s00_axi_rdata[588] = \<const0> ;
  assign s00_axi_rdata[587] = \<const0> ;
  assign s00_axi_rdata[586] = \<const0> ;
  assign s00_axi_rdata[585] = \<const0> ;
  assign s00_axi_rdata[584] = \<const0> ;
  assign s00_axi_rdata[583] = \<const0> ;
  assign s00_axi_rdata[582] = \<const0> ;
  assign s00_axi_rdata[581] = \<const0> ;
  assign s00_axi_rdata[580] = \<const0> ;
  assign s00_axi_rdata[579] = \<const0> ;
  assign s00_axi_rdata[578] = \<const0> ;
  assign s00_axi_rdata[577] = \<const0> ;
  assign s00_axi_rdata[576] = \<const0> ;
  assign s00_axi_rdata[575] = \<const0> ;
  assign s00_axi_rdata[574] = \<const0> ;
  assign s00_axi_rdata[573] = \<const0> ;
  assign s00_axi_rdata[572] = \<const0> ;
  assign s00_axi_rdata[571] = \<const0> ;
  assign s00_axi_rdata[570] = \<const0> ;
  assign s00_axi_rdata[569] = \<const0> ;
  assign s00_axi_rdata[568] = \<const0> ;
  assign s00_axi_rdata[567] = \<const0> ;
  assign s00_axi_rdata[566] = \<const0> ;
  assign s00_axi_rdata[565] = \<const0> ;
  assign s00_axi_rdata[564] = \<const0> ;
  assign s00_axi_rdata[563] = \<const0> ;
  assign s00_axi_rdata[562] = \<const0> ;
  assign s00_axi_rdata[561] = \<const0> ;
  assign s00_axi_rdata[560] = \<const0> ;
  assign s00_axi_rdata[559] = \<const0> ;
  assign s00_axi_rdata[558] = \<const0> ;
  assign s00_axi_rdata[557] = \<const0> ;
  assign s00_axi_rdata[556] = \<const0> ;
  assign s00_axi_rdata[555] = \<const0> ;
  assign s00_axi_rdata[554] = \<const0> ;
  assign s00_axi_rdata[553] = \<const0> ;
  assign s00_axi_rdata[552] = \<const0> ;
  assign s00_axi_rdata[551] = \<const0> ;
  assign s00_axi_rdata[550] = \<const0> ;
  assign s00_axi_rdata[549] = \<const0> ;
  assign s00_axi_rdata[548] = \<const0> ;
  assign s00_axi_rdata[547] = \<const0> ;
  assign s00_axi_rdata[546] = \<const0> ;
  assign s00_axi_rdata[545] = \<const0> ;
  assign s00_axi_rdata[544] = \<const0> ;
  assign s00_axi_rdata[543] = \<const0> ;
  assign s00_axi_rdata[542] = \<const0> ;
  assign s00_axi_rdata[541] = \<const0> ;
  assign s00_axi_rdata[540] = \<const0> ;
  assign s00_axi_rdata[539] = \<const0> ;
  assign s00_axi_rdata[538] = \<const0> ;
  assign s00_axi_rdata[537] = \<const0> ;
  assign s00_axi_rdata[536] = \<const0> ;
  assign s00_axi_rdata[535] = \<const0> ;
  assign s00_axi_rdata[534] = \<const0> ;
  assign s00_axi_rdata[533] = \<const0> ;
  assign s00_axi_rdata[532] = \<const0> ;
  assign s00_axi_rdata[531] = \<const0> ;
  assign s00_axi_rdata[530] = \<const0> ;
  assign s00_axi_rdata[529] = \<const0> ;
  assign s00_axi_rdata[528] = \<const0> ;
  assign s00_axi_rdata[527] = \<const0> ;
  assign s00_axi_rdata[526] = \<const0> ;
  assign s00_axi_rdata[525] = \<const0> ;
  assign s00_axi_rdata[524] = \<const0> ;
  assign s00_axi_rdata[523] = \<const0> ;
  assign s00_axi_rdata[522] = \<const0> ;
  assign s00_axi_rdata[521] = \<const0> ;
  assign s00_axi_rdata[520] = \<const0> ;
  assign s00_axi_rdata[519] = \<const0> ;
  assign s00_axi_rdata[518] = \<const0> ;
  assign s00_axi_rdata[517] = \<const0> ;
  assign s00_axi_rdata[516] = \<const0> ;
  assign s00_axi_rdata[515] = \<const0> ;
  assign s00_axi_rdata[514] = \<const0> ;
  assign s00_axi_rdata[513] = \<const0> ;
  assign s00_axi_rdata[512] = \<const0> ;
  assign s00_axi_rdata[511] = \<const0> ;
  assign s00_axi_rdata[510] = \<const0> ;
  assign s00_axi_rdata[509] = \<const0> ;
  assign s00_axi_rdata[508] = \<const0> ;
  assign s00_axi_rdata[507] = \<const0> ;
  assign s00_axi_rdata[506] = \<const0> ;
  assign s00_axi_rdata[505] = \<const0> ;
  assign s00_axi_rdata[504] = \<const0> ;
  assign s00_axi_rdata[503] = \<const0> ;
  assign s00_axi_rdata[502] = \<const0> ;
  assign s00_axi_rdata[501] = \<const0> ;
  assign s00_axi_rdata[500] = \<const0> ;
  assign s00_axi_rdata[499] = \<const0> ;
  assign s00_axi_rdata[498] = \<const0> ;
  assign s00_axi_rdata[497] = \<const0> ;
  assign s00_axi_rdata[496] = \<const0> ;
  assign s00_axi_rdata[495] = \<const0> ;
  assign s00_axi_rdata[494] = \<const0> ;
  assign s00_axi_rdata[493] = \<const0> ;
  assign s00_axi_rdata[492] = \<const0> ;
  assign s00_axi_rdata[491] = \<const0> ;
  assign s00_axi_rdata[490] = \<const0> ;
  assign s00_axi_rdata[489] = \<const0> ;
  assign s00_axi_rdata[488] = \<const0> ;
  assign s00_axi_rdata[487] = \<const0> ;
  assign s00_axi_rdata[486] = \<const0> ;
  assign s00_axi_rdata[485] = \<const0> ;
  assign s00_axi_rdata[484] = \<const0> ;
  assign s00_axi_rdata[483] = \<const0> ;
  assign s00_axi_rdata[482] = \<const0> ;
  assign s00_axi_rdata[481] = \<const0> ;
  assign s00_axi_rdata[480] = \<const0> ;
  assign s00_axi_rdata[479] = \<const0> ;
  assign s00_axi_rdata[478] = \<const0> ;
  assign s00_axi_rdata[477] = \<const0> ;
  assign s00_axi_rdata[476] = \<const0> ;
  assign s00_axi_rdata[475] = \<const0> ;
  assign s00_axi_rdata[474] = \<const0> ;
  assign s00_axi_rdata[473] = \<const0> ;
  assign s00_axi_rdata[472] = \<const0> ;
  assign s00_axi_rdata[471] = \<const0> ;
  assign s00_axi_rdata[470] = \<const0> ;
  assign s00_axi_rdata[469] = \<const0> ;
  assign s00_axi_rdata[468] = \<const0> ;
  assign s00_axi_rdata[467] = \<const0> ;
  assign s00_axi_rdata[466] = \<const0> ;
  assign s00_axi_rdata[465] = \<const0> ;
  assign s00_axi_rdata[464] = \<const0> ;
  assign s00_axi_rdata[463] = \<const0> ;
  assign s00_axi_rdata[462] = \<const0> ;
  assign s00_axi_rdata[461] = \<const0> ;
  assign s00_axi_rdata[460] = \<const0> ;
  assign s00_axi_rdata[459] = \<const0> ;
  assign s00_axi_rdata[458] = \<const0> ;
  assign s00_axi_rdata[457] = \<const0> ;
  assign s00_axi_rdata[456] = \<const0> ;
  assign s00_axi_rdata[455] = \<const0> ;
  assign s00_axi_rdata[454] = \<const0> ;
  assign s00_axi_rdata[453] = \<const0> ;
  assign s00_axi_rdata[452] = \<const0> ;
  assign s00_axi_rdata[451] = \<const0> ;
  assign s00_axi_rdata[450] = \<const0> ;
  assign s00_axi_rdata[449] = \<const0> ;
  assign s00_axi_rdata[448] = \<const0> ;
  assign s00_axi_rdata[447] = \<const0> ;
  assign s00_axi_rdata[446] = \<const0> ;
  assign s00_axi_rdata[445] = \<const0> ;
  assign s00_axi_rdata[444] = \<const0> ;
  assign s00_axi_rdata[443] = \<const0> ;
  assign s00_axi_rdata[442] = \<const0> ;
  assign s00_axi_rdata[441] = \<const0> ;
  assign s00_axi_rdata[440] = \<const0> ;
  assign s00_axi_rdata[439] = \<const0> ;
  assign s00_axi_rdata[438] = \<const0> ;
  assign s00_axi_rdata[437] = \<const0> ;
  assign s00_axi_rdata[436] = \<const0> ;
  assign s00_axi_rdata[435] = \<const0> ;
  assign s00_axi_rdata[434] = \<const0> ;
  assign s00_axi_rdata[433] = \<const0> ;
  assign s00_axi_rdata[432] = \<const0> ;
  assign s00_axi_rdata[431] = \<const0> ;
  assign s00_axi_rdata[430] = \<const0> ;
  assign s00_axi_rdata[429] = \<const0> ;
  assign s00_axi_rdata[428] = \<const0> ;
  assign s00_axi_rdata[427] = \<const0> ;
  assign s00_axi_rdata[426] = \<const0> ;
  assign s00_axi_rdata[425] = \<const0> ;
  assign s00_axi_rdata[424] = \<const0> ;
  assign s00_axi_rdata[423] = \<const0> ;
  assign s00_axi_rdata[422] = \<const0> ;
  assign s00_axi_rdata[421] = \<const0> ;
  assign s00_axi_rdata[420] = \<const0> ;
  assign s00_axi_rdata[419] = \<const0> ;
  assign s00_axi_rdata[418] = \<const0> ;
  assign s00_axi_rdata[417] = \<const0> ;
  assign s00_axi_rdata[416] = \<const0> ;
  assign s00_axi_rdata[415] = \<const0> ;
  assign s00_axi_rdata[414] = \<const0> ;
  assign s00_axi_rdata[413] = \<const0> ;
  assign s00_axi_rdata[412] = \<const0> ;
  assign s00_axi_rdata[411] = \<const0> ;
  assign s00_axi_rdata[410] = \<const0> ;
  assign s00_axi_rdata[409] = \<const0> ;
  assign s00_axi_rdata[408] = \<const0> ;
  assign s00_axi_rdata[407] = \<const0> ;
  assign s00_axi_rdata[406] = \<const0> ;
  assign s00_axi_rdata[405] = \<const0> ;
  assign s00_axi_rdata[404] = \<const0> ;
  assign s00_axi_rdata[403] = \<const0> ;
  assign s00_axi_rdata[402] = \<const0> ;
  assign s00_axi_rdata[401] = \<const0> ;
  assign s00_axi_rdata[400] = \<const0> ;
  assign s00_axi_rdata[399] = \<const0> ;
  assign s00_axi_rdata[398] = \<const0> ;
  assign s00_axi_rdata[397] = \<const0> ;
  assign s00_axi_rdata[396] = \<const0> ;
  assign s00_axi_rdata[395] = \<const0> ;
  assign s00_axi_rdata[394] = \<const0> ;
  assign s00_axi_rdata[393] = \<const0> ;
  assign s00_axi_rdata[392] = \<const0> ;
  assign s00_axi_rdata[391] = \<const0> ;
  assign s00_axi_rdata[390] = \<const0> ;
  assign s00_axi_rdata[389] = \<const0> ;
  assign s00_axi_rdata[388] = \<const0> ;
  assign s00_axi_rdata[387] = \<const0> ;
  assign s00_axi_rdata[386] = \<const0> ;
  assign s00_axi_rdata[385] = \<const0> ;
  assign s00_axi_rdata[384] = \<const0> ;
  assign s00_axi_rdata[383] = \<const0> ;
  assign s00_axi_rdata[382] = \<const0> ;
  assign s00_axi_rdata[381] = \<const0> ;
  assign s00_axi_rdata[380] = \<const0> ;
  assign s00_axi_rdata[379] = \<const0> ;
  assign s00_axi_rdata[378] = \<const0> ;
  assign s00_axi_rdata[377] = \<const0> ;
  assign s00_axi_rdata[376] = \<const0> ;
  assign s00_axi_rdata[375] = \<const0> ;
  assign s00_axi_rdata[374] = \<const0> ;
  assign s00_axi_rdata[373] = \<const0> ;
  assign s00_axi_rdata[372] = \<const0> ;
  assign s00_axi_rdata[371] = \<const0> ;
  assign s00_axi_rdata[370] = \<const0> ;
  assign s00_axi_rdata[369] = \<const0> ;
  assign s00_axi_rdata[368] = \<const0> ;
  assign s00_axi_rdata[367] = \<const0> ;
  assign s00_axi_rdata[366] = \<const0> ;
  assign s00_axi_rdata[365] = \<const0> ;
  assign s00_axi_rdata[364] = \<const0> ;
  assign s00_axi_rdata[363] = \<const0> ;
  assign s00_axi_rdata[362] = \<const0> ;
  assign s00_axi_rdata[361] = \<const0> ;
  assign s00_axi_rdata[360] = \<const0> ;
  assign s00_axi_rdata[359] = \<const0> ;
  assign s00_axi_rdata[358] = \<const0> ;
  assign s00_axi_rdata[357] = \<const0> ;
  assign s00_axi_rdata[356] = \<const0> ;
  assign s00_axi_rdata[355] = \<const0> ;
  assign s00_axi_rdata[354] = \<const0> ;
  assign s00_axi_rdata[353] = \<const0> ;
  assign s00_axi_rdata[352] = \<const0> ;
  assign s00_axi_rdata[351] = \<const0> ;
  assign s00_axi_rdata[350] = \<const0> ;
  assign s00_axi_rdata[349] = \<const0> ;
  assign s00_axi_rdata[348] = \<const0> ;
  assign s00_axi_rdata[347] = \<const0> ;
  assign s00_axi_rdata[346] = \<const0> ;
  assign s00_axi_rdata[345] = \<const0> ;
  assign s00_axi_rdata[344] = \<const0> ;
  assign s00_axi_rdata[343] = \<const0> ;
  assign s00_axi_rdata[342] = \<const0> ;
  assign s00_axi_rdata[341] = \<const0> ;
  assign s00_axi_rdata[340] = \<const0> ;
  assign s00_axi_rdata[339] = \<const0> ;
  assign s00_axi_rdata[338] = \<const0> ;
  assign s00_axi_rdata[337] = \<const0> ;
  assign s00_axi_rdata[336] = \<const0> ;
  assign s00_axi_rdata[335] = \<const0> ;
  assign s00_axi_rdata[334] = \<const0> ;
  assign s00_axi_rdata[333] = \<const0> ;
  assign s00_axi_rdata[332] = \<const0> ;
  assign s00_axi_rdata[331] = \<const0> ;
  assign s00_axi_rdata[330] = \<const0> ;
  assign s00_axi_rdata[329] = \<const0> ;
  assign s00_axi_rdata[328] = \<const0> ;
  assign s00_axi_rdata[327] = \<const0> ;
  assign s00_axi_rdata[326] = \<const0> ;
  assign s00_axi_rdata[325] = \<const0> ;
  assign s00_axi_rdata[324] = \<const0> ;
  assign s00_axi_rdata[323] = \<const0> ;
  assign s00_axi_rdata[322] = \<const0> ;
  assign s00_axi_rdata[321] = \<const0> ;
  assign s00_axi_rdata[320] = \<const0> ;
  assign s00_axi_rdata[319] = \<const0> ;
  assign s00_axi_rdata[318] = \<const0> ;
  assign s00_axi_rdata[317] = \<const0> ;
  assign s00_axi_rdata[316] = \<const0> ;
  assign s00_axi_rdata[315] = \<const0> ;
  assign s00_axi_rdata[314] = \<const0> ;
  assign s00_axi_rdata[313] = \<const0> ;
  assign s00_axi_rdata[312] = \<const0> ;
  assign s00_axi_rdata[311] = \<const0> ;
  assign s00_axi_rdata[310] = \<const0> ;
  assign s00_axi_rdata[309] = \<const0> ;
  assign s00_axi_rdata[308] = \<const0> ;
  assign s00_axi_rdata[307] = \<const0> ;
  assign s00_axi_rdata[306] = \<const0> ;
  assign s00_axi_rdata[305] = \<const0> ;
  assign s00_axi_rdata[304] = \<const0> ;
  assign s00_axi_rdata[303] = \<const0> ;
  assign s00_axi_rdata[302] = \<const0> ;
  assign s00_axi_rdata[301] = \<const0> ;
  assign s00_axi_rdata[300] = \<const0> ;
  assign s00_axi_rdata[299] = \<const0> ;
  assign s00_axi_rdata[298] = \<const0> ;
  assign s00_axi_rdata[297] = \<const0> ;
  assign s00_axi_rdata[296] = \<const0> ;
  assign s00_axi_rdata[295] = \<const0> ;
  assign s00_axi_rdata[294] = \<const0> ;
  assign s00_axi_rdata[293] = \<const0> ;
  assign s00_axi_rdata[292] = \<const0> ;
  assign s00_axi_rdata[291] = \<const0> ;
  assign s00_axi_rdata[290] = \<const0> ;
  assign s00_axi_rdata[289] = \<const0> ;
  assign s00_axi_rdata[288] = \<const0> ;
  assign s00_axi_rdata[287] = \<const0> ;
  assign s00_axi_rdata[286] = \<const0> ;
  assign s00_axi_rdata[285] = \<const0> ;
  assign s00_axi_rdata[284] = \<const0> ;
  assign s00_axi_rdata[283] = \<const0> ;
  assign s00_axi_rdata[282] = \<const0> ;
  assign s00_axi_rdata[281] = \<const0> ;
  assign s00_axi_rdata[280] = \<const0> ;
  assign s00_axi_rdata[279] = \<const0> ;
  assign s00_axi_rdata[278] = \<const0> ;
  assign s00_axi_rdata[277] = \<const0> ;
  assign s00_axi_rdata[276] = \<const0> ;
  assign s00_axi_rdata[275] = \<const0> ;
  assign s00_axi_rdata[274] = \<const0> ;
  assign s00_axi_rdata[273] = \<const0> ;
  assign s00_axi_rdata[272] = \<const0> ;
  assign s00_axi_rdata[271] = \<const0> ;
  assign s00_axi_rdata[270] = \<const0> ;
  assign s00_axi_rdata[269] = \<const0> ;
  assign s00_axi_rdata[268] = \<const0> ;
  assign s00_axi_rdata[267] = \<const0> ;
  assign s00_axi_rdata[266] = \<const0> ;
  assign s00_axi_rdata[265] = \<const0> ;
  assign s00_axi_rdata[264] = \<const0> ;
  assign s00_axi_rdata[263] = \<const0> ;
  assign s00_axi_rdata[262] = \<const0> ;
  assign s00_axi_rdata[261] = \<const0> ;
  assign s00_axi_rdata[260] = \<const0> ;
  assign s00_axi_rdata[259] = \<const0> ;
  assign s00_axi_rdata[258] = \<const0> ;
  assign s00_axi_rdata[257] = \<const0> ;
  assign s00_axi_rdata[256] = \<const0> ;
  assign s00_axi_rdata[255] = \<const0> ;
  assign s00_axi_rdata[254] = \<const0> ;
  assign s00_axi_rdata[253] = \<const0> ;
  assign s00_axi_rdata[252] = \<const0> ;
  assign s00_axi_rdata[251] = \<const0> ;
  assign s00_axi_rdata[250] = \<const0> ;
  assign s00_axi_rdata[249] = \<const0> ;
  assign s00_axi_rdata[248] = \<const0> ;
  assign s00_axi_rdata[247] = \<const0> ;
  assign s00_axi_rdata[246] = \<const0> ;
  assign s00_axi_rdata[245] = \<const0> ;
  assign s00_axi_rdata[244] = \<const0> ;
  assign s00_axi_rdata[243] = \<const0> ;
  assign s00_axi_rdata[242] = \<const0> ;
  assign s00_axi_rdata[241] = \<const0> ;
  assign s00_axi_rdata[240] = \<const0> ;
  assign s00_axi_rdata[239] = \<const0> ;
  assign s00_axi_rdata[238] = \<const0> ;
  assign s00_axi_rdata[237] = \<const0> ;
  assign s00_axi_rdata[236] = \<const0> ;
  assign s00_axi_rdata[235] = \<const0> ;
  assign s00_axi_rdata[234] = \<const0> ;
  assign s00_axi_rdata[233] = \<const0> ;
  assign s00_axi_rdata[232] = \<const0> ;
  assign s00_axi_rdata[231] = \<const0> ;
  assign s00_axi_rdata[230] = \<const0> ;
  assign s00_axi_rdata[229] = \<const0> ;
  assign s00_axi_rdata[228] = \<const0> ;
  assign s00_axi_rdata[227] = \<const0> ;
  assign s00_axi_rdata[226] = \<const0> ;
  assign s00_axi_rdata[225] = \<const0> ;
  assign s00_axi_rdata[224] = \<const0> ;
  assign s00_axi_rdata[223] = \<const0> ;
  assign s00_axi_rdata[222] = \<const0> ;
  assign s00_axi_rdata[221] = \<const0> ;
  assign s00_axi_rdata[220] = \<const0> ;
  assign s00_axi_rdata[219] = \<const0> ;
  assign s00_axi_rdata[218] = \<const0> ;
  assign s00_axi_rdata[217] = \<const0> ;
  assign s00_axi_rdata[216] = \<const0> ;
  assign s00_axi_rdata[215] = \<const0> ;
  assign s00_axi_rdata[214] = \<const0> ;
  assign s00_axi_rdata[213] = \<const0> ;
  assign s00_axi_rdata[212] = \<const0> ;
  assign s00_axi_rdata[211] = \<const0> ;
  assign s00_axi_rdata[210] = \<const0> ;
  assign s00_axi_rdata[209] = \<const0> ;
  assign s00_axi_rdata[208] = \<const0> ;
  assign s00_axi_rdata[207] = \<const0> ;
  assign s00_axi_rdata[206] = \<const0> ;
  assign s00_axi_rdata[205] = \<const0> ;
  assign s00_axi_rdata[204] = \<const0> ;
  assign s00_axi_rdata[203] = \<const0> ;
  assign s00_axi_rdata[202] = \<const0> ;
  assign s00_axi_rdata[201] = \<const0> ;
  assign s00_axi_rdata[200] = \<const0> ;
  assign s00_axi_rdata[199] = \<const0> ;
  assign s00_axi_rdata[198] = \<const0> ;
  assign s00_axi_rdata[197] = \<const0> ;
  assign s00_axi_rdata[196] = \<const0> ;
  assign s00_axi_rdata[195] = \<const0> ;
  assign s00_axi_rdata[194] = \<const0> ;
  assign s00_axi_rdata[193] = \<const0> ;
  assign s00_axi_rdata[192] = \<const0> ;
  assign s00_axi_rdata[191] = \<const0> ;
  assign s00_axi_rdata[190] = \<const0> ;
  assign s00_axi_rdata[189] = \<const0> ;
  assign s00_axi_rdata[188] = \<const0> ;
  assign s00_axi_rdata[187] = \<const0> ;
  assign s00_axi_rdata[186] = \<const0> ;
  assign s00_axi_rdata[185] = \<const0> ;
  assign s00_axi_rdata[184] = \<const0> ;
  assign s00_axi_rdata[183] = \<const0> ;
  assign s00_axi_rdata[182] = \<const0> ;
  assign s00_axi_rdata[181] = \<const0> ;
  assign s00_axi_rdata[180] = \<const0> ;
  assign s00_axi_rdata[179] = \<const0> ;
  assign s00_axi_rdata[178] = \<const0> ;
  assign s00_axi_rdata[177] = \<const0> ;
  assign s00_axi_rdata[176] = \<const0> ;
  assign s00_axi_rdata[175] = \<const0> ;
  assign s00_axi_rdata[174] = \<const0> ;
  assign s00_axi_rdata[173] = \<const0> ;
  assign s00_axi_rdata[172] = \<const0> ;
  assign s00_axi_rdata[171] = \<const0> ;
  assign s00_axi_rdata[170] = \<const0> ;
  assign s00_axi_rdata[169] = \<const0> ;
  assign s00_axi_rdata[168] = \<const0> ;
  assign s00_axi_rdata[167] = \<const0> ;
  assign s00_axi_rdata[166] = \<const0> ;
  assign s00_axi_rdata[165] = \<const0> ;
  assign s00_axi_rdata[164] = \<const0> ;
  assign s00_axi_rdata[163] = \<const0> ;
  assign s00_axi_rdata[162] = \<const0> ;
  assign s00_axi_rdata[161] = \<const0> ;
  assign s00_axi_rdata[160] = \<const0> ;
  assign s00_axi_rdata[159] = \<const0> ;
  assign s00_axi_rdata[158] = \<const0> ;
  assign s00_axi_rdata[157] = \<const0> ;
  assign s00_axi_rdata[156] = \<const0> ;
  assign s00_axi_rdata[155] = \<const0> ;
  assign s00_axi_rdata[154] = \<const0> ;
  assign s00_axi_rdata[153] = \<const0> ;
  assign s00_axi_rdata[152] = \<const0> ;
  assign s00_axi_rdata[151] = \<const0> ;
  assign s00_axi_rdata[150] = \<const0> ;
  assign s00_axi_rdata[149] = \<const0> ;
  assign s00_axi_rdata[148] = \<const0> ;
  assign s00_axi_rdata[147] = \<const0> ;
  assign s00_axi_rdata[146] = \<const0> ;
  assign s00_axi_rdata[145] = \<const0> ;
  assign s00_axi_rdata[144] = \<const0> ;
  assign s00_axi_rdata[143] = \<const0> ;
  assign s00_axi_rdata[142] = \<const0> ;
  assign s00_axi_rdata[141] = \<const0> ;
  assign s00_axi_rdata[140] = \<const0> ;
  assign s00_axi_rdata[139] = \<const0> ;
  assign s00_axi_rdata[138] = \<const0> ;
  assign s00_axi_rdata[137] = \<const0> ;
  assign s00_axi_rdata[136] = \<const0> ;
  assign s00_axi_rdata[135] = \<const0> ;
  assign s00_axi_rdata[134] = \<const0> ;
  assign s00_axi_rdata[133] = \<const0> ;
  assign s00_axi_rdata[132] = \<const0> ;
  assign s00_axi_rdata[131] = \<const0> ;
  assign s00_axi_rdata[130] = \<const0> ;
  assign s00_axi_rdata[129] = \<const0> ;
  assign s00_axi_rdata[128] = \<const0> ;
  assign s00_axi_rdata[127] = \<const0> ;
  assign s00_axi_rdata[126] = \<const0> ;
  assign s00_axi_rdata[125] = \<const0> ;
  assign s00_axi_rdata[124] = \<const0> ;
  assign s00_axi_rdata[123] = \<const0> ;
  assign s00_axi_rdata[122] = \<const0> ;
  assign s00_axi_rdata[121] = \<const0> ;
  assign s00_axi_rdata[120] = \<const0> ;
  assign s00_axi_rdata[119] = \<const0> ;
  assign s00_axi_rdata[118] = \<const0> ;
  assign s00_axi_rdata[117] = \<const0> ;
  assign s00_axi_rdata[116] = \<const0> ;
  assign s00_axi_rdata[115] = \<const0> ;
  assign s00_axi_rdata[114] = \<const0> ;
  assign s00_axi_rdata[113] = \<const0> ;
  assign s00_axi_rdata[112] = \<const0> ;
  assign s00_axi_rdata[111] = \<const0> ;
  assign s00_axi_rdata[110] = \<const0> ;
  assign s00_axi_rdata[109] = \<const0> ;
  assign s00_axi_rdata[108] = \<const0> ;
  assign s00_axi_rdata[107] = \<const0> ;
  assign s00_axi_rdata[106] = \<const0> ;
  assign s00_axi_rdata[105] = \<const0> ;
  assign s00_axi_rdata[104] = \<const0> ;
  assign s00_axi_rdata[103] = \<const0> ;
  assign s00_axi_rdata[102] = \<const0> ;
  assign s00_axi_rdata[101] = \<const0> ;
  assign s00_axi_rdata[100] = \<const0> ;
  assign s00_axi_rdata[99] = \<const0> ;
  assign s00_axi_rdata[98] = \<const0> ;
  assign s00_axi_rdata[97] = \<const0> ;
  assign s00_axi_rdata[96] = \<const0> ;
  assign s00_axi_rdata[95] = \<const0> ;
  assign s00_axi_rdata[94] = \<const0> ;
  assign s00_axi_rdata[93] = \<const0> ;
  assign s00_axi_rdata[92] = \<const0> ;
  assign s00_axi_rdata[91] = \<const0> ;
  assign s00_axi_rdata[90] = \<const0> ;
  assign s00_axi_rdata[89] = \<const0> ;
  assign s00_axi_rdata[88] = \<const0> ;
  assign s00_axi_rdata[87] = \<const0> ;
  assign s00_axi_rdata[86] = \<const0> ;
  assign s00_axi_rdata[85] = \<const0> ;
  assign s00_axi_rdata[84] = \<const0> ;
  assign s00_axi_rdata[83] = \<const0> ;
  assign s00_axi_rdata[82] = \<const0> ;
  assign s00_axi_rdata[81] = \<const0> ;
  assign s00_axi_rdata[80] = \<const0> ;
  assign s00_axi_rdata[79] = \<const0> ;
  assign s00_axi_rdata[78] = \<const0> ;
  assign s00_axi_rdata[77] = \<const0> ;
  assign s00_axi_rdata[76] = \<const0> ;
  assign s00_axi_rdata[75] = \<const0> ;
  assign s00_axi_rdata[74] = \<const0> ;
  assign s00_axi_rdata[73] = \<const0> ;
  assign s00_axi_rdata[72] = \<const0> ;
  assign s00_axi_rdata[71] = \<const0> ;
  assign s00_axi_rdata[70] = \<const0> ;
  assign s00_axi_rdata[69] = \<const0> ;
  assign s00_axi_rdata[68] = \<const0> ;
  assign s00_axi_rdata[67] = \<const0> ;
  assign s00_axi_rdata[66] = \<const0> ;
  assign s00_axi_rdata[65] = \<const0> ;
  assign s00_axi_rdata[64] = \<const0> ;
  assign s00_axi_rdata[63] = \<const0> ;
  assign s00_axi_rdata[62] = \<const0> ;
  assign s00_axi_rdata[61] = \<const0> ;
  assign s00_axi_rdata[60] = \<const0> ;
  assign s00_axi_rdata[59] = \<const0> ;
  assign s00_axi_rdata[58] = \<const0> ;
  assign s00_axi_rdata[57] = \<const0> ;
  assign s00_axi_rdata[56] = \<const0> ;
  assign s00_axi_rdata[55] = \<const0> ;
  assign s00_axi_rdata[54] = \<const0> ;
  assign s00_axi_rdata[53] = \<const0> ;
  assign s00_axi_rdata[52] = \<const0> ;
  assign s00_axi_rdata[51] = \<const0> ;
  assign s00_axi_rdata[50] = \<const0> ;
  assign s00_axi_rdata[49] = \<const0> ;
  assign s00_axi_rdata[48] = \<const0> ;
  assign s00_axi_rdata[47] = \<const0> ;
  assign s00_axi_rdata[46] = \<const0> ;
  assign s00_axi_rdata[45] = \<const0> ;
  assign s00_axi_rdata[44] = \<const0> ;
  assign s00_axi_rdata[43] = \<const0> ;
  assign s00_axi_rdata[42] = \<const0> ;
  assign s00_axi_rdata[41] = \<const0> ;
  assign s00_axi_rdata[40] = \<const0> ;
  assign s00_axi_rdata[39] = \<const0> ;
  assign s00_axi_rdata[38] = \<const0> ;
  assign s00_axi_rdata[37] = \<const0> ;
  assign s00_axi_rdata[36] = \<const0> ;
  assign s00_axi_rdata[35] = \<const0> ;
  assign s00_axi_rdata[34] = \<const0> ;
  assign s00_axi_rdata[33] = \<const0> ;
  assign s00_axi_rdata[32] = \<const0> ;
  assign s00_axi_rdata[31] = \<const0> ;
  assign s00_axi_rdata[30] = \<const0> ;
  assign s00_axi_rdata[29] = \<const0> ;
  assign s00_axi_rdata[28] = \<const0> ;
  assign s00_axi_rdata[27] = \<const0> ;
  assign s00_axi_rdata[26] = \<const0> ;
  assign s00_axi_rdata[25] = \<const0> ;
  assign s00_axi_rdata[24] = \<const0> ;
  assign s00_axi_rdata[23] = \<const0> ;
  assign s00_axi_rdata[22] = \<const0> ;
  assign s00_axi_rdata[21] = \<const0> ;
  assign s00_axi_rdata[20] = \<const0> ;
  assign s00_axi_rdata[19] = \<const0> ;
  assign s00_axi_rdata[18] = \<const0> ;
  assign s00_axi_rdata[17] = \<const0> ;
  assign s00_axi_rdata[16] = \<const0> ;
  assign s00_axi_rdata[15] = \<const0> ;
  assign s00_axi_rdata[14] = \<const0> ;
  assign s00_axi_rdata[13] = \<const0> ;
  assign s00_axi_rdata[12] = \<const0> ;
  assign s00_axi_rdata[11] = \<const0> ;
  assign s00_axi_rdata[10] = \<const0> ;
  assign s00_axi_rdata[9] = \<const0> ;
  assign s00_axi_rdata[8] = \<const0> ;
  assign s00_axi_rdata[7] = \<const0> ;
  assign s00_axi_rdata[6] = \<const0> ;
  assign s00_axi_rdata[5] = \<const0> ;
  assign s00_axi_rdata[4] = \<const0> ;
  assign s00_axi_rdata[3] = \<const0> ;
  assign s00_axi_rdata[2] = \<const0> ;
  assign s00_axi_rdata[1] = \<const0> ;
  assign s00_axi_rdata[0] = \<const0> ;
  assign s00_axi_rid[0] = s00_axi_arid;
  assign s00_axi_rresp[1] = \<const0> ;
  assign s00_axi_rresp[0] = \<const0> ;
  assign s00_axi_ruser[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  design_1_non_benes_ip_0_0_axi_std_interface inst
       (.axi_arready_reg(s00_axi_arready),
        .axi_rvalid_reg(s00_axi_rvalid),
        .axi_wready_reg(s00_axi_wready),
        .s00_axi_aclk(s00_axi_aclk),
        .s00_axi_aresetn(s00_axi_aresetn),
        .s00_axi_arlen(s00_axi_arlen),
        .s00_axi_arvalid(s00_axi_arvalid),
        .s00_axi_awready(s00_axi_awready),
        .s00_axi_awvalid(s00_axi_awvalid),
        .s00_axi_bready(s00_axi_bready),
        .s00_axi_bvalid(s00_axi_bvalid),
        .s00_axi_rlast(s00_axi_rlast),
        .s00_axi_rready(s00_axi_rready),
        .s00_axi_wlast(s00_axi_wlast),
        .s00_axi_wvalid(s00_axi_wvalid));
endmodule

(* ORIG_REF_NAME = "axi_std_interface" *) 
module design_1_non_benes_ip_0_0_axi_std_interface
   (axi_wready_reg,
    axi_rvalid_reg,
    axi_arready_reg,
    s00_axi_awready,
    s00_axi_bvalid,
    s00_axi_rlast,
    s00_axi_aclk,
    s00_axi_wvalid,
    s00_axi_wlast,
    s00_axi_awvalid,
    s00_axi_rready,
    s00_axi_bready,
    s00_axi_arvalid,
    s00_axi_aresetn,
    s00_axi_arlen);
  output axi_wready_reg;
  output axi_rvalid_reg;
  output axi_arready_reg;
  output s00_axi_awready;
  output s00_axi_bvalid;
  output s00_axi_rlast;
  input s00_axi_aclk;
  input s00_axi_wvalid;
  input s00_axi_wlast;
  input s00_axi_awvalid;
  input s00_axi_rready;
  input s00_axi_bready;
  input s00_axi_arvalid;
  input s00_axi_aresetn;
  input [7:0]s00_axi_arlen;

  wire axi_arready_reg;
  wire axi_rvalid_reg;
  wire axi_wready_reg;
  wire s00_axi_aclk;
  wire s00_axi_aresetn;
  wire [7:0]s00_axi_arlen;
  wire s00_axi_arvalid;
  wire s00_axi_awready;
  wire s00_axi_awvalid;
  wire s00_axi_bready;
  wire s00_axi_bvalid;
  wire s00_axi_rlast;
  wire s00_axi_rready;
  wire s00_axi_wlast;
  wire s00_axi_wvalid;

  design_1_non_benes_ip_0_0_axi_std_slave axi_std_slave_inst
       (.axi_arready_reg_0(axi_arready_reg),
        .axi_rvalid_reg_0(axi_rvalid_reg),
        .axi_wready_reg_0(axi_wready_reg),
        .s00_axi_aclk(s00_axi_aclk),
        .s00_axi_aresetn(s00_axi_aresetn),
        .s00_axi_arlen(s00_axi_arlen),
        .s00_axi_arvalid(s00_axi_arvalid),
        .s00_axi_awready(s00_axi_awready),
        .s00_axi_awvalid(s00_axi_awvalid),
        .s00_axi_bready(s00_axi_bready),
        .s00_axi_bvalid(s00_axi_bvalid),
        .s00_axi_rlast(s00_axi_rlast),
        .s00_axi_rready(s00_axi_rready),
        .s00_axi_wlast(s00_axi_wlast),
        .s00_axi_wvalid(s00_axi_wvalid));
endmodule

(* ORIG_REF_NAME = "axi_std_slave" *) 
module design_1_non_benes_ip_0_0_axi_std_slave
   (axi_wready_reg_0,
    axi_rvalid_reg_0,
    axi_arready_reg_0,
    s00_axi_awready,
    s00_axi_bvalid,
    s00_axi_rlast,
    s00_axi_aclk,
    s00_axi_wvalid,
    s00_axi_wlast,
    s00_axi_awvalid,
    s00_axi_rready,
    s00_axi_bready,
    s00_axi_arvalid,
    s00_axi_aresetn,
    s00_axi_arlen);
  output axi_wready_reg_0;
  output axi_rvalid_reg_0;
  output axi_arready_reg_0;
  output s00_axi_awready;
  output s00_axi_bvalid;
  output s00_axi_rlast;
  input s00_axi_aclk;
  input s00_axi_wvalid;
  input s00_axi_wlast;
  input s00_axi_awvalid;
  input s00_axi_rready;
  input s00_axi_bready;
  input s00_axi_arvalid;
  input s00_axi_aresetn;
  input [7:0]s00_axi_arlen;

  wire [14:7]ar_wrap_size;
  wire axi_araddr1;
  wire axi_araddr3;
  wire \axi_arlen[7]_i_1_n_0 ;
  wire \axi_arlen_cntr[7]_i_1_n_0 ;
  wire \axi_arlen_cntr[7]_i_4_n_0 ;
  wire [7:0]axi_arlen_cntr_reg;
  wire axi_arready2;
  wire axi_arready_i_1_n_0;
  wire axi_arready_i_2_n_0;
  wire axi_arready_i_4_n_0;
  wire axi_arready_i_5_n_0;
  wire axi_arready_reg_0;
  wire axi_arv_arr_flag;
  wire axi_arv_arr_flag_i_1_n_0;
  wire axi_awready_i_1_n_0;
  wire axi_awready_i_2_n_0;
  wire axi_awv_awr_flag;
  wire axi_awv_awr_flag_i_1_n_0;
  wire axi_bvalid_i_1_n_0;
  wire axi_rlast_i_10_n_0;
  wire axi_rlast_i_11_n_0;
  wire axi_rlast_i_12_n_0;
  wire axi_rlast_i_1_n_0;
  wire axi_rlast_i_2_n_0;
  wire axi_rlast_i_4_n_0;
  wire axi_rlast_i_5_n_0;
  wire axi_rlast_i_6_n_0;
  wire axi_rlast_i_7_n_0;
  wire axi_rlast_i_8_n_0;
  wire axi_rlast_i_9_n_0;
  wire axi_rlast_reg_i_3_n_5;
  wire axi_rlast_reg_i_3_n_6;
  wire axi_rlast_reg_i_3_n_7;
  wire axi_rvalid_i_1_n_0;
  wire axi_rvalid_reg_0;
  wire axi_wready_i_1_n_0;
  wire axi_wready_reg_0;
  wire [7:0]p_0_in;
  wire s00_axi_aclk;
  wire s00_axi_aresetn;
  wire [7:0]s00_axi_arlen;
  wire s00_axi_arvalid;
  wire s00_axi_awready;
  wire s00_axi_awvalid;
  wire s00_axi_bready;
  wire s00_axi_bvalid;
  wire s00_axi_rlast;
  wire s00_axi_rready;
  wire s00_axi_wlast;
  wire s00_axi_wvalid;
  wire [7:4]NLW_axi_rlast_reg_i_3_CO_UNCONNECTED;
  wire [7:0]NLW_axi_rlast_reg_i_3_O_UNCONNECTED;

  LUT3 #(
    .INIT(8'h04)) 
    \axi_arlen[7]_i_1 
       (.I0(axi_arready_reg_0),
        .I1(s00_axi_arvalid),
        .I2(axi_arv_arr_flag),
        .O(\axi_arlen[7]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \axi_arlen_cntr[0]_i_1 
       (.I0(axi_arlen_cntr_reg[0]),
        .O(p_0_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \axi_arlen_cntr[1]_i_1 
       (.I0(axi_arlen_cntr_reg[0]),
        .I1(axi_arlen_cntr_reg[1]),
        .O(p_0_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \axi_arlen_cntr[2]_i_1 
       (.I0(axi_arlen_cntr_reg[0]),
        .I1(axi_arlen_cntr_reg[1]),
        .I2(axi_arlen_cntr_reg[2]),
        .O(p_0_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \axi_arlen_cntr[3]_i_1 
       (.I0(axi_arlen_cntr_reg[1]),
        .I1(axi_arlen_cntr_reg[0]),
        .I2(axi_arlen_cntr_reg[2]),
        .I3(axi_arlen_cntr_reg[3]),
        .O(p_0_in[3]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \axi_arlen_cntr[4]_i_1 
       (.I0(axi_arlen_cntr_reg[2]),
        .I1(axi_arlen_cntr_reg[0]),
        .I2(axi_arlen_cntr_reg[1]),
        .I3(axi_arlen_cntr_reg[3]),
        .I4(axi_arlen_cntr_reg[4]),
        .O(p_0_in[4]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \axi_arlen_cntr[5]_i_1 
       (.I0(axi_arlen_cntr_reg[3]),
        .I1(axi_arlen_cntr_reg[1]),
        .I2(axi_arlen_cntr_reg[0]),
        .I3(axi_arlen_cntr_reg[2]),
        .I4(axi_arlen_cntr_reg[4]),
        .I5(axi_arlen_cntr_reg[5]),
        .O(p_0_in[5]));
  LUT2 #(
    .INIT(4'h6)) 
    \axi_arlen_cntr[6]_i_1 
       (.I0(\axi_arlen_cntr[7]_i_4_n_0 ),
        .I1(axi_arlen_cntr_reg[6]),
        .O(p_0_in[6]));
  LUT4 #(
    .INIT(16'h04FF)) 
    \axi_arlen_cntr[7]_i_1 
       (.I0(axi_arv_arr_flag),
        .I1(s00_axi_arvalid),
        .I2(axi_arready_reg_0),
        .I3(s00_axi_aresetn),
        .O(\axi_arlen_cntr[7]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \axi_arlen_cntr[7]_i_2 
       (.I0(s00_axi_rready),
        .I1(axi_rvalid_reg_0),
        .I2(axi_araddr3),
        .O(axi_araddr1));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \axi_arlen_cntr[7]_i_3 
       (.I0(\axi_arlen_cntr[7]_i_4_n_0 ),
        .I1(axi_arlen_cntr_reg[6]),
        .I2(axi_arlen_cntr_reg[7]),
        .O(p_0_in[7]));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \axi_arlen_cntr[7]_i_4 
       (.I0(axi_arlen_cntr_reg[5]),
        .I1(axi_arlen_cntr_reg[3]),
        .I2(axi_arlen_cntr_reg[1]),
        .I3(axi_arlen_cntr_reg[0]),
        .I4(axi_arlen_cntr_reg[2]),
        .I5(axi_arlen_cntr_reg[4]),
        .O(\axi_arlen_cntr[7]_i_4_n_0 ));
  FDRE \axi_arlen_cntr_reg[0] 
       (.C(s00_axi_aclk),
        .CE(axi_araddr1),
        .D(p_0_in[0]),
        .Q(axi_arlen_cntr_reg[0]),
        .R(\axi_arlen_cntr[7]_i_1_n_0 ));
  FDRE \axi_arlen_cntr_reg[1] 
       (.C(s00_axi_aclk),
        .CE(axi_araddr1),
        .D(p_0_in[1]),
        .Q(axi_arlen_cntr_reg[1]),
        .R(\axi_arlen_cntr[7]_i_1_n_0 ));
  FDRE \axi_arlen_cntr_reg[2] 
       (.C(s00_axi_aclk),
        .CE(axi_araddr1),
        .D(p_0_in[2]),
        .Q(axi_arlen_cntr_reg[2]),
        .R(\axi_arlen_cntr[7]_i_1_n_0 ));
  FDRE \axi_arlen_cntr_reg[3] 
       (.C(s00_axi_aclk),
        .CE(axi_araddr1),
        .D(p_0_in[3]),
        .Q(axi_arlen_cntr_reg[3]),
        .R(\axi_arlen_cntr[7]_i_1_n_0 ));
  FDRE \axi_arlen_cntr_reg[4] 
       (.C(s00_axi_aclk),
        .CE(axi_araddr1),
        .D(p_0_in[4]),
        .Q(axi_arlen_cntr_reg[4]),
        .R(\axi_arlen_cntr[7]_i_1_n_0 ));
  FDRE \axi_arlen_cntr_reg[5] 
       (.C(s00_axi_aclk),
        .CE(axi_araddr1),
        .D(p_0_in[5]),
        .Q(axi_arlen_cntr_reg[5]),
        .R(\axi_arlen_cntr[7]_i_1_n_0 ));
  FDRE \axi_arlen_cntr_reg[6] 
       (.C(s00_axi_aclk),
        .CE(axi_araddr1),
        .D(p_0_in[6]),
        .Q(axi_arlen_cntr_reg[6]),
        .R(\axi_arlen_cntr[7]_i_1_n_0 ));
  FDRE \axi_arlen_cntr_reg[7] 
       (.C(s00_axi_aclk),
        .CE(axi_araddr1),
        .D(p_0_in[7]),
        .Q(axi_arlen_cntr_reg[7]),
        .R(\axi_arlen_cntr[7]_i_1_n_0 ));
  FDRE \axi_arlen_reg[0] 
       (.C(s00_axi_aclk),
        .CE(\axi_arlen[7]_i_1_n_0 ),
        .D(s00_axi_arlen[0]),
        .Q(ar_wrap_size[7]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_arlen_reg[1] 
       (.C(s00_axi_aclk),
        .CE(\axi_arlen[7]_i_1_n_0 ),
        .D(s00_axi_arlen[1]),
        .Q(ar_wrap_size[8]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_arlen_reg[2] 
       (.C(s00_axi_aclk),
        .CE(\axi_arlen[7]_i_1_n_0 ),
        .D(s00_axi_arlen[2]),
        .Q(ar_wrap_size[9]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_arlen_reg[3] 
       (.C(s00_axi_aclk),
        .CE(\axi_arlen[7]_i_1_n_0 ),
        .D(s00_axi_arlen[3]),
        .Q(ar_wrap_size[10]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_arlen_reg[4] 
       (.C(s00_axi_aclk),
        .CE(\axi_arlen[7]_i_1_n_0 ),
        .D(s00_axi_arlen[4]),
        .Q(ar_wrap_size[11]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_arlen_reg[5] 
       (.C(s00_axi_aclk),
        .CE(\axi_arlen[7]_i_1_n_0 ),
        .D(s00_axi_arlen[5]),
        .Q(ar_wrap_size[12]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_arlen_reg[6] 
       (.C(s00_axi_aclk),
        .CE(\axi_arlen[7]_i_1_n_0 ),
        .D(s00_axi_arlen[6]),
        .Q(ar_wrap_size[13]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_arlen_reg[7] 
       (.C(s00_axi_aclk),
        .CE(\axi_arlen[7]_i_1_n_0 ),
        .D(s00_axi_arlen[7]),
        .Q(ar_wrap_size[14]),
        .R(axi_awready_i_1_n_0));
  LUT5 #(
    .INIT(32'hEAAAAAAA)) 
    axi_arready_i_1
       (.I0(axi_arready_i_2_n_0),
        .I1(axi_rvalid_reg_0),
        .I2(s00_axi_rready),
        .I3(axi_arready2),
        .I4(axi_arready_reg_0),
        .O(axi_arready_i_1_n_0));
  LUT4 #(
    .INIT(16'h0004)) 
    axi_arready_i_2
       (.I0(axi_awv_awr_flag),
        .I1(s00_axi_arvalid),
        .I2(axi_arready_reg_0),
        .I3(axi_arv_arr_flag),
        .O(axi_arready_i_2_n_0));
  LUT6 #(
    .INIT(64'h9009000000000000)) 
    axi_arready_i_3
       (.I0(ar_wrap_size[14]),
        .I1(axi_arlen_cntr_reg[7]),
        .I2(ar_wrap_size[13]),
        .I3(axi_arlen_cntr_reg[6]),
        .I4(axi_arready_i_4_n_0),
        .I5(axi_arready_i_5_n_0),
        .O(axi_arready2));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    axi_arready_i_4
       (.I0(axi_arlen_cntr_reg[3]),
        .I1(ar_wrap_size[10]),
        .I2(ar_wrap_size[12]),
        .I3(axi_arlen_cntr_reg[5]),
        .I4(ar_wrap_size[11]),
        .I5(axi_arlen_cntr_reg[4]),
        .O(axi_arready_i_4_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    axi_arready_i_5
       (.I0(axi_arlen_cntr_reg[0]),
        .I1(ar_wrap_size[7]),
        .I2(ar_wrap_size[9]),
        .I3(axi_arlen_cntr_reg[2]),
        .I4(ar_wrap_size[8]),
        .I5(axi_arlen_cntr_reg[1]),
        .O(axi_arready_i_5_n_0));
  FDRE axi_arready_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_arready_i_1_n_0),
        .Q(axi_arready_reg_0),
        .R(axi_awready_i_1_n_0));
  LUT5 #(
    .INIT(32'hBFFFAAAA)) 
    axi_arv_arr_flag_i_1
       (.I0(axi_arready_i_2_n_0),
        .I1(axi_rvalid_reg_0),
        .I2(s00_axi_rready),
        .I3(axi_arready2),
        .I4(axi_arv_arr_flag),
        .O(axi_arv_arr_flag_i_1_n_0));
  FDRE axi_arv_arr_flag_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_arv_arr_flag_i_1_n_0),
        .Q(axi_arv_arr_flag),
        .R(axi_awready_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    axi_awready_i_1
       (.I0(s00_axi_aresetn),
        .O(axi_awready_i_1_n_0));
  LUT6 #(
    .INIT(64'hFF04000400040004)) 
    axi_awready_i_2
       (.I0(axi_arv_arr_flag),
        .I1(s00_axi_awvalid),
        .I2(axi_awv_awr_flag),
        .I3(s00_axi_awready),
        .I4(s00_axi_wlast),
        .I5(axi_wready_reg_0),
        .O(axi_awready_i_2_n_0));
  FDRE axi_awready_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_awready_i_2_n_0),
        .Q(s00_axi_awready),
        .R(axi_awready_i_1_n_0));
  LUT6 #(
    .INIT(64'h0004F0F4F0F4F0F4)) 
    axi_awv_awr_flag_i_1
       (.I0(axi_arv_arr_flag),
        .I1(s00_axi_awvalid),
        .I2(axi_awv_awr_flag),
        .I3(s00_axi_awready),
        .I4(s00_axi_wlast),
        .I5(axi_wready_reg_0),
        .O(axi_awv_awr_flag_i_1_n_0));
  FDRE axi_awv_awr_flag_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_awv_awr_flag_i_1_n_0),
        .Q(axi_awv_awr_flag),
        .R(axi_awready_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000FFFF80008000)) 
    axi_bvalid_i_1
       (.I0(s00_axi_wlast),
        .I1(axi_wready_reg_0),
        .I2(s00_axi_wvalid),
        .I3(axi_awv_awr_flag),
        .I4(s00_axi_bready),
        .I5(s00_axi_bvalid),
        .O(axi_bvalid_i_1_n_0));
  FDRE axi_bvalid_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_bvalid_i_1_n_0),
        .Q(s00_axi_bvalid),
        .R(axi_awready_i_1_n_0));
  LUT6 #(
    .INIT(64'h0008080808080808)) 
    axi_rlast_i_1
       (.I0(axi_rlast_i_2_n_0),
        .I1(s00_axi_aresetn),
        .I2(\axi_arlen[7]_i_1_n_0 ),
        .I3(axi_araddr3),
        .I4(axi_rvalid_reg_0),
        .I5(s00_axi_rready),
        .O(axi_rlast_i_1_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    axi_rlast_i_10
       (.I0(ar_wrap_size[11]),
        .I1(axi_arlen_cntr_reg[4]),
        .I2(ar_wrap_size[12]),
        .I3(axi_arlen_cntr_reg[5]),
        .O(axi_rlast_i_10_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    axi_rlast_i_11
       (.I0(ar_wrap_size[9]),
        .I1(axi_arlen_cntr_reg[2]),
        .I2(ar_wrap_size[10]),
        .I3(axi_arlen_cntr_reg[3]),
        .O(axi_rlast_i_11_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    axi_rlast_i_12
       (.I0(ar_wrap_size[7]),
        .I1(axi_arlen_cntr_reg[0]),
        .I2(ar_wrap_size[8]),
        .I3(axi_arlen_cntr_reg[1]),
        .O(axi_rlast_i_12_n_0));
  LUT6 #(
    .INIT(64'h02000000CECCCCCC)) 
    axi_rlast_i_2
       (.I0(axi_arv_arr_flag),
        .I1(s00_axi_rlast),
        .I2(axi_rlast_i_4_n_0),
        .I3(axi_arready_i_4_n_0),
        .I4(axi_arready_i_5_n_0),
        .I5(s00_axi_rready),
        .O(axi_rlast_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h6FF6)) 
    axi_rlast_i_4
       (.I0(axi_arlen_cntr_reg[6]),
        .I1(ar_wrap_size[13]),
        .I2(axi_arlen_cntr_reg[7]),
        .I3(ar_wrap_size[14]),
        .O(axi_rlast_i_4_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    axi_rlast_i_5
       (.I0(ar_wrap_size[13]),
        .I1(axi_arlen_cntr_reg[6]),
        .I2(axi_arlen_cntr_reg[7]),
        .I3(ar_wrap_size[14]),
        .O(axi_rlast_i_5_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    axi_rlast_i_6
       (.I0(ar_wrap_size[11]),
        .I1(axi_arlen_cntr_reg[4]),
        .I2(axi_arlen_cntr_reg[5]),
        .I3(ar_wrap_size[12]),
        .O(axi_rlast_i_6_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    axi_rlast_i_7
       (.I0(ar_wrap_size[9]),
        .I1(axi_arlen_cntr_reg[2]),
        .I2(axi_arlen_cntr_reg[3]),
        .I3(ar_wrap_size[10]),
        .O(axi_rlast_i_7_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    axi_rlast_i_8
       (.I0(ar_wrap_size[7]),
        .I1(axi_arlen_cntr_reg[0]),
        .I2(axi_arlen_cntr_reg[1]),
        .I3(ar_wrap_size[8]),
        .O(axi_rlast_i_8_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    axi_rlast_i_9
       (.I0(ar_wrap_size[13]),
        .I1(axi_arlen_cntr_reg[6]),
        .I2(ar_wrap_size[14]),
        .I3(axi_arlen_cntr_reg[7]),
        .O(axi_rlast_i_9_n_0));
  FDRE axi_rlast_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_rlast_i_1_n_0),
        .Q(s00_axi_rlast),
        .R(1'b0));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY8 axi_rlast_reg_i_3
       (.CI(1'b1),
        .CI_TOP(1'b0),
        .CO({NLW_axi_rlast_reg_i_3_CO_UNCONNECTED[7:4],axi_araddr3,axi_rlast_reg_i_3_n_5,axi_rlast_reg_i_3_n_6,axi_rlast_reg_i_3_n_7}),
        .DI({1'b0,1'b0,1'b0,1'b0,axi_rlast_i_5_n_0,axi_rlast_i_6_n_0,axi_rlast_i_7_n_0,axi_rlast_i_8_n_0}),
        .O(NLW_axi_rlast_reg_i_3_O_UNCONNECTED[7:0]),
        .S({1'b0,1'b0,1'b0,1'b0,axi_rlast_i_9_n_0,axi_rlast_i_10_n_0,axi_rlast_i_11_n_0,axi_rlast_i_12_n_0}));
  LUT4 #(
    .INIT(16'h0072)) 
    axi_rvalid_i_1
       (.I0(axi_rvalid_reg_0),
        .I1(s00_axi_rready),
        .I2(axi_arv_arr_flag),
        .I3(s00_axi_aresetn),
        .O(axi_rvalid_i_1_n_0));
  FDRE axi_rvalid_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_rvalid_i_1_n_0),
        .Q(axi_rvalid_reg_0),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0F88)) 
    axi_wready_i_1
       (.I0(axi_awv_awr_flag),
        .I1(s00_axi_wvalid),
        .I2(s00_axi_wlast),
        .I3(axi_wready_reg_0),
        .O(axi_wready_i_1_n_0));
  FDRE axi_wready_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_wready_i_1_n_0),
        .Q(axi_wready_reg_0),
        .R(axi_awready_i_1_n_0));
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
