.data
	menen:	.asciiz	"Escriba una frase\r\n"
	espal: 	.asciiz	"Es un palindromo"
	noespal:	.asciiz	"No es un palindromo"
	buffer:	.space	1024
	saltolinea:.asciiz	"\n"
	
.text
main:

		li $v0, 4
		la $a0, menen
		syscall
		
		#Lee la frase
		li $v0, 8
		la $a0, buffer
		li $a1, 1024
		syscall

