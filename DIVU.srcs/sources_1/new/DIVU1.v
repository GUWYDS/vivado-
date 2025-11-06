`timescale 1ns/1ps
module DIVU1 (
    input [31:0] dividend,
    input [31:0] divisor,
    input start,
    input clock,
    input reset,
    output reg [31:0] q,
    output reg [31:0] r,
    output reg busy
);

    reg [63:0] temp;
    reg [31:0] reg_divisor;
    reg [5:0] count;

    always @(posedge clock or posedge reset) begin
        if (reset) begin
            q <= 0;
            r <= 0;
            busy <= 0;
            count <= 0;
            temp <= 0;
            reg_divisor <= 0;
        end else begin
            if (start && !busy) begin
                busy <= 1;
                temp <= {32'b0, dividend};     // ×ó±ßÊÇÓàÊýÇøÓò
                reg_divisor <= divisor;
                count <= 0;
            end else if (busy) begin
                if (count < 32) begin
                    temp = temp << 1;
                    if (temp[63:32] >= reg_divisor) begin
                        temp[63:32] = temp[63:32] - reg_divisor;
                        temp[0] = 1'b1;
                    end else begin
                        temp[0] = 1'b0;
                    end
                    count <= count + 1;
                end else begin
                    q <= temp[31:0];
                    r <= temp[63:32];
                    busy <= 0;
                end
            end
        end
    end

endmodule
