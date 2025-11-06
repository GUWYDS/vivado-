module MUL( 
    input clk,
    input reset,
    input [31:0] a,
    input [31:0] b,
    output reg [63:0] z
);

    wire [31:0] abs_a = a[31] ? (~a + 1) : a;
    wire [31:0] abs_b = b[31] ? (~b + 1) : b;
    wire sign = a[31] ^ b[31];

    wire [63:0] unsigned_result;
    wire [63:0] signed_result = sign ? (~unsigned_result + 1) : unsigned_result;

    MULTU multu(
        .clk(clk),
        .reset(reset),
        .a(abs_a),
        .b(abs_b),
        .z(unsigned_result)
    );

    // Êä³ö¼Ä´æ
    always @(posedge clk) begin
        if (reset)
            z <= 64'b0;
        else
            z <= signed_result;
    end

endmodule
