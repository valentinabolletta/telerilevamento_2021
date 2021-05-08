#R_code_land_cover.r

library(raster)
library(RStoolbox)
#install.packages("ggplot2")
library(ggplot2)
#install.packages("gridExtra")
library(gridExtra)

setwd("c:/lab/")

defor1 <- brick("defor1.jpg")
defor2 <- brick("defor2.jpg")

defor1
# names: defor1_.1, defor1_.2, defor1_.3 
# defor1_.1 = NIR
# defor1_.2 = red
# defor1_.3 = green

plotRGB(defor1, r=1, g=2, b=3, stretch="Lin")
ggRGB(defor1, r=1, g=2, b=3, stretch="Lin")

plotRGB(defor2, r=1, g=2, b=3, stretch="Lin")
ggRGB(defor2, r=1, g=2, b=3, stretch="Lin")

par(mfrow=c(2,1))
plotRGB(defor1, r=1, g=2, b=3, stretch="Lin")
plotRGB(defor2, r=1, g=2, b=3, stretch="Lin")

#multiframe with ggplot2 and gridExtra
p1 <- ggRGB(defor1, r=1, g=2, b=3, stretch="Lin")
p2 <- ggRGB(defor2, r=1, g=2, b=3, stretch="Lin")

grid.arrange(p1, p2, nrow = 2) # this needs gridExtra


#unsupervised classification
d1c <- unsuperClass(defor1, nClasses=2)
d1c
plot(d1c$map)
#class1:forest
#class2:agriculture

#set.seed() would allow you to attain the same results

d2c <- unsuperClass(defor2, nClasses=2)
plot(d2c$map)
#class1:forest
#class2:agriculture
