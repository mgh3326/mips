.data

str1:     .asciiz 	"number = "
str2:     .asciiz	 "\n"
str3:     .asciiz 	"! =  "
str4:     .asciiz 	" \n"

input:      .word    0
result:     .word    0
#----------------------------------------------------------------------

.text

main:
      li 	$v0,4     	# print "number = "
      la  	$a0,str1
      syscall
     
      li   	$v0,4
      la   	$a0,str2	# "\n"
      syscall

      li   	$v0, 5     # input number
      syscall
      
      sw   	$v0,input # li 5 >> input

#------------------------------------------
      li   	$t0,1      
      li   	$t1,1
      bgt  	$t1,$v0,end

for:    

      mul  	$t0,$t0,$t1
      addi 	$t1, $t1,1

      ble 	$t1,$v0, for
#----------------------------------------      

end: sw  	$t0,result
     
     
   # print  result   
     
      li   	$v0,1
      lw   	$a0,input
      syscall
     
      li   	$v0,4
      la   	$a0,str3	# "! =  "
      syscall
      
      li   	$v0,1
      lw   	$a0,result
      syscall

     
      li   	$v0,4
      la   	$a0,str4	# " \n"
      syscall

      li   	$v0,10
      syscall
