`include "rv32i.v"
`include "csr_cfg.v"

module csr
    (
        input wire[11:0] i_csr_addr;//csr寄存器地址
        input wire[4:0] i_rs1_addr_uimm;
        input wire[4:0] i_rd_addr;
        input wire[`MXLEN-1:0] i_rs1_data;
        input wire[2:0] i_funct3;
        input wire i_clk;
        input wire i_nrst;//确保复位信号已经被同步了

        //to gpr
        output reg [`MXLEN-1:0] o_rd_data;//给目标寄存器的数据
        output reg[4:0] o_rd_addr;//目标寄存器地址
    );

    //寄存器表
    //所有csr寄存器都用64位宽实现
    (* ram_style = "block" *) reg[63:0] csrs[0:4095];

    //赋初始值
    csrs[12'h301]=

    // //非特权csr
    // //Unprivileged Floating-Point CSRs

    // //Unprivileged Counter/Timers
    // reg[63:0] cycle;//cycle instret hpmcounter time是m寄存器的影子
    // reg[63:0] time_;
    // reg[63:0] instret;//P36
    // reg[63:0] hpmcounter[3:31];

    // //机械模式特权csr
    // // Machine Information Registers
    // reg[31:0] mvendorid;//必定是32位
    // reg[`MXLEN] marchid;
    // reg[`MXLEN] mimpid;
    // reg[`MXLEN] mhartid;
    // reg[`MXLEN] mconfigptr;
    // // Machine Trap Setup
    // reg[63:0] mstatus;//按照32位实现
    // reg[`MXLEN] misa;//=10 0000 I
    // //Machine Trap Handling
    // reg[`MXLEN] mscratch;//存上下文？
    // reg[`MXLEN] mepc;//
    // reg[`MXLEN] mcause;//
    // // Machine Counter/Timers
    // reg[63:0] mcycle;//RV32 RV64都是64位，riscv-privileged p34 3.1.10
    // reg[63:0] minstret;//RV32 RV64都是64位，riscv-privileged p34 3.1.10
    // reg[63:0] mhpmcounter[3:31];
    // // Machine Counter Setup
    // reg[31:0] mcountinhibit;//可以不实现

    // reg[63:0] mtime;
    // reg[63:0] mtimecmp;

    //时序逻辑
    always @ (posedge i_clk) begin//每个clk上升沿就来看看
        `ifedf RV32I
            if(i_nrst==1'b0) begin
                csrs[`CSR_MCYCLE_ADDR]<=64'b0;
                csrs[`CSR_MCYCLEH_ADDR]<=64'b0;
            end else begin
                if(csrs[12'hB00][31:0]==32'hFFFF) begin
                    csrs[12'hB00]<=64'b0;
                    csrs[12'hB80]<=csrs[12'hB80]+1'b1;
                end else begin
                    csrs[12'hB00]<=csrs[12'hB00]+1'b1;
                end
            end
        `else
        `endif
    end

    //组合逻辑
    always @ (*) begin
        //misa 长度可变
        //                                              zy xwvu tsrq ponm lkji hgfe dcba
        csrs[`CSR_MISA_ADDR]<={`MXL,`MXLEN-28{1'b0},26'b00_0000_0000_0000_0001_0000_0000}
        //mvendorid 永远32位
        csrs[`CSR_MVENDORID_ADDR]<=32'd0;//非商业实现
        //marchid 长度可变
        csrs[`CSR_MARCHID_ADDR]<=`MXLEN'b0;//架构编码未定
        //mimpid 长度可变
        csrs[`CSR_MIMPID_ADDR]<=`MXLEN'b0;//实现编码未定
        //mhartid 长度可变
        csrs[`CSR_MHARTID_ADDR]<=`MXLEN'b0;//只有一个0hart
        //mstatus
        csrs[`CSR_MSTATUS_ADDR]<=`MXLEN'b0;//只有一个0hart

        case (i_funct3)
            `INST_CSRRW: begin
                if(i_rd_addr!=5'b0) begin//rd!=x0 读数据
                    o_rd_data<=csrs[i_csr_addr];
                end
                //写csr
                csrs[i_csr_addr]<=i_rs1_data;
            end
            `INST_CSRRS: begin//rs1数据按位置位
                if(i_rs1_addr_uimm!=5'b0) begin//rd!=x0 写数据
                    csrs[i_csr_addr]<=csrs[i_csr_addr]|i_rs1_data;
                end
                o_rd_data<=csrs[i_csr_addr];
            end
            `INST_CSRRC: begin
                if(i_rs1_addr_uimm!=5'b0) begin//rd!=x0 写数据
                    csrs[i_csr_addr]<=csrs[i_csr_addr]&(~i_rs1_data);
                end
                o_rd_data<=csrs[i_csr_addr];
            end
            `INST_CSRRWI: begin
                if(i_rd_addr!=5'b0) begin//rd!=x0 读数据
                    o_rd_data<=csrs[i_csr_addr];
                end
                //
                csrs[i_csr_addr]<=i_rs1_addr_uimm;
            end
            `INST_CSRRSI: begin
                if(i_rs1_addr_uimm!=5'b0) begin//rd!=x0 写数据
                    
                    csrs[i_csr_addr]<=csrs[i_csr_addr]|i_rs1_addr_uimm;
                end
                //
                o_rd_data<=csrs[i_csr_addr];
            end
            `INST_CSRRCI: begin
                if(i_rs1_addr_uimm!=5'b0) begin//rd!=x0 写数据
                    csrs[i_csr_addr]<=csrs[i_csr_addr]|(~i_rs1_addr_uimm);
                end
                //
                o_rd_data<=csrs[i_csr_addr];
            end
            default: begin
                
            end
        endcase
    end

endmodule