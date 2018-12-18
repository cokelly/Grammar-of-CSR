# Grammar-of-CSR
This is a notebook associated with the Social and Legal Studies Paper "Human Rights and the Grammar of Corporate Social Responsibility"

The supplementary data files are arranged towards reproducibility and with this in mind all computation associated with the paper was carried out using R, a free and open source statistical programming language.

R can be installed by following instructions on the R Project's website:

[https://r-project.org](https://r-project.org)

It may be advantageous to employ an Integrated Learning Environment (IDE) such as RStudio to follow the instructions for reproducing the paper.

A GPL version of RStudio can be downloaded from:

[https://rstudio.com](https://rstudio.com)

Instructions for reproducing the paper's calculations, tables and figures are contained in the files '[notebooks/GrammarSocialResponsibility.html](notebooks/GrammarSocialResponsibility.html)' or '[notebooks/GrammarSocialResponsiiblity.Rmd](notebooks/GrammarSocialResponsiiblity.Rmd)'. Using RStudio it is easy to process this file as a notebook and read as an html file to be opened and read in a browser such as Firefox or Chrome.

A somewhat processed version of the dataset is contained in the file '[data/docs.RDS](data/docs.RDS)'. RDS files are designed for reading compressed information into R using the base 'readRDS' function. The reports used are outlined in footnote 4 in the main paper. PDF files were downloaded and read into R using the '[https://readtext.quanteda.io/articles/readtext_vignette.html](readtext)' library. All punctuation was stripped and the text was converted to lowercase. The reports were also lemmatised, meaning that some words (plurals etc) were replaced by their roots) and included as '[data/docs_nostops.RDS](data/docs_nostops.RDS)'

If you wish to load the Raw data from the original pdf files email me for a link to the data set at [mailto:c.okelly@qub.ac.uk](c.okelly@qub.ac.uk) and then use the instructions in the 'notebooks/GetDocs.R' script. 