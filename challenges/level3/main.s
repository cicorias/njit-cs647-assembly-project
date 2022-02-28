.text
    .global _start
    _start:

    
    xor %eax, %eax   # set to 0
    push %eax       # push 0 on stack ---
    push 0x68732f2f  # push //sh
    push 0x6e69622f  # push /bin
    mov  %esp, %ebx   # stack pointer is at prior push, so we can use that for first PARM to execvu
    mov  %eax, %ecx   # second parm, needs to be zero
    mov  %eax, %edx   # thirdd parm, again zero

    mov  $11, %eax    # syscall for execve 
    int  $0x80         # sys int to make call
