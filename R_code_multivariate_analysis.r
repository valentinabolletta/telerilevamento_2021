#R_code_multivariate_analysis.r

library(raster)
library(RStoolbox)

setwd("c:/lab/")

p224r63<-brick("p224r63_2011_masked.grd")
plot(p224r63)
