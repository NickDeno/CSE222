	.data
	
	
	.text
main:	
	li $t0, 4 #Stores integer 4 in t0
	li $t1, 9 #Stores integer 9 in t1
	mul 
	mult $t0, $t1 #Multiplys values in t1 and t0 and stores in lo 
	mflo $t2 #Moves value (t1 x t0) thats stored in lo into t2
	
	div $t1, $t0 #Divvides values in t1 and t0
	mfhi $t3
	mflo $t4 

	li $a0, 0x1A2B  #Loads hex number
	li $v0, 1	#Prints hex number as decimal
	syscall
	
	#I-type Instruction
	addi $t2, $t1, 0xABCD1234
		
	#R-type Instruction
	li $t0, 100	#Stores 100 in $t0 (rs register)
	li $t1, 200	#Stores 200 in $t1 (rt register)
	add $t2, $t0, $t1 #Stores 200 +100 in $t2 (rd reigister)
	
	li $v0, 42 #Service code to generate random num stored in v0	
	li $a1, 1000 #Puts upperbound in a1
	syscall	#Generates random number between [0,999]
	
	li $v0, 1 #Prints random number as decimal
	syscall
	
	li $v0, 34 #Prints random number as hexadecimal
	syscall	
		
	li $v0, 35 #Prints random number as binary
	syscall
	
	li $v0, 10 #Ends program
	syscall