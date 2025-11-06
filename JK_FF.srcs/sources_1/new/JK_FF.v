`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/26 14:18:47
// Design Name: 
// Module Name: JK_FF
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


module JK_FF(
    input CLK, //时钟信号，上升沿有效
    input J, //输入信号 J
    input K, //输入信号 K
    input RST_n, //复位信号，低电平有效
    output reg Q1,//输出信号 Q
    output Q2 //输出信号Q?
);
always@(negedge RST_n,posedge CLK)
    begin    
        if(!RST_n)
           begin
            Q1<=0;
            end
        else 
        begin  
          case ({J, K})  
              2'b00: begin // 无变化  
                   Q1 <= Q1;  
                     end  
              2'b01: begin // 复位  
                   Q1 <= 1'b0;  
                     end  
              2'b10: begin // 置位  
                   Q1 <= 1'b1;  
                     end  
              2'b11: begin // 翻转  
                   Q1 <= ~Q1;  
                     end  
           endcase  
        end  
    end      
    assign Q2 = !Q1;  
endmodule
