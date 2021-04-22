#R_code_classification.r

setwd("C:/lab/") # Windows

library(raster)
 
so <- brick("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")
so
 
#visualizing RGB levels
plotRGB(so, 1, 2, 3, stretch="lin")

library (RStoolbox)

#unsupervised classification
soc <- unsuperClass(so, nClasses=3)



