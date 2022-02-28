.data 
    IntArray:
        .int 1, 2, 3, 4, 5

    Label1:
    	.short 10

    Label2:
    	.int 20

.text
    .globl _start
    _start:

        movw (Label1), %ax	
        addl $0x10, %eax		

        movl $Label2, %ebx		
        addl %eax, (%ebx)		

        movl -10(%ebx), %ecx	
        addl $0x20, %ecx	

        subl $0xa, %ebx
        movl %ecx, (%ebx) 


        # Exit the program
        movl $1, %eax
        movl $0, %ebx
        int  $0x80
