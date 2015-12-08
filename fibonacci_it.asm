.data
	menen:		.asciiz "Introduce un numero:\n"
	saltolinea:	.asciiz "\n"
	menres:		.asciiz "El número de Fibonacci es: "
	
.text

main:
		# Asks for the data
		li $v0, 4
		la $a0, menen
		syscall
		
		li $v0, 5
		syscall
		
		move $a0, $v0
		
		addi $t0, $zero, 1
		addi $v0, $zero, 1
		addi $v1, $zero, 1
		
		jal fibonacci
		
		move $a0, $v0
		li $v0, 1
		syscall
		
		li $v0, 10
		syscall
		
fibonacci:	blt $a0, 2, return
		addi $t0, $t0, 1
		move $t1, $v0
		add $v0, $v0, $v1
		beq $t0, $a0, return
		move $v1, $t1
		b fibonacci
		
return:		jr $ra
		
		