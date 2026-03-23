module control_unit(

input [7:0] instruction,
output reg [1:0] alu_op,
output reg [1:0] read_addr1,
output reg [1:0] read_addr2,
output reg [1:0] write_addr,
output reg reg_write
 );
 
always @(*)
begin

alu_op = instruction[7:6];
write_addr = instruction[5:4];
read_addr1 = instruction[5:4];
read_addr2 = instruction[3:2];

reg_write = 1'b1;
end
endmodule
