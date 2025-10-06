`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/09/29 04:01:50
// Design Name: 
// Module Name: multipiler
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module multipiler(
    input [31:9]data_in,
    output reg [31:0] data_out 
    );
    
always @(*) begin
    data_out = data_in *2;
end
    
endmodule
