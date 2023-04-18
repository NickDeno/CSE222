	.data
	
	.text
main:
	#Calls func1
	jal func1
	
	#End program
	li $v0, 10
	syscall

#Generate random number.Pass into func2
func1:
	#Protect data
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	#Func1
	li $v0, 42
	li $a1, 21
	syscall
	addi $s0, $a0, 0
	
	#Call func2
	jal func2
	
	#Recover data, reset "stack"
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra

#Display as int value
func2: 
	#Protect data
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s0, 4($sp)
	
	li $v0, 1
	addi $a0, $s0, 0
	syscall
	
	#Recover data, reset "stack
	lw $ra, 0($sp)
	lw $s0, 4($sp)
	addi $sp, $sp, 8
	jr $ra