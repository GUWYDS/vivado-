`timescale 1ns / 1ps  

module Counter8_tb;  
    reg CLK;            // 输入时钟信号  
    reg rst_n;         // 复位信号  
    wire [2:0] oQ;     // 二进制计数器输出  
    wire [6:0] oDisplay; // 七段显示器输出  
    Counter8 uut (  
        .CLK(CLK),   
        .rst_n(rst_n),   
        .oQ(oQ),   
        .oDisplay(oDisplay)  
    );  
    initial begin  
        CLK = 0; // 初始时钟为低  
        forever #5 CLK = ~CLK; // 10ns周期的时钟  
    end  
    initial begin  
        rst_n = 0; // 初始为低，进行复位  
        #15;      // 等待15ns以确保计数器复位  
        rst_n = 1; // 解除复位  
        #4000; // 运行4000ns以观察计数器变化  
    end  
endmodule