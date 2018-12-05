// new_component.v

// This file was auto-generated as a prototype implementation of a module
// created in component editor.  It ties off all outputs to ground and
// ignores all inputs.  It needs to be edited to make it do something
// useful.
// 
// This file will not be automatically regenerated.  You should check it in
// to your version control system if you want to keep it.

`timescale 1 ps / 1 ps
module new_component #(
		parameter Packet Length = 1024
	) (
		input  wire        clock_clk,            //          clock.clk
		input  wire        reset_reset,          //          reset.reset
		input  wire [31:0] asi_bitstream_data,   //  asi_bitstream.data
		output wire        asi_bitstream_ready,  //               .ready
		input  wire        asi_bitstream_valid,  //               .valid
		output wire [31:0] aso_qamreal_data,     //    aso_qamreal.data
		input  wire        aso_qamreal_ready,    //               .ready
		output wire        aso_qamreal_valid,    //               .valid
		output wire [31:0] aso_qamimagine_data,  // aso_qamimagine.data
		input  wire        aso_qamimagine_ready, //               .ready
		output wire        aso_qamimagine_valid  //               .valid
	);

	// TODO: Auto-generated HDL template

	assign asi_bitstream_ready = 1'b0;

	assign aso_qamreal_valid = 1'b0;

	assign aso_qamreal_data = 32'b00000000000000000000000000000000;

	assign aso_qamimagine_valid = 1'b0;

	assign aso_qamimagine_data = 32'b00000000000000000000000000000000;

endmodule
