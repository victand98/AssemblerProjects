%macro print 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro

section .data
    msj db 10,'Hola '
    len equ $ - msj

section .bss
    n resb 2

section .text
    global _start

_start:
    mov ecx, 20

imprimir:
    push ecx
    add ecx, '00'
    mov [n], ecx
    print msj, len
    print n, 3
    pop ecx
    loop imprimir

salir:
    mov eax, 1
    int 80h