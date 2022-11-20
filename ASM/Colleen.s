    global _main
    extern _printf
    section .text
; This program will print its own source when run.
_func:
    ret
_main:
    ; This program will print its own source when run.
    call    _func
    sub     rsp, 8
    lea     rdi, [rel s]
    lea     rsi, [rel s]
    mov     rdx, 10
    mov     rcx, 34
    call    _printf
    add     rsp, 8
    mov     rax, 0
    ret

    section .data
s: db "    global _main%2$c    extern _printf%2$c    section .text%2$c; This program will print its own source when run.%2$c_func:%2$c    ret%2$c_main:%2$c    ; This program will print its own source when run.%2$c    call    _func%2$c    sub     rsp, 8%2$c    lea     rdi, [rel s]%2$c    lea     rsi, [rel s]%2$c    mov     rdx, 10%2$c    mov     rcx, 34%2$c    call    _printf%2$c    add     rsp, 8%2$c    mov     rax, 0%2$c    ret%2$c%2$c    section .data%2$cs: db %3$c%1$s%3$c, 0%2$c", 0
