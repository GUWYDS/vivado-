`timescale 1ns / 1ps

module MUL1_tb;

reg clk;
reg reset;
reg [31:0] a, b;
wire [63:0] z;

MUL1 uut (
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

    // Test 1: 5 * 3 = 15
    a = 32'd5;
    b = 32'd3;
    reset = 1;
    #10;
    reset = 0;
    #350;

    // Test 2: -5 * 3 = -15
    a = -32'd5;
    b = 32'd3;
    reset = 1;
    #10;
    reset = 0;
    #350;

    // Test 3: -6 * -4 = 24
    a = -32'd6;
    b = -32'd4;
    reset = 1;
    #10;
    reset = 0;
    #350;
end

endmodule
