rm(list=ls())
#install.packages("ggfortify")
library("ggfortify")
library("ElemStatLearn")
library("clustvarsel")
data(nci)
dim(nci)

# Applying the Pc on the data and selecting the first two PC components
data <- t(nci)
data <- scale(data)
pc.fit <- prcomp(data, .scale=TRUE)
pc.fit.x <- pc.fit$x[,1:2]

# Applying a low variance filter on the data
dat <- apply(nci,1,var)
highdat <- order(dat, decreasing = T)[1:250]
ncivar <- nci[highdat, ]
ncicol <- as.factor(colnames(nci))
#ncivar <- t(ncivar)
#ncivar <- data.frame(cl = ncicol, ncivar)
ncivar <- data.matrix(ncivar)

# Stepwise greedy search
clust.fit <- clustvarsel(ncivar, G = 1:64, search = "greedy", direction = "forward")
clust.fit
clust.fit$subset

# Headlong search
clust.fit1 <- clustvarsel(ncivar, G = 1:5, search = "headlong")
clust.fit1
clust.fit1$subset

