.text
.globl main
main:
 jal GoodSubprogram

 la $a0, string1
 jal PrintString

 jal Exit
GoodSubprogram:
 addi $sp, $sp, -4 # save space on the stack (push) for the $ra
 sw $ra, 0($sp) # save $ra
 la $a0, string1
 jal PrintString
 

 li $v0, 4
 la $a0, string1
 syscall

 lw $ra, 0($sp) # restore $ra
 addi $sp, $sp, 4 # return the space on the stack (pop)
 jr $ra
.data
string1: .asciiz "test"
.include "utils.asm"
