#R_code_variability.r

library(raster)
library(RStoolbox)

setwd("c:/lab/")

sent <- brick("sentinel.png")
sent

#NIR 1, RED 2, GREEN 3
#r=1, g=2, b=3

plotRGB(sent) 

plotRGB(sent, stretch="lin")
plotRGB(sent, r=2, g=1, b=3, stretch="lin")

nir <- sent$sentinel.1
red <- sent$sentinel.2

ndvi <- (nir-red) / (nir+red)
plot(ndvi)

cl <- colorRampPalette(c('black','white','red','magenta','green'))(100) # 
plot(ndvi,col=cl)




