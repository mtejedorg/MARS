.data
	menen:	.asciiz	"Escriba dos numeros\r\n"
	menres: 	.asciiz	"El mayor es: "
	
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
		
		#Comparamos
		bgt $t1, $t0,  otro
		
		move $t2, $t0
		b seguir
		
otro:		move $t2, $t1
		b seguir
		
		
seguir:	li $v0, 4
		la $a0, menres
		syscall
		
		li $v0, 1
		move $a0, $t2
		syscall
		
		#Finalizamos el programa llamando a exit
		li $v0, 10
		syscall
