#!/bin/bash

# The script is used to remove the prefix . of the filename

for f in .*; do
    if [[ -f $f ]]; then
        ff=`echo $f | sed 's/^\.//'`
        mv $f $ff
    fi
done
