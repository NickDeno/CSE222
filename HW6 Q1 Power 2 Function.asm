	.data
randNum:	.word 0	
msg1:	.asciiz "The number "
msg2: 	.asciiz " is a power of 2"
msg3:	.asciiz " is not a power of 2"
nextLine: .asciiz "\n"
	.text		
main:
	#Generates random number from [0,100]. Stores in randNum
	li $v0, 42  
	li $a1, 101
	syscall
	sw $a0, randNum
	
	#Prints "The number [num] "
	la $a0, msg1
	li $v0, 4
	syscall
	lw $a0, randNum
	li $v0, 1
	syscall
	
	#Calls func1. Change to "jal func2" to test func2 since both functions use $s0 to store result(1 or 0)
	jal func1
	
	#If $s0 =1, => is power of 2
	bne $s0, $0, isPow2
	#Exectued if not power of 2
	la $a0, msg3
	li $v0, 4
	syscall
	j end

isPow2:	#Exectued if randNum is power of 2 => prints msg2
	la $a0, msg2
	li $v0, 4
	syscall
end:
	li $v0, 10
	syscall

#Since the only odd number that is power of 2 is 1, first check if randNum is 1. If yes, => power of 2. If not, check if randNum
#is even. If not, => not power of 2. If randNum is even, divide by 2. Then, repeat this loop.
func1:
	#Loads randomly generated num into $t1 and 2 into $t2
	lw $t1, randNum
	li $t2, 2
   loop:
  	beq $t1, 1, yes 
  	#Checks if $t1 is even by checking if remainder is 0 or 1
  	div $t1, $t2
  	mfhi $t3
  	bne $t3, $0, no  #If remainder != 0, => odd number => not power of 2	
  	#Executed if $t1 is even.
  	mflo $t1
  	j loop

   yes: #If randNum is power of 2, store 1 in $s0
  	li, $s0, 1
  	jr $ra 	 
   no:	#If randNum is not power of 2, store o in $s0
  	li, $s0, 0
  	jr $ra 
 
#Since a number that is power of 2 will always be represented with 1 non-zero bit(Ex: 8 = 1000 or 32 = 100000), we can perform
#the AND operation of the number and the number preceding it. If result = 0, => power of 2. Else, => not power of 2. 
#Ex: randNum = 8 so perform AND on 1000 and 0001. Result = 0000 = 0 => 8 is power of 2.
func2: 
	#Performs AND operation on randNum and predecessor of randNum
	lw $t1, randNum
	addi $t2, $t1, -1 
	and $t1, $t1, $t2
	
	#If result of AND operation = 0, => randNum is power of 2 => Execute "yes1" code
	beq $t1, $0, yes1
	#Executed if result of AND operation != 0, => not power of 2
	li $s0, 0
	jr $ra
	
  yes1: #Stores 1 in $s0 => randNum is power of 2
   	li $s0, 1
   	jr $ra
