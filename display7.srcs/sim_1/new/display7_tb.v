`timescale 1ns/1ps  

module display7_tb;   
    reg [3:0] iData;     
    wire [6:0] oData;    
    display7 uut (  
        .iData(iData),  
        .oData(oData)  
    );  

    initial begin  
        iData = 4'b0000;  
        $monitor("At time %t: iData = %b, oData = %b", $time, iData, oData);  
        for (iData = 4'b0000; iData <= 4'b1001; iData = iData + 1) begin  
            #10;  
        end  
        $finish;  
    end  
endmodule