nasm -f elf64 -o $1.o $1.asm
ld -o $2 $1.o
./$2