//Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.2.2 (lin64) Build 3118627 Tue Feb  9 05:13:49 MST 2021
//Date        : Mon Nov 20 17:21:30 2023
//Host        : baldur running 64-bit Ubuntu 18.04.6 LTS
//Command     : generate_target XDMA_AXI_BENES_wrapper.bd
//Design      : XDMA_AXI_BENES_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module XDMA_AXI_BENES_wrapper
   (pci_express_x8_rxn,
    pci_express_x8_rxp,
    pci_express_x8_txn,
    pci_express_x8_txp,
    pcie_perstn,
    pcie_refclk_clk_n,
    pcie_refclk_clk_p);
  input [7:0]pci_express_x8_rxn;
  input [7:0]pci_express_x8_rxp;
  output [7:0]pci_express_x8_txn;
  output [7:0]pci_express_x8_txp;
  input pcie_perstn;
  input pcie_refclk_clk_n;
  input pcie_refclk_clk_p;

  wire [7:0]pci_express_x8_rxn;
  wire [7:0]pci_express_x8_rxp;
  wire [7:0]pci_express_x8_txn;
  wire [7:0]pci_express_x8_txp;
  wire pcie_perstn;
  wire pcie_refclk_clk_n;
  wire pcie_refclk_clk_p;

  XDMA_AXI_BENES XDMA_AXI_BENES_i
       (.pci_express_x8_rxn(pci_express_x8_rxn),
        .pci_express_x8_rxp(pci_express_x8_rxp),
        .pci_express_x8_txn(pci_express_x8_txn),
        .pci_express_x8_txp(pci_express_x8_txp),
        .pcie_perstn(pcie_perstn),
        .pcie_refclk_clk_n(pcie_refclk_clk_n),
        .pcie_refclk_clk_p(pcie_refclk_clk_p));
endmodule
