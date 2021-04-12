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

# par
par(mfrow=c(2,2))
plot(lst_2000)
plot(lst_2005)
plot(lst_2010)
plot(lst_2015)

# list of files:
rlist <- list.files(pattern="lst")
rlist

import <- lapply(rlist,raster) #files importati tutti insieme ma separati
import

TGr <- stack(import)
plot(TGr)
TGr

plotRGB(TGr, 1, 2, 3, stretch="Lin") 
plotRGB(TGr, 2, 3, 4, stretch="Lin") 
plotRGB(TGr, 4, 3, 2, stretch="Lin") 

levelplot(TGr)

cl <- colorRampPalette(c("blue","light blue","pink","red"))(100)
levelplot(TGr,col.regions=cl,main="Summer land surface temperature",names.attr=c("July 2000","July 2005", "July 2010", "July 2015"))



