	.data
msg1:	.asciiz "Original number: "
msg2:	.asciiz "After shifting to left by 1 bit: "
msg3:	.asciiz "After shifting to right by 1 bit(logic): "
msg4:	.asciiz "After shifting to right by 1 bit(arithmetic): "
msg5:	.asciiz "After rotating to the left by 8 bits: "
msg6:	.asciiz "Before filtering out odd bits: "
msg7:	.asciiz "After filtering out odd bits : "
newLine: .asciiz "\n"	
	.text
main:
#3a)
	#Loads 0xA1B3E5F7 into $s0
	lui $s0, 0xA1B3
	ori $s0, $s0, 0xE5F7
	
	#Prints msg1("Orignal number: ")
	la $a0, msg1
	li $v0, 4
	syscall
	
	#Prints orignal number(as Hex)
	addi $a0, $s0, 0
	li $v0, 34
	syscall
	
	#Moves to new line
	la $a0, newLine
	li $v0, 4
	syscall
	
#3b) Shift number to left by 1 bit, display new number
	#Shifts number to left by 1 bit
	sll $s0, $s0,1
	
	#Prints msg2("After shifting to left by 1 bit: ")
	la $a0, msg2
	li $v0, 4
	syscall
	
	#Prints new number(after shifting 1 bit to left) 
	addi $a0, $s0, 0
	li $v0, 34
	syscall
	
	#Moves to new line
	la $a0, newLine
	li $v0, 4
	syscall
	
#3c) Shift (3b) number right by 1 bit logic:
	#Shift number to right by 1 bit logical
	srl $s0, $s0, 1
	
	#Prints msg3("After shifting to right by 1 bit(logic): ")
	la $a0, msg3
	li $v0, 4
	syscall
	
	#Prints new number(after shifting 3b number rigt by 1 bit logic) 
	addi $a0, $s0, 0
	li $v0, 34
	syscall
	
	#Moves to new line
	la $a0, newLine
	li $v0, 4
	syscall
	
#3d) Shift (3c) number right by 1 bit arithmetic:
	sra $s0, $s0, 1
	
	#Prints msg4("After shifting to right by 1 bit(arithmetic): ")
	la $a0, msg4
	li $v0, 4
	syscall
	
	#Prints new number(after shifting 3c number rigt by 1 bit arithmetic) 
	addi $a0, $s0, 0
	li $v0, 34
	syscall
	
	#Moves to new line
	la $a0, newLine
	li $v0, 4
	syscall
	
#3e) Rotate (3d) number to the left by 8 bits
	rol $s0, $s0, 8
	
	#Prints msg5("After rotating to the left by 8 bits: ")
	la $a0, msg5
	li $v0, 4
	syscall
	
	#Prints new number(after rotating 3d to the left by 8 bits) 
	addi $a0, $s0, 0
	li $v0, 34
	syscall
	
	#Moves to new line
	la $a0, newLine
	li $v0, 4
	syscall
	
#3f) Filter (3e) number by only keeping bits at even places	
	#Prints msg6("Before filtering even bits: ")
	la $a0, msg6
	li $v0, 4
	syscall
	
	#Prints number as binary
	addi $a0, $s0, 0
	li $v0, 35
	syscall
	
	#Moves to next line
	la $a0, newLine
	li $v0, 4
	syscall
	
	#Loads 0x55555555(01010101.....01) into $s1
	lui $s1, 0x5555
	ori $s1, $s1, 0x5555
	
	#Performs AND operation on $s0 and $s1. 0x55555555 was chosen because this number will "filter" out all the odd
	#bits in $s0 since all the odd bits in 0x55555555 are 0. => the result of AND operation on odd bits of number will always be 
	#0 since (1 AND 0 = 0) and (0 AND 0 = 0)
	and $s0, $s0, $s1
	
	#Prints msg7 ("After filtering even bits: ")
	la $a0, msg7
	li $v0, 4
	syscall
	
	#Prints new number(after filtering)
	addi $a0, $s0, 0
	li $v0, 35
	syscall
	
	li $v0, 10
	syscall
	
	
	
	
	
	
