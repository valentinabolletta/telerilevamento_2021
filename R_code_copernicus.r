# R_code_copernicus.r
# Visualizing Copernicus data

#install.packages("ncdf4")
library(raster)
library(ncdf4)

setwd("C:/lab/")

albedo <- raster("c_gls_ALBH_202006130000_GLOBE_PROBAV_V1.5.1.nc")
