#!/bin/bash

if [ -z "$1" ]
then
    FOLDER=main
else
    FOLDER=$1
fi

# can add more custom filters to script as needed
pandoc -s -f markdown -t json $FOLDER/*.md \
--lua-filter=./filters/instable.lua | \
pandoc-crossref --pipe | \
pandoc -s -f json -t latex \
-o latex/$FOLDER.tex \
--metadata-file=metadata.yaml \
--bibliography=references.bib \
--biblatex

cp references.bib latex/references.bib
cp csl/$STYLE latex/$STYLE

cd latex

pdflatex $FOLDER.tex
biber $FOLDER
pdflatex $FOLDER.tex

cd ..