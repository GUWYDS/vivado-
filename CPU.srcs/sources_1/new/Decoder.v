`timescale 1ns / 1ps
module Decoder(                 
    input  [31:0] instr_in,     
    output add_flag,            
    output addu_flag,           
    output sub_flag,            
    output subu_flag,           
    output and_flag,            
    output or_flag,             
    output xor_flag,            
    output nor_flag,            
    output slt_flag,            
    output sltu_flag,           
    output sll_flag,            
    output srl_flag,            
    output sra_flag,            
    output sllv_flag,           
    output srlv_flag,           
    output srav_flag,           
    output jr_flag,             
    output addi_flag,           
    output addiu_flag,          
    output andi_flag,          
    output ori_flag,           
    output xori_flag,          
    output lw_flag,            
    output sw_flag,            
    output beq_flag,           
    output bne_flag,           
    output slti_flag,          
    output sltiu_flag,         
    output lui_flag,           
    output j_flag,             
    output jal_flag,           
    output [4:0]  RsC,          
    output [4:0]  RtC,          
    output [4:0]  RdC,          
    output [4:0]  shamt,        
    output [15:0] immediate,    
    output [25:0] address       
);

parameter ADD_OPE   = 6'b100000;
parameter ADDU_OPE  = 6'b100001;
parameter SUB_OPE   = 6'b100010;
parameter SUBU_OPE  = 6'b100011;
parameter AND_OPE   = 6'b100100;
parameter OR_OPE    = 6'b100101;
parameter XOR_OPE   = 6'b100110;
parameter NOR_OPE   = 6'b100111;
parameter SLT_OPE   = 6'b101010;
parameter SLTU_OPE  = 6'b101011;
parameter SLL_OPE   = 6'b000000;
parameter SRL_OPE   = 6'b000010;
parameter SRA_OPE   = 6'b000011;
parameter SLLV_OPE  = 6'b000100;
parameter SRLV_OPE  = 6'b000110;
parameter SRAV_OPE  = 6'b000111;
parameter JR_OPE    = 6'b001000;
parameter ADDI_OPE  = 6'b001000;
parameter ADDIU_OPE = 6'b001001;
parameter ANDI_OPE  = 6'b001100;
parameter ORI_OPE   = 6'b001101;
parameter XORI_OPE  = 6'b001110;
parameter LW_OPE    = 6'b100011;
parameter SW_OPE    = 6'b101011;
parameter BEQ_OPE   = 6'b000100;
parameter BNE_OPE   = 6'b000101;
parameter SLTI_OPE  = 6'b001010;
parameter SLTIU_OPE = 6'b001011;
parameter LUI_OPE   = 6'b001111;
parameter J_OPE     = 6'b000010;
parameter JAL_OPE   = 6'b000011;

assign add_flag  = (instr_in[31:26]==6'h0&&instr_in[5:0]==ADD_OPE)?1'b1:1'b0;
assign addu_flag = (instr_in[31:26]==6'h0&&instr_in[5:0]==ADDU_OPE)?1'b1:1'b0;
assign sub_flag  = (instr_in[31:26]==6'h0&&instr_in[5:0]==SUB_OPE)?1'b1:1'b0;
assign subu_flag = (instr_in[31:26]==6'h0&&instr_in[5:0]==SUBU_OPE)?1'b1:1'b0;
assign and_flag  = (instr_in[31:26]==6'h0&&instr_in[5:0]==AND_OPE)?1'b1:1'b0;
assign or_flag   = (instr_in[31:26]==6'h0&&instr_in[5:0]==OR_OPE)?1'b1:1'b0;
assign xor_flag  = (instr_in[31:26]==6'h0&&instr_in[5:0]==XOR_OPE)?1'b1:1'b0;
assign nor_flag  = (instr_in[31:26]==6'h0&&instr_in[5:0]==NOR_OPE)?1'b1:1'b0;
assign slt_flag  = (instr_in[31:26]==6'h0&&instr_in[5:0]==SLT_OPE)?1'b1:1'b0;
assign sltu_flag = (instr_in[31:26]==6'h0&&instr_in[5:0]==SLTU_OPE)?1'b1:1'b0;
assign sll_flag  = (instr_in[31:26]==6'h0&&instr_in[5:0]==SLL_OPE)?1'b1:1'b0;
assign srl_flag  = (instr_in[31:26]==6'h0&&instr_in[5:0]==SRL_OPE)?1'b1:1'b0;
assign sra_flag  = (instr_in[31:26]==6'h0&&instr_in[5:0]==SRA_OPE)?1'b1:1'b0;
assign sllv_flag = (instr_in[31:26]==6'h0&&instr_in[5:0]==SLLV_OPE)?1'b1:1'b0;
assign srlv_flag = (instr_in[31:26]==6'h0&&instr_in[5:0]==SRLV_OPE)?1'b1:1'b0;
assign srav_flag = (instr_in[31:26]==6'h0&&instr_in[5:0]==SRAV_OPE)?1'b1:1'b0;
assign jr_flag   = (instr_in[31:26]==6'h0&&instr_in[5:0]==JR_OPE)?1'b1:1'b0;
assign addi_flag  = (instr_in[31:26]==ADDI_OPE)?1'b1:1'b0;
assign addiu_flag = (instr_in[31:26]==ADDIU_OPE)?1'b1:1'b0;
assign andi_flag  = (instr_in[31:26]==ANDI_OPE)?1'b1:1'b0;
assign ori_flag   = (instr_in[31:26]==ORI_OPE)?1'b1:1'b0;
assign xori_flag  = (instr_in[31:26]==XORI_OPE)?1'b1:1'b0;
assign lw_flag    = (instr_in[31:26]==LW_OPE)?1'b1:1'b0;
assign sw_flag    = (instr_in[31:26]==SW_OPE)?1'b1:1'b0;
assign beq_flag   = (instr_in[31:26]==BEQ_OPE)?1'b1:1'b0;
assign bne_flag   = (instr_in[31:26]==BNE_OPE)?1'b1:1'b0;
assign slti_flag  = (instr_in[31:26]==SLTI_OPE)?1'b1:1'b0;
assign sltiu_flag = (instr_in[31:26]==SLTIU_OPE)?1'b1:1'b0;
assign lui_flag   = (instr_in[31:26]==LUI_OPE)?1'b1:1'b0;
assign j_flag     = (instr_in[31:26]==J_OPE)?1'b1:1'b0;
assign jal_flag   = (instr_in[31:26]==JAL_OPE)?1'b1:1'b0;

assign RsC = (add_flag||addu_flag||sub_flag||subu_flag||and_flag||or_flag||xor_flag||nor_flag||slt_flag||sltu_flag||sllv_flag||srlv_flag||srav_flag||jr_flag||addi_flag||addiu_flag||andi_flag||ori_flag||xori_flag||lw_flag||sw_flag||beq_flag||bne_flag||slti_flag||sltiu_flag)?instr_in[25:21]:5'hz;
assign RtC = (add_flag||addu_flag||sub_flag||subu_flag||and_flag||or_flag||xor_flag||nor_flag||slt_flag||sltu_flag||sll_flag||srl_flag||sra_flag||sllv_flag||srlv_flag||srav_flag||sw_flag||beq_flag||bne_flag)?instr_in[20:16]:5'hz;
assign RdC = (add_flag||addu_flag||sub_flag||subu_flag||and_flag||or_flag||xor_flag||nor_flag||slt_flag||sltu_flag||sll_flag||srl_flag||sra_flag||sllv_flag||srlv_flag||srav_flag)?instr_in[15:11]:((addi_flag||addiu_flag||andi_flag||ori_flag||xori_flag||lw_flag||slti_flag||sltiu_flag||lui_flag)?instr_in[20:16]:(jal_flag?5'd31:5'hz));
assign shamt = (sll_flag||srl_flag||sra_flag)?instr_in[10:6]:5'hz;        
assign immediate = (addi_flag||addiu_flag||andi_flag||ori_flag||xori_flag||lw_flag||sw_flag||beq_flag||bne_flag||slti_flag||sltiu_flag||lui_flag)?instr_in[15:0]:16'hz;
assign address = (j_flag||jal_flag)?instr_in[25:0]:26'hz;     

endmodule