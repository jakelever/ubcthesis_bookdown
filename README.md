# UBC Thesis template using Bookdown

This is skeleton Bookdown code to create a thesis that complies with the [UBC formatting guidelines](https://www.grad.ubc.ca/current-students/dissertation-thesis-preparation/formatting-requirements) for a thesis, specifically a PhD thesis. Bookdown allows you to easily put in plots and other R code inline with your thesis text. Plus it can manage citations and cross-references.

## Based On

This is a modified version of the existing [ubcthesis Latex template](https://faculty.washington.edu/mforbes/projects/ubcthesis/) created by Michael McNeil Forbes.

## Dependencies

Basically you need RStudio so it's not painful. You will need up-to-date versions of the R packages: knitr and bookdown. If there are weird Latex issues, try installing tinytex and restarting RStudio. Latex/tinytex should manage installing all needed Latex packages.

## Using it.

Fill in the following and before you know it, you'll have a finished thesis.

- **Title & author**: These need to be updated in the [index.Rmd](https://github.com/jakelever/ubcthesis_bookdown/blob/master/index.Rmd) and [abstract.tex](https://github.com/jakelever/ubcthesis_bookdown/blob/master/abstract.tex) files.
- **Committee**: The examining and additional committee info should be put into the [abstract.tex](https://github.com/jakelever/ubcthesis_bookdown/blob/master/abstract.tex) file
- **Abstract, lay summary & preface**: Also go into the [abstract.tex](https://github.com/jakelever/ubcthesis_bookdown/blob/master/abstract.tex) file
- **Acknowledgements & Dedication**: Go into the [index.Rmd](https://github.com/jakelever/ubcthesis_bookdown/blob/master/index.Rmd) file
- **Abbreviations**: Edit the tab-delimited abbreviations.tsv file (which is loaded in [index.Rmd](https://github.com/jakelever/ubcthesis_bookdown/blob/master/index.Rmd) and rendered using knitr kable)
- **Bibliography**: Goes into the [thesis.bib](https://github.com/jakelever/ubcthesis_bookdown/blob/master/thesis.bib) file (in BibTex format)
- **Previous Degree**: Goes in the [preamble.tex](https://github.com/jakelever/ubcthesis_bookdown/blob/master/preamble.tex) file
- **New Chapters**: Create new .Rmd files using the same numbering as the existing 01-, 02-, etc format. Reorder as necessary and the numbering will be managed automatically.

An example of a figure and table with captions are shown in [02-research.Rmd](https://github.com/jakelever/ubcthesis_bookdown/blob/master/02-research.Rmd). These are then indexed automatically in the list of figures and tables. References are done using the square brackets format (e.g. [@meyer2003pressures])

## Building it.

Either use the Knit button in RStudio or run the following command(s).

```r
library(bookdown)

# For a PDF
bookdown::render_book("index.Rmd", "bookdown::pdf_book")

# For a Word file - useful for Track Changes
bookdown::render_book("index.Rmd", "bookdown::word_document2")
```

Note that the Word file will not match the appropriate formatting and will be missing the title page, abstract, lay summary and preface (things before the Table of Contents). So you'd need to add them in manually. But it may still be useful to enable easy editing by supervisors & collaborators.

## Adapting for Another University

The general format is probably mostly valid for theses at other universities. The quick changes are the institution name and location in [genthesis.cls](https://github.com/jakelever/ubcthesis_bookdown/blob/master/genthesis.cls). Do a find & replace for "University of British Columbia" and "Vancouver". You'd also likely need to change some of the text of the main page to comply with what's expected at your university. That is also in [genthesis.cls](https://github.com/jakelever/ubcthesis_bookdown/blob/master/genthesis.cls). 

## Bibliography Files per Chapter

If you want to have a citation file for each chapter (e.g. 01-intro.bib, etc), you can include the code below to merge them into one bib file (and remove duplicates). This can be useful if your chapters are already Markdown or Latex based papers. Add this code to the index.Rmd file (in an R block) and change the bib file (in the header bit of that file) to thesis.bib.

````
```{r bibliographyMerge, eval=T, echo=F}
library(dplyr)
library(kableExtra)
library(RefManageR)
BibOptions(check.entries=F)
bibfiles <- list.files(pattern = "\\.bib$")
bibfiles <- grep("thesis.bib",bibfiles,invert=T,value=T)
bib <- ReadBib(bibfiles[1])
for(bibfile in bibfiles[2:length(bibfiles)])
  bib <- suppressWarnings(suppressMessages(merge(bib,ReadBib(bibfile))))

suppressWarnings(suppressMessages(WriteBib(bib, file='thesis.bib',check=F)))
```
````

## Issues

If you encounter any problems, please [file an issue](https://github.com/jakelever/ubcthesis_bookdown/issues) along with a detailed description.
