; Ingresar 3 valores, los cuales, con la ayuda de un menú, 
; podremos mostrar de forma ascendente y descendente, 
; para ello los tres valores deberán ser diferentes.

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
    msj_1 db 10, 'Ingrese 3 valores distintos', 10
    len_msj_1 equ $ - msj_1
    msj_2 db 'Ingrese un valor:'
    len_msj_2 equ $ - msj_2
    msj_menu db 10, '1. Mostrar', 10, '2. Salir', 10
    len_msj_menu equ $ - msj_menu
section .bss
    n1 resb 1
    n2 resb 1
    n3 resb 1
    opcion resb 1

section .text
    global _start:
_start:
insertar:
    print msj_1, len_msj_1

    print msj_2, len_msj_2
    read n1, 2
    print msj_2, len_msj_2
    read n2, 2
    print msj_2, len_msj_2
    read n3, 2
    mov ah, [n1]
    sub ah, '0'
    mov al, [n2]
    sub al, '0'
    mov bl, [n3]
    sub bl, '0'
    jmp verificar
verificar:
    cmp ah, al
    je insertar
    cmp ah, bl
    je insertar
    cmp al, bl
    je insertar
    jne menu
menu:
    print msj_menu, len_msj_menu
    read opcion, 2
    mov al, [opcion]
    sub al, '0'
    cmp al, 1
    je mostrar
    cmp al, 2
    je salir
    jmp salir ; Si la opcion no es 1 ni 2
mostrar:
    print n1, 1
    print n2, 1
    print n3, 1
salir:
    mov eax, 1
    int 80h;