%macro print 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro

%macro read 2
    mov eax, 3
    mov ebx, 2
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro

section .data
    msj db 10
    len equ $ - msj
    mjs1 db 'Ingrese un valor:'
    len1 equ $ - msj

section .bss
    numero resb 1

section .text
    global _start

_start:
    print mjs1, len1
    read numero, 1

    mov ecx, [numero]
    jmp principal

principal:
    sub ecx, '0'
    cmp ecx, 0
    jl salir
    jmp imprimir

imprimir:
    push ecx
    print numero, 2
    print msj, len
    pop ecx
    dec ecx
    add ecx, '0'
    mov [numero], ecx
    jmp principal

salir:
    mov eax, 1
    int 80h