#!/bin/bash

if [ -z "$1" ]
then
    FOLDER=main
else
    FOLDER=$1
fi

if [ -z "$2" ]
then
    STYLE=vancouver.csl
else
    STYLE=$2
fi

echo $FOLDER
echo $STYLE

# can add more custom filters to script as needed
pandoc -s -f markdown -t json $FOLDER/*.md \
--lua-filter=./filters/instable.lua | \
pandoc -s -f json -t html \
-o html/$FOLDER.html \
--filter=pandoc-crossref \
--citeproc \
--bibliography=references.bib \
--csl=csl/$STYLE \
--metadata-file=metadata.yaml \
--toc \
--number-sections