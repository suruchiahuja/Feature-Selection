rm(list=ls())
library("ElemStatLearn")
data(nci)
dim(nci)

data <- as.data.frame(nci)

dat <- t(nci)
dat <- scale(dat)
res <- dbscan::dbscan(dat, eps = 100, minPts = 1)
res

d <- dist(dat)
x11()
hist(d)

pc.fit <- prcomp(dat, .scale=TRUE)
pc.fit.x <- pc.fit$x[,1:2]
x11()
plot(pc.fit.x[,1], pc.fit.x[,2], col=res$cluster)