module adder4(
    input [3:0] a, b,

    output [3:0] sum,
    output wire carry_out
);

    wire c0, c1, c2;

    assign c0 = a[0] & b[0];
    assign sum[0] = a[0] ^ b[0];

    assign c1 = (a[1] & b[1])| (b[1] & c0 ) | (a[1] & c0 );
    assign sum[1] = a[1] ^ b[1] ^ c0;
    
    assign c2 = (a[2] & b[2])| (b[2] & c1) | (a[2] & c1); 
    assign sum[2] = a[2] ^ b[2] ^ c1;

    assign carry_out  = (a[3] & b[3])| (b[3] & c2 ) | (a[3] & c0 );
    assign sum[3] = a[3] ^ b[3] ^ c2;


endmodule