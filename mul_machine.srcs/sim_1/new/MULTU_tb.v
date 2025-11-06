`timescale 1ns / 1ps

module MULTU_tb;

    reg clk;
    reg reset;
    reg [31:0] a;
    reg [31:0] b;
    wire [63:0] z;

    MULTU uut (
        .clk(clk),
        .reset(reset),
        .a(a),
        .b(b),
        .z(z)
    );

    initial clk = 0;
    always #5 clk = ~clk;  

    initial begin
        #10;
        reset = 1;
        #10;
        reset = 0;

        // Expected z = 0x000000000000000F = 15
        a = 32'b00000000000000000000000000000101;
        b = 32'b00000000000000000000000000000011;
        #50;
        

        // Expected z = 0x0000000000000FF0 = 4080
        a = 32'b00000000000000000000000011111111;
        b = 32'b00000000000000000000000000010000;
        #50;
        

        // Expected z = 0x000000000001FFFE = 131070
        a = 32'b00000000000000001111111111111111;
        b = 32'b00000000000000000000000000000010;
        #50;
    end
endmodule
