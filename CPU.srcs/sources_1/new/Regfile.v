`timescale 1ns / 1ps
module regfile(
    input reg_clk, reg_ena, rst_n, reg_w,
    input [4:0] RdC, RtC, RsC,
    input [31:0] Rd_data_in,
    output [31:0] Rs_data_out, Rt_data_out
);

reg [31:0] array_reg [31:0];

assign Rs_data_out = reg_ena ? array_reg[RsC] : 32'bz;
assign Rt_data_out = reg_ena ? array_reg[RtC] : 32'bz;

always @(negedge reg_clk or posedge rst_n)
begin
    if(rst_n && reg_ena)
    begin:reset_block
        integer i;
        for(i = 0; i < 32; i = i + 1)
            array_reg[i] <= 32'h0;
    end
    else if(reg_ena && reg_w && (RdC != 5'h0))
        array_reg[RdC] <= Rd_data_in;
end

endmodule