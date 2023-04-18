	.data
var1: 	.word 10
var2: 	.word 20
		
	.text
main: 
	la $a0, var1
	lw $t0, 0($a0)
	
	la $a0, var2
	lw $t1, 0($a0)
	
	li $v0, 1
	move $a0, $t0
	syscall
	move $a0, $t1
	syscall
	
	la $a0, var2
	sw $t0, 0($a0)
	la $a0, var1
	sw $t1, 0($a0)
	
	li $v0, 10
	syscall	