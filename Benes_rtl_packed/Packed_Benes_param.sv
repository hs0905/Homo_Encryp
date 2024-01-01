package Packed_Benes_param;

  localparam E          = 8;
  localparam FSIZE      = 64;
  localparam SIZE       = 32;
  localparam SWITCH_NUM = (SIZE/2);
  localparam DATA_WIDTH = E*FSIZE;
  localparam LAYER_NUM  = $clog2(SIZE);
  localparam STAGE_NUM  = 2*($clog2(SIZE))-1;
  localparam BUFFER_NUM = STAGE_NUM-1;
  localparam MID_STAGE  = STAGE_NUM/2;
  
  function int abs(int x);
    return (x < 0) ? -x : x;
  endfunction

  function int pow(int base, int exponent);
    automatic int result = 1;
    for (int i = 0; i < exponent; i = i + 1) begin
      result = result * base;
    end
    return result;
  endfunction

endpackage