	.data
size:	.word 20
arr:	.space 100
offset:	.word 0
spce:	.asciiz " "
msg1:	.asciiz "Original Array: "
msg2:	.asciiz "Shuffled Array: "
nextLine: .asciiz "\n"	
	.text
main:
	#Initialize array (Generate array of size 20 with numbers 1-20)
	lw $t0, size    #Size of array 
	li $t1, 0       #Index "i"
	la $t2, arr     #Base address stored in $t2
	li $t3, 1       #Starting number
	
loop: 
	slt $t4, $t1, $t0    #If $t4 = 1, => continue loop
	beq $t4, $0, main2 #If $t4 = 0, => loop is finished => break
	
	sw $t3, 0($t2)   
	addi $t1, $t1, 1 #Increments $t1(idx) by 1
	addi $t3, $t3, 1 #Increments $t3(current number) by 1
	addi $t2, $t2, 4 #Since we are storing integers, increment $t2 by 4 bytes to serve next randNum	
	j loop
	
main2:	
 	#A)
 	la $a0, msg1
	li $v0, 4
	syscall
	jal displayFunc
	
	#B)
	jal shuffleFunc
	
	#C)
	la $a0, nextLine
	li $v0, 4
	syscall
	la $a0, msg2
	li $v0, 4
	syscall
	jal displayFunc
	
	#Ends Program
	li $v0, 10
	syscall
	
#$t0 = size of array, $t1 = base address		
displayFunc:
	lw $t0, size    #Array size = $t0
	la $t1, arr     #Array base address = $t1
	li $t2, 0       #Index(i)
	
  loop2:
	slt $t3, $t2, $t0 #If $t3 = 1, => continue loop
	beq $t3, $0, return  #If $t3 = 0, => loop is finished => go to "return"	
	
	#Retrieves integer from "arr" and prints it
	lw $a0, 0($t1)
	li $v0, 1
	syscall
	#Prints space
	la $a0, spce
	li $v0, 4
	syscall	

	addi $t1, $t1, 4 #Increments $t1 by 4 bytes to retrieve next integer
	addi $t2, $t2, 1 #Increments $t2(idx) by 1
	j loop2
	
  return:
  	jr $ra

#$t0 = size of array, $t1 = base address
shuffleFunc:
	lw $t0, size      #Array size
	la $t1, arr       #Array base address
	li $t2, 0         #Index(i)
	
  loop3:
  	slt $t3, $t2, $t0 #If $t3 = 1, => continue loop
	beq $t3, $0, return2  #If $t3 = 0, => loop is finished => go to "return2"
	
	#Generates randNum [0,19]
	li $v0,42
	addi $a1, $t0, 0
	syscall
	
	#Loads current number into temp($s0)
	sll $t4, $t2, 2  #Muliplies index(i) by 4(shifts twice to left)
	lw $s0, arr($t4) #Takes base address("arr"), and adds offset($t4) to get current index number
	
	#Gets random number in array by taking randomly generated number, multiplies by 4, and gets 
	#number in "arr" with offset(randNum x 4)
	sll $t5, $a0, 2  #Multiplies randNum by 4(shifts twice to left)
	lw $s1, arr($t5) #Takes base address("arr"), and adds offset($t5 = randNum x 4) to find random number in array
	
	#Swaps current number and random number
	sw $s1, arr($t4) 
	sw $s0, arr($t5)
	
	addi $t2, $t2, 1 #Increments $t2(idx) by 1
	j loop3
  	
  return2:	
	jr $ra
