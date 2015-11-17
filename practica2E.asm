.data
	menres: 	.asciiz	"El resultado es: "
	#num1:	.word 3
	#num2:	.half 5
	#num3:	.byte 3
	sp1:		.space 2
	sp2:		.space 4
	
.text
main:

		#lb $t0, num3

		#lw $t0, num1

		#lh $t1, num2
		
		#Lee el primero y lo mueve a $t0
		li $v0, 5
		syscall
		lw $t0, sp1
		move $t0, $v0
		#sh $t0, sp1
	
		#Lee el segundo y lo dejamos en $v0
		li $v0, 5
		syscall
		lw $t1, sp2
		move $t1, $v0
		#sw $t1, sp2
		
		
		#Sumamos e imprimimos
		add $t2 $t1 $t0
		
		li $v0, 4
		la $a0, menres
		syscall
		
		li $v0, 1
		move $a0, $t2
		syscall
		
		#Finalizamos el programa llamando a exit
		li $v0, 10
		syscall
