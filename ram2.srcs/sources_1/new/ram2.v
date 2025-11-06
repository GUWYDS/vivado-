`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/14 14:23:57
// Design Name: 
// Module Name: ram
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ram2 (
     input clk, //存储器时钟信号，上升沿时向 ram 内部写入数据
    input ena, //存储器有效信号，高电平时存储器才运行，否则输出 z
    input wena, //存储器读写有效信号，高电平为写有效，低电平为读有效，与ena 同时有效时才可对存储器进行读写
     input [4:0] addr, //输入地址，指定数据读写的地址
    inout [31:0] data //存储器数据线，可传输存储器读出或写入的数据。写入的数据在 clk 上升沿时被写入
);
    reg [31:0] memory [31:0];  
    reg [31:0] data_out;  
    assign data = (ena && !wena) ? data_out : 32'bz; 
    always @(posedge clk) 
    begin  
        if (ena && wena)  
            memory[addr] <= data;  
    end
    always@(*)
    begin
        if(ena && !wena)
               data_out = memory[addr];
    end           
endmodule  
