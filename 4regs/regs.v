module regs(
    input wire i_clk,
    input wire i_nrst,

    input wire[4:0] i_rs1_addr,
    input wire[4:0] i_rs2_addr,

    output reg[31:0] o_rs1_data,
    output reg[31:0] o_rs2_data
);

reg[31:0] reg_file[0:31];

always @(*) begin
    //任意时刻，只要复位信号为0，输出信号就清零
    if(i_nrst == 1'b0) begin
        o_rs1_data <= 32'b0;
        o_rs2_data <= 32'b0;
    end
    else begin
        //如果rs1_addr不为0，则将reg_file中对应地址的数据赋值给rs1_data
        if(i_rs1_addr != 5'b0) begin
            o_rs1_data <= reg_file[i_rs1_addr];
        end
        else begin
            o_rs1_data <= 32'b0;
        end
        //如果rs2_addr不为0，则将reg_file中对应地址的数据赋值给rs2_data
        if(i_rs2_addr != 5'b0) begin
            o_rs2_data <= reg_file[i_rs2_addr];
        end
        else begin
            o_rs2_data <= 32'b0;
        end
    end
end

always @(posedge i_clk or negedge i_nrst) begin

    //时钟到了，发现复位信号为0，则将寄存器全部清零
    if(i_nrst == 1'b0) begin
        for(integer i = 0; i < 32; i = i + 1) begin
            reg_file[i] <= 32'b0;
        end
    end
end

endmodule