`timescale 1ns / 1ps

module CP0(
    input clk,                 // CP0时钟
    input rst,                 // CP0复位
    input mfc0,                // MFC0指令：从CP0读
    input mtc0,                // MTC0指令：写入CP0
    input [31:0] pc,           // 当前指令PC值
    input [4:0] Rd,            // 目标CP0寄存器号
    input [31:0] wdata,        // 写入数据
    input exception,          // 是否异常（如 syscall/break）
    input eret,                // 是否为ERET指令
    input [4:0] cause,         // 异常类型
    input intr,                // 外部中断信号
    output [31:0] rdata,       // CP0输出数据 (MFC0)
    output [31:0] status,      // CP0的status寄存器
    output reg timer_int,      // 外部中断标志
    output [31:0] exc_addr     // 异常跳转地址
);

    // 三种异常编码
    parameter SYSCALL = 5'b01000;
    parameter BREAK   = 5'b01001;
    parameter TEQ     = 5'b01101;

    // CP0寄存器编号
    parameter STATUS = 4'd12;
    parameter CAUSE  = 4'd13;
    parameter EPC    = 4'd14;

    // CP0寄存器堆
    reg [31:0] cp0_reg [31:0];

    // 异步读取接口
    assign rdata = (mfc0) ? cp0_reg[Rd] : 32'hz;
    assign status = cp0_reg[STATUS];

    // 异常跳转地址输出
    assign exc_addr = (exception || intr) ? 32'h00000004 : 32'hz;

    integer i;
    // CP0写入、异常处理逻辑
    always @(negedge clk or posedge rst) begin
        if (rst) begin
            for (i = 0; i < 32; i = i + 1)
                cp0_reg[i] <= 32'b0;
            timer_int <= 1'b0;
        end else begin
            if (mtc0) begin
                cp0_reg[Rd] <= wdata;
            end

            // 异常指令（系统调用 / break / teq）
            if (exception && (cause == SYSCALL || cause == BREAK || cause == TEQ)) begin
                cp0_reg[STATUS] <= cp0_reg[STATUS] << 5;
                cp0_reg[CAUSE]  <= {24'b0, cause, 2'b0}; // [6:2] = cause
                cp0_reg[EPC]    <= pc;
            end

            // 外部中断
            if (intr) begin
                cp0_reg[STATUS] <= cp0_reg[STATUS] << 5;
                cp0_reg[CAUSE]  <= {24'b0, 5'b00001, 2'b0}; // 外部中断cause设为1
                cp0_reg[EPC]    <= pc;
                timer_int       <= 1'b1;
            end else begin
                timer_int <= 1'b0;
            end

            // 处理ERET指令
            if (eret) begin
                cp0_reg[STATUS] <= cp0_reg[STATUS] >> 5;
            end
        end
    end

endmodule
