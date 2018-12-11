// OFDMCPAdder.v

// Generated using ACDS version 16.1 196

`timescale 1 ps / 1 ps
module OFDMCPAdder (
		input  wire        clk_clk,                               //                     clk.clk
		input  wire [21:0] cpadderrouter_0_asi_in0_data,          // cpadderrouter_0_asi_in0.data
		input  wire        cpadderrouter_0_asi_in0_valid,         //                        .valid
		input  wire        cpadderrouter_0_asi_in0_endofpacket,   //                        .endofpacket
		input  wire        cpadderrouter_0_asi_in0_startofpacket, //                        .startofpacket
		output wire        cpadderrouter_0_asi_in0_ready,         //                        .ready
		output wire [21:0] multiplexer_0_out_data,                //       multiplexer_0_out.data
		output wire        multiplexer_0_out_valid,               //                        .valid
		input  wire        multiplexer_0_out_ready,               //                        .ready
		output wire [1:0]  multiplexer_0_out_channel,             //                        .channel
		input  wire        reset_reset_n                          //                   reset.reset_n
	);

	wire         cpadderrouter_0_cpsource_valid;      // CPAdderRouter_0:CPSource_valid -> avalon_st_adapter:in_0_valid
	wire  [21:0] cpadderrouter_0_cpsource_data;       // CPAdderRouter_0:CPSource_data -> avalon_st_adapter:in_0_data
	wire         avalon_st_adapter_out_0_valid;       // avalon_st_adapter:out_0_valid -> multiplexer_0:in1_valid
	wire  [21:0] avalon_st_adapter_out_0_data;        // avalon_st_adapter:out_0_data -> multiplexer_0:in1_data
	wire         avalon_st_adapter_out_0_ready;       // multiplexer_0:in1_ready -> avalon_st_adapter:out_0_ready
	wire         avalon_st_adapter_out_0_channel;     // avalon_st_adapter:out_0_channel -> multiplexer_0:in1_channel
	wire         cpadderrouter_0_datasource_valid;    // CPAdderRouter_0:aso_out0_valid -> avalon_st_adapter_001:in_0_valid
	wire  [21:0] cpadderrouter_0_datasource_data;     // CPAdderRouter_0:aso_out0_data -> avalon_st_adapter_001:in_0_data
	wire         avalon_st_adapter_001_out_0_valid;   // avalon_st_adapter_001:out_0_valid -> sc_fifo_0:in_valid
	wire  [21:0] avalon_st_adapter_001_out_0_data;    // avalon_st_adapter_001:out_0_data -> sc_fifo_0:in_data
	wire         avalon_st_adapter_001_out_0_ready;   // sc_fifo_0:in_ready -> avalon_st_adapter_001:out_0_ready
	wire         sc_fifo_0_out_valid;                 // sc_fifo_0:out_valid -> avalon_st_adapter_002:in_0_valid
	wire  [21:0] sc_fifo_0_out_data;                  // sc_fifo_0:out_data -> avalon_st_adapter_002:in_0_data
	wire         sc_fifo_0_out_ready;                 // avalon_st_adapter_002:in_0_ready -> sc_fifo_0:out_ready
	wire         avalon_st_adapter_002_out_0_valid;   // avalon_st_adapter_002:out_0_valid -> multiplexer_0:in0_valid
	wire  [21:0] avalon_st_adapter_002_out_0_data;    // avalon_st_adapter_002:out_0_data -> multiplexer_0:in0_data
	wire         avalon_st_adapter_002_out_0_ready;   // multiplexer_0:in0_ready -> avalon_st_adapter_002:out_0_ready
	wire         avalon_st_adapter_002_out_0_channel; // avalon_st_adapter_002:out_0_channel -> multiplexer_0:in0_channel
	wire         rst_controller_reset_out_reset;      // rst_controller:reset_out -> [CPAdderRouter_0:reset_reset, avalon_st_adapter:in_rst_0_reset, avalon_st_adapter_001:in_rst_0_reset, avalon_st_adapter_002:in_rst_0_reset, multiplexer_0:reset_n, sc_fifo_0:reset]

	OFDM_Cyclic_Prefix_Adder #(
		.Packet_Length (1024),
		.CP_Length     (128)
	) cpadderrouter_0 (
		.asi_in0_data          (cpadderrouter_0_asi_in0_data),          //    asi_in0.data
		.asi_in0_valid         (cpadderrouter_0_asi_in0_valid),         //           .valid
		.asi_in0_endofpacket   (cpadderrouter_0_asi_in0_endofpacket),   //           .endofpacket
		.asi_in0_startofpacket (cpadderrouter_0_asi_in0_startofpacket), //           .startofpacket
		.asi_in0_ready         (cpadderrouter_0_asi_in0_ready),         //           .ready
		.clock_clk             (clk_clk),                               //      clock.clk
		.reset_reset           (rst_controller_reset_out_reset),        //      reset.reset
		.aso_out0_data         (cpadderrouter_0_datasource_data),       // dataSource.data
		.aso_out0_valid        (cpadderrouter_0_datasource_valid),      //           .valid
		.CPSource_data         (cpadderrouter_0_cpsource_data),         //   CPSource.data
		.CPSource_valid        (cpadderrouter_0_cpsource_valid)         //           .valid
	);

	OFDMCPAdder_multiplexer_0 multiplexer_0 (
		.clk         (clk_clk),                             //   clk.clk
		.reset_n     (~rst_controller_reset_out_reset),     // reset.reset_n
		.out_data    (multiplexer_0_out_data),              //   out.data
		.out_valid   (multiplexer_0_out_valid),             //      .valid
		.out_ready   (multiplexer_0_out_ready),             //      .ready
		.out_channel (multiplexer_0_out_channel),           //      .channel
		.in0_data    (avalon_st_adapter_002_out_0_data),    //   in0.data
		.in0_valid   (avalon_st_adapter_002_out_0_valid),   //      .valid
		.in0_ready   (avalon_st_adapter_002_out_0_ready),   //      .ready
		.in0_channel (avalon_st_adapter_002_out_0_channel), //      .channel
		.in1_data    (avalon_st_adapter_out_0_data),        //   in1.data
		.in1_valid   (avalon_st_adapter_out_0_valid),       //      .valid
		.in1_ready   (avalon_st_adapter_out_0_ready),       //      .ready
		.in1_channel (avalon_st_adapter_out_0_channel)      //      .channel
	);

	altera_avalon_sc_fifo #(
		.SYMBOLS_PER_BEAT    (1),
		.BITS_PER_SYMBOL     (22),
		.FIFO_DEPTH          (2048),
		.CHANNEL_WIDTH       (0),
		.ERROR_WIDTH         (0),
		.USE_PACKETS         (0),
		.USE_FILL_LEVEL      (0),
		.EMPTY_LATENCY       (3),
		.USE_MEMORY_BLOCKS   (1),
		.USE_STORE_FORWARD   (0),
		.USE_ALMOST_FULL_IF  (0),
		.USE_ALMOST_EMPTY_IF (0)
	) sc_fifo_0 (
		.clk               (clk_clk),                              //       clk.clk
		.reset             (rst_controller_reset_out_reset),       // clk_reset.reset
		.in_data           (avalon_st_adapter_001_out_0_data),     //        in.data
		.in_valid          (avalon_st_adapter_001_out_0_valid),    //          .valid
		.in_ready          (avalon_st_adapter_001_out_0_ready),    //          .ready
		.out_data          (sc_fifo_0_out_data),                   //       out.data
		.out_valid         (sc_fifo_0_out_valid),                  //          .valid
		.out_ready         (sc_fifo_0_out_ready),                  //          .ready
		.csr_address       (2'b00),                                // (terminated)
		.csr_read          (1'b0),                                 // (terminated)
		.csr_write         (1'b0),                                 // (terminated)
		.csr_readdata      (),                                     // (terminated)
		.csr_writedata     (32'b00000000000000000000000000000000), // (terminated)
		.almost_full_data  (),                                     // (terminated)
		.almost_empty_data (),                                     // (terminated)
		.in_startofpacket  (1'b0),                                 // (terminated)
		.in_endofpacket    (1'b0),                                 // (terminated)
		.out_startofpacket (),                                     // (terminated)
		.out_endofpacket   (),                                     // (terminated)
		.in_empty          (1'b0),                                 // (terminated)
		.out_empty         (),                                     // (terminated)
		.in_error          (1'b0),                                 // (terminated)
		.out_error         (),                                     // (terminated)
		.in_channel        (1'b0),                                 // (terminated)
		.out_channel       ()                                      // (terminated)
	);

	OFDMCPAdder_avalon_st_adapter #(
		.inBitsPerSymbol (22),
		.inUsePackets    (0),
		.inDataWidth     (22),
		.inChannelWidth  (0),
		.inErrorWidth    (0),
		.inUseEmptyPort  (0),
		.inUseValid      (1),
		.inUseReady      (0),
		.inReadyLatency  (0),
		.outDataWidth    (22),
		.outChannelWidth (1),
		.outErrorWidth   (0),
		.outUseEmptyPort (0),
		.outUseValid     (1),
		.outUseReady     (1),
		.outReadyLatency (0)
	) avalon_st_adapter (
		.in_clk_0_clk   (clk_clk),                         // in_clk_0.clk
		.in_rst_0_reset (rst_controller_reset_out_reset),  // in_rst_0.reset
		.in_0_data      (cpadderrouter_0_cpsource_data),   //     in_0.data
		.in_0_valid     (cpadderrouter_0_cpsource_valid),  //         .valid
		.out_0_data     (avalon_st_adapter_out_0_data),    //    out_0.data
		.out_0_valid    (avalon_st_adapter_out_0_valid),   //         .valid
		.out_0_ready    (avalon_st_adapter_out_0_ready),   //         .ready
		.out_0_channel  (avalon_st_adapter_out_0_channel)  //         .channel
	);

	OFDMCPAdder_avalon_st_adapter_001 #(
		.inBitsPerSymbol (22),
		.inUsePackets    (0),
		.inDataWidth     (22),
		.inChannelWidth  (0),
		.inErrorWidth    (0),
		.inUseEmptyPort  (0),
		.inUseValid      (1),
		.inUseReady      (0),
		.inReadyLatency  (0),
		.outDataWidth    (22),
		.outChannelWidth (0),
		.outErrorWidth   (0),
		.outUseEmptyPort (0),
		.outUseValid     (1),
		.outUseReady     (1),
		.outReadyLatency (0)
	) avalon_st_adapter_001 (
		.in_clk_0_clk   (clk_clk),                           // in_clk_0.clk
		.in_rst_0_reset (rst_controller_reset_out_reset),    // in_rst_0.reset
		.in_0_data      (cpadderrouter_0_datasource_data),   //     in_0.data
		.in_0_valid     (cpadderrouter_0_datasource_valid),  //         .valid
		.out_0_data     (avalon_st_adapter_001_out_0_data),  //    out_0.data
		.out_0_valid    (avalon_st_adapter_001_out_0_valid), //         .valid
		.out_0_ready    (avalon_st_adapter_001_out_0_ready)  //         .ready
	);

	OFDMCPAdder_avalon_st_adapter_002 #(
		.inBitsPerSymbol (22),
		.inUsePackets    (0),
		.inDataWidth     (22),
		.inChannelWidth  (0),
		.inErrorWidth    (0),
		.inUseEmptyPort  (0),
		.inUseValid      (1),
		.inUseReady      (1),
		.inReadyLatency  (0),
		.outDataWidth    (22),
		.outChannelWidth (1),
		.outErrorWidth   (0),
		.outUseEmptyPort (0),
		.outUseValid     (1),
		.outUseReady     (1),
		.outReadyLatency (0)
	) avalon_st_adapter_002 (
		.in_clk_0_clk   (clk_clk),                             // in_clk_0.clk
		.in_rst_0_reset (rst_controller_reset_out_reset),      // in_rst_0.reset
		.in_0_data      (sc_fifo_0_out_data),                  //     in_0.data
		.in_0_valid     (sc_fifo_0_out_valid),                 //         .valid
		.in_0_ready     (sc_fifo_0_out_ready),                 //         .ready
		.out_0_data     (avalon_st_adapter_002_out_0_data),    //    out_0.data
		.out_0_valid    (avalon_st_adapter_002_out_0_valid),   //         .valid
		.out_0_ready    (avalon_st_adapter_002_out_0_ready),   //         .ready
		.out_0_channel  (avalon_st_adapter_002_out_0_channel)  //         .channel
	);

	altera_reset_controller #(
		.NUM_RESET_INPUTS          (1),
		.OUTPUT_RESET_SYNC_EDGES   ("deassert"),
		.SYNC_DEPTH                (2),
		.RESET_REQUEST_PRESENT     (0),
		.RESET_REQ_WAIT_TIME       (1),
		.MIN_RST_ASSERTION_TIME    (3),
		.RESET_REQ_EARLY_DSRT_TIME (1),
		.USE_RESET_REQUEST_IN0     (0),
		.USE_RESET_REQUEST_IN1     (0),
		.USE_RESET_REQUEST_IN2     (0),
		.USE_RESET_REQUEST_IN3     (0),
		.USE_RESET_REQUEST_IN4     (0),
		.USE_RESET_REQUEST_IN5     (0),
		.USE_RESET_REQUEST_IN6     (0),
		.USE_RESET_REQUEST_IN7     (0),
		.USE_RESET_REQUEST_IN8     (0),
		.USE_RESET_REQUEST_IN9     (0),
		.USE_RESET_REQUEST_IN10    (0),
		.USE_RESET_REQUEST_IN11    (0),
		.USE_RESET_REQUEST_IN12    (0),
		.USE_RESET_REQUEST_IN13    (0),
		.USE_RESET_REQUEST_IN14    (0),
		.USE_RESET_REQUEST_IN15    (0),
		.ADAPT_RESET_REQUEST       (0)
	) rst_controller (
		.reset_in0      (~reset_reset_n),                 // reset_in0.reset
		.clk            (clk_clk),                        //       clk.clk
		.reset_out      (rst_controller_reset_out_reset), // reset_out.reset
		.reset_req      (),                               // (terminated)
		.reset_req_in0  (1'b0),                           // (terminated)
		.reset_in1      (1'b0),                           // (terminated)
		.reset_req_in1  (1'b0),                           // (terminated)
		.reset_in2      (1'b0),                           // (terminated)
		.reset_req_in2  (1'b0),                           // (terminated)
		.reset_in3      (1'b0),                           // (terminated)
		.reset_req_in3  (1'b0),                           // (terminated)
		.reset_in4      (1'b0),                           // (terminated)
		.reset_req_in4  (1'b0),                           // (terminated)
		.reset_in5      (1'b0),                           // (terminated)
		.reset_req_in5  (1'b0),                           // (terminated)
		.reset_in6      (1'b0),                           // (terminated)
		.reset_req_in6  (1'b0),                           // (terminated)
		.reset_in7      (1'b0),                           // (terminated)
		.reset_req_in7  (1'b0),                           // (terminated)
		.reset_in8      (1'b0),                           // (terminated)
		.reset_req_in8  (1'b0),                           // (terminated)
		.reset_in9      (1'b0),                           // (terminated)
		.reset_req_in9  (1'b0),                           // (terminated)
		.reset_in10     (1'b0),                           // (terminated)
		.reset_req_in10 (1'b0),                           // (terminated)
		.reset_in11     (1'b0),                           // (terminated)
		.reset_req_in11 (1'b0),                           // (terminated)
		.reset_in12     (1'b0),                           // (terminated)
		.reset_req_in12 (1'b0),                           // (terminated)
		.reset_in13     (1'b0),                           // (terminated)
		.reset_req_in13 (1'b0),                           // (terminated)
		.reset_in14     (1'b0),                           // (terminated)
		.reset_req_in14 (1'b0),                           // (terminated)
		.reset_in15     (1'b0),                           // (terminated)
		.reset_req_in15 (1'b0)                            // (terminated)
	);

endmodule
