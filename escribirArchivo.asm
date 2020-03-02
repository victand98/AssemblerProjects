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
    file db '/home/victor/Documentos/Ensamblador/escritura.txt', 0
    msj1 db 'Ingrese texto para el archivo:', 10
    len1 equ $ - msj1
    msj2 db 'Error en el archivo:', 10
    len2 equ $ - msj2

section .bss
    text resb 1
    id_file resb 1

section .text
    global _start

_start:
    print msj1, len1
    read text, 35

    mov eax, 8 ;Se convoca una subrutina de escritura al SO
    mov ebx, file ;Dirección del archivo
    ;Modos de acceso:
    ; Read Only = 0
    ; Write Only = 1
    ; RDWR = 2
    mov ecx, 2
    mov edx, 0x1FF ;Estableciendo permisos
    int 0x80

    ;Verifica si existe o no existe la dirección
    ; Si ZF = 0 existe un error
    test eax, eax 
    jz error

    mov dword [id_file], eax
    mov eax, 4
    mov ebx, [id_file] ;Standar de escritura
    mov ecx, text
    mov edx, 35
    int 0x80

    print text, 50

    ;Cerrar Archivo
    mov eax, 6
    mov ebx, [id_file]
    mov ecx, 0
    mov edx, 0
    jmp exit

error:
    print msj2, len2
    jmp exit

exit:
    mov eax, 1
    int 0x80