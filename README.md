# Analysis of Genetic Data 2: Mapping Genome-wide Associations

In this short workshop, we will use popular software tools such as
GEMMA to generate interesting biological insights from large-scale
genetic data. In particular, we will conduct a genome-wide association
analysis (GWAS) to identify genetic contributors to physiological
traits in mice. (We cannot use human data in this workshop due to data
sharing restrictions.) This workshop is mainly intended to develop
practical computing skills for researchers working with genetic
data—concepts such as "genotype" and "genetic variant" will not be
explained. This will be a hands-on workshop, and we will do "live
coding" throughout, so please bring your laptop!

Attendees will: (1) work through the basic steps of a genome-wide
association analysis (GWAS); (2) understand how phenotype and genotype
data from a GWAS are encoded in computer files; (3) appreciate some of
the benefits and complications of using linear-mixed models (LMMs) for
GWAS; (4) use R and command-line tools to inspect and prepare the GWAS
data for analysis; (5) use GEMMA to implement a "genome-wide"
association analysis; (6) use R to visualize and interpret the results
of an association analysis; (7) learn through "live coding."

## Prerequisites

This hands-on workshop assumes participants are already familiar with
R and a UNIX-like shell environment. An RCC user account is
recommended, but not required. Guest access to the RCC cluster will be
available in class to those with no RCC account. All participants must
bring a laptop with a Mac, Linux, or Windows operating system that
they have administrative privileges on.

## Other information

+ This workshop attempts to apply elements of the [Software Carpentry
approach][swcarpentry].  See also [this article][swc-paper].  Please also
take a look at the [Code of Conduct](conduct.md), and the [license
information](LICENSE.md).

+ To generate PDFs of the slides from the R Markdown source, run `make
slides.pdf` in the [docs](docs) directory. For this to work, you will
need to to install the [rmarkdown][rmarkdown] package in R, as well as
the packages used in [slides.Rmd](slides.Rmd). For more details,
see the [Makefile](Makefile).

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

[swcarpentry]; http://software-carpentry.org/lessons
[swc-paper]: http://dx.doi.org/10.12688/f1000research.3-62.v2
[rmarkdown]: https://cran.r-project.org/package=rmarkdown
