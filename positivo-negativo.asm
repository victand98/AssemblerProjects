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
    msj_numero_1 db 'Ingrese el primer número:'
    len_numero_1 equ $ - msj_numero_1
    msj_numero_2 db 'Ingrese el segundo número (Sustraendo):'
    len_numero_2 equ $ - msj_numero_2
    msj_negativo db 'La diferencia es negativa.', 10
    len_negativo equ $ - msj_negativo
    msj_positivo db 'La diferencia es positiva.', 10
    len_positivo equ $ - msj_positivo

section .bss
    numero_1 resb 1
    numero_2 resb 2

section .text
    global _start:

    _start:
        print msj_numero_1, len_numero_1
        read numero_1, 2
        print msj_numero_2, len_numero_2
        read numero_2, 2
        mov al, [numero_1]
        sub al, '0'
        mov bl, [numero_2]
        sub bl, '0'
        sub al, bl
        js negativo ;Comprueba si la bandera de signo negativo es 1

    positivo:
        print msj_positivo, len_positivo
        jmp salir

    negativo:
        print msj_negativo, len_negativo

    salir:
        mov eax, 1
        int 80h