	.data
msg:	.ascii "The sum from 0 to 9 is "	
	.text
main: #Sum numbers 0-9
	li $s0, 10 #Stores upperbound of for loop
	li $s1, 0  #Stores index of for loop(i)
	li $s2, 0  #sum
	
loop:	slt $t0, $s1, $s0   #Checks if idx($s1) < upperbound($s0). If yes, $t0 = 1, else $t0 = 0 
	bne $t0, $0, addop  #If $t0 = 1, => idx < upperBound => continue loop => go to "addop" If $t0 = 0, => loop is over
	j disp              #"Loop" is finished, jump to disp    
	
addop:	add $s2, $s2, $s1   #Adds value of $s2 (sum) with $s1 (idx) and stores in $s2
	addi $s1, $s1, 1    #Increments $s1 (idx) by 1
	j loop		   #Goes back into "loop"

disp:
	la $a0, msg
	li $v0, 4
	syscall
	
	move $a0, $s2
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
