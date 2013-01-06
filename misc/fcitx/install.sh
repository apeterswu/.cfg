#!/bin/sh

DESTDIR="${HOME}/.config/fcitx/"
for f in *; do
    file_ext=${f##*.} # get the file extension
    DESTFILE="${DESTDIR}/$f" # the name of destination file

    # skip the distributing shell script
    [[ $file_ext = "sh" ]] && continue

    # remove the existing files
    [[ -e $DESTFILE ]] && rm -rf $DESTFILE

    # make a linkage to that file
    ln -sf "`pwd`/$f" "${DESTDIR}"
done

echo "Installation Done!"
