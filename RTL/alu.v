module alu(
    input [7:0] A,
    input [7:0] B,
    input [1:0] opcode,
    output reg [7:0] result);
always @(*) begin
    case(opcode)
        2'b00: result = A+B;
        2'b01: result = A-B;
        2'b10: result = A&B;
        2'b10: result = A|B;
        default: result = 8'b00000000;
    endcase
end
endmodule
