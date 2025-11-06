`timescale 1ns / 1ps

module Asynchronous_D_FF_tb;
    reg CLK;
    reg D;
    reg RST_n;
    wire Q1;
    wire Q2;
    Asynchronous_D_FF uut (
        .CLK(CLK),
        .D(D),
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
        D = 0;
        RST_n = 1; 
        #10;
        
        // 测试复位功能
        RST_n = 0; 
        #10 RST_n = 1; 

        // 测试D触发器功能
        #10 D = 1; 
        #10 D = 0; 
        #10 D = 1; 
        #10 $finish;
    end
endmodule