	.data
mon:	.asciiz "Monday"
tues:	.asciiz "Tuesday"
wed:	.asciiz "Wednesday"
thur:	.asciiz "Thursday"
fri:	.asciiz "Friday"
sat:	.asciiz "Saturday"
sun:	.asciiz "Sunday"	
	.text
main:
	#Generates random number from [0,6], stores in $t0
	li $v0, 42
	li $a1, 7
	syscall
	move $t0, $a0
	
	#Case 1 (Monday):
	li $t1, 1
	beq $t0 $t1, case1
	
	#Case 2 (Tuesday):
	li $t1, 2
	beq $t0 $t1, case2
	
	#Case 3 (Wednesday):
	li $t1, 3
	beq $t0 $t1, case3
	
	#Case 4 (Thursday):
	li $t1, 4
	beq $t0 $t1, case4
	
	#Case 5 (Friday):
	li $t1, 5
	beq $t0 $t1, case5
	
	#Case 6 (Saturday):
	li $t1, 6
	beq $t0 $t1, case6
	
	#Case 0 (Sunday):
	la $a0, sun
	li $v0, 4
	syscall
	j end		
case1:	
	la $a0, mon
	li $v0, 4
	syscall
	j end
case2:
	la $a0, tues
	li $v0, 4
	syscall
	j end	
case3:
	la $a0, wed
	li $v0, 4
	syscall
	j end	
case4:
	la $a0, thur
	li $v0, 4
	syscall
	j end
case5:
	la $a0, fri
	li $v0, 4
	syscall
	j end
case6:
	la $a0, sat
	li $v0, 4
	syscall
	j end
end:
	li $v0, 10
	syscall
	
	
	