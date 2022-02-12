; X86 Assembly linux (Ubuntu 20.04)
; NASM version 2.14.02

SYS_WRITE  equ 1
STD_OUT    equ 1  

global _start

section .bss
  x: resb 4
  right: resb 4

section .rodata
  null: db 0x00, 10

section .text
                        
print_x:                ; Set size of: x in RDX before calling
  mov rax, SYS_WRITE    ; System call (sys_write)
  mov rdi, STD_OUT      ; file descriptor (stdout)
  mov rsi, x            ; Message
  syscall               ; Call Kernel
                       
  mov rax, SYS_WRITE           
  mov rdi, STD_OUT          
  mov rsi, null          
  mov rdx, 2   
  syscall               ; Prints new line after printing x

  ret

_start:
  mov ebx, 0x31         ; EBX is first value 
  mov ecx, 0x30         ; ECX is second value
  cmp ebx, ecx          ; Compare EBX to ECX
  je True               ; If equal, jumo to label: True 

  False:
    mov ebx, 0x30
    mov [x], ebx
    mov rdx, 1          ; Sets size of bites for syscall
    call print_x        ; Prints '0'
    jmp Continue

  True: 
    mov ebx, 0x31
    mov [x], ebx
    mov rdx, 1          ; Sets size of bites for syscall
    call print_x        ; Prints '1'

  Continue: 
    mov ebx, 0x454E4F44
    mov [x], ebx
    mov rdx, 4          ; Sets size of bites for syscall
    call print_x        ; Prints 'DONE'

  ; Exiting program
  mov rax, 60       
  mov rdi, 0       
  syscall   
