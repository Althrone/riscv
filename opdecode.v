
//opcode解码模块
module opdecode (
    input wire[6:0] i_inst,//输入指令

    output reg o_is_rvg_opcode//输出是否为rv32g rv64g的opcode 0表示rvc的opcode
);

wire test = i_inst[1:0];
    
// assign o_is_rvg_opcode=(i_inst[1:0]==2'b11);

always @(*) begin
    if (i_inst[1:0]==2'b11) begin
        o_is_rvg_opcode<=1'b1;
    end
    else begin
        o_is_rvg_opcode<=1'b0;
    end
end

// case (i_inst[1:0])
//     2'b11: begin
//         assign o_is_rvg_inst=(i_inst[1:0]==2'b11);
//     end
//     default: begin
        
//     end
// endcase

endmodule