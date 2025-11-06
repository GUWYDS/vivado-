`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/24 12:28:19
// Design Name: 
// Module Name: DataCompare8
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


module DataCompare8(
    input [7:0] iData_a, // 输入数据 a
    input [7:0] iData_b, // 输入数据 b
    output [2:0] oData  // 结果输出
);

    wire [2:0] compare_low;
    wire [2:0] compare_high;

    DataCompare4 compare_low_instance (
        .iData_a(iData_a[3:0]),
        .iData_b(iData_b[3:0]),
        .iData(3'b001), // 级联输入，表示低位比较结果
        .oData(compare_low)
    );
    DataCompare4 compare_high_instance (
        .iData_a(iData_a[7:4]),
        .iData_b(iData_b[7:4]),
        .iData(compare_low), // 级联输入，使用低位比较器的结果
        .oData(compare_high)
    );
    assign oData = compare_high;

endmodule