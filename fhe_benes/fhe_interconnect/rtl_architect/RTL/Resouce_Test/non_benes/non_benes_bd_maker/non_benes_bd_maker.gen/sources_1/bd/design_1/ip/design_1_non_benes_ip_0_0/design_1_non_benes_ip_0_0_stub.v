// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2.2 (lin64) Build 3118627 Tue Feb  9 05:13:49 MST 2021
// Date        : Thu Dec 28 14:07:36 2023
// Host        : baldur running 64-bit Ubuntu 18.04.6 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/hs/Desktop/FHE/fhe_benes/fhe_interconnect/step1/RTL/sim_resource/non_benes/non_benes_bd_maker/non_benes_bd_maker.gen/sources_1/bd/design_1/ip/design_1_non_benes_ip_0_0/design_1_non_benes_ip_0_0_stub.v
// Design      : design_1_non_benes_ip_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcu280-fsvh2892-2L-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "axi_std_interface,Vivado 2020.2.2" *)
module design_1_non_benes_ip_0_0(s00_axi_aclk, s00_axi_aresetn, s00_axi_awid, 
  s00_axi_awaddr, s00_axi_awlen, s00_axi_awsize, s00_axi_awburst, s00_axi_awlock, 
  s00_axi_awcache, s00_axi_awprot, s00_axi_awqos, s00_axi_awregion, s00_axi_awuser, 
  s00_axi_awvalid, s00_axi_awready, s00_axi_wdata, s00_axi_wstrb, s00_axi_wlast, 
  s00_axi_wuser, s00_axi_wvalid, s00_axi_wready, s00_axi_bid, s00_axi_bresp, s00_axi_buser, 
  s00_axi_bvalid, s00_axi_bready, s00_axi_arid, s00_axi_araddr, s00_axi_arlen, 
  s00_axi_arsize, s00_axi_arburst, s00_axi_arlock, s00_axi_arcache, s00_axi_arprot, 
  s00_axi_arqos, s00_axi_arregion, s00_axi_aruser, s00_axi_arvalid, s00_axi_arready, 
  s00_axi_rid, s00_axi_rdata, s00_axi_rresp, s00_axi_rlast, s00_axi_ruser, s00_axi_rvalid, 
  s00_axi_rready)
/* synthesis syn_black_box black_box_pad_pin="s00_axi_aclk,s00_axi_aresetn,s00_axi_awid[0:0],s00_axi_awaddr[10:0],s00_axi_awlen[7:0],s00_axi_awsize[2:0],s00_axi_awburst[1:0],s00_axi_awlock,s00_axi_awcache[3:0],s00_axi_awprot[2:0],s00_axi_awqos[3:0],s00_axi_awregion[3:0],s00_axi_awuser[0:0],s00_axi_awvalid,s00_axi_awready,s00_axi_wdata[1023:0],s00_axi_wstrb[127:0],s00_axi_wlast,s00_axi_wuser[0:0],s00_axi_wvalid,s00_axi_wready,s00_axi_bid[0:0],s00_axi_bresp[1:0],s00_axi_buser[0:0],s00_axi_bvalid,s00_axi_bready,s00_axi_arid[0:0],s00_axi_araddr[10:0],s00_axi_arlen[7:0],s00_axi_arsize[2:0],s00_axi_arburst[1:0],s00_axi_arlock,s00_axi_arcache[3:0],s00_axi_arprot[2:0],s00_axi_arqos[3:0],s00_axi_arregion[3:0],s00_axi_aruser[0:0],s00_axi_arvalid,s00_axi_arready,s00_axi_rid[0:0],s00_axi_rdata[1023:0],s00_axi_rresp[1:0],s00_axi_rlast,s00_axi_ruser[0:0],s00_axi_rvalid,s00_axi_rready" */;
  input s00_axi_aclk;
  input s00_axi_aresetn;
  input [0:0]s00_axi_awid;
  input [10:0]s00_axi_awaddr;
  input [7:0]s00_axi_awlen;
  input [2:0]s00_axi_awsize;
  input [1:0]s00_axi_awburst;
  input s00_axi_awlock;
  input [3:0]s00_axi_awcache;
  input [2:0]s00_axi_awprot;
  input [3:0]s00_axi_awqos;
  input [3:0]s00_axi_awregion;
  input [0:0]s00_axi_awuser;
  input s00_axi_awvalid;
  output s00_axi_awready;
  input [1023:0]s00_axi_wdata;
  input [127:0]s00_axi_wstrb;
  input s00_axi_wlast;
  input [0:0]s00_axi_wuser;
  input s00_axi_wvalid;
  output s00_axi_wready;
  output [0:0]s00_axi_bid;
  output [1:0]s00_axi_bresp;
  output [0:0]s00_axi_buser;
  output s00_axi_bvalid;
  input s00_axi_bready;
  input [0:0]s00_axi_arid;
  input [10:0]s00_axi_araddr;
  input [7:0]s00_axi_arlen;
  input [2:0]s00_axi_arsize;
  input [1:0]s00_axi_arburst;
  input s00_axi_arlock;
  input [3:0]s00_axi_arcache;
  input [2:0]s00_axi_arprot;
  input [3:0]s00_axi_arqos;
  input [3:0]s00_axi_arregion;
  input [0:0]s00_axi_aruser;
  input s00_axi_arvalid;
  output s00_axi_arready;
  output [0:0]s00_axi_rid;
  output [1023:0]s00_axi_rdata;
  output [1:0]s00_axi_rresp;
  output s00_axi_rlast;
  output [0:0]s00_axi_ruser;
  output s00_axi_rvalid;
  input s00_axi_rready;
endmodule
