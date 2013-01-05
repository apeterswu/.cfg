#!/bin/sh

# The script is used to make soft link to HOME

DEST=$HOME

for f in *; do
    file_ext=${f##*.} # get the file extension

    if [[ $file_ext != "sh" ]]; then
        ln -sf "`pwd`/${f}" "${DEST}/.${f}"
    fi
done

echo "Symbolic linking done!"
