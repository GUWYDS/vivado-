`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/26 13:35:11
// Design Name: 
// Module Name: Synchronous_D_FF
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


module Synchronous_D_FF(
    input CLK, //时钟信号，上升沿有效
    input D, //输入信号 D
    input RST_n, //复位信号，低电平有效
    output reg Q1, //输出信号 Q
    output Q2//输出信号 ~Q  
    );
    always@(posedge CLK)
    begin    
        if(!RST_n)
           begin
            Q1<=0;
            end
        else
            begin
            Q1<=D;
            end
    end        
    assign Q2 = !Q1;
endmodule
