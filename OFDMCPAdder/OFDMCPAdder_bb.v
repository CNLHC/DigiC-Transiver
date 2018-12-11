
module OFDMCPAdder (
	clk_clk,
	cpadderrouter_0_asi_in0_data,
	cpadderrouter_0_asi_in0_valid,
	cpadderrouter_0_asi_in0_endofpacket,
	cpadderrouter_0_asi_in0_startofpacket,
	cpadderrouter_0_asi_in0_ready,
	multiplexer_0_out_data,
	multiplexer_0_out_valid,
	multiplexer_0_out_ready,
	multiplexer_0_out_channel,
	reset_reset_n);	

	input		clk_clk;
	input	[21:0]	cpadderrouter_0_asi_in0_data;
	input		cpadderrouter_0_asi_in0_valid;
	input		cpadderrouter_0_asi_in0_endofpacket;
	input		cpadderrouter_0_asi_in0_startofpacket;
	output		cpadderrouter_0_asi_in0_ready;
	output	[21:0]	multiplexer_0_out_data;
	output		multiplexer_0_out_valid;
	input		multiplexer_0_out_ready;
	output	[1:0]	multiplexer_0_out_channel;
	input		reset_reset_n;
endmodule
