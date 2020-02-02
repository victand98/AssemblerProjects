; Ingrese una palabra, a esa palabra se la mostrará por consola, 
; luego se reemplazará desde el tercer carácter de la palabra con ‘Hola’, 
; y se mostrará el resultado.

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
    msj_1 db 'Ingrese una palabra:'
    len_msj_1 equ $ - msj_1

section .bss
    palabra resb 1

section .text
    global _start:
_start:
    print msj_1, len_msj_1
    read palabra, 10
    print palabra, 10
    mov [palabra + 2], dword 'hola' ;Desde el tercer caracter 
    print palabra, 10

    ; byte (8 bit): byte, DB, RESB
    ; 2 bytes (16 bit): word, DW, RESW
    ; 4 bytes (32 bit): dword, DD, RESD
    ; 8 bytes (64 bit): qword, DQ, RESQ
    ; 10 bytes (80 bit): tword, DT, REST
    ; 16 bytes (128 bit): oword, DO, RESO, DDQ, RESDQ
    ; 32 bytes (256 bit): yword, DY, RESY
    ; 64 bytes (512 bit): zword, DZ, RESZ

    mov eax, 1
    int 80h;