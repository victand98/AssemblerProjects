%macro show_message 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 0x80
%endmacro

section .data
    ; Direccion del archivo
    file db "/home/victor/Documentos/Ensamblador/ExamenFinal/arreglo.txt", 0

    ; Mensajes
    msj1 db "Ha ocurrido un error al leer el archivo", 10
    len1 equ $ - msj1
    msj2 db " se repite "
    len2 equ $ - msj2 
    msj3 db 10, "La suma total es:"
    len3 equ $ - msj3
    new_line db 10
    result db "  "
    len equ $ - result

section .bss
    idFile resb 1
    text resb 20
    replays resb 1
    aux resb 1
    number resb 1

section .text
    global _start

_start:
    ; ########### Leyendo archivo ###########
    mov eax, 5 ;Se convoca una subrutina de lectura al SO
    mov ebx, file ;Dirección del archivo
    ;Modos de acceso:
    ; Read Only = 0
    ; Write Only = 1
    ; RDWR = 2
    mov ecx, 0
    mov edx, 0 ;Estableciendo permisos
    int 0x80

    ;Verifica si existe o no existe la dirección
    ; Si ZF = 0 existe un error
    test eax, eax 
    jz error

    mov dword [idFile], eax
    mov eax, 3
    mov ebx, [idFile] ;Estandar de Lectura
    mov ecx, text
    mov edx, 20
    int 80h

    ; Mostrando numero
    show_message text, 20
    show_message new_line, 1
    
    ;Cerrar Archivo
    mov eax, 6
    mov ebx, [idFile]
    mov ecx, 0
    mov edx, 0

    ; Longitud del arreglo
    mov esi, text
    mov edi, 0
    
    mov bl, 0
    mov dl, 0

    mov [aux], bl

verify:
    mov al, [esi]
    sub al, '0'

    add esi, 1
    add edi, 1

    cmp al, dl
    je counter

    cmp edi, 20
    jb verify

    jmp checkResult

counter:
    inc bl
    cmp edi, 20
    jb verify

checkResult:
    cmp bl, 0
    jg showResult

    inc dl
    mov esi, text
    mov edi, 0    
    mov bl, 0

    cmp dl, 9
    jng verify

    clc

    jmp getSum

showResult:
    push dx

    add dl, '0'
    mov [number], dl

    add bl, '0'
    mov [replays], bl
    
    ; Mostrando Repeticiones
    show_message number, 1
    show_message msj2, len2
    show_message replays, 1
    show_message new_line, 1

    pop dx
    
    inc dl
    mov esi, text
    mov edi, 0    
    mov bl, 0

    cmp dl, 9
    jng verify
    clc
    jmp getSum

getSum:
    mov al, [result + 1]
    mov ah, [esi]
    sub ah, '0'
    adc al, ah
    aaa
    pushf
    or al, 30h
    popf
    mov [result + 1], al
    mov al, [result + 0]
    mov ah, 0
    adc al, ah
    aaa
    pushf
    or al, 30h
    popf
    mov [result + 0], al

    add esi, 1
    add edi, 1

    cmp edi, 20
    jb getSum

    ; Mostrando Suma total
    show_message msj3, len3
    show_message result, 2
    show_message new_line, 1

    jmp exit

error:
    show_message msj1, len1
    jmp exit

exit:
    mov eax, 1
    int 0x80