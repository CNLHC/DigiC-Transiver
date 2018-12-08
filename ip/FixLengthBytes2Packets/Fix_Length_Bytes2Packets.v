// Fix_Length_Bytes2Packets.v

// This file was auto-generated as a prototype implementation of a module
// created in component editor.  It ties off all outputs to ground and
// ignores all inputs.  It needs to be edited to make it do something
// useful.
// 
// This file will not be automatically regenerated.  You should check it in
// to your version control system if you want to keep it.

`timescale 1 ps / 1 ps
module Fix_Length_Bytes2Packets (
		input  wire [31:0] asi_in0_data,           //     asi_in0.data
		output wire        asi_in0_ready,          //            .ready
		input  wire        asi_in0_valid,          //            .valid
		input  wire        reset_reset,            //       reset.reset
		output reg  [31:0] aso_out0_data,          //    aso_out0.data
		input  wire        aso_out0_ready,         //            .ready
		output wire        aso_out0_valid,         //            .valid
		output reg         aso_out0_startofpacket, //            .startofpacket
		output reg         aso_out0_endofpacket,   //            .endofpacket
		output wire [1:0]  aso_out0_empty,         //            .empty
		input  wire        clock_clk,              //     clock_1.clk
		output wire        status,                  // conduit_end.new_signal
        output wire [11:0] conduit_debug_packet_counter
	);
    reg [11:0]BytesCounter;
    reg stateFlip;
    reg [1:0]packetState;//0:IDLE 1:start-assert 2:packeting 3:end-assert
    assign status = stateFlip;
    assign conduit_debug_packet_counter = BytesCounter;
    assign aso_out0_valid = aso_out0_ready;
    assign aso_out0_empty = 2'b00;

    always @(negedge reset_reset or posedge clock_clk) begin
        if(!reset_reset) begin
            stateFlip<=0;
            packetState<=0;
            BytesCounter<=0;
            stateFlip<=1;
            
        end
        else begin 
            if(aso_out0_ready)begin
                BytesCounter<=BytesCounter+1;
                aso_out0_data<=aso_out0_valid;
                case(packetState)
                    0:begin 
                        packetState<=1;
                        aso_out0_startofpacket<=1;
                    end
                    1:begin
                        if(aso_out0_startofpacket) begin
                            aso_out0_startofpacket<=0;
                            packetState<=2;
                        end
                        else
                            packetState<=0;
                    end
                    2:begin
                        if(BytesCounter==256)begin //TODO:Hard-Coded Warning
                            packetState<=3;
                            aso_out0_endofpacket<=1;
                            stateFlip<=~stateFlip;
                        end
                    end
                    3: begin
                        packetState<=0;
                        aso_out0_endofpacket<=0;
                    end
                endcase
            end
        end
    end


endmodule
