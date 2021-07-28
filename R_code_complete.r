#R_code_complete.r - Telerilevamento Geo-ecologico

#Summary:

#1. Remote sensing-first code
#2. Time series (Greenland)
#3. R code Copernicus
#4. R code knitr
#5. R code multivariate analysis
#6. R code classification
#7. R code ggplot2
#8. R code vegetation indices
#9. R code land cover
#10. R code variability

#.........................................

# il mio primo codice in R per il telerilevamento!

install.packages("raster") #Download and install packages from CRAN-like repositories or from local files.
library(raster) # Loading/Attaching and Listing of Packages

setwd ("C:/lab/") #Windows, Set or Change R Working Directory

p224r63_2011 <- brick("p224r63_2011_masked.grd") #function of raster packages to Create a RasterBrick object(multi-layer raster object)
p224r63_2011

plot(p224r63_2011) #Generic function for plotting of R objects/visualizing data.

# B1: blue
# B2: green
# B3: red
# B4: NIR

#colorRampPalette a function to extend a color palette
cl <- colorRampPalette(c('black','grey','light grey'))(100) # "c" means single argument containing a series of elements and "100" is an argument to explain to R on how many levels to develop the new colors
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

#Visualizing data by RGB plotting (Red-Green-Blue plot of a multi-layered Raster object)

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
                      
#8. R code vegetation indices
#R_code_vegetation_indices.r

library(raster) #require (raster)
library(RStoolbox) #for vegetation indices calculation

install.packages("rasterdiv")
library(rasterdiv) #for the worldwide NDVI
library(rasterVis)

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
vi1 <-spectralIndices(defor1, green=3, red=2, nir=1)
plot(vi1, col=cl)

vi2 <-spectralIndices(defor2, green=3, red=2, nir=1)
plot(vi2, col=cl)

difndvi <- ndvi1 - ndvi2
cld <- colorRampPalette(c('blue','white','red'))(100) 
plot(difndvi, col=cld)

#worldwide NDVI
plot(copNDVI)

# Pixels with values 253, 254 and 255 (water) will be set as NA’s.
copNDVI <- reclassify(copNDVI, cbind(253:255, NA))
plot(copNDVI)

# rasterVis package needed:
levelplot(copNDVI)

#...................................................................

#9. R code land cover
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

d2c3 <- unsuperClass(defor2, nClasses=3)
plot(d2c3$map)

#frequencies
freq(d1c$map)
# aree aperte = 37039 (pixel)
# foresta = 304253

#calcoliamo la proporzione di pixel
s1<- 306583+34709
s1

prop1<- freq(d1c$map)/s1
#proporzione foresta = 0.898
#proporzione agricolo= 0.101

s2<- 342726
prop2<- freq(d2c$map)/s2
#proporzione foresta = 0.520
#proporzione agricolo= 0.479

#build  a a dataframe
cover<- c(forest ("forest", "agriculture")
percent_1992<- c(89.83,10.16)
percent_2006<- c(52.06, 47.93)
          
percentages<- data.frame (cover, percent_1992, percent_2006)
percentages          

#let's plot them
p1<-ggplot(percentages, aes(x=cover, y=percent_1992, color=cover)) + geom_bar(stat="identity", fill="white")   
p1<-ggplot(percentages, aes(x=cover, y=percent_2006, color=cover)) + geom_bar(stat="identity", fill="white")   
          
grid.arrange(p1, p2, nrow = 1) # this needs griExtra       
          
#..........................................................
          
#10. R code variability
#R_code_variability.r

library(raster)
library(RStoolbox)
library(ggplot2) #for ggplot plotting
library(gridExtra) #for plotting ggplot together
library(viridis) #for ggplot couloring

setwd("c:/lab/")

sent <- brick("sentinel.png")
sent

#NIR 1, RED 2, GREEN 3
#r=1, g=2, b=3

plotRGB(sent) 

plotRGB(sent, stretch="lin")
plotRGB(sent, r=2, g=1, b=3, stretch="lin")

nir <- sent$sentinel.1
red <- sent$sentinel.2

ndvi <- (nir-red) / (nir+red)
plot(ndvi)

cl <- colorRampPalette(c('black','white','red','magenta','green'))(100) # 
plot(ndvi,col=cl)

ndvisd3 <- focal(ndvi, w=matrix(1/9,nrow=3,ncol=3), fun=sd)
plot(ndvisd3)


clsd <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100) #
plot(ndvisd3, col=clsd)
 
#mean ndvi with focal
ndvimean3 <- focal(ndvi, w=matrix(1/9, nrow=3, ncol=3), fun=mean)
clsd <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100) # 
plot(ndvimean3, col=clsd)

ndvisd5 <- focal(ndvi, w=matrix(1/25, nrow=5, ncol=5), fun=sd)
clsd <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100) # 
plot(ndvisd5, col=clsd)

#PCA
sentpca<- rasterPCA(sent)
plot(sentpca$map)

summary(sentpca$model)
#the first PC contains 0.6736804 of the original information
 

pc1 <- sentpca$map$PC1

pc1sd5 <- focal(pc1, w=matrix(1/25, nrow=5, ncol=5), fun=sd)
clsd <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100) # 
plot(pc1sd5, col=clsd)

# pc1 <- sentpca$map$PC1
# pc1sd7 <- focal(pc1, w=matrix(1/49, nrow=7, ncol=7), fun=sd)
# plot(pc1sd7)

# With the source function you can upload code from outside!
source("source_test_lezione.r")
source("source_ggplot.r")

# https://cran.r-project.org/web/packages/viridis/vignettes/intro-to-viridis.html
# The package contains eight color scales: “viridis”, the primary choice, and five alternatives with similar properties - “magma”, “plasma”, “inferno”, “civids”, “mako”, and “rocket” -, and a rainbow color map - “turbo”.

p1 <- ggplot() +
geom_raster(pc1sd5, mapping = aes(x = x, y = y, fill = layer)) +
scale_fill_viridis()  +
ggtitle("Standard deviation of PC1 by viridis colour scale")

p2 <- ggplot() +
geom_raster(pc1sd5, mapping = aes(x = x, y = y, fill = layer)) +
scale_fill_viridis(option = "magma")  +
ggtitle("Standard deviation of PC1 by magma colour scale")

p3 <- ggplot() +
geom_raster(pc1sd5, mapping = aes(x = x, y = y, fill = layer)) +
scale_fill_viridis(option = "turbo")  +
ggtitle("Standard deviation of PC1 by turbo colour scale")

grid.arrange(p1, p2, p3, nrow = 1)

#.....................................
          
          
          




