`timescale 1ns / 1ps

module JK_FF_tb;
    reg CLK;
    reg J;
    reg K;
    reg RST_n;
    wire Q1;
    wire Q2;
    JK_FF uut (
        .CLK(CLK),
        .J(J),
        .K(K),
        .RST_n(RST_n),
        .Q1(Q1),
        .Q2(Q2)
    );
    initial begin
        CLK = 0;
        forever #5 CLK = ~CLK; 
    end
    initial begin
        // 初始化输入
        J = 0;
        K = 0;
        RST_n = 0; 
        #10;
        // 释放复位
        RST_n = 1;
        #10;
        // 2'b00: 无变化
        J = 0; K = 0;
        #10; 
        // 2'b01: 复位
        J = 0; K = 1;
        #10;
        // 2'b10: 置位
        J = 1; K = 0;
        #10; 
        // 2'b11: 翻转
        J = 1; K = 1;
        #10; 
        // 再次测试翻转
        J = 1; K = 1;
        #10; 
        #10 $finish;
    end
endmodule