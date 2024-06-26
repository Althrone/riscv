`include "rv32i.v"

module ex (
    //来自指令译码模块
    input wire [6:0] i_opcede,
    input wire [2:0] i_funct3,
    input wire [6:0] i_funct7,
    input wire [31:0] i_imm,
    input wire [4:0] i_rd_addr,
    // input wire[31:0] i_rd_data,
    // input wire [4:0] i_rs1_addr,
    input wire[31:0] i_rs1_data,
    // input wire [4:0] i_rs2_addr,
    input wire[31:0] i_rs2_data,
    input wire [4:0] i_rs2_addr_shamt,

    output reg o_rd_we,//目的寄存器写使能
    output reg[31:0] o_rd_data,

    output reg[1:0] o_mem_we,//内存写使能，0不写，1一字节，2两字节，3四字节
    output reg [31:0] o_mem_w_addr,//写入的内存地址
    output reg [31:0] o_mem_w_data,//写入内存的数据
    input wire [31:0] i_mem_r_data,//从内存读出数据

    output reg o_jump_flag,
    output reg [31:0] o_jump_addr,
    input wire[31:0] i_pc
);
    always @(*) begin
        case (i_opcede)
            `INST_R_TYPE: begin//R指令
                case (i_funct3)
                    `INST_ADD_SUB: begin//加减指令要通过funct7判断
                        case (i_funct7)
                            7'b0: begin//add
                                o_rd_we<=1'b1;
                                o_rd_data<=i_rs1_data+i_rs2_data;
                            end
                            7'b0100000: begin//sub
                                o_rd_we<=1'b1;
                                o_rd_data<=i_rs1_data-i_rs2_data;
                            end
                            default: begin
                                o_rd_we<=1'b0;
                            end
                        endcase
                    end
                    `INST_SLL: begin
                        o_rd_we<=1'b1;
                        o_rd_data<=i_rs1_data<<i_rs2_data[4:0];
                    end
                    `INST_SLT: begin
                        o_rd_we<=1'b1;
                        o_rd_data<=$signed(i_rs1_data) < $signed(i_rs2_data);
                    end
                    `INST_SLTU: begin
                        o_rd_we<=1'b1;
                        o_rd_data<=i_rs1_data < i_rs2_data;
                    end
                    `INST_XOR: begin
                        o_rd_we<=1'b1;
                        o_rd_data<=i_rs1_data ^ i_rs2_data;
                    end
                    `INST_SR: begin//需要判断是算数位移还是逻辑位移
                        o_rd_we<=1'b1;
                        case (i_funct7)
                            7'b0: begin//逻辑右移
                                o_rd_data<=i_rs1_data>>i_rs2_data[4:0];
                            end
                            7'b0100000: begin//算数右移
                                o_rd_data<=$signed(i_rs1_data)>>>i_rs2_data[4:0];
                            end
                            default: begin
                                /////////////////////////
                                o_rd_we<=1'b0;
                            end
                        endcase
                    end
                    `INST_OR: begin
                        o_rd_we<=1'b1;
                        o_rd_data<=i_rs1_data | i_rs2_data;
                    end
                    `INST_AND: begin
                        o_rd_we<=1'b1;
                        o_rd_data<=i_rs1_data & i_rs2_data;
                    end
                    default: begin
                        /////////////////////
                        o_rd_we<=1'b0;
                    end
                endcase
            end
            `INST_I_TYPE: begin//I指令
                case (i_funct3)
                    `INST_ADDI: begin
                        o_rd_we<=1'b1;
                        o_rd_data<=i_rs1_data+i_imm;
                    end
                    `INST_SLTI: begin
                        o_rd_we<=1'b1;
                        o_rd_data<=$signed(i_rs1_data)<$signed(i_imm);
                    end
                    `INST_SLTIU: begin
                        o_rd_we<=1'b1;
                        o_rd_data<=i_rs1_data<i_imm;
                    end
                    `INST_XORI: begin
                        o_rd_we<=1'b1;
                        o_rd_data<=i_rs1_data^i_imm;
                    end
                    `INST_ORI: begin
                        o_rd_we<=1'b1;
                        o_rd_data<=i_rs1_data|i_imm;
                    end
                    `INST_ANDI: begin
                        o_rd_we<=1'b1;
                        o_rd_data<=i_rs1_data&i_imm;
                    end
                    `INST_SLLI: begin
                        //判断shamt最高位是否为0
                        // if(i_rs2_addr_shamt[])
                        o_rd_we<=1'b1;
                        o_rd_data<=i_rs1_data<<i_rs2_addr_shamt;
                    end
                    `INST_SRI: begin
                        o_rd_we<=1'b1;
                        case (i_funct7)
                            7'b0: begin//逻辑右移
                                o_rd_data<=i_rs1_data>>i_rs2_addr_shamt;//后续需要考虑shamt6位的情况
                            end
                            7'b0100000: begin//算数右移
                                o_rd_data<=$signed(i_rs1_data)>>>i_rs2_addr_shamt;//后续需要考虑shamt6位的情况
                            end
                            default: begin
                                ////////////
                                o_rd_we<=1'b0;
                            end
                        endcase
                    end
                    default: begin
                        /////////
                        o_rd_we<=1'b0;
                    end
                endcase
            end
            `INST_I_TYPE: begin//S指令需要至少两个时钟才能完成写入
                case (i_funct3)
                    `INST_SB: begin//存一个字节
                        o_mem_we<=2'b01;
                        o_mem_w_addr<=i_rs1_data+i_imm;
                        o_mem_w_data<=i_rs2_data[7:0];
                    end
                    `INST_SH: begin//存一个字节
                        o_mem_we<=2'b10;
                        o_mem_w_addr<=i_rs1_data+i_imm;
                        o_mem_w_data<=i_rs2_data[15:0];
                    end
                    `INST_SW: begin//存一个字节
                        o_mem_we<=2'b11;
                        o_mem_w_addr<=i_rs1_data+i_imm;
                        o_mem_w_data<=i_rs2_data[31:0];
                    end
                    default: begin
                        
                    end
                endcase
            end
            `INST_B_TYPE: begin//B指令
                case (i_funct3)
                    `INST_BEQ: begin
                        if (i_rs1_data==i_rs2_data) begin
                            o_jump_flag<=1'b0;
                            o_jump_addr<=i_pc+i_imm;
                        end
                    end
                    default: begin
                        
                    end
                endcase
            end
            default: begin
                o_rd_we<=1'b0;
            end
        endcase
    end
endmodule