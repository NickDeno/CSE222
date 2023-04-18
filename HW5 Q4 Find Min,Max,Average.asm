	.data
msg: 	.asciiz "Generated Numbers: "
min:	.asciiz "The min number is "
max:	.asciiz "The max number is "	
aver:	.asciiz "The average number is "
newLine: .asciiz "\n"
spce:	.asciiz " "
currRand: .word 0
	.text
main:
#4) Generate 20 random numbers in range [10,100]. Find max, min, and average
	li $s0, 20    #Stores upperbound of loop
	li $s1, 0     #Stores index of for loop(i)
	li $s2, 0     #Stores sum of all numbers (to calculate average)
	li $s3, 1000  #Stores min number (Set to 1000 so first generated number will definetly be smaller)
	li $s4, 0     #Stores max number (Set to 0 so first generated number will definetly be greater)
	
	#Prints msg("Generated Numbers: ")
	la $a0, msg
	li $v0, 4
	syscall		
loop:
	slt $t0, $s1, $s0   #Checks if idx($s1) < upperbound($s0). If yes, $t0 = 1, else $t0 = 0 
	bne $t0, $0, calc   #If $t0 = 1, => idx < upperBound => continue loop => go to "calc" If $t0 = 0, => loop is over
	j disp              #"Loop" is finished, jump to disp

 calc:
 	#Generates random number from [10,100], stores in currRand
 	li $v0, 42
 	li $a1, 101
 	syscall 
 	add $a0, $a0, 10
 	sw $a0, currRand
 	
 	#Prints generated number, and loads generated number back into $a0 after
 	li $v0, 1
 	syscall
 	la $a0, spce
 	li $v0, 4
 	syscall
 	lw $a0, currRand
 	
 	add $s2, $s2, $a0    #Adds new random number to $s2(sum) and stores in $s2
 	slt $t0, $a0, $s3    #Checks if current radom number($a0) is less then min number($s3)
 	bne $t0, $0, newMin  #If $t0 = 1, => new number < current min => go to "newMin" code
 	sgt $t0, $a0, $s4    #Checks if current radom number($a0) is greater then max number($s4)
 	bne $t0, $0, newMax #If $t0 = 1, => new number > current max => go to "newMax" code
 	
 	addi $s1, $s1, 1    #Increments $s1 (idx) by 1
	j loop		   #Goes back into "loop"	
 newMin:
 	move $s3, $a0	#Sets current random numnber as newMin
 	j loop
 newMax:
 	move $s4, $a0	#Sets current random numnber as newMax
 	j loop
disp:	
	#Moves to next line
	la $a0, newLine
	li $v0, 4
	syscall
	
	#Prints min("The min number is ")
	la $a0, min
	li $v0, 4
	syscall
	
	#Prints min number
	move $a0, $s3
	li $v0, 1	
	syscall
	
	#Moves to next line
	la $a0, newLine
	li $v0, 4
	syscall
	
	#Prints max("The max number is ")
	la $a0, max
	li $v0, 4
	syscall
	
	#Prints max number
	move $a0, $s4
	li $v0, 1
	syscall
	
	#Moves to next line
	la $a0, newLine
	li $v0, 4
	syscall
	
	#Prints aver("The average number is ")
	la $a0, aver
	li $v0, 4
	syscall
	
	#Prints average number (integer) 
	li $t0, 20
	div $s2, $t0	
	mflo $a0
	li $v0, 1
	syscall
	
	
	