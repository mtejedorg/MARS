
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
	
	move $s0, $v0		# $s0 stores the original number
	
	