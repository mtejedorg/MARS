.data
	menen:	.asciiz	"Escriba una frase\n"
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
		
		la $t0, buffer
		la $t1, buffer
		
loop:		lb $t2, 0($t1)
		beq $t2, 10, calcpal		#If LF, continues the program
		addiu $t1, $t1, 1
		b loop				#else, loops again
		
calcpal:	subiu $t1, $t1, 1		#So that $t1 is the char before LF
		lb $t2, 0($t0)
		lb $t3, 0($t1)
		bne $t2, $t3, nopal
		addiu $t0, $t0, 1
		blt $t1, $t0, sipal
		b calcpal
		
sipal:	li $v0, 4
		la $a0, espal
		b end
		
nopal:	li $v0, 4
		la $a0, noespal
		b end				#Not necessary sentence
		
end:		syscall
		li $v0, 10
		syscall

		
		
		