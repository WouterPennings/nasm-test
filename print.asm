global _start

section .bss
  print_value: resb 4
  x: resb 4

section .text
            
_start: 
    mov eax, 0X31 
    mov [print_value], eax
    call print

    mov rax, 60       
    mov rdi, 0       
    syscall   

print:
    mov rax, 1   
    mov rdi, 1
    mov rsi, print_value
    mov rdx, 10
    syscall

    ret   