`timescale 1ns/1ps

module adder4_tb;

    reg [3:0]a, b;

    wire [3:0] sum;
    wire carry_out;


    adder4 dut(
        .a(a),
        .b(b),
        .sum(sum),
        .carry_out(carry_out)
    );


    initial begin 
        $dumpfile("wave.vcd");  
            $dumpvars(0, adder4_tb);

            a = 0; b = 0; #10;
            $display("%b + %b = %b%b", a, b, carry_out,sum);

            a = 1; b = 0; #10;
            $display("%b + %b = %b%b", a, b, carry_out,sum);

            a = 0; b = 1; #10;
            $display("%b + %b = %b%b", a, b, carry_out,sum);

            a = 1; b = 1; #10;
            $display("%b + %b = %b%b", a, b, carry_out,sum);

            a = 2; b = 0; #10;
            $display("%b + %b = %b%b", a, b, carry_out,sum);

            a = 4; b = 0; #10;
            $display("%b + %b = %b%b", a, b, carry_out,sum);

            a = 2; b = 4; #10;
            $display("%b + %b = %b%b", a, b, carry_out, sum);

            a = 8; b = 8; #10;
            $display("%b + %b = %b%b", a, b, carry_out, sum);

        $finish;

    end 

endmodule
