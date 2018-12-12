
module OFDMCPAdder (
	clk_clk,
	cpadderrouter_0_data_out_data,
	cpadderrouter_0_data_out_valid,
	cpadderrouter_0_data_out_endofpacket,
	cpadderrouter_0_data_out_startofpacket,
	demultiplexer_0_in_data,
	demultiplexer_0_in_valid,
	demultiplexer_0_in_ready,
	demultiplexer_0_in_startofpacket,
	demultiplexer_0_in_endofpacket,
	demultiplexer_0_in_channel,
	reset_reset_n);	

	input		clk_clk;
	output	[21:0]	cpadderrouter_0_data_out_data;
	output		cpadderrouter_0_data_out_valid;
	output		cpadderrouter_0_data_out_endofpacket;
	output		cpadderrouter_0_data_out_startofpacket;
	input	[21:0]	demultiplexer_0_in_data;
	input		demultiplexer_0_in_valid;
	output		demultiplexer_0_in_ready;
	input		demultiplexer_0_in_startofpacket;
	input		demultiplexer_0_in_endofpacket;
	input		demultiplexer_0_in_channel;
	input		reset_reset_n;
endmodule
