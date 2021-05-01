#R_code_vegetation_indices.r

library(raster) #require (raster)
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
dvi1 <- defor1$defor1.1 - defor1$defor1.2 


