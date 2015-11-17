.data
	menres: 	.asciiz	"El resultado es: "
	num1:	.word 3
	num2:	.half 5
	#num3:	.byte 3
	
.text
main:

		#lb $t0, num3

		lw $t0, num1

		lh $t1, num2
		
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
