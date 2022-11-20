    global _main
    extern _dprintf
    extern _sprintf
    extern _system
    extern _strcmp
    section .text
_main:
    cmp     [rel i], BYTE 0
    je      _end
    sub     rsp, 8
    lea     r12, [rel filename]
    mov     r13b, BYTE [rel i]
    add     r13b, 48
    mov     BYTE [r12+6], r13b
    mov     rdi, r12
    lea     rsi, [rel prog]
    call    _strcmp
    add     rsp, 8
    cmp     rax, 0
    jne     _create_file
    dec     BYTE [r12+6]
_create_file:
    mov     rax, 0x02000005
    mov     rdi, r12
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
    mov     r9, 0
    mov     r9b, BYTE [r12+6]
    sub     r9b, 48
    call    _dprintf
    pop     rdi
    push    rax
    mov     rax, 0x02000006
    syscall
    jc      _err
    pop     rax
    cmp     rax, 0
    jl      _err
    sub     rsp, 8
    mov     rdi, command
    lea     rsi, [rel run]
    mov     rdx, 0
    mov     dl, BYTE[r12+6]
    sub     dl, 48
    call    _sprintf
    cmp     rax, 0
    jl      _err_align
    mov     rdi, command
    call    _system
    add     rsp, 8
    ret
_err_align:
    add     rsp, 8
    jmp     _err
_err:
    mov     rax, 1
    ret
_end:
    mov     rax, 0
    ret

    section .bss
command: resb 91
    section .data
i: db 5
filename: db "Sully_i.s", 0
prog: db __FILE__, 0
run: db "nasm -f macho64 Sully_%1$d.s && ld -lSystem -o Sully_%1$d Sully_%1$d.o && rm Sully_%1$d.o && ./Sully_%1$d", 0
s: db "    global _main%2$c    extern _dprintf%2$c    extern _sprintf%2$c    extern _system%2$c    extern _strcmp%2$c    section .text%2$c_main:%2$c    cmp     [rel i], BYTE 0%2$c    je      _end%2$c    sub     rsp, 8%2$c    lea     r12, [rel filename]%2$c    mov     r13b, BYTE [rel i]%2$c    add     r13b, 48%2$c    mov     BYTE [r12+6], r13b%2$c    mov     rdi, r12%2$c    lea     rsi, [rel prog]%2$c    call    _strcmp%2$c    add     rsp, 8%2$c    cmp     rax, 0%2$c    jne     _create_file%2$c    dec     BYTE [r12+6]%2$c_create_file:%2$c    mov     rax, 0x02000005%2$c    mov     rdi, r12%2$c    mov     rsi, 0x601%2$c    mov     rdx, 644o%2$c    syscall%2$c    jc      _err%2$c    mov     rdi, rax%2$c    push    rax%2$c    lea     rsi, [rel s]%2$c    lea     rdx, [rel s]%2$c    mov     rcx, 10%2$c    mov     r8, 34%2$c    mov     r9, 0%2$c    mov     r9b, BYTE [r12+6]%2$c    sub     r9b, 48%2$c    call    _dprintf%2$c    pop     rdi%2$c    push    rax%2$c    mov     rax, 0x02000006%2$c    syscall%2$c    jc      _err%2$c    pop     rax%2$c    cmp     rax, 0%2$c    jl      _err%2$c    sub     rsp, 8%2$c    mov     rdi, command%2$c    lea     rsi, [rel run]%2$c    mov     rdx, 0%2$c    mov     dl, BYTE[r12+6]%2$c    sub     dl, 48%2$c    call    _sprintf%2$c    cmp     rax, 0%2$c    jl      _err_align%2$c    mov     rdi, command%2$c    call    _system%2$c    add     rsp, 8%2$c    ret%2$c_err_align:%2$c    add     rsp, 8%2$c    jmp     _err%2$c_err:%2$c    mov     rax, 1%2$c    ret%2$c_end:%2$c    mov     rax, 0%2$c    ret%2$c%2$c    section .bss%2$ccommand: resb 91%2$c    section .data%2$ci: db %4$d%2$cfilename: db %3$cSully_i.s%3$c, 0%2$cprog: db __FILE__, 0%2$crun: db %3$cnasm -f macho64 Sully_%%1$d.s && ld -lSystem -o Sully_%%1$d Sully_%%1$d.o && rm Sully_%%1$d.o && ./Sully_%%1$d%3$c, 0%2$cs: db %3$c%1$s%3$c%2$c"
