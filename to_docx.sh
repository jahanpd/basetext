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
--lua-filter=./filters/instable.lua \
--lua-filter=./filters/ender.lua | \
pandoc -s -f json -t docx \
-o docx/$FOLDER.docx \
--filter pandoc-crossref \
--citeproc --bibliography=references.bib \
--csl=csl/$STYLE \
--metadata-file=metadata.yaml \
--reference-doc docx/reference.docx \
--lua-filter=./filters/pagebreak.lua \
--metadata-file=metadata.yaml \
--number-sections \
--lua-filter=./filters/moveref.lua