; Ingrese un valor, al cual se lo validara para que sea mayor a 5, 
; si cumple la condición entonces se decrementara el valor de 1 en 1, 
; hasta que llegue a cero donde la aplicación llegará a su fin.

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
    msj_1 db 'Ingrese un valor:'
    len_msj_1 equ $ - msj_1

section .bss
    numero resb 1

section .text
    global _start:
_start:
insertar:
    print msj_1, len_msj_1
    read numero, 2
    mov ah, [numero]
    sub ah, '0'
    jmp comparar
comparar:
    cmp ah, 5
    jbe insertar ;Menor o Igual
    jmp salir
salir:
    mov eax, 1
    int 80h;