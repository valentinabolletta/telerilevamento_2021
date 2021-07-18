#R_code_spectral_signatures.r

library(raster)
library(rgdal)
library(ggplot2)

setwd ("C:/lab/")

defor2 <- brick("defor2.jpg")

#defor2.1, defor2.2, defor2.3  
# NIR, red, green

plotRGB(defor2, r=1, g=2, b=3, stretch="lin")
#or
plotRGB(defor2, r=1, g=2, b=3, stretch="hist")

click(defor2, id=T, xy=T, cell=T, type="p", pch=16, col="magenta")
click(defor2, id=T, xy=T, cell=T, type="p", pch=16, cex=4, col="yellow")

#Define colors of the dataset:
band<- c(1,2,3)
forest <- c(187,23,34)
water <- c(39,87,125)  #i dati sono diversi a seconda dei risultati del click

#Create the dataframe
spectrals <- data.frame(band,forest,water)

#Plot the spectral signatures
ggplot(aes(x=band)) +geom_line(aes(y=forest), color="green")+geom_line(aes(y=water), color="blue") 

labs(x="band", y="reflectance")
