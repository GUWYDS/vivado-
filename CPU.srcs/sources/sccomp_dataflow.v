`timescale 1ns / 1ps
module sccomp_dataflow(
    input clk_in,
    input reset,
    output [7:0]  o_seg,
    output [7:0]  o_sel
    );

wire [31:0] pc_out;
wire [31:0] dm_addr_temp;

wire [31:0] im_addr_in;
wire [31:0] im_instr_out;

assign im_addr_in = pc_out - 32'h00400000;

wire dm_ena;
wire dm_r, dm_w;
wire [31:0] dm_addr;
wire [31:0] dm_data_out;
wire [31:0] dm_data_w;

assign dm_addr = (dm_addr_temp -  32'h10010000)/4;

assign pc = pc_out;
assign inst = im_instr_out;

IMEM imem(
    .im_addr_in(im_addr_in[12:2]),
    .im_instr_out(im_instr_out)
    );

DMEM dmem(
    .dm_clk(clk_cpu),
    .dm_ena(dm_ena),
    .dm_r(dm_r),
    .dm_w(dm_w),
    .dm_addr(dm_addr[10:0]),
    .dm_data_in(dm_data_w),
    .dm_data_out(dm_data_out)
    );

cpu sccpu(
    .clk(clk_cpu),
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

seg7x16 seg7x16_inst(
    .clk(clk_in),
    .reset(reset),
    .cs(1'b1),
    .i_data(im_instr_out),
    .o_seg(o_seg),
    .o_sel(o_sel)
    );

Divider Divider_inst(
    .clk(clk_in),
    .rst_n(~reset),
    .clk_out(clk_cpu)
    );

endmodule