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
		
		li $s1, 1			# By default sign is +
		
		la $t0, buffer
		addi $s0, $zero, 0		# $s0 will store the number
		lb $t1, 0($t0) 
		bne $t1, 45, noneg
		li $s1, -1			# Turns sign to negative
		addi $t0, $t0, 1		# That means it has sign
		
noneg:		bne $t1, 43, loop
		addi $t0, $t0, 1		# That means it has sign
		
loop:		lb $t1, 0($t0)
		blt $t1, 48, cont		# LF is included
		bgt $t1, 57, cont
		mul $s0, $s0, 10
		subi $t2, $t1, 48
		add $s0, $s0, $t2
		addi $t0, $t0, 1
		b loop				#else, loops again
		
cont:		
		mul $s0, $s0, $s1

		# Print num
		li $v0, 1
		move $a0, $s0
		syscall
		
		# Exit
		li $v0, 10
		syscall

		
		
		
