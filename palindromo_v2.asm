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
		
calcpal:	subi $t0, $t0, 1		# Makes the loop easier
		
beginning:	addiu $t0, $t0, 1
		lb $t2, 0($t0)

checknumberbeg:	blt $t2, 48, beginning
		bgt $t2, 57, checkletterbeg
		b ending
		
checkletterbeg:	blt $t2, 97, beginning
		bgt $t2, 122, beginning

ending:		subiu $t1, $t1, 1
		lb $t3, 0($t1)
		
checknumberend:	blt $t3, 48, ending
		bgt $t3, 57, checkletterend
		b continue
		
checkletterend:	blt $t3, 97, ending
		bgt $t3, 122,ending

continue:	bne $t2, $t3, noigual

		blt $t1, $t0, sipal
		b beginning
		
noigual:	addi $t4, $t3, 32
		beq $t2, $t4, sipal
		subi $t4, $t3, 32
		beq $t2, $t4, sipal
		
nopal:		li $v0, 4
		la $a0, noespal
		b end
		
sipal:		li $v0, 4
		la $a0, espal
		b end				#Not necessary sentence
		
end:		syscall
		li $v0, 10
		syscall

		
		
		
