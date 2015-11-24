.data
	menen:	.asciiz	"Escriba dos numeros\r\n"
	menres: 	.asciiz	"El siguiente múltiplo es: "
	saltolinea:.asciiz	"\n"
	
.text
main:

		li $v0, 4
		la $a0, menen
		syscall
		
		#Lee el primero y lo mueve a $t0
		li $v0, 5
		syscall
		move $t0, $v0
		#sh $t0, sp1
	
		#Lee el segundo y lo dejamos en $t1
		li $v0, 5
		syscall
		move $t1, $v0
		#sw $t1, sp2
		
		#Si es 0 finalizamos
		beq $t1, 0, fin
		
		mul $t4, $t0, $t1
		li $t2, 0
		
loop:		addi $t2, $t2, 1
		mul $t3, $t0, $t2
		bgt $t3, $t4, fin
		
		li $v0, 4
		la $a0, menres
		syscall
		
		li $v0, 1
		move $a0, $t3
		syscall
		
		li $v0, 4
		la $a0, saltolinea
		syscall
		
		b loop
		
fin:		#Finalizamos el programa llamando a exit
		li $v0, 10
		syscall
