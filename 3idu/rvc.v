//压缩指令集
//Table 16.4: RVC opcode map

`define RVC_QUADRANT_0 2'b00
`define RVC_QUADRANT_1 2'b01
`define RVC_QUADRANT_2 2'b10

//5'b00000
`define C_ADDI4SPN_INST             {3'b000 , `RVC_QUADRANT_0}
//5'b00100
`define C_FLD3264_LQ128_INST        {3'b001 , `RVC_QUADRANT_0}
//5'b01000
`define C_LW_INST                   {3'b010 , `RVC_QUADRANT_0}
//5'b01100
`define C_FLW32_LD64128_INST        {3'b011 , `RVC_QUADRANT_0}
//5'b10000
`define C_Reserved_INST             {3'b100 , `RVC_QUADRANT_0}
//5'b10100
`define C_FSD3264_SQ128_INST        {3'b101 , `RVC_QUADRANT_0}
//5'b11000
`define C_SW_INST                   {3'b110 , `RVC_QUADRANT_0}
//5'b11100
`define C_FSW32_SD64128_INST        {3'b111 , `RVC_QUADRANT_0}

//5'b00001
`define C_ADDI_INST                 {3'b000 , `RVC_QUADRANT_1}
//5'b00101
`define C_JAL32_ADDIW64128_INST     {3'b001 , `RVC_QUADRANT_1}
//5'b01001
`define C_LI_INST                   {3'b010 , `RVC_QUADRANT_1}
//5'b01101
`define C_LUI_ADDI16SP_INST         {3'b011 , `RVC_QUADRANT_1}
//5'b10001
`define C_MISC_ALU_INST             {3'b100 , `RVC_QUADRANT_1}
//5'b10101
`define C_J_INST                    {3'b101 , `RVC_QUADRANT_1}
//5'b11001
`define C_BEQZ_INST                 {3'b110 , `RVC_QUADRANT_1}
//5'b11101
`define C_BNEZ_INST                 {3'b111 , `RVC_QUADRANT_1}

//5'b00010
`define C_SLLI_INST                 {3'b000 , `RVC_QUADRANT_2}
//5'b00110
`define C_FLDSP3264_LQSP218_INST    {3'b001 , `RVC_QUADRANT_2}
//5'b01010
`define C_LWSP_INST                 {3'b010 , `RVC_QUADRANT_2}
//5'b01110
`define C_FLWSP32_LDSP64128_INST    {3'b011 , `RVC_QUADRANT_2}
//5'b10010
`define C_JR_JALR_MV_ADD_INST       {3'b100 , `RVC_QUADRANT_2}
//5'b10110
`define C_FSDSP3264_SQSP128_INST    {3'b101 , `RVC_QUADRANT_2}
//5'b11010
`define C_SWSP_INST                 {3'b110 , `RVC_QUADRANT_2}
//5'b11110
`define C_FSWSP32_SDSP64128_INST    {3'b111 , `RVC_QUADRANT_2}
