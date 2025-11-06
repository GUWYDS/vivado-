module FA_tb;  
    reg iA;  
    reg iB;  
    reg iC;  
    wire oS;  
    wire oC;  
    FA uut (  
        .iA(iA),  
        .iB(iB),  
        .iC(iC),  
        .oS(oS),  
        .oC(oC)  
    );  
    initial begin  
        $monitor("Time = %0t, iA = %b, iB = %b, iC = %b, oS = %b, oC = %b", $time, iA, iB, iC, oS, oC);  
        // 0, 0, 0 -> 0, 0  
        iA = 0; iB = 0; iC = 0; #10;  
        // 0, 0, 1 -> 1, 0  
        iA = 0; iB = 0; iC = 1; #10;  
        // 0, 1, 0 -> 1, 0  
        iA = 0; iB = 1; iC = 0; #10;  
        // 0, 1, 1 -> 0, 1  
        iA = 0; iB = 1; iC = 1; #10;  
        // 1, 0, 0 -> 1, 0  
        iA = 1; iB = 0; iC = 0; #10;  
        // 1, 0, 1 -> 0, 1  
        iA = 1; iB = 0; iC = 1; #10;  
        // 1, 1, 0 -> 0, 1  
        iA = 1; iB = 1; iC = 0; #10;  
        // 1, 1, 1 -> 1, 1  
        iA = 1; iB = 1; iC = 1; #10;  
        $finish;  
    end  
endmodule