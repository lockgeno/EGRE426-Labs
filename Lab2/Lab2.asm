.data
	message: .asciiz "Enter bytes: "
	userinput: .asciiz "Enter String: "
	message2: .asciiz " \nIs it a Palindrome ...... \n"
	No: .asciiz "No"
	Yes: .asciiz "Yes"
.text
	main:
	#print enter value of bytes
	lw $v0, 4 	
	la $a0, message
	syscall 
	#input number of byte
	li $v0, 5
	syscall 
	move $t0, $v0
	#allocate the space
	li $v0, 9
	move $a0, $t0
	syscall 
	#display output
	li $v0, 4
	la $a0, userinput
	syscall
	#user string input
	li $v0, 8
	move $a0, $sp
	move $a1, $t0 
	syscall
	#Print message2
	li $v0, 4 	
	la $a0, message2
	syscall
	#save first value in register
	move $t2, $sp
	#value [0] at index in hex
	lb $s2, ($t2)
	#move t3 to next sp
	addi $t1, $t0, -2
	add $sp, $sp, $t1
	move $t3, $sp
	#value [n-1] at index in hex
	lb $s3, ($t3)
	beq $s2, $s3, checkpal
	jal Noa
	
Yesa:	#display output
	li $v0, 4
	la $a0, Yes
	syscall
	#end of program
	li $v0, 10
	syscall
	
Noa:	#display output
	li $v0, 4
	la $a0, No
	syscall
	
	#end of program
	li $v0, 10
	syscall
	
checkpal: 
	#check if 1 byte or 1 string value
	ble $t0, 1, Noa
	beq $t0, 2, Yesa
	#move t2, 1 index forward
	addi $t2, $t2, 1
	#value [i+1] at index in hex
	lb $s2, ($t2)
	#move t3, 1 index back
	addi $t3, $t3, -1
	#value [n- 1] at index in hex
	lb $s3, ($t2)
	
	
		
	
