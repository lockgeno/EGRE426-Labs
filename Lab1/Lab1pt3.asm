########################################################### 
#Lab 1 of 426
#Part 3 array reversal  
########################################################### 
 
.text 
.globl main 
 
main: 
#Part 3 dynamically allocate array
li $v0,4   # system call to print MSG1 
la $a0, MSG1 
syscall 
 
li $v0,5   # system call to get size
syscall 
 
la $t1, INPUT1 #get address of free space
sb $v0, 0($t1)  # store $v0 value in the adress of free space
lb $t2, 0($t1) # take the value at $v0 from memory and put in $t2

mul $s0, $t2, 4 #calculate allocated size
addi $a0, $s0, 0# determine where on the heap we are 
li $v0, 9 # allocate size
syscall

addi $s1, $v0, 0 #save address of heap onto $s1
addi $t4, $s1, 0 #save address of heap onto $t4
add $t5, $s1, $s0 
subi $t5, $t5, 4 #max address of heap on $t5 
addi $t3, $zero, 0 #define i
loop:
#ask user input
li $v0,4  
la $a0, MSG2 
syscall
#system call to get user input
li $v0,5  
syscall 
#take user input and put into array address
sw $v0, 0($s1)
addi $s1, $s1, 4
addi $t3, $t3, 1
blt $t3, $t2, loop

li $v0,4   # system call to print MSG3 
la $a0, bracket1 
syscall
sub $s1, $s1, $s0
addi $t3, $zero, 0
subi $t2, $t2, 1
loop1:
lw $t7, 0($s1)
li $v0, 1
add $a0, $t7, $zero
syscall
li $v0,4   # system call to print MSG3 
la $a0, comma
syscall
addi $s1, $s1, 4
addi $t3, $t3, 1
blt $t3, $t2, loop1
lw $t7, 0($s1)
li $v0, 1
add $a0, $t7, $zero
syscall
li $v0,4   # system call to print MSG3 
la $a0, bracket2 
syscall




#Reverse the loop
li $v0,4   # system call to print MSG3 
la $a0, MSG3 
syscall 

loop2:
bge $t4, $t5, exit
#$s2 holds the value of 
lw $s2, 0($t4)
lw $s3, 0($t5)
sw $s3, 0($t4)
sw $s2, 0($t5)
addi $t4, $t4, 4
subi $t5, $t5, 4
j loop2
exit:
#print reversed array
li $v0,4   # system call to print MSG1 
la $a0, bracket1
syscall 
sub $s1, $s1, $s0
addi $s1, $s1, 4
addi $t3, $zero, 0
loop3:
lw $t7, 0($s1)
li $v0, 1
add $a0, $t7, $zero
syscall
li $v0,4   # system call to print MSG3 
la $a0, comma
syscall
addi $s1, $s1, 4
addi $t3, $t3, 1
blt $t3, $t2, loop3
lw $t7, 0($s1)
li $v0, 1
add $a0, $t7, $zero
syscall
li $v0,4   # system call to print MSG3 
la $a0, bracket2 
syscall




li $v0, 10 #end program



 
.data 
 
MSG1: .asciiz "Enter the size of the array " 
MSG2: .asciiz "enter number: " 
MSG3: .asciiz "\nReversing array....\n" 
bracket1: .asciiz "{"
bracket2: .asciiz "}"
comma: .asciiz ","
# reserve a word space 
INPUT1: .space 4 
INPUT2: .space 4
