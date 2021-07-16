#R_code_no2.r

# 1. set the working directory EN
setwd("C:/lab/EN") # Windows
library(raster)

# 2. Import the first image (single band)
# we will select band 1, but the raster function enables to select other single-bands
# [suggerimento studenti]
# https://www.rdocumentation.org/packages/raster/versions/3.4-10/topics/raster

EN01 <- raster("EN_0001.png")

# 3. Plot the first imported image with your preferred ColorRampPalette

cls <- colorRampPalette(c("red","pink","orange","yellow")) (200)
plot(EN01, col=cls)

# 4. Import the last image (13th) and plot it with the previous colorRampPalette
EN13 <- raster("EN_0013.png")
cls <- colorRampPalette(c("red","pink","orange","yellow")) (200)
plot(EN13, col=cls)

# 5. Make the difference between the two images and plot it

ENdif<- EN13-EN01 #march-january or january-march
plot(ENdif, col=cls)

# 6. Plot everything, altogether

par(mfrow=c(3,1))
plot(EN01, col=cls, main="NO2 in January")
plot(EN13, col=cls, main="NO2 in March")
plot(ENdif, col=cls, main="Difference (January - March)")

# 7. Import the whole set

# list of files:
rlist <- list.files(pattern="EN")
rlist

import <- lapply(rlist,raster)
import

EN <- stack(import)
plot(EN, col=cls)

# 8. Replicate the plot of images 1 and 13 using the stack






