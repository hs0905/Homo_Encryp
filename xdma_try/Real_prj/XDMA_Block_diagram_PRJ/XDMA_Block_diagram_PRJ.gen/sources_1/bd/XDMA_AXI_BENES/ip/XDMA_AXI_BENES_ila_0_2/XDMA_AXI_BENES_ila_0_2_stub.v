// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2.2 (lin64) Build 3118627 Tue Feb  9 05:13:49 MST 2021
// Date        : Mon Nov 20 17:24:20 2023
// Host        : baldur running 64-bit Ubuntu 18.04.6 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/hs/Desktop/Real_prj/XDMA_Block_diagram_PRJ/XDMA_Block_diagram_PRJ.gen/sources_1/bd/XDMA_AXI_BENES/ip/XDMA_AXI_BENES_ila_0_2/XDMA_AXI_BENES_ila_0_2_stub.v
// Design      : XDMA_AXI_BENES_ila_0_2
// Purpose     : Stub declaration of top-level module interface
// Device      : xcu280-fsvh2892-2L-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "ila,Vivado 2020.2.2" *)
module XDMA_AXI_BENES_ila_0_2(clk, probe0, probe1, probe2, probe3, probe4, probe5, 
  probe6, probe7, probe8, probe9, probe10, probe11, probe12, probe13, probe14, probe15, probe16, probe17, 
  probe18)
/* synthesis syn_black_box black_box_pad_pin="clk,probe0[0:0],probe1[4:0],probe2[1:0],probe3[0:0],probe4[0:0],probe5[4:0],probe6[0:0],probe7[0:0],probe8[0:0],probe9[0:0],probe10[31:0],probe11[0:0],probe12[0:0],probe13[1:0],probe14[31:0],probe15[3:0],probe16[0:0],probe17[2:0],probe18[2:0]" */;
  input clk;
  input [0:0]probe0;
  input [4:0]probe1;
  input [1:0]probe2;
  input [0:0]probe3;
  input [0:0]probe4;
  input [4:0]probe5;
  input [0:0]probe6;
  input [0:0]probe7;
  input [0:0]probe8;
  input [0:0]probe9;
  input [31:0]probe10;
  input [0:0]probe11;
  input [0:0]probe12;
  input [1:0]probe13;
  input [31:0]probe14;
  input [3:0]probe15;
  input [0:0]probe16;
  input [2:0]probe17;
  input [2:0]probe18;
endmodule
