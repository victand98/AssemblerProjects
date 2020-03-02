%macro escribir 2
	mov eax,4  
	mov ebx,1
	mov ecx,%1
	mov edx,%2
	int 80h
%endmacro

%macro leer 2
	mov eax,3  
	mov ebx,2
	mov ecx,%1
	mov edx,%2
	int 80h
%endmacro

section .data
    asterisco db '*'
    vacio db ' '
    new_line db 10,''
section .bss
 

section .text
    global _start

_start:

    mov ecx, 9
  

l1:
    push ecx
    call imprimir
    pop ecx
    push ecx

    mov eax, 9
    mov ebx, ecx
    sub eax, ebx 

    cmp ecx, 9
    je l2
    jmp vacios

l2:
    push ecx
    call imprimir_asterisco
    pop ecx

    loop l2

    pop ecx
    loop l1

    jmp salir

vacios:
    push eax
    push ecx
    escribir vacio, 1
    pop ecx
    pop eax
    dec eax
    cmp eax, 0
    jz l2
    jnz vacios


imprimir:
    mov eax, 4
    mov ebx, 1
    mov ecx, new_line
    mov edx, 1
    int 80h

    ret 

imprimir_asterisco:
    mov eax, 4
    mov ebx, 1
    mov ecx, asterisco
    mov edx, 1
    int 80h

    ret
            

salir:    
    mov eax, 1
    int 80h