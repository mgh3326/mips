.text
main:
li $v0,0
li $s0,1
li $s1,20
for:
add $v0,$v0,$s0
addi $s0,$s0,2
ble $s0,$s1,for

move $a0,$v0
li $v0,1
syscall
li $v0,10
syscall