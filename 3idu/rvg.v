// IMAFD, Zicsr, Zifencei

//指令长度大于16bit，inst[1:0]=11
`define INST_MORE_THAN_16B  2'b11

// Table 24.1: RISC-V base opcode map, inst[1:0]=11
// inst[6:5] inst[4:2]
`define INST_LOAD_TYPE      5'b00000
`define INST_LOAD_FP_TYPE   5'b00001
`define INST_custom_0_TYPE  5'b00010
`define INST_MISC_MEM_TYPE  5'b00011
`define INST_OP_IMM_TYPE    5'b00100
`define INST_AUIPC_TYPE     5'b00101
`define INST_OP_IMM_32_TYPE 5'b00110

`define INST_STORE_TYPE     5'b01000
`define INST_STORE_FP_TYPE  5'b01001
`define INST_custom_1_TYPE  5'b01010
`define INST_AMO_TYPE       5'b01011
`define INST_OP_TYPE        5'b01100
`define INST_LUI_TYPE       5'b01101
`define INST_OP_32_TYPE     5'b01110

`define INST_MADD_TYPE      5'b10000
`define INST_MSUB_TYPE      5'b10001
`define INST_NMSUB_TYPE     5'b10010
`define INST_NMADD_TYPE     5'b10011
`define INST_OP_FP_TYPE     5'b10100
`define INST_reserved_TYPE  5'b10101
`define INST_custom_2_TYPE  5'b10110

`define INST_BRANCH_TYPE    5'b11000
`define INST_JALR_TYPE      5'b11001
`define INST_reserved_TYPE  5'b11010
`define INST_JAL_TYPE       5'b11011
`define INST_SYSTEM_TYPE    5'b11100
`define INST_reserved_TYPE  5'b11101
`define INST_custom_3_TYPE  5'b11110