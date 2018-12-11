	OFDMCPAdder u0 (
		.clk_clk                               (<connected-to-clk_clk>),                               //                     clk.clk
		.cpadderrouter_0_asi_in0_data          (<connected-to-cpadderrouter_0_asi_in0_data>),          // cpadderrouter_0_asi_in0.data
		.cpadderrouter_0_asi_in0_valid         (<connected-to-cpadderrouter_0_asi_in0_valid>),         //                        .valid
		.cpadderrouter_0_asi_in0_endofpacket   (<connected-to-cpadderrouter_0_asi_in0_endofpacket>),   //                        .endofpacket
		.cpadderrouter_0_asi_in0_startofpacket (<connected-to-cpadderrouter_0_asi_in0_startofpacket>), //                        .startofpacket
		.cpadderrouter_0_asi_in0_ready         (<connected-to-cpadderrouter_0_asi_in0_ready>),         //                        .ready
		.multiplexer_0_out_data                (<connected-to-multiplexer_0_out_data>),                //       multiplexer_0_out.data
		.multiplexer_0_out_valid               (<connected-to-multiplexer_0_out_valid>),               //                        .valid
		.multiplexer_0_out_ready               (<connected-to-multiplexer_0_out_ready>),               //                        .ready
		.multiplexer_0_out_channel             (<connected-to-multiplexer_0_out_channel>),             //                        .channel
		.reset_reset_n                         (<connected-to-reset_reset_n>)                          //                   reset.reset_n
	);

