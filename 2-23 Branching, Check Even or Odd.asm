	.data	
even:	.asciiz " is an even number"
odd: 	.asciiz " is an odd number"
randNum: .word 0
	.text
main:	#Generate random number, check if number is even or odd, display message based on result
	
	li $v0, 42   #Generates random number (loads service code 42 in $v0)
	li $a1, 101  #Stores the upper bound(101) of random number in $a1
	syscall
	sw $a0, randNum
	
	li $t0, 2     #Loads 2 into $t0
	div $a0, $t0  #Divides randNum($a0) by 2($t0)
	mfhi $t1	     #Stores remainder in $t1
	
	beq $t1, $0, evenNum #If $t1(remainder) is = $0(0), => randNum is even number => jumps to "evenNum"	
	#Odd number
	lw $a0, randNum	#Loads randNum into $a0
	li $v0, 1	#Prints randNum
	syscall
	la $a0, odd	#Loads address of odd into $a0
	li $v0, 4	#Prints odd(" is an odd number")
	syscall	   
	j end		#Jumps to "end" label(To prevent executing "evenNum" code)
evenNum: 
	lw $a0, randNum	#Loads randNum into $a0
	li $v0, 1	#Prints randNum
	syscall		
	la $a0, even	#loads address of even into $a0
	li $v0, 4	#Prints even(" is an even number")
	syscall	  

end:
	li $v0,10
	syscall
	
	
	
