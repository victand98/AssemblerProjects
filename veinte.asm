%macro print 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro

section .data

section .bss
    n resb 2

section .text
    global _start

_start:
    mov ecx, 20
    add ecx, '00'
    mov [n], ecx
    print n,2

salir:
    mov eax, 1
    int 80h