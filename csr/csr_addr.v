`include "define.v"
// Currently allocated RISC-V unprivileged CSR addresses

// Unprivileged Floating-Point CSRs
`define CSR_FFLAGS_ADDR         12'h001 //URW Floating-Point Accrued Exceptions.
`define CSR_FRM_ADDR            12'h002 //URW Floating-Point Dynamic Rounding Mode.
`define CSR_FCSR_ADDR           12'h003 //URW Floating-Point Control and Status Register (frm + fflags).
// Unprivileged Counter/Timers
`define CSR_CYCLE_ADDR          12'hC00 //URO Cycle counter for RDCYCLE instruction.
`define CSR_TIME_ADDR           12'hC01 //URO Timer for RDTIME instruction.
`define CSR_INSTRET_ADDR        12'hC02 //URO Instructions-retired counter for RDINSTRET instruction.
`define CSR_HPMCOUNTER3_ADDR    12'hC03 //URO Performance-monitoring counter.
`define CSR_HPMCOUNTER4_ADDR    12'hC04 //URO Performance-monitoring counter.
`define CSR_HPMCOUNTER5_ADDR    12'hC05 //URO Performance-monitoring counter.
`define CSR_HPMCOUNTER6_ADDR    12'hC06 //URO Performance-monitoring counter.
`define CSR_HPMCOUNTER7_ADDR    12'hC07 //URO Performance-monitoring counter.
`define CSR_HPMCOUNTER8_ADDR    12'hC08 //URO Performance-monitoring counter.
`define CSR_HPMCOUNTER9_ADDR    12'hC09 //URO Performance-monitoring counter.
`define CSR_HPMCOUNTER10_ADDR   12'hC0A //URO Performance-monitoring counter.
`define CSR_HPMCOUNTER11_ADDR   12'hC0B //URO Performance-monitoring counter.
`define CSR_HPMCOUNTER12_ADDR   12'hC0C //URO Performance-monitoring counter.
`define CSR_HPMCOUNTER13_ADDR   12'hC0D //URO Performance-monitoring counter.
`define CSR_HPMCOUNTER14_ADDR   12'hC0E //URO Performance-monitoring counter.
`define CSR_HPMCOUNTER15_ADDR   12'hC0F //URO Performance-monitoring counter.
`define CSR_HPMCOUNTER16_ADDR   12'hC10 //URO Performance-monitoring counter.
`define CSR_HPMCOUNTER17_ADDR   12'hC11 //URO Performance-monitoring counter.
`define CSR_HPMCOUNTER18_ADDR   12'hC12 //URO Performance-monitoring counter.
`define CSR_HPMCOUNTER19_ADDR   12'hC13 //URO Performance-monitoring counter.
`define CSR_HPMCOUNTER20_ADDR   12'hC14 //URO Performance-monitoring counter.
`define CSR_HPMCOUNTER21_ADDR   12'hC15 //URO Performance-monitoring counter.
`define CSR_HPMCOUNTER22_ADDR   12'hC16 //URO Performance-monitoring counter.
`define CSR_HPMCOUNTER23_ADDR   12'hC17 //URO Performance-monitoring counter.
`define CSR_HPMCOUNTER24_ADDR   12'hC18 //URO Performance-monitoring counter.
`define CSR_HPMCOUNTER25_ADDR   12'hC19 //URO Performance-monitoring counter.
`define CSR_HPMCOUNTER26_ADDR   12'hC1A //URO Performance-monitoring counter.
`define CSR_HPMCOUNTER27_ADDR   12'hC1B //URO Performance-monitoring counter.
`define CSR_HPMCOUNTER28_ADDR   12'hC1C //URO Performance-monitoring counter.
`define CSR_HPMCOUNTER29_ADDR   12'hC1D //URO Performance-monitoring counter.
`define CSR_HPMCOUNTER30_ADDR   12'hC1E //URO Performance-monitoring counter.
`define CSR_HPMCOUNTER31_ADDR   12'hC1F //URO Performance-monitoring counter.
`ifdef RV32
    `define CSR_CYCLEH_ADDR         12'hC80 //URO Upper 32 bits of cycle, RV32 only.
    `define CSR_TIMEH_ADDR          12'hC81 //URO Upper 32 bits of time, RV32 only.
    `define CSR_INSTRETH_ADDR       12'hC82 //URO Upper 32 bits of instret, RV32 only.
    `define CSR_HPMCOUNTER3H_ADDR   12'hC83 //URO Upper 32 bits of hpmcounter3, RV32 only.
    `define CSR_HPMCOUNTER4H_ADDR   12'hC84 //URO Upper 32 bits of hpmcounter4, RV32 only.
    `define CSR_HPMCOUNTER5H_ADDR   12'hC85 //URO Upper 32 bits of hpmcounter5, RV32 only.
    `define CSR_HPMCOUNTER6H_ADDR   12'hC86 //URO Upper 32 bits of hpmcounter6, RV32 only.
    `define CSR_HPMCOUNTER7H_ADDR   12'hC87 //URO Upper 32 bits of hpmcounter7, RV32 only.
    `define CSR_HPMCOUNTER8H_ADDR   12'hC88 //URO Upper 32 bits of hpmcounter8, RV32 only.
    `define CSR_HPMCOUNTER9H_ADDR   12'hC89 //URO Upper 32 bits of hpmcounter9, RV32 only.
    `define CSR_HPMCOUNTER10H_ADDR  12'hC8A //URO Upper 32 bits of hpmcounter10, RV32 only.
    `define CSR_HPMCOUNTER11H_ADDR  12'hC8B //URO Upper 32 bits of hpmcounter11, RV32 only.
    `define CSR_HPMCOUNTER12H_ADDR  12'hC8C //URO Upper 32 bits of hpmcounter12, RV32 only.
    `define CSR_HPMCOUNTER13H_ADDR  12'hC8D //URO Upper 32 bits of hpmcounter13, RV32 only.
    `define CSR_HPMCOUNTER14H_ADDR  12'hC8E //URO Upper 32 bits of hpmcounter14, RV32 only.
    `define CSR_HPMCOUNTER15H_ADDR  12'hC8F //URO Upper 32 bits of hpmcounter15, RV32 only.
    `define CSR_HPMCOUNTER16H_ADDR  12'hC90 //URO Upper 32 bits of hpmcounter16, RV32 only.
    `define CSR_HPMCOUNTER17H_ADDR  12'hC91 //URO Upper 32 bits of hpmcounter17, RV32 only.
    `define CSR_HPMCOUNTER18H_ADDR  12'hC92 //URO Upper 32 bits of hpmcounter18, RV32 only.
    `define CSR_HPMCOUNTER19H_ADDR  12'hC93 //URO Upper 32 bits of hpmcounter19, RV32 only.
    `define CSR_HPMCOUNTER20H_ADDR  12'hC94 //URO Upper 32 bits of hpmcounter20, RV32 only.
    `define CSR_HPMCOUNTER21H_ADDR  12'hC95 //URO Upper 32 bits of hpmcounter21, RV32 only.
    `define CSR_HPMCOUNTER22H_ADDR  12'hC96 //URO Upper 32 bits of hpmcounter22, RV32 only.
    `define CSR_HPMCOUNTER23H_ADDR  12'hC97 //URO Upper 32 bits of hpmcounter23, RV32 only.
    `define CSR_HPMCOUNTER24H_ADDR  12'hC98 //URO Upper 32 bits of hpmcounter24, RV32 only.
    `define CSR_HPMCOUNTER25H_ADDR  12'hC99 //URO Upper 32 bits of hpmcounter25, RV32 only.
    `define CSR_HPMCOUNTER26H_ADDR  12'hC9A //URO Upper 32 bits of hpmcounter26, RV32 only.
    `define CSR_HPMCOUNTER27H_ADDR  12'hC9B //URO Upper 32 bits of hpmcounter27, RV32 only.
    `define CSR_HPMCOUNTER28H_ADDR  12'hC9C //URO Upper 32 bits of hpmcounter28, RV32 only.
    `define CSR_HPMCOUNTER29H_ADDR  12'hC9D //URO Upper 32 bits of hpmcounter29, RV32 only.
    `define CSR_HPMCOUNTER30H_ADDR  12'hC9E //URO Upper 32 bits of hpmcounter30, RV32 only.
    `define CSR_HPMCOUNTER31H_ADDR  12'hC9F //URO Upper 32 bits of hpmcounter31, RV32 only.
`endif

// Currently allocated RISC-V supervisor-level CSR addresses

// Supervisor Trap Setup
`define CSR_SSTATUS_ADDR    12'h100 //SRW Supervisor status register.
`define CSR_SIE_ADDR        12'h104 //SRW Supervisor interrupt-enable register.
`define CSR_STVEC_ADDR      12'h105 //SRW Supervisor trap handler base address.
`define CSR_SCOUNTEREN_ADDR 12'h106 //SRW Supervisor counter enable.
// Supervisor Configuration
`define CSR_SENVCFG_ADDR    12'h10A //SRW Supervisor environment configuration register.
// Supervisor Trap Handling
`define CSR_SSCRATCH_ADDR   12'h140 //SRW Scratch register for supervisor trap handlers.
`define CSR_SEPC_ADDR       12'h141 //SRW Supervisor exception program counter.
`define CSR_SCAUSE_ADDR     12'h142 //SRW Supervisor trap cause.
`define CSR_STVAL_ADDR      12'h143 //SRW Supervisor bad address or instruction.
`define CSR_SIP_ADDR        12'h144 //SRW Supervisor interrupt pending.
// Supervisor Protection and Translation
`define CSR_SATP_ADDR       12'h180 //SRW Supervisor address translation and protection.
// Debug/Trace Registers
`define CSR_SCONTEXT_ADDR   12'h5A8 //SRW Supervisor-mode context register.

//Currently allocated RISC-V hypervisor and VS CSR addresses.

// Hypervisor Trap Setup
`define CSR_HSTATUS_ADDR        12'h600 //HRW Hypervisor status register.
`define CSR_HEDELEG_ADDR        12'h602 //HRW Hypervisor exception delegation register.
`define CSR_HIDELEG_ADDR        12'h603 //HRW Hypervisor interrupt delegation register.
`define CSR_HIE_ADDR            12'h604 //HRW Hypervisor interrupt-enable register.
`define CSR_HCOUNTEREN_ADDR     12'h606 //HRW Hypervisor counter enable.
`define CSR_HGEIE_ADDR          12'h607 //HRW Hypervisor guest external interrupt-enable register.
// Hypervisor Trap Handling
`define CSR_HTVAL_ADDR          12'h643 //HRW Hypervisor bad guest physical address.
`define CSR_HIP_ADDR            12'h644 //HRW Hypervisor interrupt pending.
`define CSR_HVIP_ADDR           12'h645 //HRW Hypervisor virtual interrupt pending.
`define CSR_HTINST_ADDR         12'h64A //HRW Hypervisor trap instruction (transformed).
`define CSR_HGEIP_ADDR          12'hE12 //HRO Hypervisor guest external interrupt pending.
// Hypervisor Configuration
`define CSR_HENVCFG_ADDR        12'h60A //HRW Hypervisor environment configuration register.
`ifdef RV32
    `define CSR_HENVCFGH_ADDR   12'h61A //HRW Additional hypervisor env. conf. register, RV32 only.
`endif
// Hypervisor Protection and Translation
`define CSR_HGATP_ADDR          12'h680 //HRW Hypervisor guest address translation and protection.
// Debug/Trace Registers
`define CSR_HCONTEXT_ADDR       12'h6A8 //HRW Hypervisor-mode context register.
// Hypervisor Counter/Timer Virtualization Registers
`define CSR_HTIMEDELTA_ADDR     12'h605 //HRW Delta for VS/VU-mode timer.
`define CSR_HTIMEDELTAH_ADDR    12'h615 //HRW Upper 32 bits of htimedelta, HSXLEN=32 only.
// Virtual Supervisor Registers
`define CSR_VSSTATUS_ADDR       12'h200 //HRW Virtual supervisor status register.
`define CSR_VSIE_ADDR           12'h204 //HRW Virtual supervisor interrupt-enable register.
`define CSR_VSTVEC_ADDR         12'h205 //HRW Virtual supervisor trap handler base address.
`define CSR_VSSCRATCH_ADDR      12'h240 //HRW Virtual supervisor scratch register.
`define CSR_VSEPC_ADDR          12'h241 //HRW Virtual supervisor exception program counter.
`define CSR_VSCAUSE_ADDR        12'h242 //HRW Virtual supervisor trap cause.
`define CSR_VSTVAL_ADDR         12'h243 //HRW Virtual supervisor bad address or instruction.
`define CSR_VSIP_ADDR           12'h244 //HRW Virtual supervisor interrupt pending.
`define CSR_VSATP_ADDR          12'h280 //HRW Virtual supervisor address translation and protection.

// Currently allocated RISC-V machine-level CSR addresses.

// Machine Information Registers
`define CSR_MVENDORID_ADDR  12'hF11 //MRO Vendor ID.
`define CSR_MARCHID_ADDR    12'hF12 //MRO Architecture ID.
`define CSR_MIMPID_ADDR     12'hF13 //MRO Implementation ID.
`define CSR_MHARTID_ADDR    12'hF14 //MRO Hardware thread ID.
`define CSR_MCONFIGPTR_ADDR 12'hF15 //MRO Pointer to configuration data structure.
// Machine Trap Setup
`define CSR_MSTATUS_ADDR    12'h300 //MRW Machine status register.
`define CSR_MISA_ADDR       12'h301 //MRW ISA and extensions
`define CSR_MEDELEG_ADDR    12'h302 //MRW Machine exception delegation register.
`define CSR_MIDELEG_ADDR    12'h303 //MRW Machine interrupt delegation register.
`define CSR_MIE_ADDR        12'h304 //MRW Machine interrupt-enable register.
`define CSR_MTVEC_ADDR      12'h305 //MRW Machine trap-handler base address.
`define CSR_MCOUNTEREN_ADDR 12'h306 //MRW Machine counter enable.
`ifdef RV32
    `define CSR_MSTATUSH_ADDR   12'h310 //MRW Additional machine status register, RV32 only.
`endif
// Machine Trap Handling
`define CSR_MSCRATCH_ADDR   12'h340 //MRW Scratch register for machine trap handlers.
`define CSR_MEPC_ADDR       12'h341 //MRW Machine exception program counter.
`define CSR_MCAUSE_ADDR     12'h342 //MRW Machine trap cause.
`define CSR_MTVAL_ADDR      12'h343 //MRW Machine bad address or instruction.
`define CSR_MIP_ADDR        12'h344 //MRW Machine interrupt pending.
`define CSR_MTINST_ADDR     12'h34A //MRW Machine trap instruction (transformed).
`define CSR_MTVAL2_ADDR     12'h34B //MRW Machine bad guest physical address.
// Machine Configuration
`define CSR_MENVCFG_ADDR        12'h30A //MRW Machine environment configuration register.
`ifdef RV32
    `define CSR_MENVCFGH_ADDR   12'h31A //MRW Additional machine env. conf. register, RV32 only.
`define CSR_MSECCFG_ADDR        12'h747 //MRW Machine security configuration register.
`endif
`ifdef RV32
    `define CSR_MSECCFGH_ADDR   12'h757 //MRW Additional machine security conf. register, RV32 only.
// Machine Memory Protection
`endif
`define CSR_PMPCFG0_ADDR        12'h3A0 //MRW Physical memory protection configuration.
`ifdef RV32
    `define CSR_PMPCFG1_ADDR    12'h3A1 //MRW Physical memory protection configuration, RV32 only.
`define CSR_PMPCFG2_ADDR        12'h3A2 //MRW Physical memory protection configuration.
`endif
`ifdef RV32
    `define CSR_PMPCFG3_ADDR    12'h3A3 //MRW Physical memory protection configuration, RV32 only.
`define CSR_PMPCFG4_ADDR        12'h3A4 //MRW Physical memory protection configuration.
`endif
`ifdef RV32
    `define CSR_PMPCFG5_ADDR    12'h3A5 //MRW Physical memory protection configuration, RV32 only.
`define CSR_PMPCFG6_ADDR        12'h3A6 //MRW Physical memory protection configuration.
`endif
`ifdef RV32
    `define CSR_PMPCFG7_ADDR    12'h3A7 //MRW Physical memory protection configuration, RV32 only.
`define CSR_PMPCFG8_ADDR        12'h3A8 //MRW Physical memory protection configuration.
`endif
`ifdef RV32
    `define CSR_PMPCFG9_ADDR    12'h3A9 //MRW Physical memory protection configuration, RV32 only.
`define CSR_PMPCFG10_ADDR       12'h3AA //MRW Physical memory protection configuration.
`endif
`ifdef RV32
    `define CSR_PMPCFG11_ADDR   12'h3AB //MRW Physical memory protection configuration, RV32 only.
`define CSR_PMPCFG12_ADDR       12'h3AC //MRW Physical memory protection configuration.
`endif
`ifdef RV32
    `define CSR_PMPCFG13_ADDR   12'h3AD //MRW Physical memory protection configuration, RV32 only.
`define CSR_PMPCFG14_ADDR       12'h3AE //MRW Physical memory protection configuration.
`endif
`ifdef RV32
    `define CSR_PMPCFG15_ADDR   12'h3AF //MRW Physical memory protection configuration, RV32 only
`endif.
`define CSR_PMPADDR0_ADDR   12'h3B0 //MRW Physical memory protection address register.
`define CSR_PMPADDR1_ADDR   12'h3B1 //MRW Physical memory protection address register.
`define CSR_PMPADDR2_ADDR   12'h3B2 //MRW Physical memory protection address register.
`define CSR_PMPADDR3_ADDR   12'h3B3 //MRW Physical memory protection address register.
`define CSR_PMPADDR4_ADDR   12'h3B4 //MRW Physical memory protection address register.
`define CSR_PMPADDR5_ADDR   12'h3B5 //MRW Physical memory protection address register.
`define CSR_PMPADDR6_ADDR   12'h3B6 //MRW Physical memory protection address register.
`define CSR_PMPADDR7_ADDR   12'h3B7 //MRW Physical memory protection address register.
`define CSR_PMPADDR8_ADDR   12'h3B8 //MRW Physical memory protection address register.
`define CSR_PMPADDR9_ADDR   12'h3B9 //MRW Physical memory protection address register.
`define CSR_PMPADDR10_ADDR  12'h3BA //MRW Physical memory protection address register.
`define CSR_PMPADDR11_ADDR  12'h3BB //MRW Physical memory protection address register.
`define CSR_PMPADDR12_ADDR  12'h3BC //MRW Physical memory protection address register.
`define CSR_PMPADDR13_ADDR  12'h3BD //MRW Physical memory protection address register.
`define CSR_PMPADDR14_ADDR  12'h3BE //MRW Physical memory protection address register.
`define CSR_PMPADDR15_ADDR  12'h3BF //MRW Physical memory protection address register.
`define CSR_PMPADDR16_ADDR  12'h3C0 //MRW Physical memory protection address register.
`define CSR_PMPADDR17_ADDR  12'h3C1 //MRW Physical memory protection address register.
`define CSR_PMPADDR18_ADDR  12'h3C2 //MRW Physical memory protection address register.
`define CSR_PMPADDR19_ADDR  12'h3C3 //MRW Physical memory protection address register.
`define CSR_PMPADDR20_ADDR  12'h3C4 //MRW Physical memory protection address register.
`define CSR_PMPADDR21_ADDR  12'h3C5 //MRW Physical memory protection address register.
`define CSR_PMPADDR22_ADDR  12'h3C6 //MRW Physical memory protection address register.
`define CSR_PMPADDR23_ADDR  12'h3C7 //MRW Physical memory protection address register.
`define CSR_PMPADDR24_ADDR  12'h3C8 //MRW Physical memory protection address register.
`define CSR_PMPADDR25_ADDR  12'h3C9 //MRW Physical memory protection address register.
`define CSR_PMPADDR26_ADDR  12'h3CA //MRW Physical memory protection address register.
`define CSR_PMPADDR27_ADDR  12'h3CB //MRW Physical memory protection address register.
`define CSR_PMPADDR28_ADDR  12'h3CC //MRW Physical memory protection address register.
`define CSR_PMPADDR29_ADDR  12'h3CD //MRW Physical memory protection address register.
`define CSR_PMPADDR30_ADDR  12'h3CE //MRW Physical memory protection address register.
`define CSR_PMPADDR31_ADDR  12'h3CF //MRW Physical memory protection address register.
`define CSR_PMPADDR32_ADDR  12'h3D0 //MRW Physical memory protection address register.
`define CSR_PMPADDR33_ADDR  12'h3D1 //MRW Physical memory protection address register.
`define CSR_PMPADDR34_ADDR  12'h3D2 //MRW Physical memory protection address register.
`define CSR_PMPADDR35_ADDR  12'h3D3 //MRW Physical memory protection address register.
`define CSR_PMPADDR36_ADDR  12'h3D4 //MRW Physical memory protection address register.
`define CSR_PMPADDR37_ADDR  12'h3D5 //MRW Physical memory protection address register.
`define CSR_PMPADDR38_ADDR  12'h3D6 //MRW Physical memory protection address register.
`define CSR_PMPADDR39_ADDR  12'h3D7 //MRW Physical memory protection address register.
`define CSR_PMPADDR40_ADDR  12'h3D8 //MRW Physical memory protection address register.
`define CSR_PMPADDR41_ADDR  12'h3D9 //MRW Physical memory protection address register.
`define CSR_PMPADDR42_ADDR  12'h3DA //MRW Physical memory protection address register.
`define CSR_PMPADDR43_ADDR  12'h3DB //MRW Physical memory protection address register.
`define CSR_PMPADDR44_ADDR  12'h3DC //MRW Physical memory protection address register.
`define CSR_PMPADDR45_ADDR  12'h3DD //MRW Physical memory protection address register.
`define CSR_PMPADDR46_ADDR  12'h3DE //MRW Physical memory protection address register.
`define CSR_PMPADDR47_ADDR  12'h3DF //MRW Physical memory protection address register.
`define CSR_PMPADDR48_ADDR  12'h3E0 //MRW Physical memory protection address register.
`define CSR_PMPADDR49_ADDR  12'h3E1 //MRW Physical memory protection address register.
`define CSR_PMPADDR50_ADDR  12'h3E2 //MRW Physical memory protection address register.
`define CSR_PMPADDR51_ADDR  12'h3E3 //MRW Physical memory protection address register.
`define CSR_PMPADDR52_ADDR  12'h3E4 //MRW Physical memory protection address register.
`define CSR_PMPADDR53_ADDR  12'h3E5 //MRW Physical memory protection address register.
`define CSR_PMPADDR54_ADDR  12'h3E6 //MRW Physical memory protection address register.
`define CSR_PMPADDR55_ADDR  12'h3E7 //MRW Physical memory protection address register.
`define CSR_PMPADDR56_ADDR  12'h3E8 //MRW Physical memory protection address register.
`define CSR_PMPADDR57_ADDR  12'h3E9 //MRW Physical memory protection address register.
`define CSR_PMPADDR58_ADDR  12'h3EA //MRW Physical memory protection address register.
`define CSR_PMPADDR59_ADDR  12'h3EB //MRW Physical memory protection address register.
`define CSR_PMPADDR60_ADDR  12'h3EC //MRW Physical memory protection address register.
`define CSR_PMPADDR61_ADDR  12'h3ED //MRW Physical memory protection address register.
`define CSR_PMPADDR62_ADDR  12'h3EE //MRW Physical memory protection address register.
`define CSR_PMPADDR63_ADDR  12'h3EF //MRW Physical memory protection address register.
// Machine Counter/Timers
`define CSR_MCYCLE_ADDR         12'hB00 //MRW Machine cycle counter.
`define CSR_MINSTRET_ADDR       12'hB02 //MRW Machine instructions-retired counter.
`define CSR_MHPMCOUNTER3_ADDR   12'hB03 //MRW Machine performance-monitoring counter.
`define CSR_MHPMCOUNTER4_ADDR   12'hB04 //MRW Machine performance-monitoring counter.
`define CSR_MHPMCOUNTER5_ADDR   12'hB05 //MRW Machine performance-monitoring counter.
`define CSR_MHPMCOUNTER6_ADDR   12'hB06 //MRW Machine performance-monitoring counter.
`define CSR_MHPMCOUNTER7_ADDR   12'hB07 //MRW Machine performance-monitoring counter.
`define CSR_MHPMCOUNTER8_ADDR   12'hB08 //MRW Machine performance-monitoring counter.
`define CSR_MHPMCOUNTER9_ADDR   12'hB09 //MRW Machine performance-monitoring counter.
`define CSR_MHPMCOUNTER10_ADDR  12'hB0A //MRW Machine performance-monitoring counter.
`define CSR_MHPMCOUNTER11_ADDR  12'hB0B //MRW Machine performance-monitoring counter.
`define CSR_MHPMCOUNTER12_ADDR  12'hB0C //MRW Machine performance-monitoring counter.
`define CSR_MHPMCOUNTER13_ADDR  12'hB0D //MRW Machine performance-monitoring counter.
`define CSR_MHPMCOUNTER14_ADDR  12'hB0E //MRW Machine performance-monitoring counter.
`define CSR_MHPMCOUNTER15_ADDR  12'hB0F //MRW Machine performance-monitoring counter.
`define CSR_MHPMCOUNTER16_ADDR  12'hB10 //MRW Machine performance-monitoring counter.
`define CSR_MHPMCOUNTER17_ADDR  12'hB11 //MRW Machine performance-monitoring counter.
`define CSR_MHPMCOUNTER18_ADDR  12'hB12 //MRW Machine performance-monitoring counter.
`define CSR_MHPMCOUNTER19_ADDR  12'hB13 //MRW Machine performance-monitoring counter.
`define CSR_MHPMCOUNTER20_ADDR  12'hB14 //MRW Machine performance-monitoring counter.
`define CSR_MHPMCOUNTER21_ADDR  12'hB15 //MRW Machine performance-monitoring counter.
`define CSR_MHPMCOUNTER22_ADDR  12'hB16 //MRW Machine performance-monitoring counter.
`define CSR_MHPMCOUNTER23_ADDR  12'hB17 //MRW Machine performance-monitoring counter.
`define CSR_MHPMCOUNTER24_ADDR  12'hB18 //MRW Machine performance-monitoring counter.
`define CSR_MHPMCOUNTER25_ADDR  12'hB19 //MRW Machine performance-monitoring counter.
`define CSR_MHPMCOUNTER26_ADDR  12'hB1A //MRW Machine performance-monitoring counter.
`define CSR_MHPMCOUNTER27_ADDR  12'hB1B //MRW Machine performance-monitoring counter.
`define CSR_MHPMCOUNTER28_ADDR  12'hB1C //MRW Machine performance-monitoring counter.
`define CSR_MHPMCOUNTER29_ADDR  12'hB1D //MRW Machine performance-monitoring counter.
`define CSR_MHPMCOUNTER30_ADDR  12'hB1E //MRW Machine performance-monitoring counter.
`define CSR_MHPMCOUNTER31_ADDR  12'hB1F //MRW Machine performance-monitoring counter.
`ifdef RV32
    `define CSR_MCYCLEH_ADDR        12'hB80 //MRW Upper 32 bits of mcycle, RV32 only.
    `define CSR_MINSTRETH_ADDR      12'hB82 //MRW Upper 32 bits of minstret, RV32 only.
    `define CSR_MHPMCOUNTER3H_ADDR  12'hB83 //MRW Upper 32 bits of mhpmcounter3, RV32 only.
    `define CSR_MHPMCOUNTER4H_ADDR  12'hB84 //MRW Upper 32 bits of mhpmcounter4, RV32 only.
    `define CSR_MHPMCOUNTER5H_ADDR  12'hB85 //MRW Upper 32 bits of mhpmcounter5, RV32 only.
    `define CSR_MHPMCOUNTER6H_ADDR  12'hB86 //MRW Upper 32 bits of mhpmcounter6, RV32 only.
    `define CSR_MHPMCOUNTER7H_ADDR  12'hB87 //MRW Upper 32 bits of mhpmcounter7, RV32 only.
    `define CSR_MHPMCOUNTER8H_ADDR  12'hB88 //MRW Upper 32 bits of mhpmcounter8, RV32 only.
    `define CSR_MHPMCOUNTER9H_ADDR  12'hB89 //MRW Upper 32 bits of mhpmcounter9, RV32 only.
    `define CSR_MHPMCOUNTER10H_ADDR 12'hB8A //MRW Upper 32 bits of mhpmcounter10, RV32 only.
    `define CSR_MHPMCOUNTER11H_ADDR 12'hB8B //MRW Upper 32 bits of mhpmcounter11, RV32 only.
    `define CSR_MHPMCOUNTER12H_ADDR 12'hB8C //MRW Upper 32 bits of mhpmcounter12, RV32 only.
    `define CSR_MHPMCOUNTER13H_ADDR 12'hB8D //MRW Upper 32 bits of mhpmcounter13, RV32 only.
    `define CSR_MHPMCOUNTER14H_ADDR 12'hB8E //MRW Upper 32 bits of mhpmcounter14, RV32 only.
    `define CSR_MHPMCOUNTER15H_ADDR 12'hB8F //MRW Upper 32 bits of mhpmcounter15, RV32 only.
    `define CSR_MHPMCOUNTER16H_ADDR 12'hB90 //MRW Upper 32 bits of mhpmcounter16, RV32 only.
    `define CSR_MHPMCOUNTER17H_ADDR 12'hB91 //MRW Upper 32 bits of mhpmcounter17, RV32 only.
    `define CSR_MHPMCOUNTER18H_ADDR 12'hB92 //MRW Upper 32 bits of mhpmcounter18, RV32 only.
    `define CSR_MHPMCOUNTER19H_ADDR 12'hB93 //MRW Upper 32 bits of mhpmcounter19, RV32 only.
    `define CSR_MHPMCOUNTER20H_ADDR 12'hB94 //MRW Upper 32 bits of mhpmcounter20, RV32 only.
    `define CSR_MHPMCOUNTER21H_ADDR 12'hB95 //MRW Upper 32 bits of mhpmcounter21, RV32 only.
    `define CSR_MHPMCOUNTER22H_ADDR 12'hB96 //MRW Upper 32 bits of mhpmcounter22, RV32 only.
    `define CSR_MHPMCOUNTER23H_ADDR 12'hB97 //MRW Upper 32 bits of mhpmcounter23, RV32 only.
    `define CSR_MHPMCOUNTER24H_ADDR 12'hB98 //MRW Upper 32 bits of mhpmcounter24, RV32 only.
    `define CSR_MHPMCOUNTER25H_ADDR 12'hB99 //MRW Upper 32 bits of mhpmcounter25, RV32 only.
    `define CSR_MHPMCOUNTER26H_ADDR 12'hB9A //MRW Upper 32 bits of mhpmcounter26, RV32 only.
    `define CSR_MHPMCOUNTER27H_ADDR 12'hB9B //MRW Upper 32 bits of mhpmcounter27, RV32 only.
    `define CSR_MHPMCOUNTER28H_ADDR 12'hB9C //MRW Upper 32 bits of mhpmcounter28, RV32 only.
    `define CSR_MHPMCOUNTER29H_ADDR 12'hB9D //MRW Upper 32 bits of mhpmcounter29, RV32 only.
    `define CSR_MHPMCOUNTER30H_ADDR 12'hB9E //MRW Upper 32 bits of mhpmcounter30, RV32 only.
    `define CSR_MHPMCOUNTER31H_ADDR 12'hB9F //MRW Upper 32 bits of mhpmcounter31, RV32 only.
`endif
// Machine Counter Setup
`define CSR_MCOUNTINHIBIT_ADDR  12'h320 //MRW Machine counter-inhibit register.
`define CSR_MHPMEVENT3_ADDR     12'h323 //MRW Machine performance-monitoring event selector.
`define CSR_MHPMEVENT4_ADDR     12'h324 //MRW Machine performance-monitoring event selector.
`define CSR_MHPMEVENT5_ADDR     12'h325 //MRW Machine performance-monitoring event selector.
`define CSR_MHPMEVENT6_ADDR     12'h326 //MRW Machine performance-monitoring event selector.
`define CSR_MHPMEVENT7_ADDR     12'h327 //MRW Machine performance-monitoring event selector.
`define CSR_MHPMEVENT8_ADDR     12'h328 //MRW Machine performance-monitoring event selector.
`define CSR_MHPMEVENT9_ADDR     12'h329 //MRW Machine performance-monitoring event selector.
`define CSR_MHPMEVENT10_ADDR    12'h32A //MRW Machine performance-monitoring event selector.
`define CSR_MHPMEVENT11_ADDR    12'h32B //MRW Machine performance-monitoring event selector.
`define CSR_MHPMEVENT12_ADDR    12'h32C //MRW Machine performance-monitoring event selector.
`define CSR_MHPMEVENT13_ADDR    12'h32D //MRW Machine performance-monitoring event selector.
`define CSR_MHPMEVENT14_ADDR    12'h32E //MRW Machine performance-monitoring event selector.
`define CSR_MHPMEVENT15_ADDR    12'h32F //MRW Machine performance-monitoring event selector.
`define CSR_MHPMEVENT16_ADDR    12'h330 //MRW Machine performance-monitoring event selector.
`define CSR_MHPMEVENT17_ADDR    12'h331 //MRW Machine performance-monitoring event selector.
`define CSR_MHPMEVENT18_ADDR    12'h332 //MRW Machine performance-monitoring event selector.
`define CSR_MHPMEVENT19_ADDR    12'h333 //MRW Machine performance-monitoring event selector.
`define CSR_MHPMEVENT20_ADDR    12'h334 //MRW Machine performance-monitoring event selector.
`define CSR_MHPMEVENT21_ADDR    12'h335 //MRW Machine performance-monitoring event selector.
`define CSR_MHPMEVENT22_ADDR    12'h336 //MRW Machine performance-monitoring event selector.
`define CSR_MHPMEVENT23_ADDR    12'h337 //MRW Machine performance-monitoring event selector.
`define CSR_MHPMEVENT24_ADDR    12'h338 //MRW Machine performance-monitoring event selector.
`define CSR_MHPMEVENT25_ADDR    12'h339 //MRW Machine performance-monitoring event selector.
`define CSR_MHPMEVENT26_ADDR    12'h33A //MRW Machine performance-monitoring event selector.
`define CSR_MHPMEVENT27_ADDR    12'h33B //MRW Machine performance-monitoring event selector.
`define CSR_MHPMEVENT28_ADDR    12'h33C //MRW Machine performance-monitoring event selector.
`define CSR_MHPMEVENT29_ADDR    12'h33D //MRW Machine performance-monitoring event selector.
`define CSR_MHPMEVENT30_ADDR    12'h33E //MRW Machine performance-monitoring event selector.
`define CSR_MHPMEVENT31_ADDR    12'h33F //MRW Machine performance-monitoring event selector.
// Debug/Trace Registers (shared with Debug Mode)
`define CSR_TSELECT_ADDR        12'h7A0 //MRW Debug/Trace trigger register select.
`define CSR_TDATA1_ADDR         12'h7A1 //MRW First Debug/Trace trigger data register.
`define CSR_TDATA2_ADDR         12'h7A2 //MRW Second Debug/Trace trigger data register.
`define CSR_TDATA3_ADDR         12'h7A3 //MRW Third Debug/Trace trigger data register.
`define CSR_MCONTEXT_ADDR       12'h7A8 //MRW Machine-mode context register.
// Debug Mode Registers
`define CSR_DCSR_ADDR           12'h7B0 //DRW Debug control and status register.
`define CSR_DPC_ADDR            12'h7B1 //DRW Debug PC.
`define CSR_DSCRATCH0_ADDR      12'h7B2 //DRW Debug scratch register 0.
`define CSR_DSCRATCH1_ADDR      12'h7B3 //DRW Debug scratch register 1.