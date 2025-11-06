`timescale 1ns/1ps

module DIV_tb;

    reg [31:0] dividend;
    reg [31:0] divisor;
    reg clock;
    reg reset;
    reg start;
    wire [31:0] q;
    wire [31:0] r;
    wire busy;

    // 实例化被测模块
    DIV uut (
        .dividend(dividend),
        .divisor(divisor),
        .start(start),
        .clock(clock),
        .reset(reset),
        .q(q),
        .r(r),
        .busy(busy)
    );

    // 时钟生成
    always #5 clock = ~clock;

    // 测试数据
    reg [31:0] dividends[0:4];
    reg [31:0] divisors[0:3];

    integer i, j;

    initial begin
        // 初始化
        clock = 0;
        reset = 1;
        start = 0;
        dividend = 0;
        divisor = 1;

        // 初始化测试数据
        dividends[0] = 32'h00000000;
        dividends[1] = 32'hffffffff;
        dividends[2] = 32'haaaaaaaa;
        dividends[3] = 32'h55555555;
        dividends[4] = 32'h7fffffff;

        divisors[0] = 32'hffffffff;
        divisors[1] = 32'haaaaaaaa;
        divisors[2] = 32'h55555555;
        divisors[3] = 32'h7fffffff;

        // 同步复位
        #20 reset = 0;

        // 开始测试所有组合
        for (i = 0; i < 5; i = i + 1) begin
            for (j = 0; j < 4; j = j + 1) begin
                // 设置被除数和除数
                dividend = dividends[i];
                divisor = divisors[j];

                // 发出 start 脉冲
                start = 1;
                #10;
                start = 0;

                // 等待 busy 变低，表示运算完成
                wait (busy == 1);
                wait (busy == 0);
                #10;

                // 打印结果
                $display("dividend = 0x%h, divisor = 0x%h => quotient = 0x%h, remainder = 0x%h",
                         dividend, divisor, q, r);
            end
        end

        $finish;
    end

endmodule
