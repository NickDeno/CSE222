	.data
greater: .asciiz " is greater then "
less:	.asciiz " is less then "
equal: 	.asciiz " is equal to "
randNum: .word 0
randNum2: .word 0
	.text
main: #Generate 2 random numbers, check which one is greater, which one is less
	li $v0, 42   #Generates random number (loads service code 42 in $v0)
	li $a1, 101  #Stores the upper bound(101) of random number in $a1
	syscall
	sw $a0 randNum
	move $s0, $a0
	
	li $v0, 42   #Generates random number (loads service code 42 in $v0)
	li $a1, 101  #Stores the upper bound(101) of random number in $a1
	syscall
	sw $a0, randNum2
	move $s1, $a0
	
	beq $s0, $s1, equal #If 2 numbers are equal, jump to "equ"
	#Not equal	
	slt $t0, $s0, $s1   #Compare randNum($s0) with randNum2($s1)
	beq $t0, $0, grtr   #If $s0 < $s1 => 1, if $s0 > $s1 => 0 which means go to "grtr"
	#randNum < randNum2
	lw $a0, randNum
	li $v0, 1
	syscall
	la $a0, less
	li $v0, 4
	syscall
	lw $a0, randNum2
	li $v0, 1
	syscall
	j end
	
grtr: #randNum > randNum2
	lw $a0, randNum
	li $v0, 1
	syscall
	la $a0, greater
	li $v0, 4
	syscall
	lw $a0, randNum2
	li $v0, 1
	syscall
	j end
equ: #2 numbers are equal
	lw $a0, randNum
	li $v0, 4
	syscall
	la $a0, equal
	li $v0, 4
	syscall
	lw $a0, randNum2
	li $v0, 4
	syscall
end: 
	li $v0, 10
	syscall
	
	
	

	
