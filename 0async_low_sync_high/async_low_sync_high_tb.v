`timescale 1ns / 1ps
// `include "pc.v"

module async_low_sync_high_tb (
    
);

parameter SYSCLK_PERIOD = 10;

reg SYSCLK;
reg NSYSRESET;

wire o_signal;

initial
begin
    SYSCLK = 1'b0;
    NSYSRESET = 1'b0;
end

/*iverilog */
initial
begin            
    $dumpfile("wave.vcd");        //生成的vcd文件名称
    $dumpvars(0, async_low_sync_high_tb);    //tb模块名称
end
/*iverilog */

initial
begin
    // #(SYSCLK_PERIOD * 10 )
    #101
        NSYSRESET = 1'b1;
    #100
        NSYSRESET = 1'b0;
    #54
        NSYSRESET = 1'b1;
    #100
        NSYSRESET = 1'b0;

        $stop;
end

// always @(SYSCLK)
//     #(SYSCLK_PERIOD / 2.0) SYSCLK <= !SYSCLK;

always #(SYSCLK_PERIOD / 2.0) SYSCLK = ~SYSCLK;

async_low_sync_high async_low_sync_high_demo (
    // Inputs
    .i_clk(SYSCLK),
    .i_signal(NSYSRESET),

    // Outputs
    .o_signal(o_signal)
);
    
endmodule