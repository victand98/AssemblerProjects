section .data
    mensaje db 'Asteriscos:', 10
    size_mensaje equ $-mensaje
    asterico times 9 db 10, '*' ;Permite repetir una cadena
    len_asterico equ $-asterico

section .text
	global _start
_start:

    mov eax, 4
    mov ebx, 1
    mov ecx, mensaje
    mov edx, size_mensaje
    int 80h

    mov eax, 4
    mov ebx, 1
    mov ecx, asterico
    mov edx, len_asterico
    int 80h

    mov eax, 1
    int 80h