	.data
size:	.word 12
arr:	.space 48
spce:	.asciiz " "
nextLine: .asciiz "\n"
msg1: 	.asciiz "The maximum element in array is " 
	.text
	
#Generates array of size 12 with random numbers between [-10,10]
main:  
	lw $t0, size    #Size of array 
	la $t1, arr     #Base address 
	li $t2, 0       #Index(i)
	
  loop: 
	slt $t4, $t2, $t0   
	beq $t4, $0, display 
	
	#Generates random number
	li $s0, 21
	li $s1, -10
	jal func1
	
	sw $a0, 0($t1)   
	addi $t1, $t1, 4  #Moves to next number in array(increments by 4 bytes)
	addi $t2, $t2, 1  #Increments index
	j loop

#Displays Array
display:
	lw $t0, size    #Array size = $t0
	la $t1, arr     #Array base address = $t1
	li $t2, 0       #Index(i)
	
  loop2:
	slt $t3, $t2, $t0 
	beq $t3, $0, main2  	
	
	lw $a0, 0($t1)
	li $v0, 1
	syscall
	la $a0, spce
	li $v0, 4
	syscall	

	addi $t1, $t1, 4 #Increments $t1 by 4 bytes
	addi $t2, $t2, 1 #Increments $t2(idx) by 1
	j loop2

#Displays Maximum Element in Array
main2:
	#Calls func2(Finds max element, stores in $s0)
	jal func2
	
	#Moves to next line("\n")
	li $v0, 4
	la $a0, nextLine
	syscall
	
	#Displays msg1("The maximum element in array is ")
	li $v0, 4
	la $a0, msg1
	syscall
	
	#Displays max element in array(Since func2 stores max in $s0, moves to $a0 and prints)
	li $v0, 1
	move $a0, $s0
	syscall
	
	#Ends Program
	li $v0, 10
	syscall

#Random number function: $s0 = upper bound, $s1 = lower bound
func1:
	li $v0, 42  
	move $a1, $s0
	syscall	    
	add $a0, $a0, $s1 
	jr $ra
	
#Finds Max Element in Array, Stores result in $s0
func2:
	lw $t0, size    #Array size
	la $t1, arr     #Array base address
	li $t2, 0       #Index(i)
	li $s0, 0       #Max element
	
  loop3:
	slt $t3, $t2, $t0   
	beq $t3, $0, return
	
	#Checks if current element is > max element($s0). If so, jump to "isGrtr"
	lw $t4, 0($t1)
	sgt $t5, $t4, $s0
	bne $t5, $0, isGrtr
	j next
  
  	isGrtr:
  	move $s0, $t4

  	next:	
	addi $t1, $t1, 4  #Moves to next number in array(increments by 4 bytes)
	addi $t2, $t2, 1  #Increments index($t2)
	j loop3
	
   return:
  	jr $ra