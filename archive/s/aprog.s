	.file	"prog.c"
	.text
	.globl	addtwo
	.type	addtwo, @function
addtwo:
	leal	(%rdi,%rsi), %eax
	ret
	.size	addtwo, .-addtwo
	.globl	addtwob
	.type	addtwob, @function
addtwob:
	addl	%esi, %edi
	movl	%edi, (%rdx)
	ret
	.size	addtwob, .-addtwob
	.globl	main
	.type	main, @function

// sayhello:
// 	# write our string to stdout.
// 	pushq	%rbx
// 	movq    $len, (%edx)       # third argument: message length.
// 	lea    msg(%rip), %ecx       # second argument: pointer to message to write.
// 	//lea output(%rip), %rdi
// 	movq    $1, (%ebx)	        # first argument: file handle (stdout).
// 	movq    $4, (%eax)	        # system call number (sys_write).
// 	int     $0x80           # call kernel.

// 	# and exit.

// 	movq    $0, (%ebx)         # first argument: exit code.
// 	movq    $1, (%eax)         # system call number (sys_exit).
// 	int     $0x80           # call kernel.
// 	popq    %rbx
// 	ret
main:
	pushq	%rbx
	subq	$16, %rsp
	movl	$40, %ebx
	movq	%fs:(%rbx), %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	leaq	4(%rsp), %rdx
	movl	$4, %esi
	movl	$3, %edi
	call	addtwob
	movq	8(%rsp), %rax
	xorq	%fs:(%rbx), %rax

	// call	sayhello

	jne	.L6
	movl	$0, %eax
	addq	$16, %rsp
	popq	%rbx
	ret
.L6:
	call	__stack_chk_fail@PLT
	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:

// .data

// msg:
//         .ascii  "Hello, world!\n"      # the string to print.
//         len = . - msg                  # length of the string.
