// OFDM_Cyclic_Prefix_Adder.v

// This file was auto-generated as a prototype implementation of a module
// created in component editor.  It ties off all outputs to ground and
// ignores all inputs.  It needs to be edited to make it do something
// useful.
// 
// This file will not be automatically regenerated.  You should check it in
// to your version control system if you want to keep it.

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

	// TODO: Auto-generated HDL template

	assign asi_in0_ready = 1'b0;

	assign aso_out0_valid = 1'b0;

	assign aso_out0_data = 38'b00000000000000000000000000000000000000;

	assign aso_out0_startofpacket = 1'b0;

	assign aso_out0_endofpacket = 1'b0;

endmodule
