module rom(
    input i_clk,
	input [31:0] i_addr,
	output reg[31:0] o_data
);

initial begin
	$readmemh("./2rom/rom.txt", rom);
end

reg [31:0] rom [0:4095];

always @(posedge i_clk) begin

	o_data <= rom[i_addr[31:2]];

end

endmodule