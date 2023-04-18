	.data	 	
prompt:	.asciiz "Enter 3 integers\n"
msg:	.asciiz "The sum of "
msg1:	.asciiz " is "
spce:	.asciiz ", "
spce1: 	.asciiz ", and "
sum:	.word 0
			
	.text
	la $a0, prompt  #loads address of prompt
	li $v0, 4	#Prints prompt
	syscall
	
	li $v0, 5	#Reads first integer from user
	syscall
	move $t0, $v0	#Stores first int in $t0
	
	li $v0, 5	#Reads second integer from user
	syscall
	move $t1, $v0	#Stores second integer in $t1
	
	li $v0, 5	#Reads third integer from user
	syscall
	move $t2, $v0	#Stores third integer in $t2
	
	add $t3, $t0, $t1  #Stores the sum of integer in t0 and integer in t1 to t3
	add $t3, $t3, $t2  #Stores the sum of integer in t3 and integer in t2 to t3
	sw $t3, sum	   #Stores value of sum in memory
	
	la $a0, msg	#Loads address of msg 
	li $v0, 4	#Prints msg ("The sum of ")
	syscall
	
	move $a0, $t0   #Loads address of first integer
	li $v0, 1	#Prints first integer
	syscall
	
	la $a0, spce	#Loads address of spce
	li $v0, 4	#Prints spce (", ")
	syscall
	
	move $a0, $t1   #Loads address of second integer
	li $v0, 1	#Prints second integer
	syscall
	
	la $a0, spce1	#Loads address of spce1
	li $v0, 4	#Prints spce1 (", and ")
	syscall
	
	move $a0, $t2   #Loads address of third integer
	li $v0, 1	#Prints third integer
	syscall
	
	la $a0, msg1	#Loads address of msg1
	li $v0, 4	#Prints msg1 (" is ")
	syscall
	
	lw $a0, sum	#Loads sum from memory
	li $v0, 1	#Prints sum
	syscall
	
	li $v0, 10	#Ends program
	syscall
	
	
	
	
	
	
	
	
	
	
	
	
	
	  
	