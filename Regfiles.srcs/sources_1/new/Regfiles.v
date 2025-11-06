`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/14 15:37:25
// Design Name: 
// Module Name: Regfiles
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


module Regfiles(
    input clk, //寄存器组时钟信号，下降沿写入数据
    input rst, //异步复位信号，高电平时全部寄存器置零
    input we, //寄存器读写有效信号，高电平时允许寄存器写入数据，低电平时允许寄存器读出数据
    input [4:0] raddr1, //所需读取的寄存器的地址
    input [4:0] raddr2, //所需读取的寄存器的地址
    input [4:0] waddr, //写寄存器的地址
    input [31:0] wdata, //写寄存器数据，数据在 clk 下降沿时被写入
    output [31:0] rdata1, //raddr1 所对应寄存器的输出数据
    output [31:0] rdata2 //raddr2 所对应寄存器的输出数据
);
    wire [15:0] out;
    decoder dec(
    .iData(waddr),
    .iEna(we),
    .oData(out)
    );
    wire [31:0] data_out [31:0];
    genvar i;
    generate
        for (i = 0; i < 32; i = i + 1) begin : gen_dff
                pcreg dff(
                .clk(clk),
                .rst(rst),
                .ena(out[i]),
                .data_in(wdata),
                .data_out(data_out[i])
                );
        end
    endgenerate
     data_selector_32_to_1 my_selector1 (  
           .iC0(data_out[0]),  
           .iC1(data_out[1]),  
           .iC2(data_out[2]),  
           .iC3(data_out[3]),  
           .iC4(data_out[4]),  
           .iC5(data_out[5]),  
           .iC6(data_out[6]),  
           .iC7(data_out[7]),  
           .iC8(data_out[8]),  
           .iC9(data_out[9]),  
           .iC10(data_out[10]),  
           .iC11(data_out[11]),  
           .iC12(data_out[12]),  
           .iC13(data_out[13]),  
           .iC14(data_out[14]),  
           .iC15(data_out[15]),  
           .iC16(data_out[16]),  
           .iC17(data_out[17]),  
           .iC18(data_out[18]),  
           .iC19(data_out[19]),  
           .iC20(data_out[20]),  
           .iC21(data_out[21]),  
           .iC22(data_out[22]),
           .iC23(data_out[23]),  
           .iC24(data_out[24]),  
           .iC25(data_out[25]),  
           .iC26(data_out[26]),  
           .iC27(data_out[27]),  
           .iC28(data_out[28]),  
           .iC29(data_out[29]),  
           .iC30(data_out[30]),  
           .iC31(data_out[31]), 
           .enable(!we),
           .iSel(raddr1),  
           .oZ(rdata1)  
       );  
       data_selector_32_to_1 my_selector2 (  
                 .iC0(data_out[0]),  
                 .iC1(data_out[1]),  
                 .iC2(data_out[2]),  
                 .iC3(data_out[3]),  
                 .iC4(data_out[4]),  
                 .iC5(data_out[5]),  
                 .iC6(data_out[6]),  
                 .iC7(data_out[7]),  
                 .iC8(data_out[8]),  
                 .iC9(data_out[9]),  
                 .iC10(data_out[10]),  
                 .iC11(data_out[11]),  
                 .iC12(data_out[12]),  
                 .iC13(data_out[13]),  
                 .iC14(data_out[14]),  
                 .iC15(data_out[15]),  
                 .iC16(data_out[16]),  
                 .iC17(data_out[17]),  
                 .iC18(data_out[18]),  
                 .iC19(data_out[19]),  
                 .iC20(data_out[20]),  
                 .iC21(data_out[21]),  
                 .iC22(data_out[22]),
                 .iC23(data_out[23]),  
                 .iC24(data_out[24]),  
                 .iC25(data_out[25]),  
                 .iC26(data_out[26]),  
                 .iC27(data_out[27]),  
                 .iC28(data_out[28]),  
                 .iC29(data_out[29]),  
                 .iC30(data_out[30]),  
                 .iC31(data_out[31]), 
                 .enable(!we),
                 .iSel(raddr2),  
                 .oZ(rdata2)  
             );  
    endmodule
