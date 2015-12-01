.data
	menen:	.asciiz	"Escriba una frase\n"
	buffer:	.space	1024
	num:		.word
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
		
loop:		lb $t1, 0($t0)
		mulu num, num, 10
		subu $t2, $t1, '0'
		addu num, num, $t2
		beq $t1, 10, cont		#If LF, ends the program
		addiu $t0, $t0, 1
		b loop				#else, loops again
		
cont:	li $v0, 1
		lw $a0, num
		syscall

		li $v0, 10
		syscall

		
		
		