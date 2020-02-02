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
    msj1 db 'Ingrese un valor para la fila:'
    len1 equ $ - msj1
    msj2 db 'Ingrese un valor para la columna:'
    len2 equ $ - msj2
    msj3 db 'X'
    len3 equ $ - msj3
    
section .bss
    i resb 1
    j resb 1

section .text
    global _start

_start:
    print msj1, len1
    read i, 2
    print msj2, len2
    read j, 2

    mov ecx, [i]
    sub ecx, '0'
    jmp principal

principal:
    mov eax, [j]
    sub eax, '0'
    dec ecx
    push ecx
    push eax
    print msj, len
    pop eax
    pop ecx
    cmp ecx, 0
    jl salir
    jmp imprimir

imprimir:
    cmp eax, 0
    je principal
    push eax
    push ecx
    print msj3, len3
    pop ecx    
    pop eax
    dec eax
    jmp imprimir

salir:
    mov eax, 1
    int 80h