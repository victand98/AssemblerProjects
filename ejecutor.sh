if [ $# -eq 1 ]
then
	echo "Compilando y ejecutando"
	nasm -f elf $1.asm; ld -m elf_i386 -s -o $1 $1.o
	./$1
else
	echo "........."
	echo "Error"
fi