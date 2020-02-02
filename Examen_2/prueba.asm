%macro escribir 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro

%macro leer 2
    mov eax, 3
    mov ebx, 2
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro

section .data

section .bss
    residuo resb 1
    cociente resb 1

section .text
    global _start:

_start:
    mov al, 3
    mov bl, 3
    div bl
    add al, '0'
    mov [cociente], al
    add ah, '0'
    mov [residuo], ah
    escribir cociente, 1
    escribir residuo, 1
salir:
    mov eax, 1
    int 80h