// OFDMCPAdder_avalon_st_adapter.v

// This file was auto-generated from altera_avalon_st_adapter_hw.tcl.  If you edit it your changes
// will probably be lost.
// 
// Generated using ACDS version 16.1 196

`timescale 1 ps / 1 ps
module OFDMCPAdder_avalon_st_adapter #(
		parameter inBitsPerSymbol = 22,
		parameter inUsePackets    = 0,
		parameter inDataWidth     = 22,
		parameter inChannelWidth  = 0,
		parameter inErrorWidth    = 0,
		parameter inUseEmptyPort  = 0,
		parameter inUseValid      = 1,
		parameter inUseReady      = 0,
		parameter inReadyLatency  = 0,
		parameter outDataWidth    = 22,
		parameter outChannelWidth = 1,
		parameter outErrorWidth   = 0,
		parameter outUseEmptyPort = 0,
		parameter outUseValid     = 1,
		parameter outUseReady     = 1,
		parameter outReadyLatency = 0
	) (
		input  wire        in_clk_0_clk,   // in_clk_0.clk
		input  wire        in_rst_0_reset, // in_rst_0.reset
		input  wire [21:0] in_0_data,      //     in_0.data
		input  wire        in_0_valid,     //         .valid
		output wire [21:0] out_0_data,     //    out_0.data
		output wire        out_0_valid,    //         .valid
		input  wire        out_0_ready,    //         .ready
		output wire        out_0_channel   //         .channel
	);

	wire         channel_adapter_0_out_valid;   // channel_adapter_0:out_valid -> timing_adapter_0:in_valid
	wire  [21:0] channel_adapter_0_out_data;    // channel_adapter_0:out_data -> timing_adapter_0:in_data
	wire         channel_adapter_0_out_channel; // channel_adapter_0:out_channel -> timing_adapter_0:in_channel

	generate
		// If any of the display statements (or deliberately broken
		// instantiations) within this generate block triggers then this module
		// has been instantiated this module with a set of parameters different
		// from those it was generated for.  This will usually result in a
		// non-functioning system.
		if (inBitsPerSymbol != 22)
		begin
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					inbitspersymbol_check ( .error(1'b1) );
		end
		if (inUsePackets != 0)
		begin
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					inusepackets_check ( .error(1'b1) );
		end
		if (inDataWidth != 22)
		begin
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					indatawidth_check ( .error(1'b1) );
		end
		if (inChannelWidth != 0)
		begin
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					inchannelwidth_check ( .error(1'b1) );
		end
		if (inErrorWidth != 0)
		begin
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					inerrorwidth_check ( .error(1'b1) );
		end
		if (inUseEmptyPort != 0)
		begin
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					inuseemptyport_check ( .error(1'b1) );
		end
		if (inUseValid != 1)
		begin
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					inusevalid_check ( .error(1'b1) );
		end
		if (inUseReady != 0)
		begin
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					inuseready_check ( .error(1'b1) );
		end
		if (inReadyLatency != 0)
		begin
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					inreadylatency_check ( .error(1'b1) );
		end
		if (outDataWidth != 22)
		begin
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					outdatawidth_check ( .error(1'b1) );
		end
		if (outChannelWidth != 1)
		begin
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					outchannelwidth_check ( .error(1'b1) );
		end
		if (outErrorWidth != 0)
		begin
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					outerrorwidth_check ( .error(1'b1) );
		end
		if (outUseEmptyPort != 0)
		begin
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					outuseemptyport_check ( .error(1'b1) );
		end
		if (outUseValid != 1)
		begin
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					outusevalid_check ( .error(1'b1) );
		end
		if (outUseReady != 1)
		begin
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					outuseready_check ( .error(1'b1) );
		end
		if (outReadyLatency != 0)
		begin
			initial begin
				$display("Generated module instantiated with wrong parameters");
				$stop;
			end
			instantiated_with_wrong_parameters_error_see_comment_above
					outreadylatency_check ( .error(1'b1) );
		end
	endgenerate

	OFDMCPAdder_avalon_st_adapter_channel_adapter_0 channel_adapter_0 (
		.clk         (in_clk_0_clk),                  //   clk.clk
		.reset_n     (~in_rst_0_reset),               // reset.reset_n
		.in_data     (in_0_data),                     //    in.data
		.in_valid    (in_0_valid),                    //      .valid
		.out_data    (channel_adapter_0_out_data),    //   out.data
		.out_valid   (channel_adapter_0_out_valid),   //      .valid
		.out_channel (channel_adapter_0_out_channel)  //      .channel
	);

	OFDMCPAdder_avalon_st_adapter_timing_adapter_0 timing_adapter_0 (
		.clk         (in_clk_0_clk),                  //   clk.clk
		.reset_n     (~in_rst_0_reset),               // reset.reset_n
		.in_data     (channel_adapter_0_out_data),    //    in.data
		.in_valid    (channel_adapter_0_out_valid),   //      .valid
		.in_channel  (channel_adapter_0_out_channel), //      .channel
		.out_data    (out_0_data),                    //   out.data
		.out_valid   (out_0_valid),                   //      .valid
		.out_ready   (out_0_ready),                   //      .ready
		.out_channel (out_0_channel)                  //      .channel
	);

endmodule
