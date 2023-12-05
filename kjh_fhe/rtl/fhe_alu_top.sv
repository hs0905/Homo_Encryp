`timescale 1 ns / 1 ns

`include "defines.vh"
import FHE_ALU_PKG::*;

module fhe_alu_top #(
        parameter SIM_MODE        = 0
	) (
		input logic	clk,		    		
		input logic rstn,			

    input CommandDataPort commanddataport,
    output StatePort stateport
	);

  // fhe_alu fhe_alu (
  //   .clk(clk),
  //   .rstn(rstn),
  //   .commanddataport(commanddataport),
  //   .stateport0(stateport.state0),
  //   .stateport1(stateport.state1),
  //   .stateport2(stateport.state2)
  // );

  
  fhe_ntt2 fhe_ntt2 (
    .clk(clk),
    .rstn(rstn),
    .commanddataport(commanddataport),
    .stateport0(stateport.state0),
    .stateport1(stateport.state1)
  );

  
  // fhe_intt fhe_intt (
  //   .clk(clk),
  //   .rstn(rstn),
  //   .commanddataport(commanddataport),
  //   .stateport0(stateport.state0),
  //   .stateport1(stateport.state1),
  //   .stateport2(stateport.state2)
  // );
  
  // fhe_intt2 fhe_intt2 (
  //   .clk(clk),
  //   .rstn(rstn),
  //   .commanddataport(commanddataport),
  //   .stateport0(stateport.state2),
  //   .stateport1(stateport.state3)
  // );


  `ifdef verilator
  task debug_set_alu;
    // verilator public
    input bit[31:0] debug;
    begin
      // fhe_alu.debug = debug;
    end
  endtask
  `endif

endmodule
