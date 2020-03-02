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

section .data
    msj1 db 10, 'Ingrese un caracter: '
    len1 equ $ - msj1
    
section .bss
    caracter resb 1
    contador resb 1

section .text
    global _start

_start:

ingreso:
    print msj1, len1
    read caracter, 2
    mov al, [caracter]
    sub al, '0'
    mov bl, 2
    div bl
    inc bl
    mov [contador], bl

comprobar:
    cmp al, 2
    jl presentar
    jge verificar

verificar:
    mov bl, 2
    div bl
    push ax
    jmp comprobar

presentar:
    mov cx, [contador]
    cmp cx, 0
    je ingreso
    dec cx 
    mov [contador], cx
    pop ax
    add ax, '0'
    mov [caracter], ax
    print caracter, 1
    jmp presentar

salir:
    mov eax, 1
    int 80h