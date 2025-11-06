`timescale 1ns / 1ps
module Controler(              
    input add_flag, addu_flag, sub_flag, subu_flag, and_flag, or_flag, xor_flag, nor_flag, 
    input slt_flag, sltu_flag, sll_flag, srl_flag, sra_flag, sllv_flag, srlv_flag, srav_flag, 
    input jr_flag, addi_flag, addiu_flag, andi_flag, ori_flag, xori_flag, lw_flag, sw_flag, 
    input beq_flag, bne_flag, slti_flag, sltiu_flag, lui_flag, j_flag, jal_flag,
    input zero,
    output reg_w,             
    output [3:0] aluc,         
    output dm_r,               
    output dm_w,               
    output [4:0] ext_ena,      
    output cat_ena,            
    output [9:0] mux           
    );

assign reg_w = (!jr_flag && !sw_flag && !beq_flag && !bne_flag && !j_flag) ? 1'b1 : 1'b0;

assign aluc[3] = (slt_flag  || sltu_flag  || sllv_flag || srlv_flag ||
                  srav_flag || sll_flag   || srl_flag  || sra_flag  || 
                  slti_flag || sltiu_flag || lui_flag) ? 1'b1 : 1'b0;
assign aluc[2] = (and_flag  || or_flag    || xor_flag  || nor_flag  ||
                  sllv_flag || srlv_flag  || srav_flag || sll_flag  ||
                  srl_flag  || sra_flag   || andi_flag || ori_flag  ||
                  xori_flag) ? 1'b1 : 1'b0;
assign aluc[1] = (add_flag  || sub_flag   || xor_flag  || nor_flag  ||
                  slt_flag  || sltu_flag  || sllv_flag || sll_flag  ||
                  addi_flag || xori_flag  || slti_flag || sltiu_flag) ? 1'b1 : 1'b0;
assign aluc[0] = (sub_flag  || subu_flag  || or_flag   || nor_flag  ||
                  slt_flag  || sllv_flag  || srlv_flag || sll_flag  ||
                  srl_flag  || ori_flag   || slti_flag || lui_flag  ||
                  beq_flag  || bne_flag) ? 1'b1 : 1'b0;

assign dm_r = lw_flag ? 1'b1 : 1'b0;
assign dm_w = sw_flag ? 1'b1 : 1'b0;

assign ext_ena[4] = (beq_flag  || bne_flag) ? 1'b1 : 1'b0;                              
assign ext_ena[3] = (addi_flag || addiu_flag || lw_flag   || sw_flag ||
                     slti_flag || sltiu_flag) ? 1'b1 : 1'b0;                            
assign ext_ena[2] = (andi_flag || ori_flag   || xori_flag || lui_flag) ? 1'b1 : 1'b0;  
assign ext_ena[1] = (sll_flag  || srl_flag   || sra_flag) ? 1'b1 : 1'b0;               
assign ext_ena[0] = (slt_flag  || sltu_flag  || slti_flag || sltiu_flag) ? 1'b1 : 1'b0; 

assign cat_ena = (j_flag || jal_flag) ? 1'b1 : 1'b0;

assign mux[9] = (add_flag   || addu_flag  || sub_flag  || subu_flag  ||
                 and_flag   || or_flag    || xor_flag  || nor_flag   ||
                 sll_flag   || srl_flag   || sra_flag  || sllv_flag  ||
                 srlv_flag  || srav_flag  || lui_flag  || addi_flag  || 
                 addiu_flag || andi_flag  || ori_flag  || xori_flag) ? 1'b1 : 1'b0;
assign mux[8] = (addi_flag  || addiu_flag || lw_flag   || sw_flag    ||
                 slti_flag  || sltiu_flag) ? 1'b1 : 1'b0;
assign mux[7] = jal_flag ? 1'b1 : 1'b0;
assign mux[6] = beq_flag ? ~zero : (bne_flag ? zero : 1'b1);
assign mux[5] = (addi_flag  || addiu_flag || andi_flag || ori_flag  ||
                 xori_flag  || lw_flag    || sw_flag   || slti_flag ||
                 sltiu_flag || lui_flag) ? 1'b1 : 1'b0;
assign mux[4] = (!jr_flag && !j_flag && !jal_flag) ? 1'b1 : 1'b0;
assign mux[3] = (sll_flag   || srl_flag   || sra_flag) ? 1'b1 : 1'b0;
assign mux[2] = !lw_flag ? 1'b1 : 1'b0;
assign mux[1] = (j_flag || jal_flag) ? 1'b1 : 1'b0;

endmodule    