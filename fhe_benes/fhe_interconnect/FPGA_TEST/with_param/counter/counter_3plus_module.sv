`timescale 1ps/1ps

module test_counter_3plus(
  input  logic clk,
  input  logic rst_n,
  output logic [7:0] out_wire
);

logic [7:0] out_reg;

always_ff @(posedge clk, negedge rst_n) begin
  if(!rst_n)
  out_reg <= 0;
  else if(out_reg + 3 > 255)
  out_reg <= 0;
  else
  out_reg <= out_reg + 3;
end

assign out_wire = out_reg;

endmodule