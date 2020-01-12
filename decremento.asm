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
    msj_limite db 'Ingrese el límite:'
    len_limite equ $ - msj_limite
    msj_resultado db 'Número:'
    len_resultado equ $ - msj_resultado

section .bss
    limite resb 2
    resultado resb 1

section .text
    global _start:

    _start:
        print msj_limite, len_limite
        read limite, 2
        mov cx, [limite]
        sub cx, '0'

    decremento:
        cmp cx, 0
        jz salir
        dec cx
        jnz imprimir

    imprimir:
        push cx
        add cx, '0'
        mov [resultado], cx 
        print msj_resultado, len_resultado
        print resultado, 1
        pop cx
        jmp decremento 

    salir:
        mov eax, 1
        int 80h