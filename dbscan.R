rm(list=ls())
library("ElemStatLearn")
data(nci)
dim(nci)

dat <- t(nci)
dat <- scale(dat)

pc.fit <- prcomp(dat, .scale=TRUE)
pc.fit.x <- pc.fit$x[,1:2]

res <- dbscan::dbscan(pc.fit.x[,1:2], eps = 20, minPts = 4) 
res
res$cluster
plot(res$cluster)
pairs(pc.fit.x, col = res$cluster+1L)
plot(pc.fit.x, col = res$cluster+1L)
plot(knn.fit)
kNNdistplot(pc.fit.x,k=4)
knn.fit <- kNNdist(pc.fit.x,k=4,search = "kd")
knn.fit
