; Exámen 3 - Pilas
; Víctor Andrés Rojas
; 3 de febrero de 2020

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

%macro compare_number 1
    mov cx, [%1]
    sub cx, '0'
    mov [number], cx
%endmacro

section .data
    msj_1 db 'Ingrese un número entero: '
    len_1 equ $ - msj_1

section .bss
    n1 resb 1
    n2 resb 1
    n3 resb 1
    n4 resb 1
    n5 resb 1
    number resb 1
    counter resb 1
    pnumber resb 1

section .text
    global _start

_start:
    ; ----- Ingreso de Valores -----
    print msj_1, len_1
    read n1, 2

    print msj_1, len_1
    read n2, 2
    
    print msj_1, len_1
    read n3, 2

    print msj_1, len_1
    read n4, 2

    print msj_1, len_1
    read n5, 2

verify:
    ; ----- Transformando y Asignando ------
    mov ax, [n1]
    sub ax, '0'
    mov [number], ax
    mov cx, 5
    mov [counter], cx

verify_n1:
    compare_number n1
    mov bx, [number]
    sub bx, '0'
    cmp ax, bx
    jg verify_n2
    jmp change

verify_n2:
    compare_number n2
    mov bx, [number]
    sub bx, '0'
    cmp ax, bx
    jg verify_n3
    jmp change

verify_n3:
    compare_number n3
    mov bx, [number]
    sub bx, '0'
    cmp ax, bx
    jg verify_n4
    jmp change

verify_n4:
    compare_number n4
    mov bx, [number]
    sub bx, '0'
    cmp ax, bx
    jg verify_n5
    jmp change

verify_n5:
    compare_number n5
    mov bx, [number]
    sub bx, '0'
    cmp ax, bx
    jg addStack
    jmp change

addStack:
    push ax
    sub ax, '0'
    mov [pnumber], ax
    print pnumber, 1
    pop ax
    mov cx, [counter]
    dec cx
    mov [counter], cx
    cmp cx, 0
    jle salir
    jmp change

change:
    mov ax, [number]
    sub ax, '0'
    jmp verify_n1

salir:
    mov eax, 1
    int 80h