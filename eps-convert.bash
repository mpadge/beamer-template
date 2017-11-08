#!/bin/sh

shopt -s dotglob  ## Optionally would allow matches for directories beginning with .
shopt -s nullglob

function traverse () {
    local a file
    for a; do
        for file in "$a"/*; do
            if [[ -d $file ]]; then
                traverse "$file"
            elif [[ $file =~ \.jpg$ ]]; then
                echo "*****Converting jpg file $file..."
                convert "$file" "${file/.jpg/.eps}"
            elif [[ $file =~ \.JPG$ ]]; then
                echo "*****Converting jpg file $file..."
                convert "$file" "${file/.JPG/.eps}"
            elif [[ $file =~ \.png$ ]]; then
                echo "*****Converting png file $file..."
                convert "$file" "${file/.png/.eps}"
            fi
        done
    done
}

traverse "./"
