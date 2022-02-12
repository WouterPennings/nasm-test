; X86 Assembly linux (Ubuntu 20.04)
; NASM version 2.14.02

global _start

section .bss
  x: resb 4
  y: resb 4
  print_value: resb 4

section .text

print:
    mov rax, 1   
    mov rdi, 1
    mov rsi, print_value
    mov rdx, 10
    syscall

    ret  

_start:
    mov ebx, 0X31
    mov [x], ebx

    mov ebx, 0X38
    mov [y], ebx

    L1:
    mov ebx, x          ; EBX is first value 
    cmp ebx, [y]        ; Compare EBX to ECX
    jle L2              ; If equal, jumo to label: True 
    jmp L3              ; If false jumo to L3

    L2:
    mov ecx, x 
    add ecx, 1
    mov [x], ecx
    mov [print_value], ecx
    call print
    jmp L1

    L3:
    mov ecx, 0X64 
    mov [print_value], ecx
    call print

    ; Exiting program
    mov rax, 60       
    mov rdi, 0       
    syscall   