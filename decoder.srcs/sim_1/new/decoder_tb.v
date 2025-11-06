`timescale 1ns/1ps  

module decoder_tb;  // 测试平台模块  
    reg [2:0] iData;     // 输入信号 iData  
    reg [1:0] iEna;      // 输入信号 iEna  
    wire [7:0] oData;    // 输出信号 oData  

    // 实例化待测试的 decoder 模块  
    decoder uut (  
        .iData(iData),  
        .iEna(iEna),  
        .oData(oData)  
    );  

    initial begin  
        // 初始化输入信号  
        iData = 3'b000;  
        iEna = 2'b00;  

        // 观察输出  
        $monitor("At time %t: iData = %b, iEna = %b, oData = %b", $time, iData, iEna, oData);  

        // 测试 iEna = 2'b10，查看不同 iData 的输出  
        iEna = 2'b10;  
        
        for (iData = 3'b000; iData <= 3'b111; iData = iData + 1) begin  
            #10;  // 等待10个时间单位  
        end  

        // 测试 iEna = 2'b00，输出应为全1  
        iEna = 2'b00;  
        #10;  

        // 测试 iEna = 2'b01，输出应为全1  
        iEna = 2'b01;  
        #10;  

        // 测试 iEna = 2'b11，输出应为全1  
        iEna = 2'b11;  
        #10;  

        // 结束仿真  
        $finish;  
    end  
endmodule