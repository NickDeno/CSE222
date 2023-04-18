	.data
arr:	.space 80
size:	.word 20
count:	.space 8
msg1:	.asciiz "There are "
msg2:	.asciiz " even numbers and "
msg3:	.asciiz " odd numbers in array"
spce:	.asciiz " "
nextLine: .asciiz "\n"
	.text
main:
	la $s0, arr  #Base Address
	lw $s1, size #Arr Size
	li $s2, 0    #Index(i)
  loop:
  	slt $t0, $s2, $s1
  	beq $t0, $0, display
  	
  	#Loop Code:
  	li $a0, 10 
  	li $a1, 91 
  	addi $sp $sp, -8
  	sw $s0, 0($sp)
  	sw $s1, 4($sp)
  	jal generateRandomNumber
  	lw $s0, 0($sp)
  	lw $s1, 4($sp)
  	addi $sp $sp, 8
  	move $a0, $v0
  	sw $a0, 0($s0)
  	
  	
  	addi $s0, $s0, 4 #Moves to next sport in arr
  	addi $s2, $s2, 1 #Increments index by 1
  	j loop
  	
  display:
  	la $s0, arr
  	li $s2, 0
  	
  displayLoop:
  	slt $t0, $s2, $s1
  	beq $t0, $0, main2
  
  	#Loop Code:
  	lw $a0, 0($s0)
  	li $v0, 1
  	syscall
  	la $a0, spce
  	li $v0, 4
  	syscall
  	
  	addi $s0, $s0, 4 #Moves to next sport in arr
  	addi $s2, $s2, 1 #Increments index by 1
  	j displayLoop
  
main2:
	li $v0, 4
	la $a0, nextLine
	syscall
	
  	la $a0, arr
  	lw $a1, size
  	jal countEvenOddNumbers
  	la $s0, count
  	sw $v0, 0($s0)
  	sw $v1, 4($s0)
  	
  	li $v0, 4
  	la $a0, msg1
  	syscall
  	li $v0, 1
  	lw $a0, 0($s0)
  	syscall
  	li $v0, 4
  	la $a0, msg2
  	syscall
  	li $v0, 1
  	lw $a0, 4($s0)
  	syscall
  	li $v0, 4
  	la $a0, msg3
  	syscall
  	
  	#End Program
  	li $v0, 10
  	syscall
  	
#$a0 = base address "arr", $a1 = "arr" size	
countEvenOddNumbers:
	li $s0, 0 #Keeps track of even numbers
	li $s1, 0 #Keeps track of odd numbers
	li $s2, 0 #Index
	
	#Protect data
	addi $sp, $sp, -20
	sw $ra, 0($sp)
	
  loop2:
  	slt $t0, $s2, $a1
  	beq $t0, $0, afterLoop
  	#Loop Code:
  	sw $s0, 4($sp)
	sw $s1, 8($sp)
	sw $a0, 12($sp)
	lw $a0, 0($a0)  
  	jal isEvenNumber
  	lw $s0, 4($sp)
  	lw $s1, 8($sp)
  	lw $a0, 12($sp)
  	beq $v0, $0, evenCount
  	addi $s1, $s1, 1
  	j continue	
  evenCount:
  	addi $s0, $s0, 1
  continue:
  	addi $a0, $a0, 4 #Moves to next sport in arr
  	addi $s2, $s2, 1 #Increments index by 1
  	j loop2	
  afterLoop:
	addi $v0, $s0, 0
	addi $v1, $s1, 0
	#Recover data, reset "stack"
	lw $ra, 0($sp)
	addi $sp, $sp, 20
	
	jr $ra

#$a0 = Lower bound, $a1 = Upper bound, Result stored in $v0
generateRandomNumber:
	addi $s0, $a0, 0 
	addi $s1, $a1, 0
	slt $t1, $s0, $s1
	bne $t1, $0, ifCond
	j elseCond

  ifCond:
	li $v0, 42
	addi $a1, $s1, 1   
	syscall            
	add $a0, $a0, $s0
	j return
  elseCond:
  	li $v0, 42
	addi $a1, $s1, 1   
	syscall            
	add $a0, $a0, $s0			
  return:
  	addi $v0, $a0, 0
	jr $ra
	
#$a0 = given number, result(0 = even, 1 = odd) is stored in $v0
isEvenNumber:
	sw $ra, 16($sp)	
	li $s0, 2
	div $a0, $s0
	mfhi $s0
	
	beq $s0, $0, even
	li $v0, 1
	j return1
  even:
  	li $v0, 0
  return1:
	lw $ra, 16($sp)
	jr $ra
