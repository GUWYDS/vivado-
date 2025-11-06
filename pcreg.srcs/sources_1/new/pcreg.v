module pcreg(
    input clk,    // 1位输入，寄存器时钟信号，上升沿时为PC寄存器赋值
    input rst,    // 1位输入，异步重置信号，高电平时将PC寄存器清零
    input ena,    // 1位输入,有效信号高电平时PC寄存器读入data_in的值，否则保持原有输出
    input [31:0] data_in, // 32位输入，输入数据将被存入寄存器内部
    output [31:0] data_out // 32位输出，工作时始终输出PC寄存器内部存储的值
);

// 实例化32个D触发器
wire [31:0] dff_out;
genvar i;
generate
    for (i = 0; i < 32; i = i + 1) begin : gen_dff
        Asynchronous_D_FF dff (
            .clk(clk),
            .rst(rst),
            .ena(ena),
            .d(data_in[i]),
            .q(dff_out[i])
        );
    end
endgenerate
// 将D触发器的输出连接到data_out
assign data_out = dff_out;
endmodule