; X86_64 Assembly linux (Ubuntu 20.04)
; NASM version 2.14.02

global _start

section .bss
    print_value: resb 4

section .rodata
  null: db 0x00, 10

section .text

print:
    mov rax, 1   
    mov rdi, 1
    mov rsi, rdx
    mov rdx, 20
    syscall

    ret 

_start:
    ; RAX is OLLEH (Reverse)
    mov rdx, 0x4f4c4c4540
    call print

    ; Print new line: '\n'
    mov rdx, 0x0a
    mov [print_value], rdx
    call print

    ; =====================
    ; Exiting program
    mov rax, 60       
    mov rdi, 0       
    syscall   
