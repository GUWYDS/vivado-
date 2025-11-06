`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/08 14:26:41
// Design Name: 
// Module Name: display7
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


module display7(
    input [2:0] iData,
    output reg [6:0] oData 
    );
    always@(*)begin
    case(iData)
    3'b000: oData=7'b1000000;
    3'b001: oData=7'b1111001;
    3'b010: oData=7'b0100100;
    3'b011: oData=7'b0110000;
    3'b100: oData=7'b0011001;
    3'b101: oData=7'b0010010;
    3'b110: oData=7'b0000010;
    3'b111: oData=7'b1111000;
    default: oData=7'b1111111;
    endcase
    end
endmodule
