# UBC Thesis template using Bookdown

This is skeleton Bookdown code to create a thesis that complies with the [UBC formatting guidelines](https://www.grad.ubc.ca/current-students/dissertation-thesis-preparation/formatting-requirements) for a thesis, specifically a PhD thesis. Bookdown allows you to easily put in plots and other R code inline with your thesis text. Plus it can manage citations and cross-references.

## Based On

This is a modified version of the existing [ubcthesis Latex template](https://faculty.washington.edu/mforbes/projects/ubcthesis/) created by Michael McNeil Forbes.

## Dependencies

Basically you need RStudio so it's not painful. You will need up-to-date versions of the R packages: knitr and bookdown. If there are weird Latex issues, try installing tinytex and restarting RStudio. Latex/tinytex should manage installing all needed Latex packages.

## Using it.

Fill in the following and before you know it, you'll have a finished thesis.

- **Title & author**: These need to be updated in the index.Rmd and abstract.tex files.
- **Committee**: The examining and additional committee info should be put into the abstract.tex file
- **Abstract, lab summary & preface**: Also go into the abstract.text file
- **Acknowledgements & Dedication**: Go into the index.Rmd file
- **Abbreviations**: Edit the tab-delimited abbreviations.tsv file (which is loaded in index.Rmd and rendered using knitr kable)
- **Bibliography**: Goes into the thesis.bib file (in BibTex format)
- **New Chaptors**: Create new .Rmd files using the same numbering as the existing 01-, 02-, etc format. Reorder as necessary and the numbering will be managed automatically.

An example of a figure and table with captions are shown in 02-research.Rmd. These are then indexed automatically in the list of figures and tables. References are down using the square brackets format (e.g. [@meyer2003pressures])

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
