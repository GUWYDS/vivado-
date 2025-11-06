`timescale 1ns / 1ps  
module alu_tb;  

    reg [31:0] a;                // 32位输入操作数1  
    reg [31:0] b;                // 32位输入操作数2  
    reg [3:0] aluc;              // 控制ALU的操作  
    wire [31:0] r;               // 操作结果输出  
    wire zero;                   // 零标志位输出  
    wire carry;                  // 进位标志位输出  
    wire negative;               // 负数标志位输出  
    wire overflow;               // 溢出标志位输出  
    alu uut (  
        .a(a),  
        .b(b),  
        .aluc(aluc),  
        .r(r),  
        .zero(zero),  
        .carry(carry),  
        .negative(negative),  
        .overflow(overflow)  
    );  
    initial begin  
        a = 32'd10; b = 32'd20; aluc = 4'b0000; // 10 + 20  
        #50;  

        a = 32'd15; b = 32'd25; aluc = 4'b0010; // 10 + 20   
        #50;  
    
        a = 32'd30; b = 32'd20; aluc = 4'b0001; // 30 - 20  
        #50;  

        a = 32'd20; b = 32'd25; aluc = 4'b0011; // 20 - 25  
        #50;  

        a = 32'hF0F0F0F0; b = 32'h0F0F0F0F; aluc = 4'b0100; // AND  
        #50;  

        a = 32'hF0F0F0F0; b = 32'h0F0F0F0F; aluc = 4'b0101; // OR  
        #50;  

        a = 32'hF0F0F0F0; b = 32'h0F0F0F0F; aluc = 4'b0110; // XOR  
        #50;  

        a = 32'hF0F0F0F0; b = 32'h0F0F0F0F; aluc = 4'b0111; // NOR  
        #50;  

        a = 32'd0; b = 32'h12345678; aluc = 4'b1000; // 置数 
        #50;  

        a = 32'd10; b = 32'd20; aluc = 4'b1011; // 10 < 20  
        #50;  

        a = 32'd20; b = 32'd10; aluc = 4'b1010; // 20 < 10  
        #50;  

        a = 32'd2; b = 32'd8; aluc = 4'b1100; // 8 >>> 2  
        #50;  
 
        a = 32'd2; b = 32'd8; aluc = 4'b1101; // 8 >> 2  
        #50;   

        a = 32'd2; b = 32'd8; aluc = 4'b1110; // 8 << 2  
        #50;  

    end  
endmodule