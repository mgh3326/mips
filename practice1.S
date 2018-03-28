# 10개의 정수중 3보다 큰정수의 개수구하기, 1~30까지 합구하기
.data 

Num: .word 1,2,3,4,5,6,7,8,9,10

.text

li $s0, 0 # result
li $s1, 0 # index
li $t0, 1
la $v1,Num		# $v1 = Num address
li $t3, 3
li $t0, 0
Up:
    addi $s0,$s0,1
    
for:
	# sll		$v0,$t0,2	# $v0 = a*4
	mul $v0,$t0,4
	addu	$v0,$v0,$v1	# $v0 = pow2 + a*4
	lw		$s2,0($v0)	# $v0 = pow2[a]
    addi $t0,$t0,1
    addi $s1,$s1,1
    bgt $s2,3,Up
    blt $s1,10,for

sub $s0,$s0,1
move $v0,$s0


# Exceed:

Return:
# print value
          	move   	$a0,$v0       	# pass result to syscall
          	li          	$v0, 1        	# specify syscall is a write integer
          	syscall                   	# execute syscall
# all done....
         	li          	$v0, 10       	#  adios.....
         	syscall	
