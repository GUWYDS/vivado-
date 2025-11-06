`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/23 23:24:19
// Design Name: 
// Module Name: FA
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


module FA(
    input iA, //1 位二进制加数
    input iB, //1 位二进制被加数
    input iC, //低位的进位信号
    output oS, //1 位和数
    output oC //向高位的进位信号
    );
    assign oS = iA^iB^iC;
    assign oC = iA&&iC || iA&&iB || iB&&iC;
endmodule
