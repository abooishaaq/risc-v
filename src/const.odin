package main

// machine level CSRs
MCSR :: enum {
    MSTATUS = 0x300, MEDELEG = 0x302, MIDELEG, MIE, MTVEC,
    MEPC = 0x341, MCAUSE, MTVAL, MIP
}

// supervisor level CSRs
SCSR :: enum {
    SSTATUS = 0x100, SIE = 0x104, STVEC,
    SEPC = 0x141, SCAUSE, STVAL, SIP, SATP = 0x180
}

MIP :: enum {
    SSIP = 1 << 1, MSIP = 1 << 3, STIP = 1 << 5,
    MTIP = 1 << 7, SEIP = 1 << 9, MEIP = 1 << 11
}
