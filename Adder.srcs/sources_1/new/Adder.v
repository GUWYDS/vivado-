`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/24 12:38:57
// Design Name: 
// Module Name: Adder
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
module Adder(
    input [7:0] iData_a, // 8位二进制加数
    input [7:0] iData_b, // 8位二进制被加数
    input iC, // 低位的进位信号
    output  [7:0] oData, // 8位和数
    output  oData_C // 向高位的进位信号
);
    wire [7:0] carry;
    FA fa0 (
        .iA(iData_a[0]),
        .iB(iData_b[0]),
        .iC(iC),
        .oS(oData[0]),
        .oC(carry[0])
    );
     FA fa1 (
        .iA(iData_a[1]),
        .iB(iData_b[1]),
        .iC(carry[0]),
        .oS(oData[1]),
        .oC(carry[1])
    );
    FA fa2 (
        .iA(iData_a[2]),
        .iB(iData_b[2]),
        .iC(carry[1]),
        .oS(oData[2]),
        .oC(carry[2])
    );
    FA fa3 (
        .iA(iData_a[3]),
        .iB(iData_b[3]),
        .iC(carry[2]),
        .oS(oData[3]),
        .oC(carry[3])
    );
    FA fa4 (
        .iA(iData_a[4]),
        .iB(iData_b[4]),
        .iC(carry[3]),
        .oS(oData[4]),
        .oC(carry[4])
    );
    FA fa5 (
        .iA(iData_a[5]),
        .iB(iData_b[5]),
        .iC(carry[4]),
        .oS(oData[5]),
        .oC(carry[5])
    );
    FA fa6 (
        .iA(iData_a[6]),
        .iB(iData_b[6]),
        .iC(carry[5]),
        .oS(oData[6]),
        .oC(carry[6])
    );
    FA fa7 (
        .iA(iData_a[7]),
        .iB(iData_b[7]),
        .iC(carry[6]),
        .oS(oData[7]),
        .oC(oData_C)
    );
endmodule
