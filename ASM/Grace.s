    global _main
    extern _dprintf
    section .text
_main:
    ; This program will print its own source when run.
    mov     rax, 0x02000005
    lea     rdi, [rel f]
    mov     rsi, 0x601
    mov     rdx, 644o
    syscall
    jc      _err
    mov     rdi, rax
    push    rax
    lea     rsi, [rel s]
    lea     rdx, [rel s]
    mov     rcx, 10
    mov     r8, 34
    call    _dprintf
    pop     rdi
    push    rax
    mov     rax, 0x02000006
    syscall
    jc      _err_pop
    pop     rax
    cmp     rax, 0
    jl      _err
    mov     rax, 0
    ret
_err_pop:
    pop     rax
    jmp     _err
_err:
    mov     rax, 1
    ret

    section .data
f: db "Grace_kid.s", 0
s: db "    global _main%2$c    extern _dprintf%2$c    section .text%2$c_main:%2$c    ; This program will print its own source when run.%2$c    mov     rax, 0x02000005%2$c    lea     rdi, [rel f]%2$c    mov     rsi, 0x601%2$c    mov     rdx, 644o%2$c    syscall%2$c    jc      _err%2$c    mov     rdi, rax%2$c    push    rax%2$c    lea     rsi, [rel s]%2$c    lea     rdx, [rel s]%2$c    mov     rcx, 10%2$c    mov     r8, 34%2$c    call    _dprintf%2$c    pop     rdi%2$c    push    rax%2$c    mov     rax, 0x02000006%2$c    syscall%2$c    jc      _err_pop%2$c    pop     rax%2$c    cmp     rax, 0%2$c    jl      _err%2$c    mov     rax, 0%2$c    ret%2$c_err_pop:%2$c    pop     rax%2$c    jmp     _err%2$c_err:%2$c    mov     rax, 1%2$c    ret%2$c%2$c    section .data%2$cf: db %3$cGrace_kid.s%3$c, 0%2$cs: db %3$c%1$s%3$c%2$c"
