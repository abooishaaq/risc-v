package main

is_fatal :: proc(e : Exception) -> bool {
    return e == Exception.INSTRUCTION_ADDRESS_MISALIGNED ||
           e == Exception.INSTRUCTION_ACCESS_FAULT ||
           e == Exception.LOAD_ACCESS_FAULT ||
           e == Exception.STORE_AMO_ADDRESS_MISALIGNED ||
           e == Exception.STORE_AMO_ACCESS_FAULT
}

main :: proc() {
    
}
