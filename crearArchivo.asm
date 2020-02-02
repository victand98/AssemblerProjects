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

section .base
    msj_1 db 10, 'Archivo creado.', 10
    len_msj_1 equ $ - msj_1
    msj_2 db 'Ingrese una direccion para crear:'
    len_msj_2 equ $ - msj_2
    msj_3 db 'Error al crear el Archivo.'
    len_msj_3 equ $ - msj_3

section .bss
    path resb 100

section .text
    global _start:

_start:

    print msj_2, len_msj_2
    read path, 100

    mov eax, 8		;sys_creat
    mov ebx, path
	mov ecx, 511		;access rights
	int 80h

	cmp eax, 0		;check if file was created
	jbe error		;error creating file

    print msj_1, len_msj_1
    jmp salir

error: 
    print msj_3, len_msj_3

salir:
    mov eax, 1
    int 80h