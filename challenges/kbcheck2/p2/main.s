01: .data 
02:     IntArray:
03:         .int 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
04: 
05: .text
06:     .globl _start
07:     _start:
08: 
09:         xor  %eax, %eax  # Bitwise exclusive OR operation. eax = eax XOR eax
10: 
11:         movl $0x16, %eax
12: 
13:         movl $0x0, %ecx
14:         movl $0x9, %edi
15:         movl %eax, IntArray(%ecx, %edi, 1)
16: 
17:         # Exit the program
18:         movl $1, %eax
19:         movl $0, %ebx
20:         int  $0x80
