%macro print 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro

section .data
    n1 db '3277'
    n2 db '2566'
    result db '    '
    len1 equ $ - result

section .text
    global _start

_start:
    ; longitud del arreglo
    mov esi, 3
    mov ecx, 4
    ; ----------Desactivar el carry----------
    ; Desactivar el bit (estado activo) de la bandera carry
    clc

addProcess:
    ; Accediendo a posicion de la cadena
    mov al, [n1 + esi]
    mov ah, [n2 + esi]
    adc al, ah
    ; Ajustar bcd, trabaja directamente con al
    aaa
    ; Salvando los estados del procesador y mandarlos a pila
    pushf
    ; Trabaja con números binarios, ajusta a decimal
    or al, 30h ; Se convierte en aas
    popf
    ; Moviendo el resultado
    mov [result + esi], al
    ; Decremento la posición
    dec esi
    loop addProcess

    ; Imprimir resultado final
    print result, len1

    mov eax, 1
    int 0x80