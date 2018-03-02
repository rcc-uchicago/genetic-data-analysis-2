# Analysis of Genetic Data 2: Mapping Genome-wide Associations

Materials for the RCC workshop, "Analysis of Genetic Data 2: Mapping
Genome-Wide Associations".

**Date:** Tuesday, March 6, 2018<br>
**Time:** 2:00 pm to 4:30 pm<br>
**Location:** Zar Room, John Crerar Library
([OpenStreetMap](https://www.openstreetmap.org/search?query=john%20crerar%20library#map=18/41.79053/-87.60282))<br>
**Instructor:** Peter Carbonetto

## Introduction

In this short workshop, we will use popular software tools such as
PLINK and GEMMA to generate interesting biological insights from
large-scale genetic data. In particular, we will conduct a genome-wide
association analysis to identify genetic contributors to physiological
traits in mice. (Due to data sharing restrictions, we cannot use human
data.) While anyone who is curious about the "genomics revolution" may
attend, this workshop is mainly intended to develop practical
computing skills for graduate students and other researchers working
with genetic data-concepts such as "genotype" and "allele frequency"
will not be explained. We will practice "live coding" throughout, so
please bring your laptop!

## Prerequisites

This workshop assumes participants are already familiar with R and a
UNIX-like shell environment. An RCC user account is recommended, but
not required-temporary access to the RCC cluster will be available in
class. All participants must bring a laptop with a Mac, Linux, or
Windows operating system that they have administrative privileges on.

## Other information

+ This workshop attempts to apply elements of the
[Software Carpentry approach](http://software-carpentry.org/lessons).
See also
[this article](http://dx.doi.org/10.12688/f1000research.3-62.v2).
Please also take a look at the [Code of Conduct](conduct.md), and
the [license information](LICENSE.md).

+ To generate PDFs of the slides from the R Markdown source, run `make
slides.pdf` in the [docs](docs) directory. For this to work, you will
need to to install the
[rmarkdown](https://cran.r-project.org/package=rmarkdown) package in
R, as well as the packages used in [slides.Rmd](code/slides.Rmd). For
more details, see the [Makefile](docs/Makefile).

+ See also the [instructor notes](NOTES.md).

## Credits

These materials were developed by
[Peter Carbonetto](http://pcarbo.github.io) at the
[University of Chicago](https://www.uchicago.edu). Thank you to
[Matthew Stephens](http://stephenslab.uchicago.edu) for his support
and guidance. Also thanks to
[Jonathan Flint](https://twitter.com/jonathan_flint1), Jerome Nicod
and the other members of the Flint lab for making the data from the
[CFW sequencing study](https://wp.cs.ucl.ac.uk/outbredmice) available
for public use.
