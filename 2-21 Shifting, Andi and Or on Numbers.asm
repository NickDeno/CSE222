	.data
	
	.text
main: 
#Take ABCD1234 => CDAB3412
	la $s0, 0xABCD1234
	andi $s1, $s0, 0x00FF #s1 stores 00000034
	andi $s2, $s0, 0xFF00 #s2 stores 00001200
	sll $s1, $s1, 8       #s1 is shifted to 00003400
	srl $s2, $s2, 8       #s2 is shifted to 00000012
	or  $s1, $s1, $s2     #Or operation is run on s1(00003400) and s2(00000012), => s1 = (00003412)
	
	andi $s2, $s0, 0xFF0000   #s2 stores 00CD000000
	andi $s3 $s0, 0xFF000000  #s3 stores AB00000000
	sll $s2, $s2, 8	         #s2 is shifted to CD000000
	srl $s3, $s3, 8		 #s3 is shifted to 00AB0000
	or $s2, $s2, $s3          #Or operation is run on s2(CD000000) and s3(00000012), => s2 = (CDAB0000)
	
	or $s3, $s1, $s2,  #Or operation is run on $s1(00003412) and $s2(CDAB0000) and the result(CDAB3412) is stored in $s3
	move $a0, $s3	  #The value in $s3(CDAB3412) is moved to $a0
	li $v0, 34	  #Prints hexadecimal number
	syscall
	
		
