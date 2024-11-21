`timescale 1ns / 1ps
// `include "pc.v"

module pc_tb (
    
);

parameter SYSCLK_PERIOD = 10;

reg SYSCLK;
reg NSYSRESET;

wire [31:0] pc;

initial
begin
    SYSCLK = 1'b0;
    NSYSRESET = 1'b0;
end

/*iverilog */
initial
begin            
    $dumpfile("wave.vcd");        //生成的vcd文件名称
    $dumpvars(0, pc_tb);    //tb模块名称
end
/*iverilog */

initial
begin
    #(SYSCLK_PERIOD * 10 )
        NSYSRESET = 1'b1;
    #1000
        $stop;
end

always @(SYSCLK)
    #(SYSCLK_PERIOD / 2.0) SYSCLK <= !SYSCLK;

pc pc_demo (
    // Inputs
    .i_nrst(NSYSRESET),
    .i_clk(SYSCLK),

    // Outputs
    .o_pc( pc)
);
    
endmodule