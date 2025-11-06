`timescale 1ns / 1ps
module Synchronous_D_FF_tb;
    // 输入信号
    reg CLK;
    reg D;
    reg RST_n;
    // 输出信号
    wire Q1;
    wire Q2;
    Synchronous_D_FF uut (
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