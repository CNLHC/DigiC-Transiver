module SegDriver(
	input  [3:0]data, 
	output reg [6:0]SEG
);
always @(*) begin
	case(data)
		4'h1: SEG = 7'b1111001;	
		4'h2: SEG = 7'b0100100; 	
		4'h3: SEG = 7'b0110000; 	
		4'h4: SEG = 7'b0011001; 	
		4'h5: SEG = 7'b0010010; 	
		4'h6: SEG = 7'b0000010; 	
		4'h7: SEG = 7'b1111000; 	
		4'h8: SEG = 7'b0000000; 	
		4'h9: SEG = 7'b0011000; 	
		4'ha: SEG = 7'b0001000;
		4'hb: SEG = 7'b0000011;
		4'hc: SEG = 7'b1000110;
		4'hd: SEG = 7'b0100001;
		4'he: SEG = 7'b0000110;
		4'hf: SEG = 7'b0001110;
		4'h0: SEG = 7'b1000000;
	endcase
end
endmodule
