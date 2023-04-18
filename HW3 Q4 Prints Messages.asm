	.data
msg1:	.asciiz "Computer Architecture and Organization\n"
msg2: 	.asciiz "SCCC - Computer Science Program"
		
	.text	
	la $a0, msg1 #load addres of msg1 to a0
	li $v0, 4    #print msg1, 4 = print string
	syscall
	
	la $a0, msg2 #load addres of msg2 to a0
	li $v0, 4    #print msg22, 4 = print string
	syscall
	
	li $v0, 10   #end program
   	syscall
	