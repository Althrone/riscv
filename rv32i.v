//压缩指令集
//Table 16.4: RVC opcode map
`define C_ADDI4SPN_INST             5'b00000
`define C_ADDI_INST                 5'b00001
`define C_SLLI_INST                 5'b00010

`define C_FLD3264_LQ128_INST        5'b00100
`define C_JAL32_ADDIW64128_INST     5'b00101
`define C_FLDSP3264_LQSP218_INST    5'b00110

`define C_LW_INST                   5'b01000
`define C_LI_INST                   5'b01001
`define C_LWSP_INST                 5'b01010

`define C_FLW32_LD64128_INST        5'b01100
`define C_LUI_ADDI16SP_INST         5'b01101
`define C_FLWSP32_LDSP64128_INST    5'b01110

`define C_Reserved_INST             5'b10000
`define C_MISC_ALU_INST             5'b10001
`define C_JR_JALR_MV_ADD_INST       5'b10010

`define C_FSD3264_SQ128_INST        5'b10100
`define C_J_INST                    5'b10101
`define C_FSDSP3264_SQSP128_INST    5'b10110

`define C_SW_INST                   5'b11000
`define C_BEQZ_INST                 5'b11001
`define C_SWSP_INST                 5'b11010

`define C_FSW32_SD64128_INST        5'b11100
`define C_BNEZ_INST                 5'b11101
`define C_FSWSP32_SDSP64128_INST    5'b11110

//>16b
`define INST_MORE_THAN_16B  2'b11
//32b指令集
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


// R type inst
`define INST_R_TYPE     7'b0110011  //10
`define INST_ADD_SUB    3'b000      //把寄存器 x[rs2]加到寄存器 x[rs1]上，结果写入 x[rd]。忽略算术溢出
                                    //x[rs1]减去 x[rs2]，结果写入 x[rd]。忽略算术溢出
`define INST_SLL        3'b001      //把寄存器 x[rs1]左移 x[rs2]位，空出的位置填入 0，结果写入 x[rd]。x[rs2]的低 5 位（如果是
                                    //RV64I 则是低 6 位）代表移动位数，其高位则被忽略。
`define INST_SLT        3'b010      //比较 x[rs1]和 x[rs2]中的数，如果 x[rs1]更小，向 x[rd]写入 1，否则写入 0
`define INST_SLTU       3'b011      //比较 x[rs1]和 x[rs2]，比较时视为无符号数。如果 x[rs1]更小，向 x[rd]写入 1，否则写入 0
`define INST_XOR        3'b100      //x[rs1]和 x[rs2]按位异或，结果写入 x[rd]
`define INST_SR         3'b101      //把寄存器 x[rs1]右移 x[rs2]位，空位用 x[rs1]的最高位填充，结果写入 x[rd]。x[rs2]的低 5 位
                                    //（如果是 RV64I 则是低 6 位）为移动位数，高位则被忽略
                                    //把寄存器 x[rs1]右移 x[rs2]位，空出的位置填入 0，结果写入 x[rd]。x[rs2]的低 5 位（如果是
                                    //RV64I 则是低 6 位）代表移动位数，其高位则被忽略
`define INST_OR         3'b110      //把寄存器 x[rs1]和寄存器 x[rs2]按位取或，结果写入 x[rd]
`define INST_AND        3'b111      //将寄存器 x[rs1]和寄存器 x[rs2]位与的结果写入 x[rd]

// I type inst
`define INST_I_TYPE     7'b0010011  //9
`define INST_ADDI       3'b000      //把符号位扩展的立即数加到寄存器 x[rs1]上，结果写入 x[rd]。忽略算术溢出
`define INST_SLTI       3'b010      //比较 x[rs1]和有符号扩展的 immediate，如果 x[rs1]更小，向 x[rd]写入 1，否则写入 0。
`define INST_SLTIU      3'b011      //比较 x[rs1]和有符号扩展的 immediate，比较时视为无符号数。如果 x[rs1]更小，向 x[rd]写入
                                    //1，否则写入 0
`define INST_XORI       3'b100      //x[rs1]和有符号扩展的 immediate 按位异或，结果写入 x[rd]。
`define INST_ORI        3'b110      //把寄存器 x[rs1]和有符号扩展的立即数 immediate 按位取或，结果写入 x[rd]
`define INST_ANDI       3'b111      //把符号位扩展的立即数和寄存器 x[rs1]上的值进行位与，结果写入 x[rd]。
`define INST_SLLI       3'b001      //把寄存器x[rs1]左移shamt位，空出的位置填入0，结果写入x[rd]。对于RV32I，仅当shamt[5]=0
                                    //时，指令才是有效的。
`define INST_SRI        3'b101      //把寄存器x[rs1]右移shamt位，空出的位置填入0，结果写入x[rd]。对于RV32I，仅当shamt[5]=0
                                    //时，指令才是有效的。
                                    //把寄存器 x[rs1]右移 shamt 位，空位用 x[rs1]的最高位填充，结果写入 x[rd]。对于 RV32I，
                                    //仅当 shamt[5]=0 时指令有效。

// S type inst
`define INST_S_TYPE     7'b0100011  //3
`define INST_SB         3'b000      //将 x[rs2]的低位字节存入内存地址 x[rs1]+sign-extend(offset)
`define INST_SH         3'b001
`define INST_SW         3'b010

// B type inst
`define INST_B_TYPE     7'b1100011//6
`define INST_BEQ        3'b000
`define INST_BNE        3'b001
`define INST_BLT        3'b100
`define INST_BGE        3'b101
`define INST_BLTU       3'b110
`define INST_BGEU       3'b111

// U type inst
`define INST_LUI        { `INST_LUI_TYPE , `INST_MORE_THAN_16B }//7'b0110111
`define INST_AUIPC      { `INST_AUIPC_TYPE , `INST_MORE_THAN_16B }//7'b0010111

// J type inst
`define INST_JAL        { `INST_JAL_TYPE , `INST_MORE_THAN_16B }//7'b1101111
// I type inst
`define INST_JALR       { `INST_JALR_TYPE , `INST_MORE_THAN_16B }//7'b1100111

`define INST_FENCE  7'b0001111
`define INST_ECALL  32'h73
`define INST_EBREAK 32'h00100073

// L type inst
`define INST_L_TYPE 7'b0000011//5
`define INST_LB     3'b000
`define INST_LH     3'b001
`define INST_LW     3'b010
`define INST_LBU    3'b100
`define INST_LHU    3'b101

//RV32/RV64 Zicsr Standard Extension
//opcode=1110011
`define INST_SYSTEM_OPCODE   7'b1110011
`define INST_CSRRW  3'b001//对指定的csr寄存器独写，如果rd是x0就只写入
`define INST_CSRRS  3'b010
`define INST_CSRRC  3'b011
`define INST_CSRRWI 3'b101
`define INST_CSRRSI 3'b110
`define INST_CSRRCI 3'b111

`define RV32I