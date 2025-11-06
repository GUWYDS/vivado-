`timescale 1ns / 1ps  

module MULTU(   
    input clk,  
    input reset,  
    input [31:0] a,  
    input [31:0] b,  
    output [63:0] z  
);  

reg [63:0] temp;  
reg [63:0] stored0_0, stored0_1, stored0_2, stored0_3, stored0_4, stored0_5, stored0_6, stored0_7;  
reg [63:0] stored1_0, stored1_1, stored1_2, stored1_3, stored1_4, stored1_5, stored1_6, stored1_7;  
reg [63:0] stored2_0, stored2_1, stored2_2, stored2_3, stored2_4, stored2_5, stored2_6, stored2_7;  
reg [63:0] stored3_0, stored3_1, stored3_2, stored3_3, stored3_4, stored3_5, stored3_6, stored3_7;  

reg [63:0] add0_0_1, add0_2_3, add0_4_5, add0_6_7;  
reg [63:0] add0_01_23, add0_45_67;  
reg [63:0] add1_0_1, add1_2_3, add1_4_5, add1_6_7;  
reg [63:0] add1_01_23, add1_45_67;  
reg [63:0] add2_0_1, add2_2_3, add2_4_5, add2_6_7;  
reg [63:0] add2_01_23, add2_45_67;  
reg [63:0] add3_0_1, add3_2_3, add3_4_5, add3_6_7;  
reg [63:0] add3_01_23, add3_45_67;  

reg [63:0] sum0_raw, sum1_raw, sum2_raw, sum3_raw;  

always @(posedge clk or negedge reset) begin   
    if (reset) begin   
        temp <= 64'b0;  
        stored0_0 <= 64'b0; stored0_1 <= 64'b0; stored0_2 <= 64'b0; stored0_3 <= 64'b0;  
        stored0_4 <= 64'b0; stored0_5 <= 64'b0; stored0_6 <= 64'b0; stored0_7 <= 64'b0;  
        stored1_0 <= 64'b0; stored1_1 <= 64'b0; stored1_2 <= 64'b0; stored1_3 <= 64'b0;  
        stored1_4 <= 64'b0; stored1_5 <= 64'b0; stored1_6 <= 64'b0; stored1_7 <= 64'b0;  
        stored2_0 <= 64'b0; stored2_1 <= 64'b0; stored2_2 <= 64'b0; stored2_3 <= 64'b0;  
        stored2_4 <= 64'b0; stored2_5 <= 64'b0; stored2_6 <= 64'b0; stored2_7 <= 64'b0;  
        stored3_0 <= 64'b0; stored3_1 <= 64'b0; stored3_2 <= 64'b0; stored3_3 <= 64'b0;  
        stored3_4 <= 64'b0; stored3_5 <= 64'b0; stored3_6 <= 64'b0; stored3_7 <= 64'b0;  
        add0_0_1 <= 64'b0; add0_2_3 <= 64'b0; add0_4_5 <= 64'b0; add0_6_7 <= 64'b0;  
        add0_01_23 <= 64'b0; add0_45_67 <= 64'b0;  
        add1_0_1 <= 64'b0; add1_2_3 <= 64'b0; add1_4_5 <= 64'b0; add1_6_7 <= 64'b0;  
        add1_01_23 <= 64'b0; add1_45_67 <= 64'b0;  
        add2_0_1 <= 64'b0; add2_2_3 <= 64'b0; add2_4_5 <= 64'b0; add2_6_7 <= 64'b0;  
        add2_01_23 <= 64'b0; add2_45_67 <= 64'b0;  
        add3_0_1 <= 64'b0; add3_2_3 <= 64'b0; add3_4_5 <= 64'b0; add3_6_7 <= 64'b0;  
        add3_01_23 <= 64'b0; add3_45_67 <= 64'b0;  
        sum0_raw <= 64'b0; sum1_raw <= 64'b0; sum2_raw <= 64'b0; sum3_raw <= 64'b0;  
    end   
    else begin   
        stored0_0 <= b[0]  ? {32'b0, a} << 0  : 64'b0;  
        stored0_1 <= b[1]  ? {32'b0, a} << 1  : 64'b0;  
        stored0_2 <= b[2]  ? {32'b0, a} << 2  : 64'b0;  
        stored0_3 <= b[3]  ? {32'b0, a} << 3  : 64'b0;  
        stored0_4 <= b[4]  ? {32'b0, a} << 4  : 64'b0;  
        stored0_5 <= b[5]  ? {32'b0, a} << 5  : 64'b0;  
        stored0_6 <= b[6]  ? {32'b0, a} << 6  : 64'b0;  
        stored0_7 <= b[7]  ? {32'b0, a} << 7  : 64'b0;  

        stored1_0 <= b[8]  ? {32'b0, a} << 8  : 64'b0;  
        stored1_1 <= b[9]  ? {32'b0, a} << 9  : 64'b0;  
        stored1_2 <= b[10] ? {32'b0, a} << 10 : 64'b0;  
        stored1_3 <= b[11] ? {32'b0, a} << 11 : 64'b0;  
        stored1_4 <= b[12] ? {32'b0, a} << 12 : 64'b0;  
        stored1_5 <= b[13] ? {32'b0, a} << 13 : 64'b0;  
        stored1_6 <= b[14] ? {32'b0, a} << 14 : 64'b0;  
        stored1_7 <= b[15] ? {32'b0, a} << 15 : 64'b0;  

        stored2_0 <= b[16] ? {32'b0, a} << 16 : 64'b0;  
        stored2_1 <= b[17] ? {32'b0, a} << 17 : 64'b0;  
        stored2_2 <= b[18] ? {32'b0, a} << 18 : 64'b0;  
        stored2_3 <= b[19] ? {32'b0, a} << 19 : 64'b0;  
        stored2_4 <= b[20] ? {32'b0, a} << 20 : 64'b0;  
        stored2_5 <= b[21] ? {32'b0, a} << 21 : 64'b0;  
        stored2_6 <= b[22] ? {32'b0, a} << 22 : 64'b0;  
        stored2_7 <= b[23] ? {32'b0, a} << 23 : 64'b0;  

        stored3_0 <= b[24] ? {32'b0, a} << 24 : 64'b0;  
        stored3_1 <= b[25] ? {32'b0, a} << 25 : 64'b0;  
        stored3_2 <= b[26] ? {32'b0, a} << 26 : 64'b0;  
        stored3_3 <= b[27] ? {32'b0, a} << 27 : 64'b0;  
        stored3_4 <= b[28] ? {32'b0, a} << 28 : 64'b0;  
        stored3_5 <= b[29] ? {32'b0, a} << 29 : 64'b0;  
        stored3_6 <= b[30] ? {32'b0, a} << 30 : 64'b0;  
        stored3_7 <= b[31] ? {32'b0, a} << 31 : 64'b0;  

        add0_0_1 <= stored0_0 + stored0_1;  
        add0_2_3 <= stored0_2 + stored0_3;  
        add0_4_5 <= stored0_4 + stored0_5;  
        add0_6_7 <= stored0_6 + stored0_7;  
        add1_0_1 <= stored1_0 + stored1_1;  
        add1_2_3 <= stored1_2 + stored1_3;  
        add1_4_5 <= stored1_4 + stored1_5;  
        add1_6_7 <= stored1_6 + stored1_7;  
        add2_0_1 <= stored2_0 + stored2_1;  
        add2_2_3 <= stored2_2 + stored2_3;  
        add2_4_5 <= stored2_4 + stored2_5;  
        add2_6_7 <= stored2_6 + stored2_7;  
        add3_0_1 <= stored3_0 + stored3_1;  
        add3_2_3 <= stored3_2 + stored3_3;  
        add3_4_5 <= stored3_4 + stored3_5;  
        add3_6_7 <= stored3_6 + stored3_7;  

        add0_01_23 <= add0_0_1 + add0_2_3;  
        add0_45_67 <= add0_4_5 + add0_6_7;  
        add1_01_23 <= add1_0_1 + add1_2_3;  
        add1_45_67 <= add1_4_5 + add1_6_7;  
        add2_01_23 <= add2_0_1 + add2_2_3;  
        add2_45_67 <= add2_4_5 + add2_6_7;  
        add3_01_23 <= add3_0_1 + add3_2_3;  
        add3_45_67 <= add3_4_5 + add3_6_7;  

        sum0_raw <= add0_01_23 + add0_45_67;  
        sum1_raw <= add1_01_23 + add1_45_67;  
        sum2_raw <= add2_01_23 + add2_45_67;  
        sum3_raw <= add3_01_23 + add3_45_67;  

        temp <= sum0_raw + sum1_raw + sum2_raw + sum3_raw;  
    end   
end   

assign z = temp;  

endmodule  
