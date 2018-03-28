#
#  First MIPS program
#
          .data		#Start of data segment
My_val:   .word    1          # first value, initialized to 1
Two:   .word    2          # second value, initialized to 2

# program to add 1+2!

          .text #Start of text segment
main:		
# load constants and add values
          lw       $s0,My_val        # first operand load word $s0 << My_val
          lw       $s1,Two       # second operand   load word $s1 << Two
          add     $s2,$s0,$s1   # add s2 << s0 + s1
          li    $a0,2
# note registers in an add instrcution need not be distinct
# print value
          move   $a0,$s2       # pass result to syscall a0 << s2
          li          $v0, 1        # specify syscall is a write integer
          syscall                   # execute syscall
# all done....
          li          $v0, 10       #  adios.....
          syscall	
