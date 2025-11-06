`timescale 1ns / 1ps

module push(  
    input clk,            // 时钟信号  
    input reset,          // 复位信号  
    input key,            // 按键输入  
    output reg led,            // LED 输出  
    output [6:0] seg      // 七段数码管输出   
);  
 
    reg [3:0] key_duration;   // 按键持续时间  
    reg [3:0] pulse_count;     // 脉冲计数  

    // 状态机  
    parameter IDLE = 2'b00,  
               KEY_PRESS = 2'b01,  
               LED_ON = 2'b10;  
    reg [1:0] state;  

    // 计时器逻辑  
    always @(posedge clk or posedge reset) begin  
        if (reset) begin   
            key_duration <= 0;  
            pulse_count <= 0;  
            led <= 0;  
            state <= IDLE;  
        end else begin  
            case (state)  
                IDLE: begin  
                    if (key) begin  
                        key_duration <= 0; 
                        pulse_count <= 1;   
                        state <= KEY_PRESS;  
                    end  
                end 
                KEY_PRESS: begin  
                    if (key) begin  
                        pulse_count <= pulse_count + 1;  
                        key_duration <= key_duration + 1;  
                    end else begin  
                        // 按键释放，更新脉冲计数和LED状态  
                        led <= 1;  
                        state <= LED_ON;  
                    end  
                end  
                LED_ON: begin  
                    if (key_duration > 0) begin  
                        key_duration <= key_duration - 1;  
                    end else begin  
                        led <= 0;  
                        state <= IDLE;
                    end  
                end  
            endcase  
        end  
    end  
     display7 display_inst(  
         .iData(pulse_count), // 输入脉冲数量  
         .oData(seg)          // 输出到七段数码管  
     );  
     Divider divider_inst(
         .I_CLK(clk),
         .rst(reset),
         .O_CLK(CLK)
         );
endmodule

module display7(
    input [3:0] iData,
    output reg [6:0] oData 
    );
    always@(*)begin
    case(iData)
    4'b0000: oData=7'b1000000;
    4'b0001: oData=7'b1111001;
    4'b0010: oData=7'b0100100;
    4'b0011: oData=7'b0110000;
    4'b0100: oData=7'b0011001;
    4'b0101: oData=7'b0010010;
    4'b0110: oData=7'b0000010;
    4'b0111: oData=7'b1111000;
    4'b1000: oData=7'b0000000;
    4'b1001: oData=7'b0010000;
    default: oData=7'b1111111;
    endcase
    end
endmodule
