module RealTimeGenerator(
    input clock50,
    input sysRst,
    output reg realClk,
    output reg [31:0]Counter
);
always @(posedge clock50 or negedge sysRst)
    if(!sysRst)
        Counter<=32'hABCDEF00;
    else begin 
        if(Counter<50000000)
            Counter<=Counter+1;
        else begin
            realClk <=~realClk;
            Counter=0;
        end
    end
endmodule 


