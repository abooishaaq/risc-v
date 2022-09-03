package main

import "core:mem"

PLIC_BASE :: 0xc000000
PLIC_SIZE :: 0x4000000
PLIC_PENDING :: (PLIC_BASE + 0x1000)
PLIC_SENABLE :: (PLIC_BASE + 0x2080)
PLIC_SPRIORITY :: (PLIC_BASE + 0x201000)
PLIC_SCLAIM :: (PLIC_BASE + 0x201004)

PLIC :: struct {
    pending: u64,
    senable: u64,
    spriority: u64,
    sclaim: u64,
}

new_plic :: proc() -> ^PLIC {
    return cast(^PLIC) mem.alloc(size_of(PLIC))
}

plic_load :: proc(p: ^PLIC, addr: u64, size: u64, res: ^u64) -> Exception {
    if (size != 32) {
        return Exception.LOAD_ACCESS_FAULT
    }

    switch addr {
        case PLIC_PENDING:
            res^ = p.pending
        case PLIC_SENABLE:
            res^ = p.senable
        case PLIC_SPRIORITY:
            res^ = p.spriority
        case PLIC_SCLAIM:
            res^ = p.sclaim
    }
    return Exception.OK
}

plic_store :: proc(p: ^PLIC, addr: u64, size: u64, val: u64) -> Exception {
    if (size != 32) {
        return Exception.STORE_AMO_ACCESS_FAULT
    }

    switch addr {
        case PLIC_PENDING:
            p.pending = val
        case PLIC_SENABLE:
            p.senable = val
        case PLIC_SPRIORITY:
            p.spriority = val
        case PLIC_SCLAIM:
            p.sclaim = val
    }
    return Exception.OK
}
