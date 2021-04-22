#R_code_classification.r

setwd("C:/lab/") # Windows

library(raster)
 
so <- brick("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")
so
 
#visualizing RGB levels
plotRGB(so, 1, 2, 3, stretch="lin")

library (RStoolbox)

#unsupervised classification
set.seed(42)
soc <- unsuperClass(so, nClasses=3)
cl <- colorRampPalette(c('yellow','red','black'))(100)
plot(soe$map,col=cl)

#unsupervised classification with 20 classes
soc20 <- unsuperClass(so, nClasses=20)
plot(soc20$map)

#download an image from:
#link immagine ESA
sun<-brick("sun.png")

#unsupervised classification
sunc <- unsuperClass(sun, nClasses=3)
plot(sunc$map)
