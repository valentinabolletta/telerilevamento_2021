#R_code_classification.r

setwd("C:/lab/") # Windows

library(raster)
 
so <- brick("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")
 
plotRGB(so, 1, 2, 3, stretch="lin")


