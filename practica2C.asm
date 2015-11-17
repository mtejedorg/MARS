.data
	menres: .asciiz	"El resultado es: "
	
.text
main:
		#Lee el primero y lo mueve a $t0
		li $v0, 5
		syscall
		move $t0, $v0	
	
		#Lee el segundo y lo dejamos en $v0
		li $v0, 5
		syscall
		move $t1, $v0
		
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