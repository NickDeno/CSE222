	.data
size:	.word 10  
arr:	.space 40 
spce:	.asciiz " "
	.text
main: 
	la $a0, size
	lw $t0, 0($a0)  #Size of array 
	li $t1, 0       #Idx i       
	la $t2, arr     #Base Address
loop: 
	slt $t3, $t1, $t0
	beq $t3, $0, display  
	
	#loop code
	li $v0, 42 
	li $a1, 21 
	syscall	   
	addi $a0, $a0, -5, 
	sw $a0, 0($t2)  
	
	addi $t1, $t1, 1 
	addi $t2, $t2, 4 
	j loop
	
display:
	li $t1, 0       
	la $t2, arr     	
displayLoop:
	slt $t3, $t1, $t0 
	beq $t3, $0, end  
	
	#displayLoop code
	lw $a0, 0($t2)
	li $v0, 1
	syscall
	la $a0, spce
	li $v0, 4
	syscall	

	addi $t1, $t1, 1 
	addi $t2, $t2, 4 
	j displayLoop
end:	
	li $v0, 10
	syscall
    