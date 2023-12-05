
`timescale 1 ns / 1 ps

	module Axi_lite_v1_0_S00_AXI #
	(
		localparam DATA_WIDTH = 4,
		localparam PORT_NUM = 8,
		localparam SWITCH_NUM = (PORT_NUM/2),
		localparam LAYER_NUM = $clog2(PORT_NUM),
		localparam STAGE_NUM = (LAYER_NUM * 2) - 1,
		localparam C_S_AXI_DATA_INPUT_WIDTH = 32, // INPUT WIDTH is mult of Switch_num and stage_num (4 * 5)
		localparam C_S_AXI_DATA_OUTPUT_WIDTH = 32, // OUTPUT WIDTH is mult of port num and data width (8 * 8)
		//localparam integer C_S_AXI_DATA_WIDTH	= 32,
		localparam  C_S_AXI_WRITE_ADDR_WIDTH	= 5,
		localparam  C_S_AXI_READ_ADDR_WIDTH		= 5
	)
	(
		input wire  																		S_AXI_ACLK,
		input wire 	 																		S_AXI_ARESETN,
		input wire [C_S_AXI_WRITE_ADDR_WIDTH-1 : 0] 										S_AXI_AWADDR,
		input wire [2 : 0] 																	S_AXI_AWPROT,
		input wire  																		S_AXI_AWVALID,
		output wire  																		S_AXI_AWREADY,
		input wire [C_S_AXI_DATA_INPUT_WIDTH-1 : 0] 										S_AXI_WDATA, 		//받아와서 나누어 저장하는 식으로 하자	(20 / stage_num)
		input wire [(C_S_AXI_DATA_INPUT_WIDTH/8)-1 : 0] 									S_AXI_WSTRB,		//byte 단위로 strb 결정
		input wire  																		S_AXI_WVALID,
		output wire  																		S_AXI_WREADY,
		output wire [1 : 0] 																S_AXI_BRESP,
		output wire  																		S_AXI_BVALID,
		input wire  																		S_AXI_BREADY,
		input wire [C_S_AXI_READ_ADDR_WIDTH-1 : 0] 											S_AXI_ARADDR, 	// 주소 비트는 5비트
		input wire [2 : 0] 																	S_AXI_ARPROT,
		input wire  																		S_AXI_ARVALID,
		output wire  																		S_AXI_ARREADY,
		output wire [C_S_AXI_DATA_OUTPUT_WIDTH-1 : 0] 										S_AXI_RDATA,		//받아와서 나누어 저장하는 식으로 하자(64/8)
		output wire [1 : 0] 																S_AXI_RRESP,
		output wire  																		S_AXI_RVALID,
		input wire  																		S_AXI_RREADY
	);

	// AXI4LITE signals
	reg [C_S_AXI_WRITE_ADDR_WIDTH-1 : 0] 									axi_awaddr;
	reg  																	axi_awready;
	reg  																	axi_wready;
	reg [1 : 0] 															axi_bresp;
	reg  																	axi_bvalid;
	reg [C_S_AXI_READ_ADDR_WIDTH-1 : 0] 									axi_araddr;
	reg  																	axi_arready;
	reg [C_S_AXI_DATA_OUTPUT_WIDTH-1 : 0] 									axi_rdata; // 64bit
	reg [1 : 0] 															axi_rresp;
	reg  																	axi_rvalid;

	localparam integer WADDR_LSB = (C_S_AXI_DATA_INPUT_WIDTH/32) + 1; // 
	localparam integer RADDR_LSB = (C_S_AXI_DATA_OUTPUT_WIDTH/32) + 1; // 
	localparam integer OPT_MEM_ADDR_BITS = 2; 

	//----------------------------------------------
	//-- Signals for user logic register space example
	//------------------------------------------------
	//-- Number of Slave Registers 8
	reg [SWITCH_NUM-1:0]		slv_reg0;
	reg [SWITCH_NUM-1:0]		slv_reg1;
	reg [SWITCH_NUM-1:0]		slv_reg2;
	reg [SWITCH_NUM-1:0]		slv_reg3;
	reg [SWITCH_NUM-1:0]		slv_reg4;
	//reg [C_S_AXI_DATA_WIDTH-1:0]		slv_reg5;
	//reg [C_S_AXI_DATA_WIDTH-1:0]		slv_reg6;
	//reg [C_S_AXI_DATA_WIDTH-1:0]		slv_reg7;
	wire	 													slv_reg_rden;		// read enable
	wire	 													slv_reg_wren;  	// write enable
	reg [C_S_AXI_DATA_OUTPUT_WIDTH-1:0]	 						reg_data_out;		// data_out
	integer	 													byte_index;
	reg	 														aw_en;					// address write enable?

	// I/O Connections output assignments
	assign S_AXI_AWREADY	= axi_awready;	 // output
	assign S_AXI_WREADY		= axi_wready; 		 // output
	assign S_AXI_BRESP		= axi_bresp; 			 // output
	assign S_AXI_BVALID		= axi_bvalid; 	   // output
	assign S_AXI_ARREADY	= axi_arready;   // output
	assign S_AXI_RDATA		= axi_rdata; 			 //	output 
	assign S_AXI_RRESP		= axi_rresp; 			 //	output
	assign S_AXI_RVALID		= axi_rvalid;      //	output


// [AW channel]
	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 ) begin 	// 리셋이면
	      axi_awready <= 1'b0; 						// awready를 0으로 초기화
	      aw_en <= 1'b1;									// aw_enable을 0으로 초기화
	    end else begin    
	      if (~axi_awready && S_AXI_AWVALID && S_AXI_WVALID && aw_en) begin// master가 awvalid와 wvalid신호를 전송하고, aw_en일때       
	          axi_awready <= 1'b1; // awready를 high로 설정
	          aw_en <= 1'b0; // awready를 low로 설정 왜?(handshake가 일어나며 awaddress 신호를 이미 수신했으므로)
	      end else if (S_AXI_BREADY && axi_bvalid) begin // Bready와 bvalid가 high일때(wdata를 수신완료)
	              aw_en <= 1'b1;
	              axi_awready <= 1'b0;
	      end else begin
	          axi_awready <= 1'b0; // write를 받을 준비가 됐거나, write를 종료했거나 둘다 아닌 기본 상태일 때
	        end
	    end 
	end       

//[awaddress] 관리
	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 ) 
	    axi_awaddr <= 0; // 주소 초기화
	  else if (~axi_awready && S_AXI_AWVALID && S_AXI_WVALID && aw_en) // awready가 low고, awvalid/wvalid/aw_en이 high일 때(write address를 입력할 준비)
	    axi_awaddr <= S_AXI_AWADDR;
	end

//[W Channel] write data 관리
	always @( posedge S_AXI_ACLK )begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    axi_wready <= 1'b0;
	  else if(~axi_wready && S_AXI_WVALID && S_AXI_AWVALID && aw_en ) // write할 준비가 됐는지?
	    axi_wready <= 1'b1;
	  else
	    axi_wready <= 1'b0;
	end      

assign slv_reg_wren = axi_wready && S_AXI_WVALID && axi_awready && S_AXI_AWVALID; // slave register에 write할 준비가 됐는지?
	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 ) begin
	      slv_reg0 <= 0;
	      slv_reg1 <= 0;
	      slv_reg2 <= 0;
	      slv_reg3 <= 0;
	      slv_reg4 <= 0;
     	//slv_reg5 <= 0;
	    //slv_reg6 <= 0;
	    //slv_reg7 <= 0;
	    end else begin
	    if (slv_reg_wren) begin // hard coding 
		slv_reg0 <= S_AXI_WDATA[31:28];
	    slv_reg1 <= S_AXI_WDATA[27:24];
	    slv_reg2 <= S_AXI_WDATA[23:20];
	    slv_reg3 <= S_AXI_WDATA[19:16];
	    slv_reg4 <= S_AXI_WDATA[15:12];
			end
		end
	end    

// [B channel]
always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 ) begin
	      axi_bvalid  <= 0;
	      axi_bresp   <= 2'b0;
	  end else begin    
	    if (axi_awready && S_AXI_AWVALID && ~axi_bvalid && axi_wready && S_AXI_WVALID) begin // aw과 w hs발생 및, bvalid가 일때
	      axi_bvalid <= 1'b1;
	      axi_bresp  <= 2'b0; // 'OKAY' response 
	  end else begin
	    if (S_AXI_BREADY && axi_bvalid) begin // Bready와 Bvalid가 hs되면
	      axi_bvalid <= 1'b0;  // bvalid를 0으로 초기화
	    	end  
	      end
	    end
	end   

// Implement axi_arready generation
// [AR channel]
	always @( posedge S_AXI_ACLK ) begin
	  if ( S_AXI_ARESETN == 1'b0 ) begin
	      axi_arready <= 1'b0;
	      axi_araddr  <= 32'b0; // address read address를 초기화
	  end else begin    
	      if (~axi_arready && S_AXI_ARVALID) begin // arready가 Low, arvalid가 0이면 (read 할 준비가 됐다면)
	        axi_arready <= 1'b1; 
	        axi_araddr  <= S_AXI_ARADDR; // araddr을 update
	      end else begin // 기본 default 상태
	        axi_arready <= 1'b0;
	      end
	    end 
	end


	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 ) begin
	      axi_rvalid <= 0;
	      axi_rresp  <= 0;
	    end else begin    
	      if (axi_arready && S_AXI_ARVALID && ~axi_rvalid)
	        begin
	          axi_rvalid <= 1'b1;
	          axi_rresp  <= 2'b0; // 'OKAY' response
	        end else if (axi_rvalid && S_AXI_RREADY)
	        begin
	          axi_rvalid <= 1'b0;
	        end                
	    end
	end    

// [R channel]
// manage read data 
	logic [DATA_WIDTH-1:0]module_output_reg[0:PORT_NUM-1];
	assign slv_reg_rden = axi_arready & S_AXI_ARVALID & ~axi_rvalid; // slave read enable
	always @(*)	begin // 항상
	  reg_data_out <= {						module_output_reg[0],
											module_output_reg[1],
											module_output_reg[2],
											module_output_reg[3],
											module_output_reg[4],
											module_output_reg[5],
											module_output_reg[6],
											module_output_reg[7]
										};
	end
	// Output register or memory read data
	always @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
				axi_rdata  <= 0;
	    end else begin    
	      if (slv_reg_rden) begin
	          axi_rdata <= reg_data_out;     // register read data
	      end   
	    end
	end    

logic [SWITCH_NUM-1:0]module_input_reg[0:STAGE_NUM-1];
always@(*)begin
module_input_reg[0] = S_AXI_WDATA[31:28];
module_input_reg[1] = S_AXI_WDATA[27:24];
module_input_reg[2] = S_AXI_WDATA[23:20];
module_input_reg[3] = S_AXI_WDATA[19:16];
module_input_reg[4] = S_AXI_WDATA[15:12];
end

benes_top benes_inst(
	.clk(S_AXI_ACLK),
	.rst_n(S_AXI_ARESETN),
	.switch_selection(module_input_reg),
	.o_port(module_output_reg)
);

	endmodule
