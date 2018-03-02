# A Makefile for generating the PDFs from the R Markdown files.
#
# * Type "make slides" in this directory to generate a PDF of the
#   slides from the R Markdown source.
#
# * Type "make test" to generate a PDF of the slides that also runs
#   the R code.
#
# * Optionally, type "make handout" to generate a PDF document that
#   can be used as a handout to distribute to workshop
#   participants. For improved layout, I recommend setting the YAML
#   header in slides.Rmd to
# 
#     ---
#     title: "Analysis of Genetic Data 2: Mapping Genome-wide Associations"
#     author: Peter Carbonetto
#     header-includes:
#       - \usepackage{newcent}
#     ---
#
# * Type "make clean" to discard the generated PDFs, and all accompanying
#   output.
#

# RULES
# -----
all: slides

slides: slides.pdf

test: slides_test.pdf

handout: handout.pdf

# Generate the slides while also testing the R code.
slides_test.pdf : ../code/slides.Rmd
	Rscript -e 'knitr::opts_chunk$$set(eval = TRUE); \
                    rmarkdown::render("../code/slides.Rmd", \
                    output_file = "../docs/slides_test.pdf")'

# Create the slides.
slides.pdf : ../code/slides.Rmd
	Rscript -e 'knitr::opts_chunk$$set(eval = FALSE); \
                    rmarkdown::render("../code/slides.Rmd", \
                                      output_file = "../docs/slides.pdf")'

# Create the handout.
handout.pdf : ../code/slides.Rmd
	Rscript -e 'knitr::opts_chunk$$set(eval = FALSE); \
                    rmarkdown::render("../code/slides.Rmd", \
                    output_format = "pdf_document", \
                    output_file = "../docs/handout.pdf")'

clean:
	rm -f slides.tex slides.pdf slides_test.pdf handout.pdf


