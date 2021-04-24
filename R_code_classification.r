#R_code_classification.r

library(raster)
library (RStoolbox)

setwd("C:/lab/") # Windows


so <- brick("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")
so
 
#visualizing RGB levels
plotRGB(so, 1, 2, 3, stretch="lin")


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

#Grand Canyon
#https://landsat.visibleearth.nasa.gov/view.php?id=80948
#When John Wesley Powell led an expedition down the Colorado River and through the Grand Canyon in 1869, he was confronted with a daunting landscape.

gc<-brick("dolansprings_oli_2013088_canyon_lrg.jpg")
plotRGB(gc, r=1, g=2, b=3, stretch="lin")
plotRGB(gc, r=1, g=2, b=3, stretch="hist")

