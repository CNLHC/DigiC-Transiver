	OFDMCPAdder u0 (
		.clk_clk                                (<connected-to-clk_clk>),                                //                      clk.clk
		.cpadderrouter_0_data_out_data          (<connected-to-cpadderrouter_0_data_out_data>),          // cpadderrouter_0_data_out.data
		.cpadderrouter_0_data_out_valid         (<connected-to-cpadderrouter_0_data_out_valid>),         //                         .valid
		.cpadderrouter_0_data_out_endofpacket   (<connected-to-cpadderrouter_0_data_out_endofpacket>),   //                         .endofpacket
		.cpadderrouter_0_data_out_startofpacket (<connected-to-cpadderrouter_0_data_out_startofpacket>), //                         .startofpacket
		.demultiplexer_0_in_data                (<connected-to-demultiplexer_0_in_data>),                //       demultiplexer_0_in.data
		.demultiplexer_0_in_valid               (<connected-to-demultiplexer_0_in_valid>),               //                         .valid
		.demultiplexer_0_in_ready               (<connected-to-demultiplexer_0_in_ready>),               //                         .ready
		.demultiplexer_0_in_startofpacket       (<connected-to-demultiplexer_0_in_startofpacket>),       //                         .startofpacket
		.demultiplexer_0_in_endofpacket         (<connected-to-demultiplexer_0_in_endofpacket>),         //                         .endofpacket
		.demultiplexer_0_in_channel             (<connected-to-demultiplexer_0_in_channel>),             //                         .channel
		.reset_reset_n                          (<connected-to-reset_reset_n>)                           //                    reset.reset_n
	);

