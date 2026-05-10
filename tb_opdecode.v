//~ `New testbench
`timescale  1ns / 1ps

module tb_opdecode;

// opdecode Parameters
parameter PERIOD  = 10;


// opdecode Inputs
reg   [6:0] i_inst                     = 0 ;

// opdecode Outputs
wire  o_is_rvg_inst                        ;

// /*iverilog */
// initial
// begin            
    
// end
/*iverilog */

// initial
// begin
//     forever #(PERIOD/2)  clk=~clk;
// end

// initial
// begin
//     #(PERIOD*2) rst_n  =  1;
// end

opdecode  u_opdecode (
    .i_inst             (  i_inst   ),

    .o_is_rvg_opcode    ( o_is_rvg_inst      )
);

initial
begin
    $dumpfile("wave.vcd");        //生成的vcd文件名称
    // $dumpvars;    //tb模块名称
    $dumpvars(0, tb_opdecode);    //tb模块名称
    i_inst=7'b0000111;
    #100
    i_inst=7'b0000110;
    #100
    i_inst=7'b0000100;
    #100
    i_inst=7'b0000101;
    #100
    // $finish;
    $stop;
end

endmodule