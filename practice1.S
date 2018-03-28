# 10개의 정수중 3보다 큰정수의 개수구하기, 1~30까지 합구하기
.data 

Num: .word 1,2,3,4,5,6,7,8,9,10

.text

li $s0, 0 # result
li $s1, 0 # index
li $t0, 1
la $t1, Num
li $t3, 3
Up:
    addi $s0,$s0,1
    addi $s1,$s1,1
for:
    bgt $s1,10, Result
    lw	$v0,0($t1)	# $v0 = pow2[a]
    slti	$v0,$a0,3              # $v0 = a < 8 true 1?
    bgt $v0,$t3,Up
    
    
    sll $t0,$s1,2
    mul $t2,$t0,$s1
    add $t1,$t1,$t0
    addi $s1,$s1,1
    j for




# Exceed:

Result:
