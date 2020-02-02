%macro escribir 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro

%macro leer 2
    mov eax, 3
    mov ebx, 2
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro

section .data
    msj1 db 10, 'Escriba un numero del 1 al 9:', 10
    len1 equ $ - msj1
    msj2 db 10, 'El número no es primo', 10
    len2 equ $ - msj2
    msj3 db 10, 'El número es primo', 10
    len3 equ $ - msj3

section .bss
    numero resb 2
    contador resb 2
    aux resb 2

section .text
    global _start:

_start:

insertar_datos:
    escribir msj1, len1
    leer numero, 2
    mov al, [numero]
    sub al, '0'
    cmp al, 0
    ; Si el numero es menor o igual a 0 vuelve a pedir datos
    jng insertar_datos
    cmp al, 9
    ; Si el numero es mayor a 9 vuelve a pedir datos
    jg insertar_datos
    ; Inicializamos el contador y el auxiliar de la división en 0
    mov bl, 0
    mov [aux], bl
    mov cx, 0
    mov [contador], cx
    jmp es_primo

es_primo:
    mov al, [numero]
    sub al, '0'
    mov bl, [aux]
    ; Si el divisor es mayor al dividendo(Valor ingresado) se salta a verificar
    cmp bl, al
    jg verificar
    inc bl
    mov [aux], bl
    div bl
    ; Si el residuo es igual a 0 incrementa el contador
    cmp ah, 0
    jne es_primo
    mov cx, [contador]
    inc cx
    mov [contador], cx
    jmp es_primo

verificar:
    ; Se verifica si el contador es igual a 2, si lo es el valor es primo
    mov cx, [contador]
    cmp cx, 2
    je primo
    jne no_primo

primo:
    escribir msj3, len3

    ; Imprimiendo contador y divisor
    ; mov cx, [contador]
    ; add cx, '0'
    ; mov [contador], cx
    ; escribir contador, 2
    ; mov cx, [aux]
    ; add cx, '0'
    ; mov [aux], cx
    ; escribir aux, 2

    jmp salir

no_primo:
    escribir msj2, len2

    ; Imprimiendo contador y divisor
    ; mov cx, [contador]
    ; add cx, '0'
    ; mov [contador], cx
    ; escribir contador, 2
    ; mov cx, [aux]
    ; add cx, '0'
    ; mov [aux], cx
    ; escribir aux, 2

    jmp salir

salir:
    mov eax, 1
    int 80h