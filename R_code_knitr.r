# R_code_knitr.r

setwd("C:/lab/")

library(knitr)

# starting from the code folder where framed.sty is put!

stitch("~/Downloads/R_code_temp.r", template=system.file("misc", "knitr-template.Rnw", package="knitr"))

