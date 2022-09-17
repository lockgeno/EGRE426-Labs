.data
	message: .asciiz "Enter bytes: "
	userinput: .asciiz "Enter String: "
	message2: .asciiz " \nIs it a Palindrome ...... \n"
	No: .asciiz "No"
	Yes: .asciiz "Yes"
.text
	main:
	#print enter value of bytes
	li $v0, 4 	
	la $a0, message
	syscall 
	#input size of string
	li $v0, 5
	syscall
	#save number of byte in the string to $s0
	addi $s0, $v0, 0
	#accounting for end null
	addi $s2, $s0, 1 #buffer size
	addi $a0, $s2, 0# determine where on the heap we are 
	li $v0, 9 # allocate size
	syscall
	addi $s1, $v0, 0 #save address of heap onto $s1
	#print enter String
	li $v0, 4
	la $a0, userinput
	syscall
	#input string on the heap and buffer size
	addi $a0, $s1, 0 
	addi $a1, $s2, 0
	li $v0, 8
	syscall
	#see if the string is a panedrone
	#print is it a palindrone
	li $v0, 4
	la $a0, message2
	syscall
	addi $t0, $s1,0 #save the address of the first char
	add $t1, $s1, $s0 #save the address of the last char 
	addi $t1, $t1, -1 
loop: 	bge $t0, $t1, Pal
	lb $t2, 0($t0)
	lb  $t3, 0($t1)
	bne $t2, $t3 noPal
	addi $t0, $t0, 1
	addi $t1, $t1, -1
	j loop
Pal: 	li $v0, 4 	
	la $a0, Yes
	syscall 
	j Exit
noPal: li $v0, 4 	
	la $a0, No
	syscall
	j Exit 	
	#end of program
Exit:	li $v0, 10
	syscall

	
		
	
