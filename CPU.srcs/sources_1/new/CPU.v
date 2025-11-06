`timescale 1ns / 1ps
module cpu(
    input clk,                  
    input ena,                  
    input rst_n,                
    input [31:0] instr_in,      
    input [31:0] dm_data,       
    output dm_ena,              
    output dm_w,                
    output dm_r,                
    output [31:0] pc_out,       
    output [31:0] dm_addr,      
    output [31:0] dm_data_w     
);

wire add_flag, addu_flag, sub_flag, subu_flag, and_flag, or_flag, xor_flag, nor_flag,
     slt_flag, sltu_flag,
     sll_flag, srl_flag, sra_flag, sllv_flag,
     srlv_flag, srav_flag,
     jr_flag,
     addi_flag, addiu_flag,
     andi_flag, ori_flag, xori_flag,
     lw_flag, sw_flag,
     beq_flag, bne_flag,
     slti_flag, sltiu_flag,
     lui_flag,
     j_flag, jal_flag;       
wire [4:0] RsC, RtC, RdC, shamt;
wire [15:0] immediate;
wire [25:0] address;

wire reg_w;                    
wire [9:0] mux;                 
wire [4:0] ext_ena;             
wire cat_ena;                   

wire [31:0] a, b;                            
wire [3:0] aluc;                      
wire [31:0] alu_data_out;               
wire zero, carry, negative, overflow;   

wire [31:0] Rd_data_in, Rs_data_out, Rt_data_out;

wire [31:0] pc_addr_in, pc_addr_out;

wire [31:0] ext1_out, ext5_out, ext16_out, ext16_out_signed, ext18_out_signed;
assign ext1_out = (slt_flag||sltu_flag)?negative:(slti_flag||sltiu_flag)?carry:32'hz;
assign ext5_out = (sll_flag||srl_flag||sra_flag)?shamt:32'hz;
assign ext16_out = (andi_flag||ori_flag||xori_flag||lui_flag)?{16'h0,immediate[15:0]}:32'hz;
assign ext16_out_signed = (addi_flag||addiu_flag||lw_flag||sw_flag||slti_flag||sltiu_flag)?{{16{immediate[15]}},immediate[15:0]}:32'hz;
assign ext18_out_signed = (beq_flag||bne_flag)?{{14{immediate[15]}},immediate[15:0],2'b0}:32'hz;

wire [31:0] cat_out;
assign cat_out = cat_ena?{pc_out[31:28],address[25:0],2'h0}:32'hz;

wire [31:0] npc = pc_addr_out + 4;

wire [31:0] mux1_out, mux2_out, mux3_out, mux4_out, mux5_out, mux6_out, mux7_out, mux8_out, mux9_out;
assign mux1_out = mux[1]?cat_out:mux4_out;
assign mux2_out = mux[2]?mux9_out:dm_data;
assign mux3_out = mux[3]?ext5_out:((sllv_flag||srlv_flag||srav_flag)?{27'h0,Rs_data_out[4:0]}:Rs_data_out);
assign mux4_out = mux[4]?mux6_out:Rs_data_out;
assign mux5_out = mux[5]?mux8_out:Rt_data_out;
assign mux6_out = mux[6]?npc:ext18_out_signed + npc;
assign mux7_out = mux[7]?(pc_addr_out + 4):mux2_out;
assign mux8_out = mux[8]?ext16_out_signed:ext16_out;
assign mux9_out = mux[9]?alu_data_out:ext1_out;

assign pc_addr_in = mux1_out;
assign a = mux3_out;
assign b = mux5_out;
assign pc_out = pc_addr_out;
assign dm_ena = (dm_r||dm_w)?1'b1:1'b0;
assign dm_addr = alu_data_out;
assign dm_data_w = Rt_data_out;
assign Rd_data_in = mux7_out;

Decoder Decoder_inst(
    .instr_in(instr_in),
    .add_flag(add_flag), .addu_flag(addu_flag), .sub_flag(sub_flag), .subu_flag(subu_flag),
    .and_flag(and_flag), .or_flag(or_flag), .xor_flag(xor_flag), .nor_flag(nor_flag),
    .slt_flag(slt_flag), .sltu_flag(sltu_flag), .sll_flag(sll_flag), .srl_flag(srl_flag),
    .sra_flag(sra_flag), .sllv_flag(sllv_flag), .srlv_flag(srlv_flag), .srav_flag(srav_flag),
    .jr_flag(jr_flag), .addi_flag(addi_flag), .addiu_flag(addiu_flag), .andi_flag(andi_flag),
    .ori_flag(ori_flag), .xori_flag(xori_flag), .lw_flag(lw_flag), .sw_flag(sw_flag),
    .beq_flag(beq_flag), .bne_flag(bne_flag), .slti_flag(slti_flag), .sltiu_flag(sltiu_flag),
    .lui_flag(lui_flag), .j_flag(j_flag), .jal_flag(jal_flag),
    .RsC(RsC), .RtC(RtC), .RdC(RdC), .shamt(shamt), .immediate(immediate), .address(address)
);

Controler Controler_inst(              
    .add_flag(add_flag), .addu_flag(addu_flag), .sub_flag(sub_flag), .subu_flag(subu_flag),
    .and_flag(and_flag), .or_flag(or_flag), .xor_flag(xor_flag), .nor_flag(nor_flag),
    .slt_flag(slt_flag), .sltu_flag(sltu_flag), .sll_flag(sll_flag), .srl_flag(srl_flag),
    .sra_flag(sra_flag), .sllv_flag(sllv_flag), .srlv_flag(srlv_flag), .srav_flag(srav_flag),
    .jr_flag(jr_flag), .addi_flag(addi_flag), .addiu_flag(addiu_flag), .andi_flag(andi_flag),
    .ori_flag(ori_flag), .xori_flag(xori_flag), .lw_flag(lw_flag), .sw_flag(sw_flag),
    .beq_flag(beq_flag), .bne_flag(bne_flag), .slti_flag(slti_flag), .sltiu_flag(sltiu_flag),
    .lui_flag(lui_flag), .j_flag(j_flag), .jal_flag(jal_flag), .zero(zero),
    .reg_w(reg_w), .aluc(aluc), .dm_r(dm_r), .dm_w(dm_w), .ext_ena(ext_ena), .cat_ena(cat_ena), .mux(mux)
);

ALU ALU_inst(                      
    .A(a), .B(b), .ALUC(aluc), .alu_data_out(alu_data_out),
    .zero(zero), .carry(carry), .negative(negative), .overflow(overflow)
);

regfile cpu_ref(                
    .reg_clk(clk), .reg_ena(ena), .rst_n(rst_n), .reg_w(reg_w),
    .RdC(RdC), .RtC(RtC), .RsC(RsC), .Rd_data_in(Rd_data_in),
    .Rs_data_out(Rs_data_out), .Rt_data_out(Rt_data_out)
);

PC PC_inst(                     
    .pc_clk(clk), .pc_ena(ena), .rst_n(rst_n),
    .pc_addr_in(pc_addr_in), .pc_addr_out(pc_addr_out)
);

endmodule