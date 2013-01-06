#!/bin/sh

# The script is used to make soft link to HOME

DESTDIR="${HOME}/"

for f in *; do
    file_ext=${f##*.} # get the file extension
    DESTFILE="${DESTDIR}/.$f" # the name of destination file

    # skip the distributing shell script
    [[ $file_ext = "sh" ]] && continue

    # remove the existing files
    [[ -e $DESTFILE ]] && rm -rf $DESTFILE

    # make a linkage to that file
    ln -sf "`pwd`/$f" "${DESTFILE}"
done

echo "Installation Done!"
