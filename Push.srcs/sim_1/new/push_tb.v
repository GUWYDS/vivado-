`timescale 1ns / 1ps  

module push_tb;   
    reg clk;               // 时钟信号  
    reg reset;             // 复位信号  
    reg key;               // 按键输入  
    wire led;              // LED 输出  
    wire [6:0] seg;        // 七段数码管输出   
    push uut (  
        .clk(clk),  
        .reset(reset),  
        .key(key),  
        .led(led),  
        .seg(seg)  
    );  
    initial begin  
        clk = 0;  
        forever #5 clk = ~clk;

    // 测试过程  
    initial begin    
        reset = 1;   
        key = 0;   
        #25;      

        // 解除复位  
        reset = 0;  
        #20;  

        // 模拟按键按下  
        key = 1;  
        #40;       

        key = 0;   
        #50;    

        // 再次按下按键
        key = 1;    
        #60;      

        key = 0;    
        #60;        
    end  


endmodule