#!/bin/sh

DESTDIR="${HOME}/.config"
CURDIR=${PWD##*/}
DESTFILE="${DESTDIR}/$CURDIR" # the name of destination file

# remove the existing files
[[ -e $DESTFILE ]] && rm -rf $DESTFILE

# make a linkage to that file
ln -sf "`pwd`" "${DESTDIR}"

echo "Installation Done!"
