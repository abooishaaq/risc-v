package main

import "core:mem"

// 128 MiB
RAM_SIZE :: 1024 * 1024 * 1024
// same a qemu's
RAM_BASE :: 0x80000000

PAGE_SIZE :: 4096

RAM :: struct {
    data : ^[RAM_SIZE]u8
}

ram_new :: proc(code: rawptr, code_size: int) -> RAM {
    ram_data := mem.alloc(RAM_SIZE)
    if ram_data == nil {
        panic("failed to allocate RAM")
    }
    mem.copy(ram_data, code, code_size)
    return RAM{data = cast(^[RAM_SIZE]u8) ram_data}
}

ram_load :: proc(ram: ^RAM, addr: u64, size: u64, res: ^u64) -> Exception {
    index := addr - RAM_BASE
    tmp: u64 = 0
    switch (size) {
        case 64: 
            tmp |= cast(u64) ram.data[index + 7] << 56
            tmp |= cast(u64) ram.data[index + 6] << 48
            tmp |= cast(u64) ram.data[index + 5] << 40
            tmp |= cast(u64) ram.data[index + 4] << 32
            fallthrough 
        case 32:
            tmp |= cast(u64) ram.data[index + 3] << 24
            tmp |= cast(u64) ram.data[index + 2] << 16
            fallthrough
        case 16:
            tmp |= cast(u64) ram.data[index + 1] << 8
            fallthrough
        case 8:
            tmp |= cast(u64) ram.data[index]
            res^ = tmp
            return Exception.OK
    }
    return Exception.LOAD_ACCESS_FAULT
}

ram_store :: proc(ram: ^RAM, addr: u64, size: u64, val: u64) -> Exception {
    index := addr - RAM_BASE
    switch (size) {
        case 64:
            ram.data[index + 7] = cast(u8) (val >> 56)
            ram.data[index + 6] = cast(u8) (val >> 48)
            ram.data[index + 5] = cast(u8) (val >> 40)
            ram.data[index + 4] = cast(u8) (val >> 32)
            fallthrough
        case 32:
            ram.data[index + 3] = cast(u8) (val >> 24)
            ram.data[index + 2] = cast(u8) (val >> 16)
            fallthrough
        case 16:
            ram.data[index + 1] = cast(u8) (val >> 8)
            fallthrough
        case 8:
            ram.data[index] = cast(u8) val
            return Exception.OK
    }
    return Exception.STORE_AMO_ACCESS_FAULT
}
