#R_code_no2.r

setwd("C:/lab/EN") # Windows
library(raster)

# 2. Import the first image (single band)
# we will select band 1, but the raster function enables to select other single-bands
# [suggerimento studenti]
# https://www.rdocumentation.org/packages/raster/versions/3.4-10/topics/raster

EN01 <- raster("EN_0001.png")

