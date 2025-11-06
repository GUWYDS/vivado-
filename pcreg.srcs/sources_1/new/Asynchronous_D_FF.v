`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/31 23:46:13
// Design Name: 
// Module Name: Asynchronous_D_FF
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


// D触发器模块定义
module Asynchronous_D_FF(
    input clk,    // 时钟信号
    input rst,    // 异步重置信号
    input ena,    // 使能信号
    input d,      // 数据输入
    output reg q // 数据输出
);

always @(posedge clk,posedge rst) begin
    if (rst) begin
        q <= 1'b0;
    end else if (ena) begin
        q <= d;
    end
end
endmodule
