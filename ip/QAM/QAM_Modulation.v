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
    //Clock and Resource 
		input  wire        clock_clk,             //    clock.clk
		input  wire        reset_reset,           //    reset.reset
    // Avalon Sink
		input  wire [31:0] asi_in0_data,          //  asi_in0.data
		output reg         asi_in0_ready,         //         .ready
		input  wire        asi_in0_valid,         //         .valid
		input  wire        asi_in0_empty,         //         .valid
		input  wire        asi_in0_startofpacket, //         .startofpacket
		input  wire        asi_in0_endofpacket,   //         .endofpacket
    // Avalon Source
		output reg  [16:0] aso_out0_data,         // aso_out0.data
		input  wire        aso_out0_ready,        //         .ready
		output reg         aso_out0_valid,        //         .valid
        output reg         aso_out0_endofpacket,
        output reg         aso_out0_startofpacket,
        output reg         aso_out0_empty);

    integer index;
    reg [1:0]tInnerStateFlag;//00-idle 01-start asserted 02: reading packet 03: end asserted
    reg [5:0]tBytesBuffer;
    reg [31:0]tInputSymbolBuffer;

    always @(posedge clock_clk or posedge reset_reset) begin
        if(reset_reset)begin
            aso_out0_valid<=0;
            asi_in0_ready<=1;
            aso_out0_data<=0;
            tInputSymbolBuffer<=0;
            tBytesBuffer<=16;
        end
        else
            case (tInnerStateFlag)
                0: begin
                    if(asi_in0_startofpacket)begin // IDLE
                    tInnerStateFlag<=1;
                    tBytesBuffer<=16;
                    aso_out0_startofpacket<=1;
                    end
                    asi_in0_ready<=1;
                end

                1:begin
                    tInnerStateFlag<=2;             //SOP Asserted
                    if(aso_out0_startofpacket)
                        aso_out0_startofpacket<=0;

                    //prefatch the Data
                    if(asi_in0_ready && asi_in0_valid) begin 
                        asi_in0_ready<=0;
                        tInputSymbolBuffer<=asi_in0_data;
                        tBytesBuffer<=0;
                    end
                end

                2:begin // Mapping QAM Symbol
                    if(asi_in0_endofpacket) begin
                        tInnerStateFlag<=3;
                        aso_out0_endofpacket<=0;
                    end

                    if(asi_in0_ready && asi_in0_valid) begin
                        tInputSymbolBuffer<=asi_in0_data;
                        tBytesBuffer<=0;
                        asi_in0_ready<=0;
                    end

                    if(tBytesBuffer<16) begin
                        asi_in0_ready<=0;
                        aso_out0_valid<=1;
                        aso_out0_data[0]<=1; //set IFFT
                        tBytesBuffer<=tBytesBuffer+1;
                        case(tInputSymbolBuffer[(16-tBytesBuffer)*2-1-:2])
                            0: begin
                                aso_out0_data[16:9]<=1;
                                aso_out0_data[8:1]<=1;
                            end
                            1:begin
                                aso_out0_data[16:9]<=-1;
                                aso_out0_data[8:1]<=1;
                            end
                            2: begin
                                aso_out0_data[16:9]<=-1;
                                aso_out0_data[8:1]<=-1;
                            end
                            3: begin
                                aso_out0_data[16:9]<=1;
                                aso_out0_data[8:1]<=-1;
                            end
                        endcase
                    end
                    else begin
                        asi_in0_ready<=1;
                        aso_out0_valid<=0;
                    end
                end
                3:begin//EOP Asserted
                    if(aso_out0_endofpacket)
                        aso_out0_endofpacket<=0;

                    // handle the remain data
                    if(tBytesBuffer<16) begin
                        asi_in0_ready<=0;
                        aso_out0_valid<=1;
                        aso_out0_data[0]<=1; //set IFFT
                        tBytesBuffer<=tBytesBuffer+1;
                        case(tInputSymbolBuffer[(16-tBytesBuffer)*2-1-:2])
                            0: begin
                                aso_out0_data[16:9]<=1;
                                aso_out0_data[8:1]<=1;
                            end
                            1:begin
                                aso_out0_data[16:9]<=-1;
                                aso_out0_data[8:1]<=1;
                            end
                            2: begin
                                aso_out0_data[16:9]<=-1;
                                aso_out0_data[8:1]<=-1;
                            end
                            3: begin
                                aso_out0_data[16:9]<=1;
                                aso_out0_data[8:1]<=-1;
                            end
                        endcase
                    end
                    else begin
                        asi_in0_ready<=1;
                        aso_out0_valid<=0;
                        tInnerStateFlag<=0;
                    end
                end
            endcase
    end
endmodule
