package util_pack;

parameter integer PARAM_ADDRESS_SIZE = 32;
parameter integer PARAM_DATA_SIZE    = 512;

  typedef struct packed{
  logic [PARAM_ADDRESS_SIZE-1:0]        raddr;
  logic [PARAM_ADDRESS_SIZE-1:0]        waddr;
  logic [PARAM_DATA_SIZE -1:0]          wdata;
  logic                                 wren;
} BufferRAMTEFsizeInputs;
  endpackage