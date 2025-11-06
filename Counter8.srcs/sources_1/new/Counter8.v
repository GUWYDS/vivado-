`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/05 21:14:00
// Design Name: 
// Module Name: Counter8
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


module Counter8(
    input CLK, //时钟信号，上升沿有效
    input rst_n, //异步复位信号，低电平有效
    output reg [2:0] oQ, //二进制计数器输出
    output reg [6:0] oDisplay //七段数字显示管输出
);
    wire Qa, Qb, Qc;
    wire [6:0] data_out;
    JK_FF FF0 (  
            .CLK(CLK),  
            .J(1'b1), 
            .K(1'b1), 
            .RST_n(rst_n),  
            .Q1(Qa)  
        );  
    JK_FF FF1 (  
            .CLK(CLK),  
            .J(Qa),  
            .K(Qa),  
            .RST_n(rst_n),  
            .Q1(Qb)  
        );  
    JK_FF FF2 (  
            .CLK(CLK), 
            .J(Qa&&Qb),  
            .K(Qa&&Qb),  
            .RST_n(rst_n),  
            .Q1(Qc)  
        );  
        display7 dff(
                .iData(oQ),
                .oData(data_out)
            );
        always @(*) 
        begin  
             oQ = {Qc, Qb, Qa};   
             oDisplay = data_out;  
        end  
endmodule

