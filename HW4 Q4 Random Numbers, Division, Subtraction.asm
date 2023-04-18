	.data
msg:	.asciiz "As Decimal: "
msg1:	.asciiz "As Hexadecimal: "
msg2:	.asciiz "As Binary: "	
quo:	.asciiz "Quotient: "
rem:	.asciiz "Remainder: "
minus:	.asciiz " - "
div: 	.asciiz " divided by "
equ:	.asciiz " = "
newLine: .asciiz "\n"
randNum: .word 0
randNum1: .word 0
	
	.text
main:
#4a)
	#Generates random number betweeen [100,1000]
	li $v0, 42   #Generates random number (loads service code 42 in $v0)
	li $a1, 1001  #Stores the upper bound(1000) of random number in $a1
	syscall
	add $a0, $a0, 100  #Adds lower bound(100) to random number stored in $a0
	sw $a0, randNum	   #Stores random integer in randNum label	
	
	#Prints as Decimal
	la $a0, msg
	li $v0, 4
	syscall
	lw $a0, randNum
	li $v0, 1
	syscall
	
	#Moves to next line
	la $a0, newLine
	li $v0, 4
	syscall
	
	#Prints as Hexadecimal
	la $a0, msg1
	li $v0, 4
	syscall
	lw $a0, randNum
	li $v0, 34
	syscall
	
	#Moves to next line
	la $a0, newLine
	li $v0, 4
	syscall
	
	#Prints as Binary
	la $a0, msg2
	li $v0, 4
	syscall
	lw $a0, randNum
	li $v0, 35
	syscall
	
	#Moves to next line twice
	la $a0, newLine
	li $v0, 4
	syscall
	la $a0, newLine
	li $v0, 4
	syscall

#4b)
	#Generates another random number betweeen [100,1000]
	li $v0, 42   #Generates random number (loads service code 42 in $v0)
	li $a1, 1001  #Stores the upper bound(1000) of random number in $a1
	syscall
	add $a0, $a0, 100  #Adds lower bound(100) to random number stored in $a0
	sw $a0, randNum1	   #Stores random integer in randNum label
	
	#Prints as Decimal
	la $a0, msg        #Stores address of msg in $a0
	li $v0, 4	  # Prints msg("As Decimal:")
	syscall
	lw $a0, randNum1  #Stores addres of randNum in $a0
	li $v0, 1	 #Prints randNum1
	syscall
	
	#Moves to next line
	la $a0, newLine
	li $v0, 4
	syscall
	
	#Prints as Hexadecimal
	la $a0, msg1  #Stores address of msg1 in $a0
	li $v0, 4     #Prints msg1("As Hexadecimal:")
	syscall
	lw $a0, randNum1
	li $v0, 34
	syscall
	
	#Moves to next line
	la $a0, newLine
	li $v0, 4
	syscall
	
	#Prints as Binary
	la $a0, msg2
	li $v0, 4
	syscall
	lw $a0, randNum1
	li $v0, 35
	syscall
	
	#Moves to next line twice
	la $a0, newLine
	li $v0, 4
	syscall
	la $a0, newLine
	li $v0, 4
	syscall
	
#4c)
	#Prints first randNum
	lw $a0, randNum #Loads randNum (first generated random number) into $a0
	li $v0, 1	#Prints first random number
	syscall
	
	#Prints - symbol
	la $a0, minus  #Loads address of minus("-" symbol) into $a0
	li $v0, 4      #Prints "-"
	syscall
	
	#Prints second randNum
	lw $a0, randNum1 #Loads randNum1(second generated random number) into $a0
	li $v0, 1	 #Prints second random number
	syscall
	
	#Prints = symbol
	la $a0, equ 	#Loads address of equ("=") into $a0
	li $v0, 4	#Prints =
	syscall
	
	#Calculates and prints result of first randNum - second randNum
	lw $t0, randNum   #Stores first random number in $t0
	lw $t1, randNum1  #Stores second random number in $t1
	sub $t0, $t0, $t1 #Subtracts $t0 - $t1 and stores result in $t0
	move $a0, $t0     #Moves the value stored in $t0 to $a0
	li $v0, 1	  #Prints result 
	syscall
	
	#Moves to next line twice
	la $a0, newLine
	li $v0, 4
	syscall
	la $a0, newLine
	li $v0, 4
	syscall

#4d)	#Divide first randNum by 7, print quotient and remainder
	
	#Prints "randNum divided by 7"
	lw $a0, randNum #Moves address of randNum into $a0
	li $v0, 1       #Prints randNum 
	syscall
	la $a0, div     #Loads address of div into $a0
	li $v0, 4       #Prints div("divided by"
	syscall
	la $a0, 7	#Loads 7 into $a0
	li $v0, 1	#Prints 7
	syscall
	
	#Moves to next line
	la $a0, newLine
	li $v0, 4
	syscall
	
	#Print "Quotient: "
	la $a0, quo  #Loads address of quo into $a0	
	li $v0, 4    #Prints quo("Quotient: ")	
	syscall
	
	#Print Quotient
	lw $t0, randNum #loads randNum into $t0
	la $t1, 7	#Loads 7 into $t1
	div $t0, $t1    #Divided value in $t0 by value in $t1 (randNum/7)
	mflo $a0        #Stores quotient of result in $a0
	li $v0, 1       #Prints quotient of result
	syscall
	
	#Moves to next line
	la $a0, newLine
	li $v0, 4
	syscall
	
	#Print "Remainder: "
	la $a0, rem  #Loads address of rem into $a0 	
	li $v0, 4    #Prints rem("Remainder: )	
	syscall
	
	#Print remainder
	mfhi $a0   #Moves remainder of result into $a0
	li $v0, 1  #Prints remainder
	syscall
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	 
	  
	
	
	
	
	

	
	

	
	
	
	
	
	
	
	
	
	
	
