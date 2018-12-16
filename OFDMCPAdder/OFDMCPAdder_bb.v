
module OFDMCPAdder (
	avalon_st_demux_0_asi_in0_data,
	avalon_st_demux_0_asi_in0_ready,
	avalon_st_demux_0_asi_in0_valid,
	avalon_st_demux_0_asi_in0_endofpacket,
	avalon_st_demux_0_asi_in0_startofpacket,
	clk_clk,
	cpadderrouter_0_data_out_data,
	cpadderrouter_0_data_out_valid,
	cpadderrouter_0_data_out_error,
	cpadderrouter_0_data_out_endofpacket,
	cpadderrouter_0_data_out_startofpacket,
	reset_reset_n);	

	input	[21:0]	avalon_st_demux_0_asi_in0_data;
	output		avalon_st_demux_0_asi_in0_ready;
	input		avalon_st_demux_0_asi_in0_valid;
	input		avalon_st_demux_0_asi_in0_endofpacket;
	input		avalon_st_demux_0_asi_in0_startofpacket;
	input		clk_clk;
	output	[21:0]	cpadderrouter_0_data_out_data;
	output		cpadderrouter_0_data_out_valid;
	output	[1:0]	cpadderrouter_0_data_out_error;
	output		cpadderrouter_0_data_out_endofpacket;
	output		cpadderrouter_0_data_out_startofpacket;
	input		reset_reset_n;
endmodule
