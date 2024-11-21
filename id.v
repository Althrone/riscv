`include "rv32i.v"

`define INST_BUS 31:0
`define INST_ADDR_BUS 31:0

`define REG_DATA_BUS 31:0
`define REG_ADDR_BUS 4:0

`define MEM_DATA_BUS 31:0

//译码
module id (
    // from if_id
    input wire[`INST_BUS]       i_inst,//输入指令
    // input wire[`INST_ADDR_BUS]  i_inst_addr,//输入指令地址

    // // from regs
    // input wire[`REG_DATA_BUS]   i_reg1_data,        // 通用寄存器1输入数据
    // input wire[`REG_DATA_BUS]   i_reg2_data,        // 通用寄存器2输入数据

    // // from ex 执行模块
    // input wire i_ex_jump_flag,               // 跳转标志

    // to regs
    output reg[`REG_ADDR_BUS]   o_rs1_addr,    // 读通用寄存器1地址
    output reg[`REG_ADDR_BUS]   o_rs2_addr_shamt,    // 读通用寄存器2地址

    // to ex
    // output reg[`INST_BUS]       o_inst,         // 指令内容
    // output reg[`INST_ADDR_BUS]  o_inst_addr,    // 指令地址

    // output reg[`MEM_DATA_BUS] o_op1,//操作数1
    // output reg[`MEM_DATA_BUS] o_op2,//操作数2

    output reg[`MEM_DATA_BUS] o_imm,//立即数

    output reg[`REG_ADDR_BUS]   o_rd_addr,    // 输出目标寄存器地址

    // to csr
    output wire[11:0] o_csr_addr//csr的地址
);
    wire[6:0] opcode = i_inst[6:0];
    wire[2:0] funct3 = i_inst[14:12];
    wire[6:0] funct7 = i_inst[31:25];
    wire[4:0] rd = i_inst[11:7];
    wire[4:0] rs1 = i_inst[19:15];
    wire[4:0] rs2_shamt = i_inst[24:20];
    //imm根据需要进行组合

    //Table 24.1: RISC-V base opcode map, inst[1:0]=11
    // wire[6:0] opcode = i_inst[6:0];

always @(*) begin
    //继续向后续模块传递
//    o_inst = i_inst;
    // o_inst_addr = i_inst_addr;
    // reg1_rdata_o = reg1_rdata_i;
    // reg2_rdata_o = reg2_rdata_i;

    // o_op1=32'b0;
    // o_op2=32'b0;

    o_imm=32'b0;

    // case (param)
    //     : 
    //     default: 
    // endcase

    case (opcode)
        `INST_R_TYPE: begin//R型指令
            //先判断 funct3 ， funct3 相同判断 funct7
            case (funct3)
                `INST_ADD_SUB,`INST_SLL,`INST_SLT,`INST_SLTU,`INST_XOR,`INST_SR,`INST_OR,`INST_AND: begin
                    o_rd_addr=rd;
                    o_rs1_addr=rs1;
                    o_rs2_addr_shamt=rs2_shamt;
                end
                default: begin//不属于已有R型指令
                    o_rd_addr=5'b0;
                    o_rs1_addr=5'b0;
                    o_rs2_addr_shamt=5'b0;
                end// funct3 对应不上的情况
            endcase
        end
        `INST_I_TYPE: begin//I型指令
            //判断 funct3
            case (funct3)
                `INST_ADDI,`INST_SLTI,`INST_SLTIU,`INST_XORI,`INST_ORI: begin
                    o_rd_addr=rd;
                    o_rs1_addr=rs1;
                    o_rs2_addr_shamt=5'b0;
                    //扩展立即数
                    o_imm={{20{i_inst[31]}},i_inst[31:20]};
                end
                `INST_ANDI,`INST_SLLI,`INST_SRI: begin//逻辑位移和算数位移
                    if(rs2_shamt!=5'b0)begin
                        o_rd_addr=5'b0;
                        o_rs1_addr=5'b0;
                        o_rs2_addr_shamt=5'b0;
                    end//对于 RV32I，仅当 shamt[5]=0 时指令有效
                    else begin
                        o_rd_addr=rd;
                        o_rs1_addr=rs1;
                        o_rs2_addr_shamt=rs2_shamt;
                    end
                end
                default: begin
                    o_rd_addr=5'b0;
                    o_rs1_addr=5'b0;
                    o_rs2_addr_shamt=5'b0;
                end
            endcase
        end
        `INST_S_TYPE: begin//S型指令
            //判断 funct3
            case (funct3)
                `INST_SB,`INST_SH,`INST_SW: begin
                    o_rs1_addr=rs1;
                    o_rs2_addr_shamt=rs2_shamt;
                    //扩展立即数
                    o_imm={{20{i_inst[31]}},{i_inst[31:25],i_inst[11:7]}};
                end
                default: begin
                    o_rd_addr=5'b0;
                    o_rs1_addr=5'b0;
                    o_rs2_addr_shamt=5'b0;
                end
            endcase
        end
        `INST_B_TYPE: begin//B型指令
            //判断 funct3
            case (funct3)
                `INST_BEQ,`INST_BNE,`INST_BLT,`INST_BGE,`INST_BLTU,`INST_BGEU: begin
                    o_rs1_addr=rs1;
                    o_rs2_addr_shamt=rs2_shamt;
                    //扩展立即数
                    o_imm={{19{i_inst[31]}},i_inst[31],i_inst[7],i_inst[30:25],i_inst[11:8],1'b0};
                end
                default: begin
                    o_rd_addr=5'b0;
                    o_rs1_addr=5'b0;
                    o_rs2_addr_shamt=5'b0;
                end
            endcase
        end
        `INST_LUI: begin//没有funct3，只能靠opcode区分
            o_rd_addr=rd;
            o_rs1_addr=5'b0;
            o_rs2_addr_shamt=5'b0;
            //扩展立即数
            o_imm={i_inst[31:12], 12'b0};
        end
        //没有funct3，只能靠opcode区分
        `INST_AUIPC: begin//把符号位扩展的 20 位（左移 12 位）立即数加到 pc 上，结果写入 x[rd]
            //说明 o_inst_addr 要接到 ex 模块
            o_rd_addr=rd;
            o_rs1_addr=5'b0;
            o_rs2_addr_shamt=5'b0;
            // o_op1=i_inst_addr;
            //扩展立即数
            o_imm={i_inst[31:12], 12'b0};
        end
        `INST_JAL: begin//把下一条指令的地址(PC + 4)存入rd寄存器中，然后把PC设置为当前值加上符号位扩展的偏移量
            //说明 o_inst_addr 要接到 ex 模块
            o_rd_addr=rd;
            o_rs1_addr=5'b0;
            o_rs2_addr_shamt=5'b0;
            o_imm={{12{i_inst[31]}}, i_inst[19:12], i_inst[20], i_inst[30:21], 1'b0};
        end
        `INST_JALR: begin//让rs1中的32位无符号数据加上imm<<1，并且进行符号位扩展后与上0xfffffffe
                         //并将原 pc+4的值写入 f[rd]。 rd 默认为 x1
            //说明 o_inst_addr 要接到 ex 模块
            o_rd_addr=rd;
            o_rs1_addr=rs1;
            o_rs2_addr_shamt=5'b0;
            //扩展立即数
            o_imm={{20{i_inst[31]}},i_inst[31:20]};//////////////////////////////////////////实现有问题
        end
        `INST_FENCE: begin//内存屏障
            o_rd_addr=rd;
            o_rs1_addr=rs1;
            o_rs2_addr_shamt=5'b0;
            ////////////////////////////未完全实现
        end
        `INST_ECALL,`INST_EBREAK: begin
            o_rd_addr=5'b0;
            o_rs1_addr=5'b0;
            o_rs2_addr_shamt=5'b0;
            //估计是要控制什么控制寄存器
            ////////////////////////////未完全实现
        end
        `INST_SYSTEM_OPCODE: begin//实际上就是i类型
            //12位imm作为csr
        end
        default: begin// opcode 对应不上的情况
            o_rd_addr=5'b0;
            o_rs1_addr=5'b0;
            o_rs2_addr_shamt=5'b0;
        end
    endcase
end
endmodule