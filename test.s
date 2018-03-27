#
#  First MIPS program
#
          .data		#Start of data segment
One:   .word    1          # first value, initialized to 1
Two:   .word    2          # second value, initialized to 2

# program to add 1+2!

          .text #Start of text segment
main:		
# load constants and add values
          lw       $s0,One        # first operand
          lw       $s1,Two       # second operand
          addi     $s2,$s0,2   # add
# note registers in an add instrcution need not be distinct
# print value
          move   $a0,$s0       # pass result to syscall
          li          $v0, 1        # specify syscall is a write integer
          syscall                   # execute syscall
# all done....
          li          $v0, 10       #  adios.....
          syscall	
