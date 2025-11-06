`timescale 1ns / 1ps  

module Divider_tb;  

    reg I_CLK;    
    reg rst;    
    wire O_CLK;  
    Divider uut (  
        .I_CLK(I_CLK),  
        .rst(rst),  
        .O_CLK(O_CLK)  
    );  
    initial begin  
        I_CLK = 0; 
        forever #5 I_CLK = ~I_CLK;  
    end  
    initial begin  
        rst = 1;
        #10; 
        rst = 0;   
        #1000; // 运行1000ns以观察输出时钟的变化  
    end  
endmodule