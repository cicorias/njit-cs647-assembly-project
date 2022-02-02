// int add(int a, int b) {
//     int c;
//     c = a + b;
//     return c;
// }

// .text

.globl add_foo
.type add_foo, @function
//.text

add_foo: 
    # prologue
    push    (%ebp)
    movl    %esp, %ebp
    # save registers
    push   (%esi)
    push   (%edi)
    push   (%ebx)
    # make room for c
    subl    $4, %esp
    # move b to ebx
    movl    12(%ebp), %ebx
    # a + b
    addl    8(%ebp), %ebx
    # move a+b to c
    movl    %ebx, -16(%ebp)
    # move c to eax
    movl    -16(%ebp), %eax

    # cleanup stack and restore
    addl    $4, %esp
    pop     (%ebx)
    pop     (%edi)
    pop     (%edi)

    # epilogue
    movl    %ebp, %esp

    pop     (%ebp)
    ret

