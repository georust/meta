#!/bin/bash -ex

BASENAME=georust-logo
SOURCE_SVG=src/$BASENAME.svg

function minify_png {
    if ! command -v pngquant &> /dev/null
    then
        echo "pngquant could not be found"
        exit 1
    fi

    while test $# -gt 0
    do

    INPUT=$1
    TMP_FILE="${1}-tmp.png"
    pngquant $INPUT --output "$TMP_FILE" && mv "$TMP_FILE" $INPUT

    shift
    done
}


function generate_favicon {
    if ! command -v convert &> /dev/null
    then
        echo '`convert` could not be found - is imagemagick installed?'
        exit
    fi
    convert $SOURCE_SVG -define icon:auto-resize=64,48,32,16 generated/favicon.ico

    cp $SOURCE_SVG generated/favicon.svg
}

function export_sizes {
    for size in $@; do
        OUTPUT=generated/$BASENAME-$size.png
        inkscape -w $size -h $size $SOURCE_SVG -o $OUTPUT

        WHITE_OUTPUT=generated/$BASENAME-white-bg-$size.png
        inkscape -b FFFFFF -w $size -h $size $SOURCE_SVG -o $WHITE_OUTPUT

        minify_png $OUTPUT $WHITE_OUTPUT
    done
}

generate_favicon
export_sizes 400 800 1600 3200


