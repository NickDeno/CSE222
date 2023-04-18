	.data
big: 	.asciiz "Big Endian"
little:	.asciiz "Little Endian"	
num:	.word 0xFF000000
bit:	.word 0xFF
	.text
main:	
	lb $t1, num  #Loads first byte from num into $t1.
	lb $t2, bit  #Loads confirmation bit into $t2.
	 
	#If FF was loaded into $t1, => MSB was loaded first => Big Endian. If $t1 = 0x00000000, => LSB was loaded first
	# => little endian
	beq $t1, $t2, bigEnd
	#Little Endian
	la $a0, little
	li $v0, 4
	syscall
	j end
	
bigEnd:
	la $a0, big
	li $v0, 4
	syscall
end:	
	li $v0, 10
	syscall
