//RV32/RV64 Zicsr Standard Extension
//opcode=1110011
// `define INST_SYSTEM_OPCODE   7'b1110011

//对指定的csr寄存器独写，如果rd是x0就只写入
`define INST_CSRRW  3'b001
`define INST_CSRRS  3'b010
`define INST_CSRRC  3'b011
`define INST_CSRRWI 3'b101
`define INST_CSRRSI 3'b110
`define INST_CSRRCI 3'b111