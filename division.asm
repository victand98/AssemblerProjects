%macro show_message 2 
      mov   eax, 4
      mov   ebx, 1
      mov   ecx, %1
      mov   edx, %2
      int   80h
%endmacro

%macro reading 2 
      mov   eax, 3
      mov   ebx, 2
      mov   ecx, %1
      mov   edx, %2
      int   80h
%endmacro

section .data
    msj1 db 'Ingrese el primer número: '
    len1 equ $ - msj1
    msj2 db 'Ingrese el segundo número: '
    len2 equ $ - msj2
    msj3 db 'El resultado de la división es: ', 10
    len3 equ $ - msj3

section .bss
    n1 resb 1
    n2 resb 1
    result resb 1

section .text
    global _start
    _start:

        show_message msj1, len1
        reading n1, 2

        show_message msj2, len2
        reading n2, 2

        ; Division
        mov edx, 0 
        mov eax, [n1]
        mov ecx, [n2]
        sub eax, '0'
        sub ecx, '0'
        div ecx
        add eax, '0'
        mov [result], eax

        show_message msj3, len3
        show_message result, 3

        mov eax, 1
        mov ebx, 0
        int 80h 