	.data
msg:	.asciiz "The random number is "
even:	.asciiz "The number is even"
odd:	.asciiz "The number is odd"
yes:	.asciiz "Yes, the number is divisible by 3 and 5"
yes2:	.asciiz "Yes, the number is divisible by 7 or 9"
no:	.asciiz "No, the number is not divisible by 3 and 5"
no2:	.asciiz "No, the number is not divisble by 7 or 9"
newLine: .asciiz "\n"
randNum: .word 0	
	.text
main:
#2a) Generates a random number from [2,1000], stores in randNum
	li $v0, 42   	   
	li $a1, 1001 	   
	syscall	     	   
	add $a0, $a0, -100  
	sw $a0, randNum
	
	#Prints msg ("The random number is ")
	la $a0, msg
	li $v0, 4
	syscall
	
	#Prints randomly generated number
	lw $a0, randNum  
	li $v0, 1	
	syscall
	
	#Moves to next line
	la $a0, newLine
	li $v0, 4
	syscall
	
#2b) Use 3 different ways to determine if randNum is even or odd
       	#Method 1: Divides randNum by 2 and stores remainder. If remainder is 0, => even. If remainder is 1, => odd
	lw $s0, randNum
	li $s1, 2  
	div $s0, $s1
	mfhi $t0
	#Checks if remainder of randNum/2 = 0. If so => even number => go to "evenNum" code. Else, continue
	#and execute code, then jump to "main2"
	beq $t0, $0, evenNum
	la $a0, odd	
	li $v0, 4	
	syscall
	j main2
  	#randNum is even => "eveNum" code is executed
  	evenNum:
  	la $a0, even	
	li $v0, 4	
	syscall	  	
main2:	
	#Method 2: Shifts randNum 31 bits to the left, => MSB will be either 0(if even) or 1(if odd)
	#Moves to next line
	la $a0, newLine
	li $v0, 4
	syscall
	#Loads randNum into $s0 and shifts bits 31 to the left
	lw $s0, randNum
	sll $s0, $s0, 31
	#If value in $s0 is = $0, => even number => execute "evenNum2" code. Else, continue and execute code, then jump to "main3"
	beq $s0, $0, evenNum2
	la $a0, odd	
	li $v0, 4	
	syscall
	j main3
	#randNum is even
  	evenNum2:
	la $a0, even	
	li $v0, 4	
	syscall	 
main3:	
	#Method 3: Does and operation with randNum and 0x0001(0b000000.....01). Resulting value stored in $t0 will either be
	# 0b00000....01(odd) or 0b00000...00(even)
	#Moves to next line
	la $a0, newLine
	li $v0, 4
	syscall
	#Perfoms and opeartion on randNum and 0x0001(0b000000...01)
	lw $s0, randNum
	andi $s0, $s0, 0x0001
	#If value in $s0 = 0, => even number => execute "evenNum3" code. Else, continue and executre code, then jump to "main4"
	beq $s0, $0, evenNum3
	la $a0, odd	
	li $v0, 4	
	syscall
	j main4	 
	#randNum is even
	evenNum3:
	la $a0, even	
	li $v0, 4	
	syscall	 		
main4:	

#2c) Check if randNum is divisible by 3 AND 5
	#Moves to next line
	la $a0, newLine
	li $v0, 4
	syscall
	
	#Loads registers    
	lw $s0, randNum
	li $s1, 3	     
	li $s2, 5	   
	
	#Checks if randNum is divisible by 3. If not, jump to "notDiv" code, else => is divisible => continue
	div $s0, $s1	     
	mfhi $t0		  
	bne $t0, $0, notDiv   
	
	#randNum is divisble by 3. Checks if divisible by 5. If not, jump to "notDiv" code, else => is divisible 
	#by 3 and 5 => continue
	div $s0, $s2 	    
	mfhi $t0		
	bne $t0, $0, notDiv  
	 
	#Is divisble by 3 and 5
	j isDiv
  notDiv: 
	#Prints "No" since randNum was not divisible by 3 and 5
	la $a0, no
	li $v0, 4
	syscall
	j main5
  isDiv:	
	#Prints "Yes" since randNum was divisible by 3 and 5
	la $a0, yes
	li $v0, 4
	syscall
main5:
#2d) Checks if randNum is divisivle by 7 OR 9
	#Moves to next line
	la $a0, newLine
	li $v0, 4
	syscall
	
	#Loads 7 and 9 into registers
	li $s1, 7	
	li $s2, 9
	
	#Checks if randNum is divisible by 7. If so, jump to "isDiv1" code
	div $s0, $s1
	mfhi $t0
	beq $t0, $0, isDiv1
	
	#Is not divisible by 7, Checks if is divisible by 9. If so, jump to "isDiv1" code
	div $s0, $s2
	mfhi $t0
	beq $t0, $0, isDiv1
	
	#Is not divisible by 7 or 9 => prints "No". Jumps to "end" code
	la $a0, no2
	li $v0, 4
	syscall	
	j end
  isDiv1:
  	#Prints "Yes" since randNum is divisible by 7 or 9
  	la $a0, yes2
	li $v0, 4
	syscall			
end:	
	li $v0, 10
	syscall
	
	
	
	
