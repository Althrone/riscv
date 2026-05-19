module id2ex(
    input wire i_clk,
    input wire i_nrst,
    
    input wire [31:0] i_rs1_data,
    input wire [31:0] i_rs2_data,
    input wire [31:0] i_imm_data,
    
    output reg [31:0] o_rs1_data,
    output reg [31:0] o_rs2_data,
    output reg [31:0] o_imm_data
);

always @(posedge i_clk or negedge i_rst_n) begin
    if (i_nrst == 1'b0) begin
        o_rs1_data <= 32'b0;
        o_rs2_data <= 32'b0;
        o_imm_data <= 32'b0;
    end else begin
        o_rs1_data <= i_rs1_data;
        o_rs2_data <= i_rs2_data;
        o_imm_data <= i_imm_data;
    end
end

endmodule