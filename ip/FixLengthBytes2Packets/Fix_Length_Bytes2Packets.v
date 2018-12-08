`timescale 1 ps / 1 ps
module Fix_Length_Bytes2Packets (
    // Clock and Reset
		input  wire        clock_clk,              //     clock_1.clk
		input  wire        reset_reset,            //       reset.reset
    //Avalon-ST Sink
		input  wire [7:0]  asi_in0_data,           //     asi_in0.data
		output wire        asi_in0_ready,          //            .ready
		input  wire        asi_in0_valid,          //            .valid
    //Avalon-ST Source
		output reg  [31:0] aso_out0_data,          //    aso_out0.data
		input  wire        aso_out0_ready,         //            .ready
		output reg         aso_out0_valid,         //            .valid
		output reg         aso_out0_startofpacket, //            .startofpacket
		output reg         aso_out0_endofpacket,   //            .endofpacket
        output wire [3:0]  aso_out0_empty
	);
    reg [12:0]symbolCounter; 
    reg [1:0]packetState;//0:IDLE 1:start-assert 2:packeting 3:end-assert
    reg [2:0]BytesCounter;

    assign aso_out0_empty = 2'b00;
    assign asi_in0_ready =1 ;

    always @(posedge reset_reset or posedge clock_clk) begin
        if(reset_reset) begin
            packetState<=0;
            symbolCounter<=0;
            BytesCounter<=0;
        end
        else begin 
            case(packetState)
                0:begin //IDLE
                    if(asi_in0_valid)begin
                        packetState<=1;
                        BytesCounter<=BytesCounter+1;
                        symbolCounter<=symbolCounter+1;
                        aso_out0_data[(4-BytesCounter)*8-1-:8]<=asi_in0_data;
                        aso_out0_startofpacket<=1;
                    end
                end
                1:begin //SOP asserted
                    if(aso_out0_startofpacket) begin
                        aso_out0_startofpacket<=0;
                        packetState<=2;
                        if(asi_in0_valid)begin
                            BytesCounter<=BytesCounter+1;
                            symbolCounter<=symbolCounter+1;
                            aso_out0_data[(4-BytesCounter)*8-1-:8]<=asi_in0_data;
                        end
                    end
                    else
                        packetState<=0;
                end
                2:begin //Packeting
                    if(asi_in0_valid)begin
                        BytesCounter<=BytesCounter+1;
                        symbolCounter<=symbolCounter+1;
                        aso_out0_data[(4-BytesCounter)*8-1-:8]<=asi_in0_data;
                    end

                    if(BytesCounter>3)begin
                        BytesCounter<=0;
                        aso_out0_valid<=1;
                    end
                    else
                        aso_out0_valid<=0;

                    if(symbolCounter>=256)begin //TODO:Hard-Coded Warning
                        packetState<=3;
                        aso_out0_endofpacket<=1;
                    end
                end
                3: begin //EOP asserted
                    packetState<=0;
                    BytesCounter<=0;
                    symbolCounter<=0;
                    aso_out0_endofpacket<=0;
                end
            endcase
        end
    end
endmodule
