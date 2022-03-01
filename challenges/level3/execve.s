.text
    .globl _start
    _start:

    
    xor %eax, %eax   # set to 0
    push %eax       # push 0 on stack ---
    // ----
    // echo -n "/bin//sh" | xxd -e
    // 00000000: 6e69622f 68732f2f               -> parts are in little endian  /bin  //sh
    // ---
    push $0x68732f2f  # push //sh
    push $0x6e69622f  # push /bin
    mov  %esp, %ebx   # stack pointer is at prior push, so we can use that for first PARM to execvu
    mov  %eax, %ecx   # second parm, needs to be zero
    mov  %eax, %edx   # thirdd parm, again zero

    mov  $11, %al    # syscall for execve 
    int  $0x80         # sys int to make call
