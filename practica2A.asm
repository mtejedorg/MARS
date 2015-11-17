.data

.text
#Lee el primero y lo mueve a $t0
li $v0, 5
syscall
move $t0, $v0

#Lee el segundo y lo dejamos en $v0
li $v0, 5
syscall

#Sumamos e imprimimos
add $a0 $v0 $t0
li $v0, 1
syscall

#Finalizamos el programa llamando a exit
li $v0, 10
syscall
