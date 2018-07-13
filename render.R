library(bookdown)
library(tinytex)

bookdown::render_book("index.Rmd", "bookdown::pdf_book", clean = FALSE)
bookdown::render_book("index.Rmd", "bookdown::word_document2")

tinytex::pdflatex('_book/thesis.tex')
#tinytex::pdflatex('thesis.tex')
