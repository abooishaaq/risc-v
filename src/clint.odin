package main

CLINT_BASE :: 0x2000000
CLINT_SIZE :: 0x10000
CLINT_MTIMECMP :: (CLINT_BASE + 0x4000)
CLINT_MTIME :: (CLINT_BASE + 0xbff8)

Clint :: struct {
    mtimecmp : u64,
    mtime : u64,
}

clint_new :: proc() -> Clint {
    return Clint{mtimecmp = 0, mtime = 0}
}

clint_load :: proc(clint: ^Clint, addr: u64, size: u64, res: ^u64) -> (Exception, u64) {
    switch (addr) {
        case CLINT_MTIMECMP:
            return Exception.OK, clint.mtimecmp
        case CLINT_MTIME:
            return Exception.OK, clint.mtime
    }
    return Exception.LOAD_ACCESS_FAULT, 0
}

clint_store :: proc(clint: ^Clint, addr: u64, val: u64) -> Exception {
    switch (addr) {
        case CLINT_MTIMECMP:
            clint.mtimecmp = val
            return Exception.OK
        case CLINT_MTIME:
            clint.mtime = val
            return Exception.OK
    }
    return Exception.STORE_AMO_ACCESS_FAULT
}
