`timescale 1ns / 1ps  
module barrelshifter32_tb;  
    reg [31:0] a;  
    reg [4:0] b;  
    reg [1:0] aluc;  
    wire [31:0] c;  
    barrelshifter32 uut (  
        .a(a),  
        .b(b),  
        .aluc(aluc),  
        .c(c)  
    );  
    initial begin  
        a = 32'b11111111111111111111111111111111;
        b = 5'b00001;
        aluc = 2'b00; 
        #10; 
        $display("ALUC=00 | A=%b, B=%b, C=%b", a, b, c);  
        a = 32'b11111111111111111111111111111111;  
        b = 5'b00001;   
        aluc = 2'b10;  
        #10; 
        $display("ALUC=10 | A=%b, B=%b, C=%b", a, b, c);  
        a = 32'b00000000000000000000000000000001; 
        b = 5'b00001;   
        aluc = 2'b01;
        #10;
        $display("ALUC=01 | A=%b, B=%b, C=%b", a, b, c);  
        a = 32'b00000000000000000000000000000001; 
        b = 5'b00001; 
        aluc = 2'b11; 
        #10; 
        $display("ALUC=11 | A=%b, B=%b, C=%b", a, b, c);  
        $finish;  
    end  
endmodule