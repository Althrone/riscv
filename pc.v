module pc(
   input wire i_clk,
   input wire i_nrst,
   output reg[31:0] o_pc
);

always @(posedge i_clk) begin

   if(i_nrst==1'b0)
       o_pc <= 32'b0;
   else
       o_pc <= o_pc+3'd4;
end

endmodule

//////////////////////////////////////////////////////

// 异步低电平同步高电平
//  ┌─┐ ┌─┐ │ ┌─┐ ┌─┐ ┌─┐ ┌─┐ ┌─┐ ┌─┐ ┌─┐ ┌─┐ ┌─┐ 
// ─┘ └─┘ └─│─┘ └─┘ └─┘ └─┘ └─┘ └─┘ └─┘ └─┘ └─┘ └─
// ┐ ┌──────│
// └─┘      │
// ┐    ┌───│
// └────┘   │

// ┌┬┐─
// ├┼┤─
// └┴┘─

// 异步拉低，同步拉高，就是一旦输入拉低输出就拉低，输出维持信号直到时钟拉高
module

async_low_sync_high(
    input   wire    i_clk,
    input   wire    i_signal,
    output  reg     o_signal
);

reg i_signal_r;

always @(posedge i_clk or negedge i_signal) begin
    if(i_signal==1'b0)begin//输入信号拉低
        i_signal_r  <=1'b0;
        o_signal    <=1'b0;
    end
    else begin//i_signal处于上升沿或者高电平
        i_signal_r  <=1'b1;
        o_signal    <=i_signal_r;
    end
end

endmodule
