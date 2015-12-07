.data
	menen:		.asciiz	"Escriba una frase\n"
	buffer:		.space	1024
	saltolinea:	.asciiz	"\n"
	
.text

main:
		# Reads the sentence
		li $v0, 4
		la $a0, menen
		syscall
		
		# Stores the data in variable buffer
		li $v0, 8
		la $a0, buffer
		li $a1, 1024
		syscall
		
		la $t0, buffer
		addi $s0, $zero, 0		# $s0 will store the number
		
loop:		lb $t1, 0($t0)
		beq $t1, 10, cont		#If LF, ends the program
		mul $s0, $s0, 10
		subi $t2, $t1, 48
		add $s0, $s0, $t2
		addi $t0, $t0, 1
		b loop				#else, loops again
		
cont:		
		# Print num
		li $v0, 1
		move $a0, $s0
		syscall
		
		# Exit
		li $v0, 10
		syscall

		
		
		
