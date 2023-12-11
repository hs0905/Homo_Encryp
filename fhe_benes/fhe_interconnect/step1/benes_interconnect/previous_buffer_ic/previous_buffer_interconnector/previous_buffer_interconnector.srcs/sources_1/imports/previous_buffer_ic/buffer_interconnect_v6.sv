`timescale 1 ns / 1 ns

`include "defines.vh"
import FHE_ALU_PKG::*;


module BufferInterconnect_v6 #(
		parameter DATA_SIZE = FSIZE, // Fsize == 64 , fsize는 data의 크기를 의미함.(polynomial의 coefficient의 개수)
		parameter CYCLES    = 2,

    parameter SLOT_NUM_IN_BUFF    = SLOT_NUM,   // Slot_num == 20 -> number of buffer ram slots
    parameter MODULE_NUM_IN_BUFF  = MODULE_NUM, // module_num == 20 -> total number of arithmetic modules(rev_trans, add, mult, etc.)

    parameter STAGE_MODULE_8_IN_BUFF        = 2, 
    parameter STAGE_SLOT_8_IN_BUFF          = 2,
    parameter STAGE_MODULE_POWER_8_IN_BUFF  = 8**STAGE_MODULE_8_IN_BUFF,// 8**2 = 64
    parameter STAGE_SLOT_POWER_8_IN_BUFF    = 8**STAGE_SLOT_8_IN_BUFF   // 8**2 = 64
	) (	
	  input logic	 clk,	
	  input logic	 rstn,	
    // module <=> intc <=> slot
    //intc <=> slot
    output BufferRAMTEFsizeInputs ram_inputs[0:SLOT_NUM_IN_BUFF-1],
    input logic [E*FSIZE-1:0]   ram_outputs[0:SLOT_NUM_IN_BUFF-1], // E == 8 e.g 8*64 = 512 bits
    // ram_output is input of moudule and input of intc
    //module <=> intc 
    input BufferRAMTEFsizeInputs  module_outputs[0:MODULE_NUM_IN_BUFF-1], 
    output logic [E*FSIZE-1:0]   module_inputs[0:MODULE_NUM_IN_BUFF-1],
    
    input logic [SLOT_NUM_IN_BUFF-1:0][$clog2(MODULE_NUM_IN_BUFF)-1:0] module_select, //module => slot
    // [19:0][log2(20)-1:0]module_select
    input logic [MODULE_NUM_IN_BUFF-1:0][$clog2(SLOT_NUM_IN_BUFF)-1:0] slot_select //module <= slot
    // [19:0][log2(20)-1:0]slot_select
  );
  
  genvar gi, gj, gk, gl, gp;
  generate

    // module => slot
    logic [SLOT_NUM_IN_BUFF-1:0][$clog2(STAGE_MODULE_POWER_8_IN_BUFF)-1:0] module_select_fifo;
    for(gi = 0; gi < SLOT_NUM_IN_BUFF ; gi++) begin: slot_fifo1
        FifoBuffer #(.DATA_SIZE($clog2(MODULE_NUM_IN_BUFF)),       .CYCLES(1) )  fifo_slot1  (.clk(clk), .rstn(1), .in(module_select[gi]), .out(module_select_fifo[gi]));
    end
    
    for(gl = 0; gl < SLOT_NUM_IN_BUFF ; gl++) begin : module_select_r

      // logic [$clog2(MODULE_NUM_IN_BUFF)-1:0] module_select_fifo[0:STAGE_MODULE];

      BufferRAMTEFsizeInputs intc_set_in [0:STAGE_MODULE_8_IN_BUFF-1][0:STAGE_MODULE_POWER_8_IN_BUFF-1];
      BufferRAMTEFsizeInputs intc_set_middle [0:STAGE_MODULE_8_IN_BUFF-1][0:STAGE_MODULE_POWER_8_IN_BUFF-1];
      BufferRAMTEFsizeInputs intc_set_out [0:STAGE_MODULE_8_IN_BUFF-1][0:STAGE_MODULE_POWER_8_IN_BUFF-1];

      for(gi = 0; gi < STAGE_MODULE_8_IN_BUFF; gi++) begin : module_to_slot_stage

        for(gj = 0; gj < 8**(STAGE_MODULE_8_IN_BUFF-gi-1) ; gj++ ) begin :fifo1
          assign intc_set_middle[gi][gj] = module_select_fifo[gl][3*gi+2] ? (module_select_fifo[gl][3*gi+1] ?
                                                                            (module_select_fifo[gl][3*gi]   ? intc_set_in[gi][8*gj+7] : intc_set_in[gi][8*gj+6]):
                                                                          (module_select_fifo[gl][3*gi]   ? intc_set_in[gi][8*gj+5] : intc_set_in[gi][8*gj+4])):
                                                                          (module_select_fifo[gl][3*gi+1] ?
                                                                            (module_select_fifo[gl][3*gi]   ? intc_set_in[gi][8*gj+3] : intc_set_in[gi][8*gj+2]):
                                                                          (module_select_fifo[gl][3*gi]   ? intc_set_in[gi][8*gj+1] : intc_set_in[gi][8*gj+0]));
        end


        // for(gj = 0; gj < 2**(STAGE_MODULE-gi-1) ; gj++ ) begin :fifo
        //   FifoBuffer #(.DATA_SIZE(32),      .CYCLES(1) )  fifo_raddr (.clk(clk), .rstn(1), .in(intc_set_middle[gi][gj].raddr), .out(intc_set_out[gi][gj].raddr));    
        //   FifoBuffer #(.DATA_SIZE(32),      .CYCLES(1) )  fifo_waddr (.clk(clk), .rstn(1), .in(intc_set_middle[gi][gj].waddr), .out(intc_set_out[gi][gj].waddr));    
        //   FifoBuffer #(.DATA_SIZE(E*FSIZE), .CYCLES(1) )  fifo_wdata (.clk(clk), .rstn(1), .in(intc_set_middle[gi][gj].wdata), .out(intc_set_out[gi][gj].wdata));    
        //   FifoBuffer #(.DATA_SIZE(1),       .CYCLES(1) )  fifo_wren  (.clk(clk), .rstn(1), .in(intc_set_middle[gi][gj].wren ), .out(intc_set_out[gi][gj].wren ));
        // end     
        // FifoBuffer #(.DATA_SIZE(($clog2(MODULE_NUM_IN_BUFF))),.CYCLES(1) )  fifo_slot11  (.clk(clk), .rstn(1), .in(module_select_fifo[gi]), .out(module_select_fifo[gi+1]));
      end

      for(gi = 0; gi < STAGE_MODULE_8_IN_BUFF-1; gi++) begin : module_select_fifo_r
        for(gj = 0 ; gj < 8**(STAGE_MODULE_8_IN_BUFF-gi-1); gj++)begin

            // for(gj = 0; gj < 2**(STAGE_MODULE-gi-1) ; gj++ ) begin :fifo
            FifoBuffer #(.DATA_SIZE(32),.CYCLES(1) )  
              fifo_raddr (.clk(clk), .rstn(1), .in(intc_set_middle[gi][gj].raddr), .out(intc_set_out[gi][gj].raddr));    
            FifoBuffer #(.DATA_SIZE(32),.CYCLES(1) )
              fifo_waddr (.clk(clk), .rstn(1), .in(intc_set_middle[gi][gj].waddr), .out(intc_set_out[gi][gj].waddr));    
            FifoBuffer #(.DATA_SIZE(E*FSIZE), .CYCLES(1) )
              fifo_wdata (.clk(clk), .rstn(1), .in(intc_set_middle[gi][gj].wdata), .out(intc_set_out[gi][gj].wdata));    
            FifoBuffer #(.DATA_SIZE(1),       .CYCLES(1) )
              fifo_wren  (.clk(clk), .rstn(1), .in(intc_set_middle[gi][gj].wren ), .out(intc_set_out[gi][gj].wren ));
            // end

            assign intc_set_in[gi+1][gj] = intc_set_out[gi][gj];
        end
      end

      // assign module_select_fifo[0] = module_select[gl];

      for(gi = 0; gi < MODULE_NUM_IN_BUFF; gi++) begin
        assign intc_set_in[0][gi] = module_outputs[gi];
      end

      for(gi = MODULE_NUM_IN_BUFF; gi < MODULE_NUM_IN_BUFF + 3; gi++) begin
        if( gi < 8**STAGE_MODULE_8_IN_BUFF)
          assign intc_set_in[0][gi] = '{default:'0};
      end
      
      assign ram_inputs[gl] = intc_set_middle[STAGE_MODULE_8_IN_BUFF-1][0];
    end


    
    // module <= slot
    logic [MODULE_NUM_IN_BUFF-1:0][$clog2(STAGE_SLOT_POWER_8_IN_BUFF)-1:0] slot_select_fifo;
    for(gi = 0; gi < MODULE_NUM_IN_BUFF ; gi++) begin: slot_fifo
        FifoBuffer #(.DATA_SIZE($clog2(SLOT_NUM_IN_BUFF)),       .CYCLES(1) )  fifo_slot11  (.clk(clk), .rstn(1), .in(slot_select[gi]), .out(slot_select_fifo[gi]));
    end

    for(gl = 0; gl < MODULE_NUM_IN_BUFF ; gl++) begin: slot_select_r

      // logic [$clog2(SLOT_NUM_IN_BUFF)-1:0] slot_select_fifo[0:STAGE_SLOT];

      logic [E*FSIZE-1:0] intc_indiv_in [0:STAGE_SLOT_8_IN_BUFF-1][0:STAGE_SLOT_POWER_8_IN_BUFF-1];
      logic [E*FSIZE-1:0] intc_indiv_out [0:STAGE_SLOT_8_IN_BUFF-1][0:STAGE_SLOT_POWER_8_IN_BUFF-1];
      logic [E*FSIZE-1:0] intc_indiv_middle [0:STAGE_SLOT_8_IN_BUFF-1][0:STAGE_SLOT_POWER_8_IN_BUFF-1];

      for(gi = 0; gi < STAGE_SLOT_8_IN_BUFF; gi++) begin : slot_to_stage

        // for(gj = 0; gj < 2**(STAGE_SLOT-gi) ; gj++ ) begin :fifo
        //   FifoBuffer #(.DATA_SIZE(E*FSIZE),       .CYCLES(1) )  fifo_indi  (.clk(clk), .rstn(1), .in(intc_indiv_in[gi][gj]), .out(intc_indiv_middle[gi][gj]));
        // end

        for(gj = 0; gj < 8**(STAGE_SLOT_8_IN_BUFF-gi-1) ; gj++ ) begin :fifo1
          // assign intc_indiv_middle[gi][gj] = slot_select_fifo[gl][2*gi+1] ? (slot_select_fifo[gl][2*gi] ? intc_indiv_in[gi][4*gj+3] : intc_indiv_in[gi][4*gj+2]) :
          //                                                                   (slot_select_fifo[gl][2*gi] ? intc_indiv_in[gi][4*gj+1] : intc_indiv_in[gi][4*gj]);
          assign intc_indiv_middle[gi][gj] = slot_select_fifo[gl][3*gi+2] ? (slot_select_fifo[gl][3*gi+1] ?
                                                                            (slot_select_fifo[gl][3*gi]   ? intc_indiv_in[gi][8*gj+7] : intc_indiv_in[gi][8*gj+6]) :
                                                                          (slot_select_fifo[gl][3*gi]   ? intc_indiv_in[gi][8*gj+5] : intc_indiv_in[gi][8*gj+4])) :
                                                                          (slot_select_fifo[gl][3*gi+1] ?
                                                                            (slot_select_fifo[gl][3*gi]   ? intc_indiv_in[gi][8*gj+3] : intc_indiv_in[gi][8*gj+2]) :
                                                                          (slot_select_fifo[gl][3*gi]   ? intc_indiv_in[gi][8*gj+1] : intc_indiv_in[gi][8*gj+0]));
        end

        // FifoBuffer #(.DATA_SIZE(($clog2(SLOT_NUM_IN_BUFF))),.CYCLES(1) )  fifo_slot12  (.clk(clk), .rstn(1), .in(slot_select_fifo[gi]), .out(slot_select_fifo[gi+1]));

      end

      for(gi = 0; gi < STAGE_SLOT_8_IN_BUFF-1; gi++) begin : slot_select_fifo_r
        for(gj = 0 ; gj < 8**(STAGE_SLOT_8_IN_BUFF-gi-1); gj++)begin
            FifoBuffer #(.DATA_SIZE(E*FSIZE),       .CYCLES(1) )  fifo_indi  (.clk(clk), .rstn(1), .in(intc_indiv_middle[gi][gj]), .out(intc_indiv_out[gi][gj]));
            assign intc_indiv_in[gi+1][gj] = intc_indiv_out[gi][gj];
        end
      end

      // assign slot_select_fifo[0] = slot_select[gl];

      for(gi = 0; gi < SLOT_NUM_IN_BUFF; gi++) begin
        assign intc_indiv_in[0][gi] = ram_outputs[gi];
      end

      for(gi = SLOT_NUM_IN_BUFF; gi < SLOT_NUM_IN_BUFF + 3; gi++) begin
        if( gi < 8**STAGE_SLOT_8_IN_BUFF)
          assign intc_indiv_in[0][gi] = '{default:'0};
      end
      
      assign module_inputs[gl] = intc_indiv_middle[STAGE_SLOT_8_IN_BUFF - 1][0];
    end

   
  endgenerate
  
  always_comb begin
    
	end
endmodule