; Ingresando dos valores numéricos, indique cuál de los dos es mayor, 
; y cual de ellos es menor, de igual forma mencione si son valores iguales.

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
    mess db 'Ingrese un número entero: '
    len equ $ - mess
    mess1 db 'Mayor: '
    len1 equ $ - mess1
    mess2 db 'Menor: '
    len2 equ $ - mess2
    mess3 db 'Los valores son Iguales.'
    len3 equ $ - mess3

section .bss
    n1 resb 1
    n2 resb 1

section .text
    global _start:
_start:
    print mess, len
    read n1, 2
    print mess, len
    read n2, 2

    mov al, [n1]
    sub al, '0'
    mov bl, [n2]
    sub bl, '0'

    cmp al, bl

    jg mayor ; El primer numero ingresado es mayor
    jl menor ; El primer numero ingresado es menor
    jmp igual ; Ambos números son iguales

mayor:
    print mess1, len1
    print n1, 1
    print mess2, len2
    print n2, 1
    jmp salir
menor:
    print mess1, len1
    print n2, 1
    print mess2, len2
    print n1, 1
    jmp salir
igual:
    print mess3, len3
    jmp salir
salir:
    mov eax, 1
    int 80h