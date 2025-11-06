`timescale 1ns / 1ps
module ram_tb;
    reg clk;
    reg ena;
    reg wena;
    reg [4:0] addr;
    reg [31:0] data_in;
    wire [31:0] data_out;
    ram uut (
        .clk(clk),.ena(ena), .wena(wena), .addr(addr), .data_in(data_in), .data_out(data_out)
    );
    initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end
    initial begin
        ena = 0;wena = 0;addr = 0;data_in = 0;
        #10;
        ena = 1;
        wena = 1;
        addr = 0;  // µÿ÷∑ 0
        data_in = 32'hAAAAAAAA;
        #10;
        addr = 1;  // µÿ÷∑ 1
        data_in = 32'hBBBBBBBB;
        #10;
        addr = 2;  // µÿ÷∑ 2
        data_in = 32'hCCCCCCCC;
        #10;
        wena = 0;
        addr = 0;
        #10;
        addr = 1;
        #10;
        addr = 2;
        #10;
        ena = 0;
    end
endmodule