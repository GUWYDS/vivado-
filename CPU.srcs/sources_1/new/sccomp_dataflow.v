`timescale 1ns / 1ps
module sccomp_dataflow(
    input clk_in, reset,
    output [31:0] inst, pc
);

wire [31:0] pc_out, dm_addr_temp;
wire [31:0] im_addr_in, im_instr_out;
wire dm_ena, dm_r, dm_w;
wire [31:0] dm_addr, dm_data_out, dm_data_w;

assign im_addr_in = pc_out - 32'h00400000;
assign dm_addr = (dm_addr_temp - 32'h10010000)/4;
assign pc = pc_out;
assign inst = im_instr_out;

IMEM imem(
    .im_addr_in(im_addr_in[12:2]),
    .im_instr_out(im_instr_out)
);

DMEM dmem(
    .dm_clk(clk_in),
    .dm_ena(dm_ena),
    .dm_r(dm_r),
    .dm_w(dm_w),
    .dm_addr(dm_addr[10:0]),
    .dm_data_in(dm_data_w),
    .dm_data_out(dm_data_out)
);

cpu sccpu(
    .clk(clk_in),
    .ena(1'b1),
    .rst_n(reset),
    .instr_in(im_instr_out),
    .dm_data(dm_data_out),
    .dm_ena(dm_ena),
    .dm_w(dm_w),
    .dm_r(dm_r),
    .pc_out(pc_out),
    .dm_addr(dm_addr_temp),
    .dm_data_w(dm_data_w)
);

endmodule