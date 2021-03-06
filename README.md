# Grammar-of-CSR
This is a notebook associated with the _Social & Legal Studies_ Paper "Human Rights and the Grammar of Corporate Social Responsibility"

The supplementary data files are arranged towards reproducibility and with this in mind all computation associated with the paper was carried out using R, a free and open source statistical programming language.

R can be installed by following instructions on the R Project's website:

[https://r-project.org](https://r-project.org)

It may be advantageous to employ an Integrated Learning Environment (IDE) such as RStudio to follow the instructions for reproducing the paper.

A GPL version of RStudio can be downloaded from:

[https://rstudio.com](https://rstudio.com)

Instructions for reproducing the paper's calculations, tables and figures are contained in the files '[GrammarSocialResponsibility.html](https://cokelly.github.io/Grammar-of-CSR/notebooks/GrammarSocialResponsibility.html)' or '[GrammarSocialResponsibility.Rmd](https://github.com/cokelly/Grammar-of-CSR/blob/master/notebooks/GrammarSocialResponsibility.Rmd)' in the 'notebooks' folder. Using RStudio it is easy to process this file as a notebook and read as an html file to be opened and read in a browser such as Firefox or Chrome.

A somewhat processed version of the dataset is contained in the file '[docs.RDS](https://github.com/cokelly/Grammar-of-CSR/tree/master/data)' in the data folder. RDS files are designed for reading compressed information into R using the base 'readRDS' function. The reports used are outlined in footnote 4 in the main paper. PDF files were downloaded and read into R using the '[readtext](https://readtext.quanteda.io/articles/readtext_vignette.html)' library. All punctuation was stripped and the text was converted to lowercase. The reports were also lemmatised, meaning that some words (plurals etc) were replaced by their roots) and included as '[docs_nostops.RDS](https://github.com/cokelly/Grammar-of-CSR/tree/master/data)'

If you wish to load the Raw data from the original pdf files email me for a link to the data set at [c.okelly@qub.ac.uk](mailto:c.okelly@qub.ac.uk) and then use the instructions in the '[GetDocs.R](https://github.com/cokelly/Grammar-of-CSR/blob/master/notebooks/GetDocs.R)' script. 
