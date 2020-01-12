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
    msj_1 db 10, 'Carpeta o directorio creado.', 10
    len_msj_1 equ $ - msj_1
    msj_2 db 'Ingrese una direccion para crear:'
    len_msj_2 equ $ - msj_2

section .bss
    path resb 100

section .text
    global _start:

_start:

    print msj_2, len_msj_2
    read path, 100

    mov eax, 39 ;39 => Servicio para crear un directorio
    mov ebx, path
    mov ecx, 0x1FF ; Definir el permiso 777 (Todos los accesos)
    int 80h

    print msj_1, len_msj_1

    mov eax, 1
    int 80h