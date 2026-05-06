#!/bin/bash

SRC_DIR="1pc"
TOP_MODULE="your_top_module"         # 必填
WAVE_FILE="wave.vcd"

# 编译所有 .v 文件，使用 -s 指定顶层模块
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
iverilog -o $SCRIPT_DIR/wave $(find "$SCRIPT_DIR" -maxdepth 1 -type f -name "*.v")
# iverilog -s "${TOP_MODULE}" -o sim_output $(find "${SRC_DIR}" -name "*.v") -Wall

# 运行仿真，生成 .vcd 文件（已通过 $dumpfile 指定）
vvp -n $SCRIPT_DIR/wave -lxt2
# # vvp -n sim_output

mv wave.vcd $SCRIPT_DIR

# 启动 GTKWave
gtkwave --rcvar "splash_disable 1" \
        --rcvar "color_back FFFFFF" \
        --rcvar "color_baseline 000000" \
        --rcvar "color_time 000000" \
        --rcvar "color_timeb FFFFFF" \
        --rcvar "color_grid A0A0A0" \
        --rcvar "color_grid2 888888" \
        --rcvar "color_value 000000" \
        "${SCRIPT_DIR}/${WAVE_FILE}"