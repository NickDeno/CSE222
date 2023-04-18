	.data
	.text
main:
#A)
	#Lui and Ori
	lui $s0, 0xABCD
	ori $s0, $s0, 0x2468
	
#B)
	#Shift and ori
	li $s1, 0xEFAB
	sll $s1, $s1, 16
	ori $s1, 0x00001357
#C)
	andi $t0, $s0, 0xFFFF0000
	andi $t1, $s1, 0xFFFF
	
	move $s2, $t1
	sll $s2, $s2, 16
	srl $t0, $t0, 16
	or $s2, $s2, $t0
	
	li $v0, 34
	move $a0, $s2
	syscall
	