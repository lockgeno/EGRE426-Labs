########################################################### 
#Lab 1 of 426
#Part 1 sum an integer without loop 
########################################################### 
 
.text 
.globl main 
 
main: 
#Part 1 Sum from 1 to N using loop
li $v0,4   # system call to print MSG1 
la $a0, MSG1 
syscall 
 
li $v0,5   # system call to get N
syscall 
 
la $t5, INPUT1 
add $t3, $v0, $zero

addi $t1, $zero, 1 #i

 
add $s0, $t1, $t3
srl $s1, $t3, 1
mul $s3, $s0, $s1

li $v0,4   # system call to print MSG1 
la $a0, MSG2 
syscall

li $v0, 1
add $a0, $s3, $zero
syscall

li $v0, 10
syscall


 
.data 
 
MSG1: .asciiz "Enter the value of N = " 
MSG2: .asciiz "Sum of 1 to N is: " 

 
# reserve a word space 
INPUT1: .space 4 
INPUT2: .space 4
