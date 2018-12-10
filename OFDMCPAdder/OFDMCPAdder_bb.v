
module OFDMCPAdder (
	cpadderrouter_0_asi_in0_data,
	cpadderrouter_0_asi_in0_valid,
	cpadderrouter_0_asi_in0_endofpacket,
	cpadderrouter_0_asi_in0_startofpacket,
	multiplexer_0_out_data,
	multiplexer_0_out_valid,
	multiplexer_0_out_ready,
	multiplexer_0_out_startofpacket,
	multiplexer_0_out_endofpacket,
	multiplexer_0_out_channel,
	clk_clk,
	reset_reset_n);	

	input	[21:0]	cpadderrouter_0_asi_in0_data;
	input		cpadderrouter_0_asi_in0_valid;
	input		cpadderrouter_0_asi_in0_endofpacket;
	input		cpadderrouter_0_asi_in0_startofpacket;
	output	[21:0]	multiplexer_0_out_data;
	output		multiplexer_0_out_valid;
	input		multiplexer_0_out_ready;
	output		multiplexer_0_out_startofpacket;
	output		multiplexer_0_out_endofpacket;
	output	[1:0]	multiplexer_0_out_channel;
	input		clk_clk;
	input		reset_reset_n;
endmodule
