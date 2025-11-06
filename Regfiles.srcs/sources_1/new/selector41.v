module data_selector_32_to_1(
    input [4:0] iSel,      // 5位宽的选择信号
     input [31:0] iC0,   // 32 位输入 c0  
      input [31:0] iC1,   // 32 位输入 c1  
      input [31:0] iC2,   // 32 位输入 c2  
      input [31:0] iC3,   // 32 位输入 c3  
      input [31:0] iC4,   // 32 位输入 c4  
      input [31:0] iC5,   // 32 位输入 c5  
      input [31:0] iC6,   // 32 位输入 c6  
      input [31:0] iC7,   // 32 位输入 c7  
      input [31:0] iC8,   // 32 位输入 c8  
      input [31:0] iC9,   // 32 位输入 c9  
      input [31:0] iC10,  // 32 位输入 c10  
      input [31:0] iC11,  // 32 位输入 c11  
      input [31:0] iC12,  // 32 位输入 c12  
      input [31:0] iC13,  // 32 位输入 c13  
      input [31:0] iC14,  // 32 位输入 c14  
      input [31:0] iC15,  // 32 位输入 c15  
      input [31:0] iC16,  // 32 位输入 c16  
      input [31:0] iC17,  // 32 位输入 c17  
      input [31:0] iC18,  // 32 位输入 c18  
      input [31:0] iC19,  // 32 位输入 c19  
      input [31:0] iC20,  // 32 位输入 c20  
      input [31:0] iC21,  // 32 位输入 c21  
      input [31:0] iC22,  // 32 位输入 c22  
      input [31:0] iC23,  // 32 位输入 c23  
      input [31:0] iC24,  // 32 位输入 c24  
      input [31:0] iC25,  // 32 位输入 c25  
      input [31:0] iC26,  // 32 位输入 c26  
      input [31:0] iC27,  // 32 位输入 c27  
      input [31:0] iC28,  // 32 位输入 c28  
      input [31:0] iC29,  // 32 位输入 c29  
      input [31:0] iC30,  // 32 位输入 c30  
      input [31:0] iC31,  // 32 位输入 c31  
    input enable,
    output reg[31:0] oZ  // 32位宽的数据输出
);
    always@(*)begin
    if(enable==1)begin
        case(iSel)
5'b00000: oZ = iC0;  
                        5'b00001: oZ = iC1;  
                        5'b00010: oZ = iC2;  
                        5'b00011: oZ = iC3;  
                        5'b00100: oZ = iC4;  
                        5'b00101: oZ = iC5;  
                        5'b00110: oZ = iC6;  
                        5'b00111: oZ = iC7;  
                        5'b01000: oZ = iC8;  
                        5'b01001: oZ = iC9;  
                        5'b01010: oZ = iC10;  
                        5'b01011: oZ = iC11;  
                        5'b01100: oZ = iC12;  
                        5'b01101: oZ = iC13;  
                        5'b01110: oZ = iC14;  
                        5'b01111: oZ = iC15;  
                        5'b10000: oZ = iC16;  
                        5'b10001: oZ = iC17;  
                        5'b10010: oZ = iC18;  
                        5'b10011: oZ = iC19;  
                        5'b10100: oZ = iC20;  
                        5'b10101: oZ = iC21;  
                        5'b10110: oZ = iC22;  
                        5'b10111: oZ = iC23;  
                        5'b11000: oZ = iC24;  
                        5'b11001: oZ = iC25;  
                        5'b11010: oZ = iC26;  
                        5'b11011: oZ = iC27;  
                        5'b11100: oZ = iC28;  
                        5'b11101: oZ = iC29;  
                        5'b11110: oZ = iC30;  
                        5'b11111: oZ = iC31;  

        default: oZ= 32'b0;
        endcase
    end else begin
   oZ=32'bz;
    end
    end     
endmodule
