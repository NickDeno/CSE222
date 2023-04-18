	.data
msg1:	.asciiz "The random number is "	
newLine: .asciiz "\n"
vx:	.word 0
	
	.text
main:
	#Prints "The random number is "
	la $a0, msg1  #loads address of msg1 into a0
	li $v0, 4     #Prints msg1
	syscall
	
	#Generate random number between [0,200] then adds lower bound (-100) => gives a number between [-100,100]
	li $v0, 42   #Generates random number (loads service code 42 in $v0)
	li $a1, 201  #Stores the upper bound of random number in $a1
	syscall	     #Randomly generated number will be stored in $a0
	add $a0, $a0, -100  #Adds lower bound(-100) to random number stored in $a0
	sw $a0, vx  #Stores the random number located in $a0 into vx label
	li $v0, 1   #Prints the random number
	syscall
	
	#Moves to next line
	la $a0, newLine	#Loads address of newLine into $a0 
	li $v0, 4     	#Prints newLine(Goes to next line using \n)
	syscall
	
	#Method 1: Multiply vx by 3
	lw $t0, vx       #Loads the generated random number into $t0
	mul $t0, $t0, 3  #Multiplys the value stored in $t0 with 3
	move $a0, $t0    #Moves the value from $t0 to $a0
	li $v0, 1	 #Prints integer in $a0
	syscall
	
	#Moves to next line
	la $a0, newLine	#Loads address of newLine into $a0 
	li $v0, 4     	#Prints newLine(Goes to next line using \n)
	syscall
	
	#Method 2: Add vx 3 times
	lw $t0, vx	   #Loads first instance of vx(random integer) in $t0
	lw $t1, vx	   #Loads second instance of vx(random integer) in $t0
	lw $t2, vx         #Loads third instance of vx(random integer) in $t0
	add $t0, $t0, $t1  #Adds values in $t0 and $t1 and stores the result in $t0
	add $t0, $t0, $t2  #Adds values in $t0 and $t2 and stores result in $t0
	move $a0, $t0  #Moves value in $t0 to $a0
	li $v0, 1      #Prints integer in $a0
	syscall
	
	#Moves to next line
	la $a0, newLine	#Loads address of newLine into $a0 
	li $v0, 4     	#Prints newLine(Goes to next line using \n)
	syscall
	
	#Method 3: Given vx, left shift twice(each time value is shifted to left, it doubles) which would give 4vx. Then
	#subtract vx once = 4vx- vx = 3vx
	lw $t1, vx	  #Loads value of vx into $t1
	sll $t0, $t1, 2	  #Logic shifts the value in $t1 2 times to the left, and stores result in $t0
	sub $t0, $t0, $t1  #Subtracts value in $t0(4vx) - value in $t1(vx) and stores result back in $to(3vx)
	move $a0, $t0      #Moves value in $t0 to $a0
	li $v0, 1	   #Prints result
	syscall
	
	li $v0, 10	#Ends program
	syscall
