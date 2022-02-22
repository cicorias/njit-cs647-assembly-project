# stuff

## setruid is called with 3ee - 1006 1,756  (0011 1110 1110) 

https://man7.org/linux/man-pages/man2/setreuid.2.html

This is user level3

level3:x:1006:1006:,,,:/home/level3:/bin/bash



Some poking around

total 28
drwxr-xr-x  2 level2     level2     4096 Jan 10 23:55 ./
drwx------ 17 level2     level2     4096 Jan 17 12:57 ../
-rwsr-xr-x  1 level3     level3     7672 Jan 10 23:33 helloVuln5*
-rw-r-----  1 level3     level3      133 Jan 10 23:34 oldpasswords.txt
-rw-r--r--  1 heisenburg heisenburg  613 Jan 10 23:33 README.enc
-rw-r--r--  1 level2     level2       23 Jan 10 23:55 shell.bin
level2@CS647:~/Desktop$ la
helloVuln5  oldpasswords.txt  README.enc  shell.bin
level2@CS647:~/Desktop$ cat oldpasswords.txt 
cat: oldpasswords.txt: Permission denied
level2@CS647:~/Desktop$ cat shell.bin
1�Ph//shh/bin����°
                 ̀level2@CS647:~/Desktop$ 
level2@CS647:~/Desktop$ 
level2@CS647:~/Desktop$ 
level2@CS647:~/Desktop$ 
level2@CS647:~/Desktop$ cat README.enc 
pC����@����O�g<�,��.7

                     ^�b����K�mt̨^�g[,�q��l� @/�rb\ו����Yo��s!�ȷ*�9?��A��F���"�sW~,By��e]��+:1M%�
A�.JPbW�j�(<x���d�ɗ�yC�?jh�yS�r�>�"� ����B!)�i
k��|b#�s�}��h��r�_`�\�uh�(�.���vZ��n6_T�
�C8�çw�ֹo�~+]|0_]�(ܟ���YD��7�A|��i@+��~�<v�0��z�Б��FGmw�sF��E3,0�Jo�,%+���)�H�9�����}���+�,Sp��G�Z~6�.���H��!k����cs;�xp㪲ͼv pO묿���S���Ms�ݦ��j��[%e`~��l?���ڲlevel2@CS647:~/Desktop$ 
level2@CS647:~/Desktop$ 
level2@CS647:~/Desktop$ 
level2@CS647:~/Desktop$ gdb -q ./helloVuln5 
Reading symbols from ./helloVuln5...(no debugging symbols found)...done.
(gdb) disassemble main
Dump of assembler code for function main:
   0x080486d4 <+0>:     lea    0x4(%esp),%ecx
   0x080486d8 <+4>:     and    $0xfffffff0,%esp
   0x080486db <+7>:     pushl  -0x4(%ecx)
   0x080486de <+10>:    push   %ebp
   0x080486df <+11>:    mov    %esp,%ebp
   0x080486e1 <+13>:    push   %ebx
   0x080486e2 <+14>:    push   %ecx
   0x080486e3 <+15>:    sub    $0x10,%esp
   0x080486e6 <+18>:    mov    %ecx,%ebx
   0x080486e8 <+20>:    movl   $0x8048888,-0xc(%ebp)
   0x080486ef <+27>:    call   0x80485fb <verifyLevelDecryption>
   0x080486f4 <+32>:    test   %eax,%eax
   0x080486f6 <+34>:    je     0x8048715 <main+65>
   0x080486f8 <+36>:    sub    $0x8,%esp
   0x080486fb <+39>:    pushl  -0xc(%ebp)
   0x080486fe <+42>:    push   $0x804891c
   0x08048703 <+47>:    call   0x8048430 <printf@plt>
   0x08048708 <+52>:    add    $0x10,%esp
   0x0804870b <+55>:    sub    $0xc,%esp
   0x0804870e <+58>:    push   $0x0
   0x08048710 <+60>:    call   0x8048480 <exit@plt>
   0x08048715 <+65>:    sub    $0x8,%esp
   0x08048718 <+68>:    push   $0x3ee
   0x0804871d <+73>:    push   $0x3ee
   0x08048722 <+78>:    call   0x80484a0 <setreuid@plt>
   0x08048727 <+83>:    add    $0x10,%esp
   0x0804872a <+86>:    mov    0x4(%ebx),%eax
   0x0804872d <+89>:    add    $0x4,%eax
   0x08048730 <+92>:    mov    (%eax),%eax
   0x08048732 <+94>:    sub    $0xc,%esp
   0x08048735 <+97>:    push   %eax
   0x08048736 <+98>:    call   0x8048651 <vulnFunction>
   0x0804873b <+103>:   add    $0x10,%esp
   0x0804873e <+106>:   mov    $0x0,%eax
   0x08048743 <+111>:   lea    -0x8(%ebp),%esp
   0x08048746 <+114>:   pop    %ecx
   0x08048747 <+115>:   pop    %ebx
   0x08048748 <+116>:   pop    %ebp
   0x08048749 <+117>:   lea    -0x4(%ecx),%esp
   0x0804874c <+120>:   ret    
End of assembler dump.
(gdb) Quit
(gdb) disassemble setreuid
Dump of assembler code for function setreuid@plt:
   0x080484a0 <+0>:     jmp    *0x804a02c
   0x080484a6 <+6>:     push   $0x40
   0x080484ab <+11>:    jmp    0x8048410
End of assembler dump.
(gdb) disassemble vulnFunction 
Dump of assembler code for function vulnFunction:
   0x08048651 <+0>:     push   %ebp
   0x08048652 <+1>:     mov    %esp,%ebp
   0x08048654 <+3>:     sub    $0x28,%esp
   0x08048657 <+6>:     movl   $0x0,-0x1c(%ebp)
   0x0804865e <+13>:    movl   $0x0,-0x18(%ebp)
   0x08048665 <+20>:    movl   $0x0,-0x14(%ebp)
   0x0804866c <+27>:    movl   $0x0,-0x10(%ebp)
   0x08048673 <+34>:    movl   $0x28,-0xc(%ebp)
   0x0804867a <+41>:    sub    $0xc,%esp
   0x0804867d <+44>:    pushl  0x8(%ebp)
   0x08048680 <+47>:    call   0x80484b0 <strlen@plt>
   0x08048685 <+52>:    add    $0x10,%esp
   0x08048688 <+55>:    mov    %eax,%edx
   0x0804868a <+57>:    mov    -0xc(%ebp),%eax
   0x0804868d <+60>:    cmp    %eax,%edx
   0x0804868f <+62>:    jb     0x80486ab <vulnFunction+90>
   0x08048691 <+64>:    sub    $0xc,%esp
   0x08048694 <+67>:    push   $0x8048854
   0x08048699 <+72>:    call   0x8048470 <puts@plt>
   0x0804869e <+77>:    add    $0x10,%esp
   0x080486a1 <+80>:    sub    $0xc,%esp
   0x080486a4 <+83>:    push   $0x0
   0x080486a6 <+85>:    call   0x8048480 <exit@plt>
   0x080486ab <+90>:    sub    $0x8,%esp
   0x080486ae <+93>:    pushl  0x8(%ebp)
   0x080486b1 <+96>:    lea    -0x1c(%ebp),%eax
   0x080486b4 <+99>:    push   %eax
   0x080486b5 <+100>:   call   0x8048460 <strcpy@plt>
   0x080486ba <+105>:   add    $0x10,%esp
   0x080486bd <+108>:   sub    $0x8,%esp
   0x080486c0 <+111>:   lea    -0x1c(%ebp),%eax
   0x080486c3 <+114>:   push   %eax
   0x080486c4 <+115>:   push   $0x804887a
   0x080486c9 <+120>:   call   0x8048430 <printf@plt>
   0x080486ce <+125>:   add    $0x10,%esp
   0x080486d1 <+128>:   nop
   0x080486d2 <+129>:   leave  
   0x080486d3 <+130>:   ret    
End of assembler dump.
(gdb) x/8xw 0x804a02c
0x804a02c:      0x080484a6      0x080484b6      0x080484c6      0x00000000