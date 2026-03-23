module simple_cpu (

    input clk,
    input reset

);

// Internal wires

wire [7:0] pc;
wire [7:0] instruction;
wire [7:0] ir_out;

wire [1:0] alu_op;
wire [1:0] read_addr1, read_addr2, write_addr;
wire reg_write;

wire [7:0] read_data1, read_data2;
wire [7:0] alu_result;

// Instantiate Program Counter
prog_count pc_inst (
    .clk(clk),
    .reset(reset),
    .pc(pc)
);

// Instruction Memory
instruction_memory imem (
    .address(pc),
    .instruction(instruction)
);

// Instruction Register
instruc_reg ir (
    .clk(clk),
    .reset(reset),
    .instruction_in(instruction),
    .instruction_out(ir_out)
);

// Control Unit
control_unit cu (
    .instruction(ir_out),
    .alu_op(alu_op),
    .read_addr1(read_addr1),
    .read_addr2(read_addr2),
    .write_addr(write_addr),
    .reg_write(reg_write)
);

// Register File
register_file rf (
    .clk(clk),
    .read_addr1(read_addr1),
    .read_addr2(read_addr2),
    .write_addr(write_addr),
    .write_data(alu_result),
    .write_enable(reg_write),
    .read_data1(read_data1),
    .read_data2(read_data2)
);

// ALU
alu alu_inst (
    .A(read_data1),
    .B(read_data2),
    .opcode(alu_op),
    .result(alu_result)
);

endmodule
