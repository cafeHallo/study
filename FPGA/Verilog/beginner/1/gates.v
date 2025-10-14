module gates(
    input a, b,
    output wire y_and, y_or, y_xor
);

assign y_and = a & b;
assign y_or = a | b;
assign y_xor = a ^ b;



endmodule