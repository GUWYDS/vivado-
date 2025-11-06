`timescale 1ns / 1ps
module DMEM(                    
    input dm_clk,               
    input dm_ena,               
    input dm_r,                 
    input dm_w,                 
    input [10:0] dm_addr,       
    input [31:0] dm_data_in,    
    output [31:0] dm_data_out   
);

reg [31:0] dmem [31:0];
assign dm_data_out = (dm_ena && dm_r && !dm_w) ? dmem[dm_addr] : 32'bz;
always @(negedge dm_clk)
begin
    if(dm_ena && dm_w && !dm_r)
        dmem[dm_addr] <= dm_data_in;
end

endmodule