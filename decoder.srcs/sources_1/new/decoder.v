`timescale 1ns / 1ps

module decoder(  
    input [4:0] iData,  // 5位输入数据  
    input iEna,         // 使能信号  
    output reg [31:0] oData // 32位输出数据  
);  
    always @(*) begin  
        if(iEna) begin  
            oData = 32'b00000000000000000000000000000000000; 
            case(iData)
                5'b00000: oData[0] = 1'b1;  
                5'b00001: oData[1] = 1'b1;  
                5'b00010: oData[2] = 1'b1;  
                5'b00011: oData[3] = 1'b1;  
                5'b00100: oData[4] = 1'b1;  
                5'b00101: oData[5] = 1'b1;  
                5'b00110: oData[6] = 1'b1;  
                5'b00111: oData[7] = 1'b1;  
                5'b01000: oData[8] = 1'b1;  
                5'b01001: oData[9] = 1'b1;  
                5'b01010: oData[10] = 1'b1;  
                5'b01011: oData[11] = 1'b1;  
                5'b01100: oData[12] = 1'b1;  
                5'b01101: oData[13] = 1'b1;  
                5'b01110: oData[14] = 1'b1;  
                5'b01111: oData[15] = 1'b1;  
                5'b10000: oData[16] = 1'b1;  
                5'b10001: oData[17] = 1'b1;  
                5'b10010: oData[18] = 1'b1;  
                5'b10011: oData[19] = 1'b1;  
                5'b10100: oData[20] = 1'b1;  
                5'b10101: oData[21] = 1'b1;  
                5'b10110: oData[22] = 1'b1;  
                5'b10111: oData[23] = 1'b1;  
                5'b11000: oData[24] = 1'b1;  
                5'b11001: oData[25] = 1'b1;  
                5'b11010: oData[26] = 1'b1;  
                5'b11011: oData[27] = 1'b1;  
                5'b11100: oData[28] = 1'b1;  
                5'b11101: oData[29] = 1'b1;  
                5'b11110: oData[30] = 1'b1;  
                5'b11111: oData[31] = 1'b1;  
                default: oData = 32'b00000000000000000000000000000000000; 
            endcase  
        end 
        else
        oData=32'bz;
    end  
endmodule