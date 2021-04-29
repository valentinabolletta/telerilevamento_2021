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
