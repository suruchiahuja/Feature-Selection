rm(list=ls())
library("ElemStatLearn")
library("clustvarsel")
data(nci)
dim(nci)

dat <- t(nci)
dat <- scale(dat)

pc.fit <- prcomp(dat, .scale=TRUE)
pc.fit.x <- pc.fit$x[,1:2]

clust.fit <- clustvarsel(pc.fit.x, G = 1:9, search = "greedy", direction = "forward")
clust.fit
clust.fit$subset

clust.fit1 <- clustvarsel(pc.fit.x, G = 1:9, ,direction = "forward")
clust.fit1
#x <- dat[,clust.fit1$subset]
#mod <- Mclust(x, G=1:9)
#summary(mod)


clust.fit2 <- clustvarsel(pc.fit.x, G = 1:9, direction = "backward")
clust.fit2
