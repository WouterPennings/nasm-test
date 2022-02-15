; X86_64 Assembly linux (Ubuntu 20.04)
; NASM version 2.14.02

global _start

section .bss
    ; =====================
    ; Your variables
    ; =====================

section .text

_start:
    ; =====================
    ; Your code
    ; =====================

    ; =====================
    ; Exiting program
    mov rax, 60       
    mov rdi, 0       
    syscall   
