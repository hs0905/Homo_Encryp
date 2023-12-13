`timescale 1ps / 1ps

import USER_PKG::*;
import FHE_ALU_PKG::*;

module tb_intc_benes;

parameter CLK_PERIOD = 10;

logic clk;
logic rst_n;
logic [DATA_WIDTH-1:0]    i_ram_outputs		[0:SLOT_NUM_IN_BUFF-1];
logic [DATA_WIDTH-1:0]    o_module_inputs	[0:MODULE_NUM_IN_BUFF-1]; 	
logic [SWITCH_NUM-1:0]	  i_module_select	[0:STAGE_NUM-1];
logic [SWITCH_NUM-1:0]	  i_slot_select		[0:STAGE_NUM-1];
BufferRAMTEFsizeInputs 	  o_ram_inputs		[0:SLOT_NUM_IN_BUFF-1];
BufferRAMTEFsizeInputs 	  i_module_outputs[0:MODULE_NUM_IN_BUFF-1]; 

/*task read_data();
  int file;
  string line;
  logic [SWITCH_NUM-1:0] i_module_select [0:STAGE_NUM-1]; // 2D 배열 선언

  file = $fopen("/home/hs/Desktop/FHE/fhe_benes/fhe_interconnect/step1/C_code/output.txt","r");
  if (!file) $display("Error opening file");
  else begin
    for (int i = 0; i < STAGE_NUM; i++) begin
      if (!$feof(file)) begin
        $fgets(line, file);
        // 'line'에서 SWITCH_NUM 길이의 이진 데이터를 파싱하여 i_module_select[i]에 저장
        sscanf(line, "%b", i_module_select[i]);
      end
      else begin
        $display("End of file reached or insufficient data for all stages.");
        break;
      end
    end
    $fclose(file);
  end
endtask */

always begin
  clk = 1'b1;
  #(CLK_PERIOD/2);
  clk = 1'b0;
  #(CLK_PERIOD/2);
end


//simulation flow
initial begin
rst_n = 1'b0;
#(CLK_PERIOD*10);
foreach(i_ram_outputs[i])   i_ram_outputs[i]   = 0;
foreach(i_module_select[i]) i_module_select[i] = 0;
foreach(i_slot_select[i])   i_slot_select[i]   = 0;
foreach(i_module_outputs[i]) begin
  i_module_outputs[i].raddr = 0;
  i_module_outputs[i].waddr = 0;
  i_module_outputs[i].wdata = 0;
  i_module_outputs[i].wren  = 0;
end
rst_n = 1'b1;
#(CLK_PERIOD*10);
//read_data(); // read data from file -> set the switch settings
// switch setttings for (module/slot) selection
i_module_select[0] = 16'hA300;
i_module_select[1] = 16'h00A8;
i_module_select[2] = 16'hE0E4;
i_module_select[3] = 16'h183C;
i_module_select[4] = 16'h1014;
i_module_select[5] = 16'h1014;
i_module_select[6] = 16'h2020;
i_module_select[7] = 16'h2810;
i_module_select[8] = 16'h2D00;

i_slot_select[0] = 16'hA300;
i_slot_select[1] = 16'h00A8;
i_slot_select[2] = 16'hE0E4;
i_slot_select[3] = 16'h183C;
i_slot_select[4] = 16'h1014;
i_slot_select[5] = 16'h1014;
i_slot_select[6] = 16'h2020;
i_slot_select[7] = 16'h2810;
i_slot_select[8] = 16'h2D00;

#(CLK_PERIOD*10);
$display("Start simulation");

//input data for RAM(slot)
for(int i = 0; i<SLOT_NUM_IN_BUFF; i++) begin // 0 ~ 19
i_module_outputs[i].raddr = i;
i_module_outputs[i].waddr = i;
i_module_outputs[i].wdata = i;
i_module_outputs[i].wren  = 1;
end

//input data for module
for(int i = 0; i<MODULE_NUM_IN_BUFF; i++) begin // 0 ~ 19
i_ram_outputs[i] = i;
end

$display("wait for 20 clk cycles");
#(CLK_PERIOD*20);
$finish;


end




Interconnect_benes DUT(
  .clk(clk),
  .rst_n(rst_n),
  .i_ram_outputs(i_ram_outputs),
  .i_module_outputs(i_module_outputs),
  .i_module_select(i_module_select),
  .i_slot_select(i_slot_select),
  .o_ram_inputs(o_ram_inputs),
  .o_module_inputs(o_module_inputs)
);


endmodule
