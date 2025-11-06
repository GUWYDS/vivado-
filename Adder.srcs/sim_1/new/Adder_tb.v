`timescale 1ns / 1ps  
  
module Adder_tb;  
    reg [7:0] iData_a;  
    reg [7:0] iData_b;  
    reg iC;  
    wire [7:0] oData;  
    wire oData_C;  
    Adder uut (  
        .iData_a(iData_a),  
        .iData_b(iData_b),  
        .iC(iC),  
        .oData(oData),  
        .oData_C(oData_C)  
    );  
    initial begin   
        iData_a = 8'h34; // 00110100  
        iData_b = 8'h12; // 00010010  
        iC = 0;  
        #10;
        $display("iData_a = 0x%X, iData_b = 0x%X, iC = %b, oData = 0x%X, oData_C = %b", iData_a, iData_b, iC, oData, oData_C);  
        iData_a = 8'hFF; // 11111111  
        iData_b = 8'h01; // 00000001  
        iC = 1;  
        #10; 
        $display("iData_a = 0x%X, iData_b = 0x%X, iC = %b, oData = 0x%X, oData_C = %b", iData_a, iData_b, iC, oData, oData_C);  
        iData_a = 8'hFF; // 11111111  
        iData_b = 8'hFF; // 11111111  
        iC = 0;  
        #10; 
        $display("iData_a = 0x%X, iData_b = 0x%X, iC = %b, oData = 0x%X, oData_C = %b", iData_a, iData_b, iC, oData, oData_C);  
        iData_a = 8'h00; // 00000000  
        iData_b = 8'h00; // 00000000  
        iC = 0;  
        #10;  
        $display("iData_a = 0x%X, iData_b = 0x%X, iC = %b, oData = 0x%X, oData_C = %b", iData_a, iData_b, iC, oData, oData_C);   
        iData_a = 8'hA3; // 10100011  
        iData_b = 8'h5C; // 01011100  
        iC = 0;  
        #10;
        $display("iData_a = 0x%X, iData_b = 0x%X, iC = %b, oData = 0x%X, oData_C = %b", iData_a, iData_b, iC, oData, oData_C);   
        $finish; 
    end  
endmodule