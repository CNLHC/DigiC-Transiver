`timescale 1 ps / 1 ps
module OFDM_Cyclic_Prefix_Adder #(
		parameter Packet_Length = 1024,
		parameter CP_Length     = 128
	) (
		input  wire [37:0] asi_in0_data,           //  asi_in0.data
		output wire        asi_in0_ready,          //         .ready
		input  wire        asi_in0_valid,          //         .valid
		input  wire        asi_in0_endofpacket,    //         .endofpacket
		input  wire        asi_in0_startofpacket,  //         .startofpacket
		input  wire        clock_clk,              //    clock.clk
		input  wire        reset_reset,            //    reset.reset
		output wire [37:0] aso_out0_data,          // aso_out0.data
		input  wire        aso_out0_ready,         //         .ready
		output wire        aso_out0_valid,         //         .valid
		output wire        aso_out0_endofpacket,   //         .endofpacket
		output wire        aso_out0_startofpacket  //         .startofpacket
	);

	
	reg [1:0] muxSel = 2'b00;
	reg sinkReady = 1'b0;
	reg sourceValid = 1'b0;
	reg [37:0] gnd = 21'b0;
	reg [10:0] counter = 11'b0;
	reg [37:0] inputBuffer = 21'b0;
	reg startofpacket = 1'b0;
	reg endofpacket = 1'b0;
	reg outValid = 1'b0;

	reg fifoRead = 1'b0;
	reg fifoWrite = 1'b0;
	
	reg counterState = 1'b0;
	
	wire [9:0] usedw;
	wire [37:0] fifoOutput;
	wire fifoFull;
	wire fifoEmpty;

assign asi_in0_ready = sinkReady;
assign aso_out0_startofpacket = startofpacket;
assign aso_out0_endofpacket = endofpacket;
assign aso_out0_valid = outValid;
	
always @(posedge clock_clk) begin

	if (fifoEmpty && muxSel == 2'b00) begin
		sinkReady <= 1'b1; //enable pervious stage source output
	end

	if (usedw == 1'd1 && muxSel == 2'b10) begin
		outValid <= 1'b0; //disable next stage sink input
	end

	if (asi_in0_startofpacket && counterState == 1'b0) begin
		counter <= counter + 1'b1;//count fifo input words
		counterState <= 1'b1;
	end
	
	if (counterState) begin
		counter <= counter + 1'b1;
	end
	

	if ((counter == 767) && !fifoFull && asi_in0_valid && (muxSel != 2'b01)) begin
		muxSel <= 2'b01;
	end
	if (counter == 767) begin
		startofpacket <= 1'b1;
		outValid <= 1'b1;
	end
	else startofpacket <= 1'b0;

	if ((counter == 766) && (muxSel == 2'b10)) begin
		endofpacket <= 1'b1;
		fifoRead <= 1'b0;
		outValid <= 1'b0;
	end
	else startofpacket <= 1'b0;

	if ((usedw == 1023) && (muxSel != 2'b10)) begin
		//sinkReady <= 1'b0;
		fifoRead <= 1'b1;
		muxSel <= 2'b10;
	end
	if ((counter == 1279) && (muxSel == 2'b10)) begin
		sinkReady <= 1'b1;
		counter <= 11'b0_00000_00000;
	end

end
	
wire fifoRst;
assign fifoRst = !reset_reset;

FIFO_38 fifo1(
	.aclr(fifoRst),
	.clock(clock_clk),
	.data(asi_in0_data),
	.rdreq(fifoRead),
	.wrreq(asi_in0_valid),
	.empty(fifoEmpty),
	.full(fifoFull),
	.q(fifoOutput),
	.usedw(usedw)
);

muxIP mux1(
	.clock(clock_clk),
	.data0x(gnd),
	.data1x(asi_in0_data),
	.data2x(fifoOutput),
	.sel(muxSel),
	.result(aso_out0_data)
);

endmodule