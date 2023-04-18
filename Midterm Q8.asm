	.data
prompt1:	.asciiz "Enter one positive integer\n"
prompt2:	.asciiz "Enter another positive integer\n"
msg:	.asciiz "The random number is "
	.text
main:
	la $a0, prompt1
	li $v0, 4	
	syscall
	li $v0, 5	
	syscall
	move $t0, $v0	
	la $a0, prompt2 
	li $v0, 4	
	syscall	
	li $v0, 5	
	syscall
	move $t1, $v0	
		
	move $a0, $t0 #Stores first chosen number in $a0
	move $a1, $t1 #Stores second chosen number in $a1
	jal generateRandomNumber #Returns a randomNum stored in $v0
	move $t0, $v0
	
	li $v0, 4
	la $a0, msg
	syscall
	
	move $a0, $t0
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
		
#$a0 = num1, $a1 = num2, $v0 = randNumber
#Generate randNum between [$a0, $a1]
generateRandomNumber:
	#Protect data
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	jal sortNumber #Returns lowerBound in $v0, upperBound in $v1
	move $s0, $v0  #Stores lowerBound in $s0
	move $s1, $v1  #Stores upperBound in $s1
	sub $s2, $s1, $s0 #Max-min
	addi $a1, $s2, 1  #+1
	li $v0, 42
	syscall	   
	add  $a0, $a0, $s0  #min
	move $v0, $a0 #Puts randNum into $v0 to be returned 
	
	#Recover data, reset "stack"
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
	
#$a0 = num1, $a1 = num2, $v0 = smaller number, $v1 = larger number
sortNumber:
	slt $t0, $a0, $a1
	bne $t0, $0, lessThan #When $a0 < $a1, go to lessThan
	move $v0, $a1
  	move $v1, $a0
	j return
  lessThan:
  	move $v0, $a0
  	move $v1, $a1
  return:
	jr $ra
	