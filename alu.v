module adder(
    input [7:0] a, 
    input [7:0] b,
    output [7:0] result,
    output cout
);

    assign {cout, result} = {1'b0, a} + {1'b0, b};

endmodule

module subtractor(
    input [7:0] a, 
    input [7:0] b,
    output [7:0] result,
    output cout
);

    assign result = a-b;
    assign cout = a<b;

endmodule

module alu (
    input [7:0] a, 
    input [7:0] b,
    input [2:0] op, // 0=+,1=-,10=&,11=|,100=^,101=SHL,110=SHR,111=EQ
    output reg [7:0] result,
    output reg cout
);

    wire [7:0] out_a, out_s;
    wire carry_a, carry_s;

    adder add(a,b,out_a,carry_a);
    subtractor sub(a,b,out_s,carry_s);

    always @(*) begin
        case (op)
            3'b000: begin
                result = out_a;
                cout = carry_a;
            end

            3'b001: begin
                result = out_s;
                cout = carry_s;
            end

            3'b010: begin
                result = a&b;
                cout = 0;
            end

            3'b011: begin
                result = a|b;
                cout = 0;
            end

            3'b100: begin
                result = a^b;
                cout = 0;
            end

            3'b101: begin
                cout = a[7];
                result = a << 1;
            end

            3'b110: begin
                cout = a[0];
                result = a >> 1;
            end

            3'b111: begin
                result = (a==b) ? 1:0;
                cout = 0;
            end
        endcase
    end

endmodule