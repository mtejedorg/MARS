
.data
	menen:		.asciiz	"Escriba un número\n"
	menres:		.asciiz	"La secuencia de Fibonacci es: "
	saltolinea:	.asciiz	"\n"

.text

main:
		# Asks for the data
		li $v0, 4
		la $a0, menen
		syscall
	
		li $v0, 5
		syscall
	
		move $a0, $v0		# $a0 stores the argument
		# we just need to calculate until f(n-1)
		subu $a0, $a0, 1	
		
		jal fibonacci		# Calls the algorithm
		
		move $a0, $v0		# Answer is in $v0
		li $v0, 1		# Prints the number
		syscall
		
		li $v0, 10		# Ends the program
		syscall
	
fibonacci:	subu $sp, $sp, 32
		sw $ra, 20($sp)
		sw $fp, 16($sp)
		addiu $fp, $sp, 28
		sw $a0, 0($fp)
		
		lw $v0, 0($fp)
		bge $v0, 1, fib_rec
		li $v0, 1		# Non-recursive case
		li $v1, 1
		b return
		
fib_rec:	lw $v1, 0($fp)
		subu $v0, $v1, 1	# Compute n - 1
		move $a0, $v0
		jal fibonacci
		
		move $t0, $v0
		add $v0, $v0, $v1
		move $v1, $t0
		
		
return:		lw $ra, 20($sp)
		lw $fp, 16($sp)
		addi $sp, $sp, 32
		jr $ra 
		
		
		
