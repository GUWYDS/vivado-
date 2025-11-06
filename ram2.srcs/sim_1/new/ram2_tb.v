`timescale 1ns / 1ps


module ram2_tb();
reg clk;
    reg ena;
    reg wena;
    reg [4:0] addr;
    reg [31:0] temp;
    wire [31:0] data;
    ram2
    RAM(.clk(clk),.ena(ena),.wena(wena),.addr(addr),.data(data));
    //clk
    initial
    begin
        clk = 0;
        #1 clk = 1;
    end
    always #2 clk = ~clk;
   assign data = wena?temp:32'bz;
    initial 
    begin
        ena = 0;
        #20 ena = 1;        
       
        wena = 1; addr = 5'b0000;temp = 32'b1;
        #5 addr = 5'b0001; temp = 32'b0011;
        #5addr = 5'b0011;temp = 32'b0101;
        #5addr = 5'b1001;temp = 32'b1111;
        #5addr = 5'b1110;temp = 32'b0110;
        #5addr = 5'b0101;temp = 32'b0100;
        #20 
        wena = 0;
        addr = 5'b0001;
        #50addr = 5'b0000;
        #50addr = 5'b1001;
        #50addr = 5'b0011;
        #50addr = 5'b0101;
        #50addr = 5'b1110;
    end
endmodule
