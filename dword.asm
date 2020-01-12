section .data
    message db 'Asteriscos:', 10
    len_message equ $-message

section .text
	global _start
_start:

    mov eax, 4
    mov ebx, 1
    mov ecx, message
    mov edx, len_message
    int 80h

    mov [message], dword 'Nuev'
    ; Número de palabras que se puede modificar
    ; word => 2
    ; dword => 4
    ; qword => 8

    mov eax, 4
    mov ebx, 1
    mov ecx, message
    mov edx, len_message
    int 80h

    mov [message + 5], dword 'Nuevoooo'
    ; + num => posicion de los caracteres

    mov eax, 4
    mov ebx, 1
    mov ecx, message
    mov edx, len_message
    int 80h
    
    mov eax, 1
    int 80h
