module DataCompare4_tb;  
    reg [3:0] iData_a;  
    reg [3:0] iData_b;  
    reg [2:0] iData;  
    wire [2:0] oData;  
    
    DataCompare4 uut (  
        .iData_a(iData_a),  
        .iData_b(iData_b),  
        .iData(iData),  
        .oData(oData)  
    );  
    
    initial begin  
        $monitor("Time = %0t, iData_a = %b, iData_b = %b, iData = %b, oData = %b", $time, iData_a, iData_b, iData, oData);  
        // 1. a == b  
        iData_a = 4'b0000; iData_b = 4'b0000; iData = 3'b000; #10;  
        iData_a = 4'b0101; iData_b = 4'b0101; iData = 3'b001; #10;  
        iData_a = 4'b1111; iData_b = 4'b1111; iData = 3'b010; #10;
        // 2. a > b  
        iData_a = 4'b0001; iData_b = 4'b0000; iData = 3'b011; #10;  
        iData_a = 4'b1010; iData_b = 4'b0101; iData = 3'b100; #10;  
        iData_a = 4'b1111; iData_b = 4'b0000; iData = 3'b101; #10;  
        // 3. a < b  
        iData_a = 4'b0000; iData_b = 4'b0001; iData = 3'b110; #10;  
        iData_a = 4'b0101; iData_b = 4'b1010; iData = 3'b111; #10;  
        iData_a = 4'b0000; iData_b = 4'b1111; iData = 3'b000; #10;  
        $finish;  
    end  
endmodule