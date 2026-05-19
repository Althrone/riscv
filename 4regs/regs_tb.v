`timescale 1ns / 1ps


module rom_tb (
    
);

parameter SYSCLK_PERIOD = 10;

reg SYSCLK;
reg NSYSRESET;
reg JP_EN;
reg [31:0] JP_ADDR;

wire [31:0] pc;
wire rst_pin;
wire [31:0] data;

wire [4:0] rs1_addr;
wire [4:0] rs2_addr;
wire [4:0] rd_addr;
wire [6:0] opcode;
wire [2:0] funct3;
wire [6:0] funct7;
wire [31:0] imm;

wire [31:0] rs1_data;
wire [31:0] rs2_data;



initial
begin
    SYSCLK = 1'b0;
    NSYSRESET = 1'b0;
    JP_EN = 1'b0;
    JP_ADDR = 32'h0000_0000;
end

/*iverilog */
initial
begin            
    $dumpfile("wave.vcd");        //生成的vcd文件名称
    $dumpvars(0, rom_tb);    //tb模块名称
end
/*iverilog */

initial
begin
    #(SYSCLK_PERIOD * 10 )
        NSYSRESET = 1'b1;
    #100
        $stop;
end

always #(SYSCLK_PERIOD / 2.0) SYSCLK = ~SYSCLK;

async_low_sync_high reset_pin(
    .i_clk(SYSCLK),
    .i_signal(NSYSRESET),
    .o_signal(rst_pin)
);

pc pc_demo (
    // Inputs
    .i_clk(SYSCLK),
    .i_nrst(rst_pin),
    .i_jump_en(JP_EN),
    .i_jump_addr(JP_ADDR),

    // Outputs
    .o_pc( pc)
);

rom rom_demo (
    .i_clk(SYSCLK),
    .i_addr(pc),
    .o_data(data)
);

id id_demo(
    .i_inst(data),
    .o_rs1_addr(rs1_addr),
    .o_rs2_addr_shamt(rs2_addr),
    .o_rd_addr(rd_addr),
    .o_opcode(opcode),
    .o_funct3(funct3),
    .o_funct7(funct7),
    .o_imm(imm)
);

regs regs_demo(
    .i_clk(SYSCLK),
    .i_nrst(rst_pin),
    .i_rs1_addr(rs1_addr),
    .i_rs2_addr(rs2_addr),
    .o_rs1_data(rs1_data),
    .o_rs2_data(rs2_data)
);

endmodule