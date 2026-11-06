`timescale 1ns/1ps

module alu_test;

    reg [7:0] a, b;
    reg [2:0] op;

    wire [7:0] result;
    wire cout;

    // Instantiate your ALU
    alu dut (
        .a(a),
        .b(b),
        .op(op),
        .result(result),
        .cout(cout)
    );

    initial begin

        $dumpfile("wave.vcd");
        $dumpvars(0, alu_test);

        // ADD
        a = 10; b = 20; op = 3'b000;
        #10;

        // ADD with carry
        a = 255; b = 1; op = 3'b000;
        #10;

        // SUB
        a = 20; b = 10; op = 3'b001;
        #10;

        // AND
        a = 12; b = 10; op = 3'b010;
        #10;

        // OR
        a = 12; b = 10; op = 3'b011;
        #10;

        // XOR
        a = 12; b = 10; op = 3'b100;
        #10;

        // SHIFT LEFT
        a = 5; b = 0; op = 3'b101;
        #10;

        // SHIFT RIGHT
        a = 8; b = 0; op = 3'b110;
        #10;

        // EQUALITY
        a = 10; b = 10; op = 3'b111;
        #10;

        $finish;

    end

endmodule