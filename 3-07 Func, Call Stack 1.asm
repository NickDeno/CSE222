	.data
msg1:	.asciiz "The number "
even:	.asciiz " is even"
odd: 	.asciiz " is odd"
randNum: .word 0
	.text
main:
	#Generates randNum [0,20]
	li $v0, 42
	li $a1, 21
	syscall
	sw $a0, randNum
	
	#Prints msg1
	la $a0, msg1
	li $v0, 4
	syscall
	
	#Prints randNum
	lw $a0, randNum
	li $v0, 1
	syscall
	
	#Calls func1
	jal func1
	
	#Ends program
	li $v0, 10
	syscall
	
#$s0 = randNum parameter	
func1: #Checks if num parameter is even or odd. Display message by calling func2
	
	#Protect data
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	#Func1:
	#Divides randNum by 2. Stores remainder in $t2
	addi $t0, $a0, 0
	li $t1, 2
	div $t0, $t1
	mfhi $t2
	#If remainder is 0, => even => load "even" address into $s0. Else, load "odd" address into $s0
	beq $t2,$0, evenMsg
	la $a0, odd
	j next
 evenMsg:
 	la $a0, even
 next:
 	#Calls Func2
	jal func2
	
	#Recover data, reset "stack"
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra

func2: #Takes address of msg depending on even or odd

	#Protect data(Even though not needed for last function called)
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	#Func2: Prints msg
	li $v0, 4
	syscall
	
	#Recover data, reset "stack"
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra