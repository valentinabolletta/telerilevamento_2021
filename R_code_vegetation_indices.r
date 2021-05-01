#R_code_vegetation_indices.r

library(raster) #require (raster)
library(RStoolbox) #for vegetation indices calculation
setwd("c:/lab/")

defor1 <- brick("defor1.jpg") 
defor2 <- brick("defor2.jpg") 

# band1: NIR, defor1_.1
# band2: red, defor1_.2
# band3: green

plotRGB(defor1, r=1, g=2, b=3, stretch="Lin")
plotRGB(defor2, r=1, g=2, b=3, stretch="Lin")

par(mfrow=c(1,2))
plotRGB(defor1, r=1, g=2, b=3, stretch="Lin")
plotRGB(defor2, r=1, g=2, b=3, stretch="Lin")

defor1 #per vedere quali sono i nomi delle bande da inserire

#difference vegetation index

#time 1
dvi1 <- defor1$defor1.1 - defor1$defor1.2 
plot(dvi1)

#dev.off()
plot(dvi1)

cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100) # specifying a color scheme
plot(dvi1, col=cl,main="DVI1 at time 1)


#time 2

dvi2 <- defor2$defor2.1 - defor2$defor2.2 
plot(dvi2, col=cl, main="DVI1 at time 2)

par(mfrow=c(2,1))
plot(dvi1, col=cl)
plot(dvi2, col=cl)

difdvi <- dvi1 - dvi2
cld <- colorRampPalette(c('blue','white','red'))(100) 
plot(difdvi, col=cld)

#ndvi
#(NIR-RED)/(NIR+RED)

ndvi1 <- (defor1$defor1.1-defor1$defor1.2) / (defor$defor1.1+defor1$defor1.2) 
plot(ndvi1, col=cl)

ndvi2 <- (defor2$defor2.1-defor1$defor2.2) / (defor$defor2.1+defor1$defor2.2) 
plot(ndvi2, col=cl)

#RStoolbox: spectralIndices
vi <-spectralIndices(defor1, green=3, red=2, nir=1)
plot(vi, col=cl)
