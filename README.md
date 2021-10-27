

# The ultimate manuscript config
Allows you to edit in pandoc markdown, keeping tables and figures separate and contained. Export to latex, docx (using dotx reference template), or html.

It is also possible to edit in chapters using multiple *.md files.
See [this link](https://stackoverflow.com/questions/4779582/markdown-and-including-multiple-files) for details.

## Tables
In the tables folder need to be either markdown (as a simple table), or html for more complex table formats (ie cells spanning multiple cols/rows).

## Dependencies
To perform a compilation with a *.sh script, you will require installations of:

* pandoc  
* Some form of Latex installation
Filters:  
* [pandoc-crossref](https://github.com/lierdakil/pandoc-crossref) (available in AUR or Homebrew etc)