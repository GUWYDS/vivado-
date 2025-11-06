`timescale 1ns / 1ps  
module encoder83_Pri_tb;
    reg [7:0] iData;    
    reg iEI;       
    wire [2:0] oData;    
    wire oEO;      
    encoder83_Pri uut (  
        .iData(iData),  
        .iEI(iEI),  
        .oData(oData),  
        .oEO(oEO)  
    );  
    initial begin  
        iData = 8'b00000000;  // 默认输入  
        iEI = 1'b0;           // 默认使能信号  
        $monitor("At time %t: iData = %b, iEI = %b, oData = %b, oEO = %b", $time, iData, iEI, oData, oEO);  
        iEI = 1'b1;   #10;   iEI = 1'b0;  
        iData = 8'b11111111; #10;  iData = 8'b01111111; #10;  
        iData = 8'b10111111; #10;  iData = 8'b11011111; #10; 
        iData = 8'b11101111; #10;  iData = 8'b11110111; #10;  
        iData = 8'b11111011; #10;  iData = 8'b11111101; #10; 
        iData = 8'b11111110; #10;  iData = 8'b00000001; #10; 
        iData = 8'b00000010; #10;  iData = 8'b00000100; #10;   
        iData = 8'b00001000; #10;  iData = 8'b00010000; #10;  
        iData = 8'b00100000; #10;  iData = 8'b01000000; #10;  
        iData = 8'b10000000; #10;  
        $finish;  
    end  
endmodule