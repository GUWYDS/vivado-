`timescale 1ns / 1ps

module Divider(
    input I_CLK,
    input rst,
    output O_CLK
    );
    parameter times = 20;
    integer cnt = 0;
    reg CLKc = 0;
    always @(posedge I_CLK )
    begin
        if (rst) begin
        CLKc <= 0;
        cnt <= 1'b0;
        end
        else
        begin
            if (cnt == times/2-1)
                begin
                CLKc <= ~CLKc;
                cnt <= 0;
                end
            else cnt <= cnt + 1;
        end
    end
    assign O_CLK = CLKc;
    
endmodule
