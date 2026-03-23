module instruction_memory (

    input [7:0] address,
    output [7:0] instruction

);

reg [7:0] memory [0:255];  // 256 instructions

// Load program into memory
initial begin
    // Format: [7:6]=opcode, [5:4]=rd, [3:2]=rs, [1:0]=00

    memory[0] = 8'b00011000; // ADD R1, R2
    memory[1] = 8'b01011000; // SUB R1, R2
    memory[2] = 8'b10011000; // AND R1, R2
    memory[3] = 8'b11011000; // OR  R1, R2

    // You can add more instructions here
end

// Read instruction
assign instruction = memory[address];

endmodule
