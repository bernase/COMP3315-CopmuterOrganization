.data
	list: .space 100 #list[25], 25*4=100
	space: .asciiz " "
.text
main:
	addi $t0,$zero,25
	lui $t2,0x1001

	add $a0,$zero,$t0
	add $a1,$zero,$t2
	
	jal fillarray	
	jal printarray
							
	end:
		addi $v0,$zero,10 #exit
		syscall
			
fillarray:				
	addi $t1,$zero,0 #t=0
	while:
		slt $t3,$t1,$a0
		beq $t3,$zero, whileend
		sw $t1,0($a1)
		addi $t1,$t1,1 #t++
		addi $a1,$a1,4
		j while
	whileend:	
	jr $ra 
	
printarray:
	addi $t1,$zero,7 #t=0 yaptýðýmda outputa 32 0 0 0 0 0 0 ekleniyordu,kodda oynadým ve 7 yapýnca düzeldi. Nedeninden tam emin deðilim, sanýrým a0 iþe alakalý :( 
	whilee:
		slt $t4,$t1,$a0
		beq $t4,$zero, whileeend
		lw $t5, -100($a1)
		addi $t1,$t1,1 #t++
		addi $a1,$a1,4
		
		#print integer
		li $v0,1 
		add $a0,$t5,$zero
		syscall
		
		# print " "
		li $v0, 11 
		li $a0, 32
		syscall
		
		j whilee
	whileeend:	
	jr $ra 
