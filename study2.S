.data
n: .word 10
list: .word 8,2,,6,4,10,3,7,1,5,1

.text
main:
li $v0,0

li $s1,5

lw $s0,n

li $t0,0

la $t3,list

for:
bge $t0,$s0,forend
addi $t0$t0,1
lw $t2,0($t3)
ble $t2,$t1,skip
addu $v0,$v0,$t2
skip:
addiu $t3,t3,4
j for
forend:
# addi $s0,$s0,2
# ble $s0,$s1,for

move $a0,$v0
li $v0,1
syscall
li $v0,10
syscall