	.data
size:	.word 10  #Defines size of array
arr:	.space 40 #Reserves 40 bytes for the "array"(Block of memory)
spce:	.asciiz " "
	.text
main: 
	#Initialize array (Generate 10 random integer numbers between [0,20]
	la $a0, size
	lw $t0, 0($a0)  #Size of array 
	li $t1, 0       #Index "i"
	la $t2, arr     #Base address stored in $t2
	
loop: 
	slt $t3, $t1, $t0    #If $t3 = 1, => continue loop
	beq $t3, $0, display #If $t3 = 0, => loop is finished => go to display
	
	#This code is executed while $t1(i) < $t0(size)
	li $v0, 42 
	li $a1, 21 #Stores upperbound in $a1
	syscall	   #Generates randNum between [0,20]
	sw $a0, 0($t2)   #Stores randNum generated at $t2 with offset of 0
	addi $t1, $t1, 1 #Increments $t1(idx) by 1
	addi $t2, $t2, 4 #Since we are storing integers, increment $t2 by 4 bytes to serve next randNum	
	j loop
	
display:
	li $t1, 0       #Reset $t1(idx) to 0
	la $t2, arr     #Resets back to base address of arr
	
displayLoop:
	slt $t3, $t1, $t0 #If $t3 = 1, => continue loop
	beq $t3, $0, end  #If $t3 = 0, => loop is finished => go to end	
	
	#Retrieves integer from "arr" and prints it
	lw $a0, 0($t2)
	li $v0, 1
	syscall
	#Prints space
	la $a0, spce
	li $v0, 4
	syscall	

	addi $t1, $t1, 1 #Increments $t1(idx) by 1
	addi $t2, $t2, 4 #Increments $t2 by 4 bytes to retrieve next integer
	j displayLoop
end:	
	li $v0, 10
	syscall