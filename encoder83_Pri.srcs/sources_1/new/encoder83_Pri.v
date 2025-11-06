`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/08 14:40:02
// Design Name: 
// Module Name: encoder83_Pri
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


module encoder83_Pri(
input [7:0] iData, 
input iEI, 
output reg [2:0] oData, 
output reg oEO
);
always@(*)
begin
    if(iEI==1'b1)
    begin
    oData=3'b111;
    oEO=1'b1;
    end
    else if(iEI==1'b0&&iData==8'b11111111)
    begin
    oData=3'b111;
    oEO=1'b0;
    end
    else if(iEI==1'b0)
    begin
    oEO=1'b1;
    if(iData[7]==0)oData=3'b000;
    if(iData[6]==0&&iData[7]==1)oData=3'b001;
    if(iData[5]==0&&iData[6]==1&&iData[7]==1)oData=3'b010;
    if(iData[4]==0&&iData[5]==1&&iData[6]==1&&iData[7]==1)oData=3'b011;
    if(iData[3]==0&&iData[4]==1&&iData[5]==1&&iData[6]==1&&iData[7]==1)oData=3'b100;
    if(iData[2]==0&&iData[3]==1&&iData[4]==1&&iData[5]==1&&iData[6]==1&&iData[7]==1)oData=3'b101;
    if(iData==8'b11111101||iData==8'b11111100)oData=3'b110;
    if(iData==8'b11111110)oData=3'b111;
    end 
end
endmodule
