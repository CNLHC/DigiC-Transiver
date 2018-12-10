// OFDM_DAC_Control.v

// This file was auto-generated as a prototype implementation of a module
// created in component editor.  It ties off all outputs to ground and
// ignores all inputs.  It needs to be edited to make it do something
// useful.
// 
// This file will not be automatically regenerated.  You should check it in
// to your version control system if you want to keep it.

`timescale 1 ps / 1 ps
module OFDM_DAC_Control (
		input  wire [21:0] asi_in0_data,          //     asi_in0.data
		output wire        asi_in0_ready,         //            .ready
		input  wire        asi_in0_valid,         //            .valid
		input  wire        asi_in0_endofpacket,   //            .endofpacket
		input  wire        asi_in0_startofpacket, //            .startofpacket
		input  wire        reset_reset,           //       reset.reset
		output wire [13:0] DAC_Control_Data,      // DAC_Control.data
		input  wire        clock_clk              //     clock_1.clk
	);

	// TODO: Auto-generated HDL template

	assign asi_in0_ready = 1'b0;

	assign DAC_Control_Data = 14'b00000000000000;

endmodule
