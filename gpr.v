// 通用寄存器 x0-x31

module gpr (
    i_clk,
    i_nrst,//已经是异步使能同步释放信号

    //写接口
    i_rd_we,//目标寄存器写使能
    i_rd_addr,
    i_rd_w_data,//写入目标寄存器的数据

    //读接口
    i_rs1_re,
    i_rs1_addr,
    o_rs1_r_data,//读出源寄存器的数据
    i_rs2_re,
    i_rs2_addr,
    o_rs2_r_data//读出源寄存器的数据
);

parameter REG_ADDR_BUS_WIDTH = 5,
          REG_DATA_BUS_WIDTH = 32,
          NUMBER_OF_GPR      = 32;//默认寄存器地址5位，数据32位，一共32个

input wire i_clk;
input wire i_nrst;
input wire                          i_rd_we;
input wire[REG_ADDR_BUS_WIDTH-1:0]  i_rd_addr;
input wire[REG_DATA_BUS_WIDTH-1:0]  i_rd_w_data;
input wire                          i_rs1_re;
input wire[REG_ADDR_BUS_WIDTH-1:0]  i_rs1_addr;
output reg[REG_DATA_BUS_WIDTH-1:0]  o_rs1_r_data;
input wire                          i_rs2_re;
input wire[REG_ADDR_BUS_WIDTH-1:0]  i_rs2_addr;
output reg[REG_DATA_BUS_WIDTH-1:0]  o_rs2_r_data;

//如果之后打算用fpga上板验证的话，reg file建议用bram来做。寄存器组在fpga上实现起来效果很差
//先用reg file来做
reg [REG_ADDR_BUS_WIDTH-1:0] regs[0:NUMBER_OF_GPR-1];

always @(posedge i_clk) begin//时钟上升沿写入一个寄存器和读取两个寄存器
    //需要解决
    //目标寄存器写使能且rd地址不是x0
    if ((i_rd_we==1'b1)&&(i_rd_addr!={REG_ADDR_BUS_WIDTH{1'b0}})) begin
        regs[i_rd_addr]<=i_rd_w_data;
    end
end

always @(negedge i_nrst) begin
    if(i_nrst==1'b0)begin
        for (integer i={REG_ADDR_BUS_WIDTH{1'b0}};i<{REG_ADDR_BUS_WIDTH{1'b1}};i=i+1) begin
            regs[i]<={REG_DATA_BUS_WIDTH{1'b0}};
        end
    end
end
    
endmodule