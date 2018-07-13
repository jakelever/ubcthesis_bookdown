library(bookdown)
library(tinytex)

# Commands for building the thesis as PDF or Word
bookdown::render_book("index.Rmd", "bookdown::pdf_book", clean = FALSE)
bookdown::render_book("index.Rmd", "bookdown::word_document2")

# Useful for debugging weird Latex issues (compile directly from the latex file)
tinytex::pdflatex('_book/thesis.tex')
