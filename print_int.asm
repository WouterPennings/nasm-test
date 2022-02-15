; X86_64 Assembly linux (Ubuntu 20.04)
; NASM version 2.14.02

global _start

section .text

; The print functions is written in C and compiled to assembly. (https://godbolt.org, -O3)
; did need some tweaking after. Source: https://github.com/wouterpennings/print_c
; Can print postive and negative integers
print_i32:
        sub     rsp, 40
        xor     r9d, r9d
        test    edi, edi
        jns     .L2
        neg     edi
        mov     r9d, 1
.L2:
        mov     BYTE [rsp+31], 10
        lea     rsi, [rsp+30]
        mov     edx, 1
        mov     r8d, 3435973837
.L3:
        mov     eax, edi
        sub     rsi, 1
        imul    rax, r8
        shr     rax, 35
        lea     ecx, [rax+rax*4]
        add     ecx, ecx
        sub     edi, ecx
        mov     ecx, edx
        add     edx, 1
        add     edi, 48
        mov     BYTE [rsi+1], dil
        mov     edi, eax
        test    eax, eax
        jne     .L3
        test    r9d, r9d
        je      .L4
        movsx   rdx, edx
        not     rdx
        mov     BYTE [rsp+32+rdx], 45
        lea     edx, [rcx+2]
.L4:
        movsx   rdx, edx
        mov     eax, 32
        mov     edi, 1
        sub     rax, rdx
        lea     rsi, [rsp+rax]
        mov     rax, 1
        syscall
        add     rsp, 40
        ret

_start:
    mov rdi, 1234
    call print_i32

    mov rdi, -1234
    call print_i32

    ; =====================
    ; Exiting program
    mov rax, 60       
    mov rdi, 0       
    syscall   
