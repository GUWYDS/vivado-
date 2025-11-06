`timescale 1ns / 1ps

module DataCompare8_tb;

    reg [7:0] iData_a;
    reg [7:0] iData_b;
    wire [2:0] oData;

    // 实例化被测试的模块
    DataCompare8 uut (
        .iData_a(iData_a),
        .iData_b(iData_b),
        .oData(oData)
    );

    // 初始块，用于测试
    initial begin
        // 初始化输入数据
        iData_a = 8'b0;
        iData_b = 8'b0;
        
        // 应用测试用例
        // 测试用例1：iData_a < iData_b
        iData_a = 8'h0F; // 00001111
        iData_b = 8'hFF; // 11111111
        #10; // 延迟10个时间单位
        $display("Test Case 1: iData_a = 0x%X, iData_b = 0x%X, oData = %b", iData_a, iData_b, oData);

        // 测试用例2：iData_a == iData_b
        iData_a = 8'h55; // 01010101
        iData_b = 8'h55; // 01010101
        #10; // 延迟10个时间单位
        $display("Test Case 2: iData_a = 0x%X, iData_b = 0x%X, oData = %b", iData_a, iData_b, oData);

        // 测试用例3：iData_a > iData_b
        iData_a = 8'hAA; // 10101010
        iData_b = 8'h55; // 01010101
        #10; // 延迟10个时间单位
        $display("Test Case 3: iData_a = 0x%X, iData_b = 0x%X, oData = %b", iData_a, iData_b, oData);

        // 测试用例4：iData_a和iData_b的低四位相同，高四位不同（iData_a高四位 > iData_b高四位）
        iData_a = 8'h66; // 01100110
        iData_b = 8'h26; // 00100110
        #10; // 延迟10个时间单位
        $display("Test Case 4: iData_a = 0x%X, iData_b = 0x%X, oData = %b", iData_a, iData_b, oData);

        // 测试用例5：iData_a和iData_b的低四位不同，高四位相同（iData_a低四位 > iData_b低四位）
        iData_a = 8'h90; // 10010000
        iData_b = 8'h85; // 10000101
        #10; // 延迟10个时间单位
        $display("Test Case 5: iData_a = 0x%X, iData_b = 0x%X, oData = %b", iData_a, iData_b, oData);

        // 结束仿真
        $finish;
    end
endmodule