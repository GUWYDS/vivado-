`timescale 1ns / 1ps

module tb_cp0();

  // 输入信号
  reg clk;
  reg rst;
  reg mfc0;
  reg mtc0;
  reg [31:0] pc;
  reg [4:0] Rd;
  reg [31:0] wdata;
  reg exception;
  reg eret;
  reg [4:0] cause;
  reg intr;

  // 输出信号
  wire [31:0] rdata;
  wire [31:0] status;
  wire timer_int;
  wire [31:0] exc_addr;

  // 实例化 DUT（Design Under Test）
  CP0 uut (
    .clk(clk),
    .rst(rst),
    .mfc0(mfc0),
    .mtc0(mtc0),
    .pc(pc),
    .Rd(Rd),
    .wdata(wdata),
    .exception(exception),
    .eret(eret),
    .cause(cause),
    .intr(intr),
    .rdata(rdata),
    .status(status),
    .timer_int(timer_int),
    .exc_addr(exc_addr)
  );

  // 时钟生成
  always #5 clk = ~clk;

  initial begin
    // 初始化
    clk = 0;
    rst = 1;
    mfc0 = 0;
    mtc0 = 0;
    pc = 32'h00000000;
    Rd = 5'd12;
    wdata = 32'hDEADBEEF;
    exception = 0;
    eret = 0;
    cause = 5'b00000;
    intr = 0;

    // 释放复位
    #10 rst = 0;
    $display("Time=%t, STATUS=%h, EPC=%h, CAUSE=%h", $time, status, uut.cp0_reg[14], uut.cp0_reg[13]);


    // 测试 MTC0 指令：写入 STATUS 寄存器
    #10 mtc0 = 1; Rd = 5'd12; wdata = 32'h12345678;
    #10 mtc0 = 0;
    $display("Time=%t, STATUS=%h, EPC=%h, CAUSE=%h", $time, status, uut.cp0_reg[14], uut.cp0_reg[13]);


    // 测试 MFC0 指令：读取 STATUS 寄存器
    #10 mfc0 = 1;
    #10 mfc0 = 0;
    $display("Time=%t, STATUS=%h, EPC=%h, CAUSE=%h", $time, status, uut.cp0_reg[14], uut.cp0_reg[13]);


    // 测试 SYSCALL 异常触发
    #10 exception = 1; cause = 5'b01000; pc = 32'h00000020;
    #10 exception = 0;
    $display("Time=%t, STATUS=%h, EPC=%h, CAUSE=%h", $time, status, uut.cp0_reg[14], uut.cp0_reg[13]);


    // 测试 ERET 异常返回
    #20 eret = 1;
    #10 eret = 0;
    $display("Time=%t, STATUS=%h, EPC=%h, CAUSE=%h", $time, status, uut.cp0_reg[14], uut.cp0_reg[13]);


    // 测试外部中断
    #20 intr = 1; pc = 32'h00000030;
    #10 intr = 0;
    $display("Time=%t, STATUS=%h, EPC=%h, CAUSE=%h", $time, status, uut.cp0_reg[14], uut.cp0_reg[13]);


    // 结束仿真
    #50 $finish;
  end

endmodule
