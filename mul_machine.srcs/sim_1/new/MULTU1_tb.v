`timescale 1ns / 1ps

module MULTU1_tb;

reg clk;
reg reset;
reg [31:0] a;
reg [31:0] b;
wire [63:0] z;

MULTU1 uut (
    .clk(clk),
    .reset(reset),
    .a(a),
    .b(b),
    .z(z)
);

initial begin
    clk = 0;
    forever #1 clk = ~clk;
end

initial begin
    reset = 1;
    #10;
    reset = 0;
    
    a = 32'b00000000000000000000000000000011; // 3
    b = 32'b00000000000000000000000000000100; // 4
    reset = 1;
    #10;
    reset = 0;
    #400; 

    a = 32'b00000000000000000000000000001111; // 15
    b = 32'b00000000000000000000000000001111; // 15
    reset = 1;
    #10;
    reset = 0;
    #400;

    a = 32'b00000000000000001111111111111111; // 65535
    b = 32'b00000000000000001111111111111111; // 65535
    reset = 1;
    #10;
    reset = 0;
    #400;
end

endmodule
