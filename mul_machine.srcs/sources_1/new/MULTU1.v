`timescale 1ns / 1ps  

module MULTU1(  
    input clk,  
    input reset,  
    input [31:0] a,  
    input [31:0] b,  
    output reg [63:0] z  
);  

reg [63:0] acc;  
reg [63:0] a_shift;  
reg [31:0] b_shift;  
reg [5:0]  count;  

always @(posedge clk) begin  
    if (reset) begin  
        acc      <= 64'b0;  
        a_shift  <= {32'b0, a};  
        b_shift  <= b;  
        count    <= 0;  
        z        <= 64'b0;  
    end else begin  
        if (count < 32) begin  
            if (b_shift[0]) acc <= acc + a_shift;  
            a_shift <= a_shift << 1;  
            b_shift <= b_shift >> 1;  
            count   <= count + 1;  
        end else begin  
            z <= acc;  
        end  
    end  
end  

endmodule  