

# The ultimate manuscript config
Allows you to edit in pandoc markdown, keeping tables and figures separate and contained. Export to latex, docx (using docx reference template), or html.

It is also possible to edit in chapters using multiple *.md files.
See [this link](https://stackoverflow.com/questions/4779582/markdown-and-including-multiple-files) for details.

## Tables
In the tables folder need to be either markdown (as a simple table), or html for more complex table formats (ie cells spanning multiple cols/rows).
The tables need to have a tag (as per pandoc-crossref) in the caption for MD or underneath the table for HTML format - see examples.
The 

## Compiling
For example:

```console
foo@bar:~$ bash to_docx.sh folder style.csl
```
Where the folder is the folder containing the content to be compiled, eg main or supplementary or chapter.

## Dependencies
To perform a compilation with a *.sh script, you will require installations of:

* pandoc
* Some form of Latex installation
* CMU fonts for basic docx template  
Filters:  
* [pandoc-crossref](https://github.com/lierdakil/pandoc-crossref) (available in AUR or Homebrew etc)