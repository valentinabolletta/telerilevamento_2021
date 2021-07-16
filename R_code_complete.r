#R_code_complete.r - Telerilevamento Geo-ecologico

#Summary:

#1. Remote sensing-first code
#2. Time series (Greenland)
#3. R code Copernicus
#4. R code knitr
#5. R code multivariate analysis
#6. R code classification
#7. R code ggplot2

#.........................................

# il mio primo codice in R per il telerilevamento!

install.packages("raster") #Download and install packages from CRAN-like repositories or from local files.
library(raster) # Loading/Attaching and Listing of Packages

setwd ("C:/lab/") #Windows, Set or Change R Working Directory

p224r63_2011 <- brick("p224r63_2011_masked.grd") #function of raster packages to Create a RasterBrick object(multi-layer raster object)
p224r63_2011

plot(p224r63_2011) #Generic function for plotting of R objects.

# B1: blue
# B2: green
# B3: red
# B4: NIR

cl <- colorRampPalette(c('black','grey','light grey'))(100) # 
plot(p224r63_2011, col=cl)


par(mfrow=c(2,2))
clb <- colorRampPalette(c('dark blue','blue','light blue'))(100) # 
plot(p224r63_2011$B1_sre, col=clb)

clg <- colorRampPalette(c('dark green','green','light green'))(100) # 
plot(p224r63_2011$B2_sre, col=clg)

clr <- colorRampPalette(c('dark red','red','pink'))(100) # 
plot(p224r63_2011$B3_sre, col=clr)

cln <- colorRampPalette(c('red','orange','yellow'))(100) # 
plot(p224r63_2011$B4_sre, col=cln)

#DAY 3
# Bande Landsat
# B1: blu
# B2: verde
# B3: rosso
# B4: infrarosso vicino
# B5: infrarosso medio
# B6: infrarosso termico
# B7: infrarosso medio

# dev.off will clean the current graph
# dev.off()

# plot band 1 with a predefined color ramp palette
plot(p224r63_2011$B1_sre)

cls <- colorRampPalette(c("red","pink","orange","purple")) (200)
plot(p224r63_2011$B1_sre, col=cls)


# 1 row, 2 columns
par(mfrow=c(1,2))
plot(p224r63_2011$B1_sre)
plot(p224r63_2011$B2_sre)

# 2 row, 1 columns
par(mfrow=c(2,1)) # if you are using columns first: par(mfcol....)
plot(p224r63_2011$B1_sre)
plot(p224r63_2011$B2_sre)

# plot the first four bands of Landsat
par(mfrow=c(4,1))
plot(p224r63_2011$B1_sre)
plot(p224r63_2011$B2_sre)
plot(p224r63_2011$B3_sre)
plot(p224r63_2011$B4_sre)

# a quadrat of bands...:
par(mfrow=c(2,2))
plot(p224r63_2011$B1_sre)
plot(p224r63_2011$B2_sre)
plot(p224r63_2011$B3_sre)
plot(p224r63_2011$B4_sre)

# a quadrat of bands...:
par(mfrow=c(2,2))
clb <- colorRampPalette(c("dark blue","blue","light blue")) (100)
plot(p224r63_2011$B1_sre, col=clb)
clg <- colorRampPalette(c("dark green","green","light green")) (100)
plot(p224r63_2011$B2_sre, col=clg)
clr <- colorRampPalette(c("dark red","red","pink")) (100)
plot(p224r63_2011$B3_sre, col=clr)
clnir <- colorRampPalette(c("red","orange","yellow")) (100)
plot(p224r63_2011$B4_sre, col=clnir)

#Visualizing data by RGB plotting

# Bande Landsat
# B1: blu
# B2: verde
# B3: rosso
# B4: infrarosso vicino
# B5: infrarosso medio
# B6: infrarosso termico
# B7: infrarosso medio

#visualizzazione immagine a colori naturali
plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="Lin")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=2, b=4, stretch="Lin")

# Exercise: mount a 2x2 multiframe
par(mfrow=c(2,2))
plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="Lin")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=2, b=4, stretch="Lin")

# pdf("il_mio_primo_pdf_con_R.pdf")
# par(mfrow=c(2,2))
# plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="Lin")
# plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
# plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin")
# plotRGB(p224r63_2011, r=3, g=2, b=4, stretch="Lin")
# dev.off()

plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="hist")

# par natural colours, flase colours, and false colours with histogram stretching
par(mfrow=c(3,1))
plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="hist")

#Multitemporal set
p224r63_1988 <- brick("p224r63_1988_masked.grd")
p224r63_1988

plot(p224r63_1988) #visualizzazione delle singole bande (7)

# Bande Landsat
# B1: blu
# B2: verde
# B3: rosso
# B4: infrarosso vicino
# B5: infrarosso medio
# B6: infrarosso termico
# B7: infrarosso medio

#plot in RGB colori naturali
plotRGB(p224r63_1988, r=3, g=2, b=1, stretch="Lin")

#plot in RGB infrarosso (NIR)
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="Lin")

#confronto 2011-1988 con creazione di PDF
pdf("multitemp.pdf")
par(mfrow=c(2,2))
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="hist")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="hist")
dev.off()

#.........................................

#2. Time series (Greenland)

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

#Ice sheet melt extent
setwd("C:/lab/Greenland/")
library(raster)
library(rasterVis)

rlist <- list.files(pattern="melt")
rlist

# Melt
meltlist <- list.files(pattern="melt")
melt_import <- lapply(meltlist,raster)
melt <- stack(melt_import)
melt

levelplot(melt)

melt_amount <- melt$X2007annual_melt - melt$X1979annual_melt
clb <- colorRampPalette(c("blue","white","red"))(100)
plot(melt_amount, col=clb)

levelplot(melt_amount, col.regions=clb)

#..........................................................

#3. R code Copernicus

# R_code_copernicus.r
# Visualizing Copernicus data

#install.packages("ncdf4")
library(raster)
library(ncdf4)

setwd("C:/lab/")

albedo <- raster("c_gls_ALBH_202006130000_GLOBE_PROBAV_V1.5.1.nc")
albedo

cl<- colorRampPalette(c('blue','green','red','yellow')) (100)#
plot (albedo,col=cl)    #posso fare la stessa operazione con un altro dato scaricato "FAPAR"

#resampling
albedores<- aggregate(albedo,fact=100)
plot(albedores,col=cl)

#.........................................

#4. R code knitr
# R_code_knitr.r

setwd("C:/lab/")

library(knitr)

# starting from the code folder where framed.sty is put!

stitch("R_Code_greenland.r.txt.txt", template=system.file("misc", "knitr-template.Rnw", package="knitr"))

#.........................................

#5. R code multivariate analysis
#R_code_multivariate_analysis.r

library(raster)
library(RStoolbox)

setwd("c:/lab/")

p224r63<-brick("p224r63_2011_masked.grd")
plot(p224r63)
p224r63

plot(p224r63$B1_sre,p224r63$B2_sre, col="red", pch=19, cex=2)

pairs(p224r63)

#aggregate cells: resampling (ricampionamento)
p224r63res <- aggregate(p224r63, fact=10, fun=mean)
p224r63res

par(mfrow=c(2,1))
plotRGB(p224r63, r=4,g=3,b=2, stretch="Lin")
plotRGB(p224r63res, r=4,g=3,b=2, stretch="Lin")

p224r63_PCA<-rasterPCA(p224r63res)

summary(p224r63_PCA$model)

plot(p224r63_PCA$map)
p224r63_PCA

plotRGB(p224r63_PCA$map, r=1, g=2, b=3, stretch="Lin")

#.........................................................

#6. R code classification
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

gcc2 <- unsuperClass(gc, nClasses=2)
gcc2
plot(gcc2$map)

gcc4 <- unsuperClass(gc, nClasses=4)
plot(gcc4$map)

#......................................................

#7. R code ggplot2
library(raster)
library(RStoolbox)
library(ggplot2)
library(gridExtra)

setwd("~/lab/")

p224r63 <- brick("p224r63_2011_masked.grd")

ggRGB(p224r63,3,2,1, stretch="lin")
ggRGB(p224r63,4,3,2, stretch="lin")

p1 <- ggRGB(p224r63,3,2,1, stretch="lin")
p2 <- ggRGB(p224r63,4,3,2, stretch="lin")

grid.arrange(p1, p2, nrow = 2) # this needs gridExtra

#............................................................
                      





