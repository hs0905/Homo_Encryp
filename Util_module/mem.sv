module mem_512#(
  parameter integer DATA_WIDTH = 512,
  parameter integer ADDR_WIDTH = 9,
  parameter integer ADDR_END   = 2**ADDR_WIDTH
)
(
  input   logic                   CLK,
  input   logic                   RSTN,
  input   logic                   WR_EN,
  input   logic                   RD_EN,
  input   logic [DATA_WIDTH-1:0]  WR_DATA,
  output  logic [DATA_WIDTH-1:0]  RD_DATA
);

localparam idle_state  = 0;
localparam write_state = 1;
localparam read_state  = 2;
localparam x_state     = 3;



logic [DATA_WIDTH-1:0] mem [0:2**ADDR_WIDTH-1];
logic [ADDR_WIDTH-1:0] read_addr;
logic [ADDR_WIDTH-1:0] write_addr;
logic [1:0]            current_state;
logic [1:0]            next_state;

always_ff@(posedge CLK)begin
  if((WR_EN == 0) && (RD_EN == 0)) begin
    next_state <= idle_state;
  end else if((WR_EN == 1) && (RD_EN == 0))begin
    next_state <= write_state;
  end else if((WR_EN == 0) && (RD_EN == 1)) begin
    next_state <= read_state;
  end else begin
    next_state <= x_state;
  end
end

always_ff@(posedge CLK) begin
  if(!RSTN) begin
    current_state <= idle_state;
  end else begin
    current_state <= next_state;
  end
end

/*always_ff@(posedge CLK or negedge RSTN) begin
  if(!RSTN || current_state == x_state) begin
    write_addr        <= 0;
    read_addr         <= 0;
    for(int i = 0; i<ADDR_END; i++) mem[i] <= 0;
  end else if(current_state == write_state) begin
    if(write_addr == ADDR_END - 1) begin
      mem[write_addr] <= WR_DATA;
      write_addr      <= 0;
    end else if(write_addr < ADDR_END) begin
      mem[write_addr] <= WR_DATA;
      write_addr      <= write_addr + 1;
    end
  end else if(current_state == read_state) begin
    if(read_addr == ADDR_END-1) begin
      RD_DATA         <= mem[read_addr];
      read_addr       <= 0;
    end else if(read_addr < ADDR_END) begin
      RD_DATA         <= mem[read_addr];
      read_addr       <= read_addr + 1;
    end
  end 
end*/


always_ff@(posedge CLK or negedge RSTN) begin
  if(!RSTN) begin
    write_addr        <= 0;
    read_addr         <= 0;
    for(int i = 0; i<ADDR_END; i++) mem[i] = 0;
  end else if(current_state == write_state) begin
    if(write_addr < ADDR_END) begin
      mem[write_addr] <= WR_DATA;
      write_addr      <= write_addr + 1;
    end else if(write_addr == ADDR_END - 1) begin
      mem[write_addr] <= WR_DATA;
      write_addr      <= 0;
    end
  end else if(current_state == read_state) begin
    if(read_addr < ADDR_END) begin
      RD_DATA         <= mem[read_addr];
      read_addr       <= read_addr + 1;
    end else if(read_addr == ADDR_END-1) begin
      RD_DATA         <= mem[read_addr];
      read_addr       <= 0;
    end
  end else if(current_state == x_state) begin
    write_addr        <= 0;
    read_addr         <= 0;
    for(int i = 0; i<ADDR_END; i++) mem[i] <= 0;
  end
end
endmodule