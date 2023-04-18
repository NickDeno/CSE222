	.data
msg1:	.asciiz "Enter a 2's power number: " 
msg2:	.asciiz " in 2's power form is 2^"	
num: .word 0
	.text
main: 	#Given a 2's power number(32, 64, 128, ..), write in the form 2^x 

	la $a0, msg1 #Loads address of msg1 into $a0
	li $v0, 4    #Prints msg1("Enter a 2's power number: ")
	syscall
	
	li $v0, 5     #Reads an integer from user
	syscall	      	
	sw $v0, num   #Stores integer given by user in "num"
	move $s0, $v0 #Moves integer given by user into $s0
	
	li $s1, 0  #Exponent of 2's power number (2^x where x = $s1)
	li $s2, 1  #Current number (Number to check if = number given by user)
	li $s3, 2
	
while:
	beq $s2, $s0, display #If $s2 is equal to number entered, loop is finished => go to display
	addi $s1, $s1, 1	     #Exponent is incremented
	mult $s2, $s3	     #Multiply power by 2 
	mflo $s2		     #Stores the quotient of multiplication back into $s2 
	j while
	
display:
	lw $a0, num
	li $v0, 1
	syscall
	
	la $a0, msg2
	li $v0, 4
	syscall
	
	move $a0, $s1 
	li $v0 1
	syscall
	
	li $v0, 10
	syscall
