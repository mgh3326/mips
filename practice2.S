#  1~30까지 합구하기

.text

li $s0, 1 # result
li $s1, 1 # index

for:
    addi $s1,$s1,1
    add $s0,$s0,$s1
    blt $s1,30, for


# Exceed:

# Result:
    move   	$a0,$s0       	# pass result to syscall
    li          	$v0, 1        	# specify syscall is a write integer
    syscall  