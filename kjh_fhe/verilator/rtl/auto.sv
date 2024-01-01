`timescale 1 ns / 1 ns

`include "defines.vh"
import FHE_ALU_PKG::*;


module Unit_permutater_dummy #(
		parameter DATA_SIZE     = FSIZE,
		parameter ELEMS         = E		
	) (	
    input logic	                        clk,	
	input logic	                        rstn,	
    input logic   [DATA_SIZE*E-1:0]     in,
    input logic                         in_valid,
    input logic                         in_last,

    input logic   [logE-1:0]            auto_offset,
    input logic   [DATA_SIZE -1:0]      control_bit_offset,
    input logic   [DATA_SIZE -1:0]      k,
    input logic   [FSIZE-1:0]           p,

    output logic  [DATA_SIZE*E-1:0]     out,
    output logic                        out_valid,
    output logic                        out_last

  );

  typedef struct packed {   
    logic [logE-1:0][0:0] valid_fifo;
    logic [logE-1:0][0:0] last;

    logic [logE-1:0] auto_offset;
    logic [logE:0][E-1:0][logE:0] control_bit;
    logic [logE:0][E-1:0][DATA_SIZE-1:0] middle_stages;
  } Registers;  

  Registers reg_current,reg_next;

  logic last_in, last_out;
  FifoBuffer #(.DATA_SIZE(1), .CYCLES(MULT_CYCLES+3+1) )  last_fifo (.clk(clk), .rstn(1), .in(last_in), .out(last_out));

  logic valid_in, valid_out;
  FifoBuffer #(.DATA_SIZE(1), .CYCLES(3+1) )  valid_fifo (.clk(clk), .rstn(1), .in(valid_in), .out(valid_out));

  logic [DATA_SIZE -1:0] control_bit_offset_in, control_bit_offset_out;
  FifoBuffer #(.DATA_SIZE(DATA_SIZE), .CYCLES(MULT_CYCLES+1) )  control_bit_fifo (.clk(clk), .rstn(1), .in(control_bit_offset_in), .out(control_bit_offset_out));

  logic [DATA_SIZE*E -1:0] in_data_in, in_data;
  FifoBuffer #(.DATA_SIZE(DATA_SIZE*E), .CYCLES(MULT_CYCLES) )  in_data_fifo (.clk(clk), .rstn(1), .in(in_data_in), .out(in_data));

  logic [E-1:0][0:0] mult1_in_valid,mult1_out_valid;
  logic [E-1:0][FSIZE-1:0] mult1_in_A;
  logic [E-1:0][FSIZE-1:0] mult1_in_B; 
  logic [E-1:0][FSIZE*2-1:0] mult1_out;     

  genvar gi,gj,gk;
  generate   
    for(gi = 0; gi < E; gi++) begin : make_control
        
        Mult #(.DATA_SIZE(FSIZE), .CYCLES(MULT_CYCLES)) mult1 (
            .clk(clk),
            .rstn(rstn),
            .in_valid(mult1_in_valid[gi]),
            .out_valid(mult1_out_valid[gi]),
            .in_A(mult1_in_A[gi]),
            .in_B(mult1_in_B[gi]),
            .out(mult1_out[gi])
        );
    end
  endgenerate
  
  always_comb begin
    out = 0;
    out_valid = valid_out;
    valid_in =  mult1_out_valid;
    last_in = in_last;
    out_last = last_out;
    in_data_in = in;
    control_bit_offset_in = control_bit_offset;

    
    for(int i  = 0; i < logE ; i++) begin   
        reg_next.auto_offset = auto_offset; 
    end

    for(int i  = 0; i < E ; i++) begin    
        mult1_in_A[i] = k;
        mult1_in_B[i] = i;
        mult1_in_valid[i] = in_valid;
    end
   
    
    
    
    for(int i  = 0; i < E ; i++) begin    
        reg_next.control_bit[0][i] = 0;    
        if(mult1_out_valid) reg_next.control_bit[0][i] = (mult1_out[i] + control_bit_offset_out) & 4'b1111; //mask(3bits) = (1<<logE) -1 

        // reg_next.control_bit[1][i] = reg_current.control_bit[0][i];
        // reg_next.control_bit[2][i] = reg_current.control_bit[1][i];
    end

    //stage1

    for(int i  = 0; i < E ; i++) begin 
        reg_next.middle_stages[0][i] = in_data[FSIZE*i +: FSIZE];
    end

    // for(int i  = 0; i < E ; i++) begin    
    //     if((i % 2) == 1 ) begin
    //         if(reg_current.control_bit[0][i][0] == 1) reg_next.middle_stages[0][i] = in_data[FSIZE*i +: FSIZE];
    //         else                                      reg_next.middle_stages[0][i] = in_data[FSIZE*(i-1) +: FSIZE];
    //     end
    //     else begin
    //         if(reg_current.control_bit[0][i][0] == 0) reg_next.middle_stages[0][i] = in_data[FSIZE*i +: FSIZE];
    //         else                                      reg_next.middle_stages[0][i] = in_data[FSIZE*(i+1) +: FSIZE];
    //     end
    // end

    //stage2
    // for(int i  = 0; i < E ; i++) begin    
    //     if((i>>1)%2 == 1 ) begin
    //         if(reg_current.control_bit[1][i][1]==1) reg_next.middle_stages[1][i] = reg_current.middle_stages[0][i];
    //         else                                    reg_next.middle_stages[1][i] = reg_current.middle_stages[0][i-2];
    //     end
    //     else begin
    //         if(reg_current.control_bit[1][i][1]==0) reg_next.middle_stages[1][i] = reg_current.middle_stages[0][i];
    //         else                                    reg_next.middle_stages[1][i] = reg_current.middle_stages[0][i+2];
    //     end
    // end


    // //stage3
    // for(int i  = 0; i < E ; i++) begin    
    //     if((i>>2)%2 == 1 ) begin
    //         if(reg_current.control_bit[2][i][2]==1) reg_next.middle_stages[2][i] = reg_current.middle_stages[1][i];
    //         else                                    reg_next.middle_stages[2][i] = reg_current.middle_stages[1][i-4];
    //     end
    //     else begin
    //         if(reg_current.control_bit[2][i][2]==0) reg_next.middle_stages[2][i] = reg_current.middle_stages[1][i];
    //         else                                    reg_next.middle_stages[2][i] = reg_current.middle_stages[1][i+4];
    //     end
    // end
    for(int j  = 0; j < logE ; j++) begin
        for(int i  = 0; i < E ; i++) begin    
            if((i>>j)%2 == 1 ) begin
                if((reg_current.control_bit[j][i][j]==1)) begin
                    reg_next.middle_stages[j+1][i] = reg_current.middle_stages[j][i];
                    reg_next.control_bit[j+1][i] = reg_current.control_bit[j][i];
                end
                else begin
                    reg_next.middle_stages[j+1][i] = reg_current.middle_stages[j][i-(1<<j)];
                    if(j < reg_current.auto_offset) reg_next.middle_stages[j+1][i] = reg_current.middle_stages[j][i];
                    reg_next.control_bit[j+1][i] = reg_current.control_bit[j][i-(1<<j)];
                    // if(j == logE-1) reg_next.control_bit[j+1][i] = reg_current.control_bit[j][i];

                    
                end

            end
            else begin
                if((reg_current.control_bit[j][i][j]==0)) begin
                    reg_next.middle_stages[j+1][i] = reg_current.middle_stages[j][i];
                    reg_next.control_bit[j+1][i] = reg_current.control_bit[j][i];
                end
                else begin                                         
                    reg_next.middle_stages[j+1][i] = reg_current.middle_stages[j][i+(1<<j)];
                    if(j < reg_current.auto_offset) reg_next.middle_stages[j+1][i] = reg_current.middle_stages[j][i];
                    reg_next.control_bit[j+1][i] = reg_current.control_bit[j][i+(1<<j)];
                    // if(j == logE-1) reg_next.control_bit[j+1][i] = reg_current.control_bit[j][i];
                end
            end
        end
    end
    
    for(int i  = 0; i < E ; i++) begin    
        out[FSIZE*i +: FSIZE] = reg_current.middle_stages[3][i];
        if((reg_current.control_bit[3][i][3] == 1) && (reg_current.auto_offset !=0) && (reg_current.middle_stages[3][i] != 0) ) out[FSIZE*i +: FSIZE] = p- reg_current.middle_stages[3][i];
    end

    // out[63:0] = reg_current.middle_stages[3][0];
    // if((reg_current.control_bit[3][0][3] == 1) && (reg_current.auto_offset !=0) && (reg_current.middle_stages[3][0] != 0)) out[63:0]   = p - reg_current.middle_stages[3][0];
    // out[127:64] = reg_current.middle_stages[3][1];
    // if((reg_current.control_bit[3][1][3] == 1) && (reg_current.auto_offset !=0) && (reg_current.middle_stages[3][1] != 0)) out[127:64] = p - reg_current.middle_stages[3][1]; 
    // out[191:128] = reg_current.middle_stages[3][2];
    // if((reg_current.control_bit[3][2][3] == 1) && (reg_current.auto_offset !=0) && (reg_current.middle_stages[3][2] != 0)) out[191:128] = p - reg_current.middle_stages[3][2];
    // out[255:192] = reg_current.middle_stages[3][3];
    // if((reg_current.control_bit[3][3][3] == 1) && (reg_current.auto_offset !=0) && (reg_current.middle_stages[3][3] != 0)) out[255:192] = p - reg_current.middle_stages[3][3];
    // out[319:256] = reg_current.middle_stages[3][4];
    // if((reg_current.control_bit[3][4][3] == 1) && (reg_current.auto_offset !=0) && (reg_current.middle_stages[3][4] != 0)) out[319:256] = p - reg_current.middle_stages[3][4];
    // out[383:320] = reg_current.middle_stages[3][5];
    // if((reg_current.control_bit[3][5][3] == 1) && (reg_current.auto_offset !=0) && (reg_current.middle_stages[3][5] != 0)) out[383:320] = p - reg_current.middle_stages[3][5];
    // out[447:384] = reg_current.middle_stages[3][6];
    // if((reg_current.control_bit[3][6][3] == 1) && (reg_current.auto_offset !=0) && (reg_current.middle_stages[3][6] != 0)) out[447:384] = p - reg_current.middle_stages[3][6];
    // out[511:448] = reg_current.middle_stages[3][7];
    // if((reg_current.control_bit[3][7][3] == 1) && (reg_current.auto_offset !=0) && (reg_current.middle_stages[3][7] != 0)) out[511:448] = p - reg_current.middle_stages[3][7];

  end

  always @ (posedge clk) begin  
    reg_current <= reg_next;
  end

endmodule

module AutomorphismControl_v1 #(
	) (	
		input logic	clk,		    		
		input logic rstn,			

		input logic start_auto,

        input logic [FSIZE-1:0] p,
        input logic [logE-1:0] auto_offset, //not optimize
        input logic [logN-1:0] auto_base, //not optimize   

        input logic [FSIZE-1:0] k,
    
		output logic auto_working,

        output BufferRAMTEFsizeInputs ram_inputs,
        input logic [E*FSIZE-1:0] ram_outputs_rdata
  );
 

  typedef struct packed {
    logic state_STATE_AUTO;
    logic state_STATE_AUTO_WAIT;

    logic [logE-1:0] auto_offset; //not optimize
    logic [logN-1:0] auto_base; //not optimize   
    logic [FSIZE-1:0] k;
    logic [FSIZE-1:0] p;

    logic [logN -logE -1:0] load_idx_above_base; //13 - 3 = 10
    logic [logN -logE -1:0] load_idx_below_base;
    logic [logN -logE -1:0] inverted_load_idx_below_base;

    logic[FSIZE-1 :0] rotate_amount;

    logic [logN-logE-1:0] raddr_auto;

    logic [FSIZE -1:0] control_bit_offset;

  } Registers;

  Registers reg_current,reg_next;

  logic auto_in_valid_in, auto_in_valid;
  FifoBuffer #(.DATA_SIZE(1), .CYCLES(BUFFER_READ_LATENCY+1) )  auto_in_valid_fifo (.clk(clk), .rstn(1), .in(auto_in_valid_in), .out(auto_in_valid));

  logic auto_in_last_in, auto_in_last;
  FifoBuffer #(.DATA_SIZE(1), .CYCLES(BUFFER_READ_LATENCY+1) )  auto_in_last_fifo (.clk(clk), .rstn(1), .in(auto_in_last_in), .out(auto_in_last));

  logic [logN-logE-1:0]  waddr_auto_in, waddr_auto;
  // FifoBuffer #(.DATA_SIZE(logN-logE), .CYCLES(BUFFER_READ_LATENCY + 2 + 1 + MULT_CYCLES + BUFFER_WRITE_DELAY + 1) )  waddr_in_fifo (.clk(clk), .rstn(1), .in(waddr_auto_in), .out(waddr_auto));
  FifoBuffer #(.DATA_SIZE(logN-logE), .CYCLES(BUFFER_READ_LATENCY + 2 + 1 + MULT_CYCLES + 1) )  waddr_in_fifo (.clk(clk), .rstn(1), .in(waddr_auto_in), .out(waddr_auto));
  
  logic [E*FSIZE-1:0] auto_data_in, auto_data_out, auto_data_out_delayed;  
  logic unit_perm_out_valid, unit_perm_out_valid_delayed;
  logic unit_perm_out_last;
  logic [FSIZE-1 :0] control_bit_offset_in, control_bit_offset;
  FifoBuffer #(.DATA_SIZE(FSIZE), .CYCLES(BUFFER_READ_LATENCY) )  control_bit_fifo (.clk(clk), .rstn(1), .in(control_bit_offset_in), .out(control_bit_offset));

  // FifoBuffer #(.DATA_SIZE(E*FSIZE), .CYCLES(BUFFER_WRITE_DELAY) )  auto_out_delay_fifo (.clk(clk), .rstn(1), .in(auto_data_out), .out(auto_data_out_delayed));
  // FifoBuffer #(.DATA_SIZE(1), .CYCLES(BUFFER_WRITE_DELAY) )  auto_valid_delay_fifo (.clk(clk), .rstn(1), .in(unit_perm_out_valid), .out(unit_perm_out_valid_delayed));

  Unit_permutater_dummy #(.DATA_SIZE(FSIZE), .ELEMS(E) )  
  unit_perm_dum (
    .clk(clk), 
    .rstn(rstn), 
    .in(auto_data_in), 
    .in_valid(auto_in_valid), 
    .in_last(auto_in_last), 
    .auto_offset(reg_current.auto_offset),
    .control_bit_offset(control_bit_offset),
    .k(reg_current.k),
    .p(reg_current.p),

    .out(auto_data_out), 
    .out_valid(unit_perm_out_valid),
    .out_last(unit_perm_out_last)
  );



  always_comb begin
    reg_next = reg_current;

    ram_inputs = '{default:'0};
    
    if(start_auto) begin        
      reg_next.state_STATE_AUTO = 1;

      reg_next.auto_offset = auto_offset;
      reg_next.auto_base = auto_base;
      reg_next.k = k;
      reg_next.p = p;

      reg_next.load_idx_above_base = 0;
      reg_next.load_idx_below_base = 0;
      reg_next.inverted_load_idx_below_base = 0;
      reg_next.rotate_amount = 0;
  
      // reg_next.control_bit_offset = 0; //in_offset   <= rotate_amount
    end

    auto_data_in = ram_outputs_rdata;
    auto_in_valid_in = 0;
    auto_in_last_in = 0;
    // reg_next.control_bit_offset = 0;

    control_bit_offset_in = 0;//= reg_current.control_bit_offset;

    reg_next.raddr_auto=0;

    if(reg_current.state_STATE_AUTO) begin
      auto_in_valid_in = 1;
      reg_next.inverted_load_idx_below_base = reg_current.inverted_load_idx_below_base + reg_current.k;
      reg_next.rotate_amount = reg_current.rotate_amount + reg_current.k;

      reg_next.raddr_auto = (reg_current.load_idx_above_base << (reg_current.auto_base) ) | (( ( ( 1 <<  (logN - 2 -logE))-1 ) >> ((logN-2) - logE - reg_current.auto_base)) & reg_current.inverted_load_idx_below_base);

      // reg_next.control_bit_offset = (reg_current.rotate_amount >> reg_current.auto_base) & 4'b1111;//
      control_bit_offset_in = (reg_current.rotate_amount >> reg_current.auto_base) & 4'b1111;//

      reg_next.load_idx_below_base = reg_current.load_idx_below_base + 1;

      if(reg_current.load_idx_below_base == (1 << reg_current.auto_base) - 1) begin
        reg_next.load_idx_below_base = 0;
        reg_next.inverted_load_idx_below_base = 0;
        reg_next.rotate_amount = 0;
        reg_next.load_idx_above_base = reg_current.load_idx_above_base + 1;

        if(reg_current.load_idx_above_base == ( ( 1 <<  (logN - logE -2 - reg_current.auto_base))-1) ) begin
          reg_next.state_STATE_AUTO = 0;
          reg_next.state_STATE_AUTO_WAIT = 1;
          auto_in_last_in = 1;
        //   reg_next.load_idx_above_base = reg_current.load_idx_above_base;
          
        end
      end
    end

    ram_inputs.raddr = reg_current.raddr_auto; 
    waddr_auto_in = reg_current.raddr_auto;

    if(reg_current.state_STATE_AUTO_WAIT || reg_current.state_STATE_AUTO) begin
      if(unit_perm_out_valid) begin
        if(unit_perm_out_last) begin
            reg_next.state_STATE_AUTO_WAIT = 0;
            reg_next.state_STATE_AUTO = 0;
        end
      end
    end

    // ram_inputs.wren  = unit_perm_out_valid_delayed;    
    // ram_inputs.waddr = waddr_auto;
    // ram_inputs.wdata = auto_data_out_delayed; 
    ram_inputs.wren  = unit_perm_out_valid;    
    ram_inputs.waddr = waddr_auto;
    ram_inputs.wdata = auto_data_out; 

    auto_working = 0;
    // if(reg_current.state_STATE_AUTO_WAIT || reg_current. state_STATE_AUTO|| unit_perm_out_valid_delayed) auto_working = 1;
    if(reg_current.state_STATE_AUTO_WAIT || reg_current. state_STATE_AUTO) auto_working = 1;

    if(rstn == 0) begin
      reg_next.state_STATE_AUTO = 0;      
      reg_next.state_STATE_AUTO_WAIT = 0;      
    end
  end
       
    
  always @ (posedge clk) begin  
    reg_current <= reg_next;
	end

endmodule
