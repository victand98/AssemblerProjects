section .data
	mensaje db "Víctor Andrés",32, 43, 70, 101,111, 127, 10
	tamanio equ $-mensaje
	mens db "Rojas Curimilma",10
	tam equ $-mens
section .text
	global _start
_start:
	mov eax, 4 ;Escritura
	mov ebx, 1 ;Tipo de salida
	mov ecx, mensaje ;Referencia en memoria
	mov edx, tamanio
	int 80h ;Envia una señal al sistema operativo, para ejecutar una subrutina(Función/Operación)

	mov eax, 4
	mov ebx, 1
	mov ecx, mens
	mov edx, tam
	int 80h

	mov eax, 1
	int 80h
