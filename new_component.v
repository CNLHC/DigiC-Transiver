// new_component.v

// This file was auto-generated as a prototype implementation of a module
// created in component editor.  It ties off all outputs to ground and
// ignores all inputs.  It needs to be edited to make it do something
// useful.
// 
// This file will not be automatically regenerated.  You should check it in
// to your version control system if you want to keep it.

`timescale 1 ps / 1 ps
module new_component (
		input  wire [31:0] asi_in0_data,  // asi_in0.data
		output wire        asi_in0_ready, //        .ready
		input  wire        asi_in0_valid, //        .valid
		input  wire        clock_clk,     //   clock.clk
		input  wire        reset_reset    //   reset.reset
	);

	// TODO: Auto-generated HDL template

	assign asi_in0_ready = 1'b0;

endmodule
