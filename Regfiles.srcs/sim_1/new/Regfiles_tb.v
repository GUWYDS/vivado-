`timescale 1ns / 1ps  

module Regfiles_tb;  
    reg clk;  
    reg rst;  
    reg we;  
    reg [4:0] raddr1;  
    reg [4:0] raddr2;  
    reg [4:0] waddr;  
    reg [31:0] wdata;  
    wire [31:0] rdata1; 
    wire [31:0] rdata2;  
    Regfiles uut (.clk(clk),.rst(rst),.we(we),.raddr1(raddr1),.raddr2(raddr2),.waddr(waddr),.wdata(wdata),.rdata1(rdata1),.rdata2(rdata2));  
    always begin  
        #5 clk = ~clk;  
    end  
    initial begin  
        clk = 0;  rst = 1;  we = 0;  raddr1 = 0;  raddr2 = 0;  waddr = 0;  wdata = 0;  
        #10 rst = 0;  
        we = 1;  
        waddr = 5'b00000;  
        wdata = 32'hA5A5A5A5;  
        #10;  
        waddr = 5'b00001;  
        wdata = 32'h5A5A5A5A;  
        #10;  
        we = 0;  
        raddr1 = 5'b00000;  
        raddr2 = 5'b00001;  
        #10; 
        we = 1;  
        waddr = 5'b00010;  
        wdata = 32'hDEADBEEF;  
        #10;  
        we = 0;  
        waddr = 5'b00001;  
        wdata = 32'h5A5A5A5A;   
        raddr1 = 5'b00010;   
        #10;  
    end  
endmodule