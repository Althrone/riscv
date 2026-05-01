module pc(
   input wire i_clk,
   input wire i_nrst,
   input wire i_jump_en,
   input wire[31:0] i_jump_addr,
   output reg[31:0] o_pc
);

always @(posedge i_clk) begin

    if(i_nrst==1'b0)
        o_pc <= 32'b0;
    else if(i_jump_en==1'b1)
        o_pc <= i_jump_addr;
    else
        o_pc <= o_pc+3'd4;
end

endmodule
