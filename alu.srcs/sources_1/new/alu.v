module alu(  
    input [31:0] a,       // 32位输入，操作数1  
    input [31:0] b,       // 32位输入，操作数2  
    input [3:0] aluc,     // 4位输入，控制ALU的操作  
    output reg [31:0] r,  // 32位输出，由a、b经过aluc指定的操作生成  
    output reg zero,      // 零标志位  
    output reg carry,     // 进位标志位  
    output reg negative,  // 负数标志位  
    output reg overflow    // 溢出标志位  
);  

reg [32:0] sum;
always @(*) 
begin  
    r = 0;  
    zero = 0;  
    carry = 0;  
    negative = 0;  
    overflow = 0;  
    case (aluc)  
        4'b0000:begin
                r = a + b;
                sum = a + b;  
                carry = sum[32];
                end                          // Addu  
        4'b0010: r = $signed(a) + $signed(b);       // Add  
        4'b0001:begin 
                r = a - b;
                carry = (a < b) ? 1'b1 : 1'b0; 
                end                          // Subu  
        4'b0011: r = $signed(a) - $signed(b);       // Sub  
        4'b0100: r = a & b;                          // And  
        4'b0101: r = a | b;                          // Or  
        4'b0110: r = a ^ b;                          // Xor  
        4'b0111: r = ~(a | b);                       // Nor  
        4'b1000, 4'b1001: r = {b[15:0], 16'b0};               // Lui  
        4'b1011: r = ($signed(a) < $signed(b)) ? 32'b1 : 32'b0; // Slt  
        4'b1010:begin 
                r = (a < b) ? 32'b1 : 32'b0;       // Sltu  
                carry = (a < b) ? 1'b1 : 1'b0;
                end
        4'b1100:begin
                r = ($signed(b)) >>> a; 
                carry = b[a];
                end                       // Sra  
        4'b1110, 4'b1111: begin
                 r = b << a;   
                 carry = b[31-a];
                 end                      // Sll/Sla  
        4'b1101:begin 
                r = b >> a;
                carry = b[a];
                end                         // Srl  
        default: r = 0;                              // 默认值  
    endcase  

    // 标志位设置  
    zero = (r == 0) ? 1'b1 : 1'b0; 
    case(aluc)
        4'b1011,4'b1010:
            zero = (a == b) ? 1'b1 : 1'b0; 
    endcase
    
    negative = r[31];
    case(aluc)
        4'b1011:
           negative = ($signed(a) < $signed(b)) ? 32'b1 : 32'b0; 
    endcase     
                                          
    case (aluc)  
        4'b0010: begin
            overflow = (($signed(a) > 0 && $signed(b) > 0 && $signed(r) < 0) ||   
                        ($signed(a) < 0 && $signed(b) < 0 && $signed(r) > 0));
        end
        4'b0011: begin
            overflow = (($signed(a) > 0 && $signed(b) < 0 && $signed(r) < 0) ||  
                        ($signed(a) < 0 && $signed(b) > 0 && $signed(r) > 0));
       end   
    endcase   
end  

endmodule