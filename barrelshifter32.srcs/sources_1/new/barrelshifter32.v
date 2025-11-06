`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/13 17:12:33
// Design Name: 
// Module Name: barrelshifter32
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module barrelshifter32(
        input [31:0] a,
        input [4:0] b,
        input [1:0] aluc,
        output reg [31:0]c
    );
    always@(*)begin
    if(aluc==2'b00)//ËãÊõÓÒÒÆ
        begin
        c = ($signed(a)) >>> b;
        end
     else if(aluc==2'b10)//Âß¼­ÓÒÒÆ
        begin
        c = a >> b;
        end
     else if(aluc==2'b01)//ËãÊı×óÒÆ
        begin
        c = a << b;
        end
     else if(aluc==2'b11)//Âß¼­×óÒÆ
        begin
        c = a << b;
        end
    end
endmodule
