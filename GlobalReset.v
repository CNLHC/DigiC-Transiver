module GlobalReset(
    input sysClk,
    output reg sysRst
);
    reg [4:0]counter;

    always @ (posedge sysClk)begin
        if (counter<20)begin 
            sysRst=0;
            counter<=counter+1;
        end
        else 
            sysRst=1;
    end

endmodule 
