#Time series analysis 
#Greenland increase of temperature
#Data and code from Emanuela Cosma

#install.packages ("raster")
library (raster)

setwd("C:/lab/greenland/")

lst_2000 <- raster("lst_2000.tif")
lst_2005 <- raster("lst_2005.tif")
lst_2010 <- raster("lst_2010.tif")
lst_2015 <- raster("lst_2015.tif")

