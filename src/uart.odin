package main

import "core:thread"

UART_BASE :: 0x10000000
UART_SIZE :: 0x1000
UART_LCR :: (UART_BASE + 0x3)
UART_LSR :: 0x80
UART_LSR_RX :: 0x1
UART_LSR_TX :: (1 << 5)

UART :: struct {
    data: ^[UART_SIZE]u8,
    interrupting: bool,

    thread: ^thread.Thread,

}

uart_thread_fn :: proc (_: ^thread.Thread) {

}