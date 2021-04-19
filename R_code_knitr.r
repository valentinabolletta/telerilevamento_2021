# R_code_knitr.r

setwd("C:/lab/")

library(knitr)

# starting from the code folder where framed.sty is put!

stitch("R_Code_greenland.r.txt.txt", template=system.file("misc", "knitr-template.Rnw", package="knitr"))

