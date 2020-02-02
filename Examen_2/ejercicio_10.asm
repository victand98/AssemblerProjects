; Ingrese un valor, si el valor es menor a 5, 
; muestre los números desde el valor ingresado al 9, 
; si el valor es igual o mayor a 5 muestre los números 
; desde el valor ingresado hasta el 0.


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
    n resb 2

section .text
    global _start:
_start:
    print msj_1, len_msj_1
    read n, 2

    mov al, [n]
    sub al, '0'
    cmp al, 5
    jge decrement ;Salta si es mayor o igual >= 5
    jl increment ;Salta si es menor < 5

decrement:
    dec al
    add al, '0'
    mov [n], al
    print n, 1
    mov al, [n]
    sub al, '0'
    cmp al, 0
    jne decrement
    jmp salir

increment:
    inc al
    add al, '0'
    mov [n], al
    print n, 1
    mov al, [n]
    sub al, '0'
    cmp al, 9
    jne increment
    jmp salir

salir:
    mov eax, 1
    int 80h