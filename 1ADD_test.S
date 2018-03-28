

	.data	#Start of data segment
	
	txt1:	.asciiz "result sum = " #Store a null-terminated string in memory
	txt2:	.asciiz "result avg = "
	txt3:	.asciiz "\n"

	input:	.word	10, 20, 30, 40, 50, 60, 70, 80, 90, 100
	addre:	.word	0 #Start of data segment
	avgre:	.word	0

	.text #?? Start of text segment
main:
	li  $t0,0		# set count=0 (actually addui $t0,0)
	li	$t5,0		# set add=0 (actually addui $t5,0)
	li	$t6,0		# set avg=0 (actually addui $t6,0) 
	la	$t3,input 		# $t3<- addr of input


for:	bgt	$t0,11,forend	# end with t0 = 11 if ($t0 > 11) goto forend
	addi	$t0,$t0,1		# inc 1
	lw 	$t2,0($t3)	# load 10,20,.....
	addu	$t5,$t5,$t2	# sum each data
	addiu	$t3,$t3,4		#inc by word size
	j	for

forend:



#calculate  avg
	div	$t6,$t5,10	


# print result  
print:     
	li   	$v0,4
	la   	$a0,txt1		# "result sum : "
	syscall
	
	sw   	$t5,addre
   
	li   	$v0,1
	move   	$a0,$t5	# print sum

	syscall
      
	li   	$v0,4
	la   	$a0,txt3		# "\n"
	syscall
	
	li   	$v0,4
	la   	$a0,txt2		# "result avg : "
	syscall
	
	sw	$t6,avgre

	li   	$v0,1
	lw   	$a0,avgre	# print avg
	syscall


Exit:	li   	$v0,10
	syscall
