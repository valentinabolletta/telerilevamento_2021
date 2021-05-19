#R_code_variability.r

library(raster)
library(RStoolbox)

setwd("c:/lab/")

sent <- brick("sentinel.png")
sent

#NIR 1, RED 2, GREEN 3
#r=1, g=2, b=3

plotRGB(sent) 



