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
        output wire        aso_out0_empty
	);
    reg [12:0]tSymbolCounter; 
    reg [1:0]tInnerState;//0:IDLE 1:start-assert 2:packeting 3:end-assert
    reg [2:0]tBytesCounter;
    reg tPacketState;

    assign aso_out0_empty = 0;
    assign asi_in0_ready =1 ;

    always @(posedge reset_reset or posedge clock_clk) begin
        if(reset_reset) begin
            tInnerState<=0;
            tSymbolCounter<=0;
            tBytesCounter<=0;
            tPacketState<=0;
        end
        else begin 
            if(aso_out0_startofpacket)
                aso_out0_startofpacket<=0;
            if(aso_out0_endofpacket)
                aso_out0_endofpacket<=0;

            if(asi_in0_valid)begin
                tBytesCounter<=tBytesCounter+1;
                aso_out0_data[(4-tBytesCounter)*8-1-:8]<=asi_in0_data;
            end

            if(tBytesCounter>3)begin
                if(!tPacketState)begin
                    aso_out0_startofpacket<=1;
                    tPacketState<=1;
                end
                tSymbolCounter<=tSymbolCounter+1;
                tBytesCounter<=0;
                aso_out0_valid<=1;
                if(tSymbolCounter>=63)begin //TODO:Hard-Coded Warning
                    tSymbolCounter<=0;
                    tInnerState<=3;
                    aso_out0_endofpacket<=1;
                    tPacketState<=0;
                end
            end
            else begin
                aso_out0_valid<=0;
            end
        end
    end
endmodule
module testFixLengthBytes2Packets();
    reg         clock_clk;
    reg         reset_reset;
    reg [7:0]   asi_in0_data;
    wire        asi_in0_ready;
    reg         asi_in0_valid;
    wire [31:0] aso_out0_data;
    reg         aso_out0_ready;
    wire        aso_out0_valid;
    wire        aso_out0_startofpacket;
    wire        aso_out0_endofpacket;
    wire        aso_out0_empty;

    Fix_Length_Bytes2Packets U1(
    clock_clk,              
    reset_reset,            
    asi_in0_data,           
    asi_in0_ready,          
    asi_in0_valid,          
    aso_out0_data,          
    aso_out0_ready,         
    aso_out0_valid,         
    aso_out0_startofpacket, 
    aso_out0_endofpacket,   
    aso_out0_empty );
    initial begin
        clock_clk=0;
        reset_reset=1;
        #5 
        reset_reset<=0;
        asi_in0_valid<=1;
           
    end
    always begin
        #1 clock_clk<=1;
           asi_in0_data<= $random%255;
        #1 clock_clk<=0;
    end
endmodule
