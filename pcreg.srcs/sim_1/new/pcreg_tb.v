`timescale 1ns / 1ps

module pcreg_tb;
    reg clk;
    reg rst;
    reg ena;
    reg [31:0] data_in;
    wire [31:0] data_out;
    pcreg uut (
        .clk(clk),
        .rst(rst),
        .ena(ena),
        .data_in(data_in),
        .data_out(data_out)
    );
    initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end
    initial begin
        rst = 1; 
        ena = 0; 
        data_in = 32'd0; 
        #10;
        rst = 0;
        #10;
        // 使能PC寄存器并更新data_i
        ena = 1;
        data_in = 32'hA5A5A5A5; 
        #10;
        // 禁用使能信号，观察data_out是否保持上一个值
        ena = 0;
        #10;
        // 再次使能并更新data_in
        ena = 1;
        data_in = 32'h5A5A5A5A; 
        #10;
        #10 $finish;
    end
endmodule