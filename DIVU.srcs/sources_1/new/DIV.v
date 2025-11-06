`timescale 1ns/1ps

module DIV(
    input [31:0] dividend,         // 被除数
    input [31:0] divisor,          // 除数
    input start,   
    input clock,
    input reset,
    output reg[31:0] q,  //商
    output reg[31:0] r,  //余数
    output reg busy
    );
    wire [31:0]abs_dividend = dividend[31] ? (~dividend + 1) : dividend;
    wire [31:0]abs_divisor = divisor[31] ? (~divisor + 1) : divisor;
    wire sign = dividend[31]^divisor[31];
    wire [31:0] u_q;
    wire [31:0] u_r;
    wire [31:0] signed_q = sign ? (~u_q + 1) : u_q;
    wire [31:0] signed_r = dividend[31] ? (~u_r + 1) : u_r;
    wire busy_temp;
    
    DIVU divu(
    .dividend(abs_dividend),
    .divisor(abs_divisor),
    .start(start),
    .clock(clock),
    .reset(reset),
    .q(u_q),
    .r(u_r),
    .busy(busy_temp)
    );
    
    always @(posedge clock) begin
        if(reset) begin
            q <= 31'b0;
            r <= 31'b0;
            busy <= 1'b0;
        end
        else begin
            q <= signed_q;
            r <= signed_r;
            busy <= busy_temp;
        end
    end
        
endmodule
            
            