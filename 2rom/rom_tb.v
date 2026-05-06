`timescale 1ns / 1ps
// `include "pc.v"

module rom_tb (
    
);

parameter SYSCLK_PERIOD = 10;

reg SYSCLK;
reg NSYSRESET;
reg JP_EN;
reg [31:0] JP_ADDR;

wire [31:0] pc;

initial
begin
    SYSCLK = 1'b0;
    NSYSRESET = 1'b0;
    JP_EN = 1'b0;
    JP_ADDR = 32'h0000_0000;
end

// always #5 SYSCLK = ~SYSCLK;

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

// always @(SYSCLK)
//     #(SYSCLK_PERIOD / 2.0) SYSCLK <= !SYSCLK;

always #(SYSCLK_PERIOD / 2.0) SYSCLK = ~SYSCLK;

wire rst_pin;
wire [31:0] data;

pc pc_demo (
    // Inputs
    .i_clk(SYSCLK),
    .i_nrst(rst_pin),
    .i_jump_en(JP_EN),
    .i_jump_addr(JP_ADDR),

    // Outputs
    .o_pc( pc)
);

async_low_sync_high reset_pin(
    .i_clk(SYSCLK),
    .i_signal(NSYSRESET),
    .o_signal(rst_pin)
);

rom rom_demo (
    .i_clk(SYSCLK),
    .i_addr(pc),
    .o_data(data)
);
    
endmodule