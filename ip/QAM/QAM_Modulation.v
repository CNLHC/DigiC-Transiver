// QAM_Modulation.v

// This file was auto-generated as a prototype implementation of a module
// created in component editor.  It ties off all outputs to ground and
// ignores all inputs.  It needs to be edited to make it do something
// useful.
// 
// This file will not be automatically regenerated.  You should check it in
// to your version control system if you want to keep it.

`timescale 1 ps / 1 ps
module QAM_Modulation #(
		parameter PACKET_LENGTH = 1024
	) (
		input  wire [31:0] asi_in0_data,          //  asi_in0.data
		output wire        asi_in0_ready,         //         .ready
		input  wire        asi_in0_valid,         //         .valid
		input  wire        asi_in0_empty,         //         .valid
		input  wire        asi_in0_startofpacket, //         .startofpacket
		input  wire        asi_in0_endofpacket,   //         .endofpacket
		input  wire        clock_clk,             //    clock.clk
		input  wire        reset_reset,           //    reset.reset
		output reg  [32:0] aso_out0_data,         // aso_out0.data
		input  wire        aso_out0_ready,        //         .ready
		output reg         aso_out0_valid,        //         .valid
        output reg         aso_out0_endofpacket,
        output reg         aso_out0_startofpacket,
        output reg         aso_out0_empty 
	);
    assign  asi_in0_ready= 1'b1;
    integer index;
    reg [1:0]tInnerStateFlag;//00-idle 01-start asserted 02: reading packet 03: end asserted

    always @(posedge asi_in0_endofpacket or posedge asi_in0_startofpacket or posedge clock_clk or negedge reset_reset) begin
        if(!reset_reset)begin
            aso_out0_valid<=0;
            aso_out0_empty<=1;
            aso_out0_data<=33'h1ABCD4321;
        end
        else
            case (tInnerStateFlag)
                0:if(asi_in0_startofpacket)begin // IDLE
                    tInnerStateFlag<=1;
                    aso_out0_valid<=1;
                    if(asi_in0_valid) begin 
                        for (index=1;index<=16;index=index+1) begin
                            case (asi_in0_data[(2*index-1)-:2])
                                2'b00: 
                                    begin 
                                        aso_out0_valid<=1;
                                        aso_out0_data[31:16]<=1;
                                        aso_out0_data[15:0]<=1;
                                    end
                                2'b01:
                                    begin 
                                        aso_out0_valid<=1;
                                        aso_out0_data[31:16]<=-1;
                                        aso_out0_data[15:0]<=1;
                                    end
                                2'b11:
                                    begin 
                                        aso_out0_valid<=1;
                                        aso_out0_data[31:16]<=-1;
                                        aso_out0_data[15:0]<=-1;
                                    end
                                2'b10:
                                    begin 
                                        aso_out0_valid<=1;
                                        aso_out0_data[31:16]<=1;
                                        aso_out0_data[15:0]<=-1;
                                    end
                            endcase
                        end
                    end
                end
                1: //SOP Asserted
                    tInnerStateFlag<=2;
                2:begin // Mapping QAM Symbol
                    if(asi_in0_endofpacket) 
                        tInnerStateFlag<=3;
                    if(asi_in0_valid) begin 
                        for (index=1;index<=16;index=index+1) begin
                            case (asi_in0_data[(2*index-1)-:2])
                                2'b00: 
                                    begin 
                                        aso_out0_valid<=1;
                                        aso_out0_data[31:16]<=1;
                                        aso_out0_data[15:0]<=1;
                                    end
                                2'b01:
                                    begin 
                                        aso_out0_valid<=1;
                                        aso_out0_data[31:16]<=-1;
                                        aso_out0_data[15:0]<=1;
                                    end
                                2'b11:
                                    begin 
                                        aso_out0_valid<=1;
                                        aso_out0_data[31:16]<=-1;
                                        aso_out0_data[15:0]<=-1;
                                    end
                                2'b10:
                                    begin 
                                        aso_out0_valid<=1;
                                        aso_out0_data[31:16]<=1;
                                        aso_out0_data[15:0]<=-1;
                                    end
                            endcase
                        end
                    end
                end
                3:begin//EOP Asserted
                    aso_out0_valid<=0;
                    tInnerStateFlag<=0;
                end
            endcase
    end
endmodule
