########################################################### 
#Lab 1 of 426
#Part 1 sum an integer sequence 
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
sw $v0, 0($t5)  # store integer in t5
lw $t3, 0($t5) 

addi $t1, $zero, 1 #i
add $t2, $zero, $zero #sum
 
loop:
bgt  $t1, $t3, end
add $t2, $t2, $t1 #sum
addi $t1, $t1, 1

j loop
end:

li $v0,4   # system call to print MSG1 
la $a0, MSG2 
syscall

li $v0, 1
add $a0, $t2, $zero
syscall

li $v0, 10
syscall


 
.data 
 
MSG1: .asciiz "Enter the valkue of N = " 
MSG2: .asciiz "Sum of 1 to N is: " 

 
# reserve a word space 
INPUT1: .space 4 
INPUT2: .space 4
