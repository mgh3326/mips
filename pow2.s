	.data		
Two:   	.word    	2          # first value, initialized to 2
Three: 	.word    	3          # second value, initialized to 3
pow2:	.word	1, 2, 4, 8, 16, 32, 64, 128        

.text		
main:		
# load constants and add values
	lw    	$a0,Two        	# first operand	$a0 = 2 (b)
	lw     	$a1,Three       	# second operand	$a1 = 3 (c)		
	addu	$a0,$a0,$a1          # a = b + c, $a0 = a a0 =5
	bltz	$a0, Exceed          	# goto Exceed if $v0 < 0
	slti	$v0,$a0,8              # $v0 = a < 8 true 1?
	beq		$v0,$zero, Exceed  # goto Exceed if $v0 == 0 a >= 8?
	la		$v1,pow2		# $v1 = pow2 address
	sll		$v0,$a0,2	# $v0 = a*4
	addu	$v0,$v0,$v1	# $v0 = pow2 + a*4
	lw		$v0,0($v0)	# $v0 = pow2[a]
	j		Return		# goto Return
Exceed:	
	addu	$v0,$zero,$zero	# $v0 = 0
Return:
# print value
          	move   	$a0,$v0       	# pass result to syscall
          	li          	$v0, 1        	# specify syscall is a write integer
          	syscall                   	# execute syscall
# all done....
         	li          	$v0, 10       	#  adios.....
         	syscall	

