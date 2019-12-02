section .data ;Constantes
    mensaje db 'Ingrese su nombre:', 10
    size_mensaje equ $-mensaje
    mensaje_2 db 'El nombre ingresado es: '
    size_mensaje_2 equ $-mensaje_2

section .bss ;Variables
    nombre resb 5 ;Variable de la capacidad (primeros 5 espacios), res es para variables
    size_nombre equ $-nombre

section .text
	global _start
_start:

    mov eax, 4
    mov ebx, 1
    mov ecx, mensaje
    mov edx, size_mensaje
    int 80h


	mov eax, 3 ;Operación de Lectura
    mov ebx, 2 ;Standar (teclado)
    mov ecx, nombre ;Se almacena lo que digitamos en nombre
    mov edx, 5 ;Número de caracteres que permite almacenar
    int 80h


    mov eax, 4
    mov ebx, 1
    mov ecx, mensaje_2
    mov edx, size_mensaje_2
    int 80h


    mov eax, 4
    mov ebx, 1
    mov ecx, nombre
    mov edx, size_nombre
    int 80h


    mov eax, 1 ;Salir
    int 80h