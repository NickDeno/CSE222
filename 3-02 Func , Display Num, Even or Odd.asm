	.data
	
	.text
main:
	#Generates randNum between [0,20]
	li $v0, 42
	li $a1, 21
	syscall
	
	jal func1 #Stores address of li(next instruction) in $ra. Then jumps to func1 
	
	#Ends program
	li $v0, 10
	syscall
	
func1:	#Function to display a number
	li $v0, 1
	syscall
	
	
	jal func2 #Incorrect way to go to func2 within func1. Will overwrite orignal $ra value
	
	jr $ra	 #Jumps to return address stored in $ra(The address of next instruction after jal)
	
func2: #Check if num is even or odd. Display message
	jr $ra	