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
		input  wire [21:0] asi_in0_data,           //    asi_in0.data
		input  wire        asi_in0_valid,          //           .valid
		input  wire        asi_in0_endofpacket,    //           .endofpacket
		input  wire        asi_in0_startofpacket,  //           .startofpacket
        output wire        asi_in0_ready,
		input  wire        clock_clk,              //      clock.clk
		input  wire        reset_reset,            //      reset.reset
		output wire [21:0] aso_out0_data,          // dataSource.data
		output wire        aso_out0_valid,         //           .valid
		output wire        aso_out0_endofpacket,   //           .endofpacket
		output wire        aso_out0_startofpacket, //           .startofpacket
		output wire [21:0] CPSource_data,          //   CPSource.data
		output wire        CPSource_valid,         //           .valid
		output wire        CPSource_endofpacket,   //           .endofpacket
		output wire        CPSource_startofpacket  //           .startofpacket
	);
    reg [12:0]tDataSymbolCounter;
    reg tInnerState;
    assign asi_in0_ready=1;
    always @(posedge reset_reset or posedge clock_clk)begin 
        if(reset_reset)begin
            tDataSymbolCounter<=0;
            tInnerState<=0;
        end
        else begin
            if(aso_out0_startofpacket)
                aso_out0_startofpacket<=0;
            if(CPSource_startofpacket)
                CPSource_startofpacket<=0;
            if(asi_in0_startofpacket)
                aso_out0_startofpacket<=1;
            if(aso_out0_endofpacket)
                aso_out0_endofpacket<=0;
            if(CPSource_endofpacket)
                CPSource_endofpacket<=0;
            if(asi_in0_valid) begin
                case(tInnerState)
                    0:begin
                        tDataSymbolCounter<=tDataSymbolCounter+1;
                        aso_out0_valid<=1;
                        CPSource_valid<=0;
                        aso_out0_data<=asi_in0_data;
                        if(tDataSymbolCounter>=767)begin
                            tInnerState<=1;
                            CPSource_startofpacket<=1;
                        end
                    end
                    1:begin
                        aso_out0_valid<=1;
                        CPSource_valid<=1;
                        tDataSymbolCounter<=tDataSymbolCounter+1;
                        aso_out0_data<=asi_in0_data;
                        CPSource_data<=asi_in0_data;
                        if(tDataSymbolCounter>=1023)begin
                            // add error checker here
                            // if(!asi_in0_endofpacket)begin
                            // end
                            tInnerState<=0;
                            tDataSymbolCounter<=0;
                            aso_out0_endofpacket<=1;
                            CPSource_endofpacket<=1;
                        end
                    end
                endcase
            end
            else begin
                aso_out0_valid<=0;
                CPSource_valid<=0;
            end
        end
    end
endmodule
