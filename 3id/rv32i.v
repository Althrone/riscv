`include "rvg.v"
`include "rvc.v"

// U type inst
//7'b0110111
`define INST_LUI        {`INST_LUI_TYPE , `INST_MORE_THAN_16B}
//7'b0010111
`define INST_AUIPC      {`INST_AUIPC_TYPE , `INST_MORE_THAN_16B}
// J type inst
//7'b1101111
`define INST_JAL        {`INST_JAL_TYPE , `INST_MORE_THAN_16B}
// I type inst
//7'b1100111
`define INST_JALR       {`INST_JALR_TYPE , `INST_MORE_THAN_16B}
// B type inst
//7'b1100011
`define INST_BRANCH     {`INST_BRANCH_TYPE , `INST_MORE_THAN_16B}
    `define INST_BEQ        3'b000
    `define INST_BNE        3'b001
    `define INST_BLT        3'b100
    `define INST_BGE        3'b101
    `define INST_BLTU       3'b110
    `define INST_BGEU       3'b111
// I type inst
//7'b0000011//5
`define INST_LOAD       {`INST_LOAD_TYPE , `INST_MORE_THAN_16B}
    `define INST_LB         3'b000
    `define INST_LH         3'b001
    `define INST_LW         3'b010
    `define INST_LBU        3'b100
    `define INST_LHU        3'b101
// S type inst
//7'b0100011  //3
`define INST_STORE      {`INST_STORE_TYPE , `INST_MORE_THAN_16B}
    //将 x[rs2]的低位字节存入内存地址 x[rs1]+sign-extend(offset)
    `define INST_SB         3'b000
    `define INST_SH         3'b001
    `define INST_SW         3'b010
// I type inst
//7'b0010011  //9
`define INST_OP_IMM     {`INST_OP_IMM_TYPE , `INST_MORE_THAN_16B}
    //把符号位扩展的立即数加到寄存器 x[rs1]上，结果写入 x[rd]。忽略算术溢出
    `define INST_ADDI       3'b000
    //比较 x[rs1]和有符号扩展的 immediate，如果 x[rs1]更小，向 x[rd]写入 1，否则写入 0。
    `define INST_SLTI       3'b010
    //比较 x[rs1]和有符号扩展的 immediate，比较时视为无符号数。如果 x[rs1]更小，向 x[rd]写入1，否则写入 0
    `define INST_SLTIU      3'b011
    //x[rs1]和有符号扩展的 immediate 按位异或，结果写入 x[rd]。
    `define INST_XORI       3'b100
    //把寄存器 x[rs1]和有符号扩展的立即数 immediate 按位取或，结果写入 x[rd]
    `define INST_ORI        3'b110
    //把符号位扩展的立即数和寄存器 x[rs1]上的值进行位与，结果写入 x[rd]。
    `define INST_ANDI       3'b111
    // R type inst
    //把寄存器x[rs1]左移shamt位，空出的位置填入0，结果写入x[rd]。对于RV32I，仅当shamt[5]=0时，指令才是有效的。
    `define INST_SLLI       3'b001
    `define INST_SRI        3'b101
        //把寄存器x[rs1]右移shamt位，空出的位置填入0，结果写入x[rd]。对于RV32I，仅当shamt[5]=0时，指令才是有效的。
        `define INST_SRLI       7'b0000000
        //把寄存器 x[rs1]右移 shamt 位，空位用 x[rs1]的最高位填充，结果写入 x[rd]。对于 RV32I，仅当 shamt[5]=0 时指令有效。
        `define INST_SRAI       7'b0100000
// R type inst
`define INST_OP         {`INST_OP_TYPE , `INST_MORE_THAN_16B}//7'b0110011  //10
    `define INST_ADD_SUB    3'b000
        //把寄存器 x[rs2]加到寄存器 x[rs1]上，结果写入 x[rd]。忽略算术溢出
        `define INST_ADD        7'b0000000
        //x[rs1]减去 x[rs2]，结果写入 x[rd]。忽略算术溢出
        `define INST_SUB        7'b0100000
    //把寄存器 x[rs1]左移 x[rs2]位，空出的位置填入 0，结果写入 x[rd]。x[rs2]的低 5 位（如果是RV64I 则是低 6 位）代表移动位数，其高位则被忽略。
    `define INST_SLL        3'b001
    //比较 x[rs1]和 x[rs2]中的数，如果 x[rs1]更小，向 x[rd]写入 1，否则写入 0
    `define INST_SLT        3'b010
    //比较 x[rs1]和 x[rs2]，比较时视为无符号数。如果 x[rs1]更小，向 x[rd]写入 1，否则写入 0
    `define INST_SLTU       3'b011
    //x[rs1]和 x[rs2]按位异或，结果写入 x[rd]
    `define INST_XOR        3'b100
    `define INST_SR         3'b101
        //把寄存器 x[rs1]右移 x[rs2]位，空位用 x[rs1]的最高位填充，结果写入 x[rd]。x[rs2]的低 5 位（如果是 RV64I 则是低 6 位）为移动位数，高位则被忽略
        `define INST_SRL        7'b0000000
        //把寄存器 x[rs1]右移 x[rs2]位，空出的位置填入 0，结果写入 x[rd]。x[rs2]的低 5 位（如果是RV64I 则是低 6 位）代表移动位数，其高位则被忽略
        `define INST_SRA        7'b0100000
    //把寄存器 x[rs1]和寄存器 x[rs2]按位取或，结果写入 x[rd]
    `define INST_OR         3'b110
    //将寄存器 x[rs1]和寄存器 x[rs2]位与的结果写入 x[rd]
    `define INST_AND        3'b111

//7'b0001111
`define INST_MISC_MEM   {`INST_MISC_MEM_TYPE , `INST_MORE_THAN_16B}
    `define INST_FENCE      3'b000
`define INST_SYSTEM     {`INST_SYSTEM_TYPE , `INST_MORE_THAN_16B}
    `define INST_EXCEPTION  3'b000
        //同时要求rs rd都是x0
        `define INST_ECALL      12'b000000000000
        //同时要求rs rd都是x0
        `define INST_EBREAK     12'b000000000001

`define RV32I