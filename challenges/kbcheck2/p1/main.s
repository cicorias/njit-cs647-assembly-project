01: .data 
02:     IntArray:
03:         .int 1, 2, 3, 4, 5
04: 
05: .text
06:     .globl _start
07:     _start:
08: 
09:         xor  %eax, %eax  # Bitwise exclusive OR operation. eax = eax XOR eax
10:         xor  %ebx, %ebx  # Bitwise exclusive OR operation. ebx = ebx XOR ebx
11: 
12:         movl $0x1234, %eax
13:         movb %al, %bl
14: 
15: 
16:         # Exit the program
17:         movl $1, %eax
18:         movl $0, %ebx
19:         int  $0x80
