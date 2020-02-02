; Ingrese un valor numérico, si el valor es par vuelva a pedir que se ingrese otro valor, 
; cuando este valor sea impar, finalice la aplicación.

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

    mov al, [numero]
    sub al, '0'
    mov bl, 2
    div bl
    cmp ah, 2
    jp salir
    jnp insertar

salir:
    mov eax, 1
    int 80h;