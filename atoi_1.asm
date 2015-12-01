.data
	menen:	.asciiz	"Escriba una frase\n"
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
		
		la $t0, buffer
		la $t1, buffer
		
loop:		lb $t2, 0($t1)
		beq $t2, 10, cont		#If LF, continues the program
		addiu $t1, $t1, 1
		b loop				#else, loops again
		
cont:	li $v0, 10
		syscall

		
		
		