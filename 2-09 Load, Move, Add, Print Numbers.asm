	.data
msg: 	.asciiz "Hello MIPS"	
var1:	.word 10
var2: 	.word 0
	
	.text
start:  
	li $v0, 1
	la $a1, var1
	lw $a0, 0($a1)
	syscall
	
	li $v0, 4
	la $a0, msg
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	li $v0, 5
	syscall
	
	add $t1, $t0, $v0
	move $a0, $t1
	li $v0, 1
	syscall
	
	la $a1, var2
	sw $t1, 0($a1)
	
	
	
		
	li $v0, 10
	syscall	
		  
