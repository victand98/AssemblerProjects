; Con la ayuda de un valor ingresado, muestre su nombre tantas veces 
; indique el valor ingresado.


%macro print 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro

%macro read 2
    mov   eax, 3
    mov   ebx, 2
    mov   ecx, %1
    mov   edx, %2
    int   80h
%endmacro

section .data
    msj_1 times 10 db 'Maria', 10
    len_msj_1 equ $ - msj_1

section .text
    global _start:
_start:
    print msj_1, len_msj_1

    mov eax, 1
    int 80h