	.data
	
	.text
main:
	li $a0, 3
	jal fact
	move $a0, $v0
	li $v0, 1
	syscall
	
#Takes a number n and calculates factorial
fact:
	addi $sp, $sp, -8
	sw $a0, 0($sp) #n
	sw $ra, 4($sp) #Return address
	
	#Function Code:
	li $s1, 2
	slt $s2, $a0, $s1 #Checks base condition
	beq $s2, $0, else #If $s2 = 0, => $a0 is not < 2, => else clause
	
	addi $v0, $0, 1
	lw $a0, 0($sp) #n
	lw $ra, 4($sp) #Return address
	addi $sp, $sp, 8
	jr $ra
else:
	addi $a0, $a0, -1 #Decrements n by 1
	jal fact
			 #Calls function recursively
	lw $a0, 0($sp)
	mul $v0, $v0, $a0
	lw $ra, 4($sp)
	addi $sp, $sp, 8
	jr $ra
	
	
	
	
