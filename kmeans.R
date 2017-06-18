rm(list=ls())
library("ElemStatLearn")
data(nci)
dim(nci)

dat <- t(nci)
dat <- scale(dat)

pc.fit <- prcomp(dat, .scale=TRUE)
pc.fit.x <- pc.fit$x[,1:2]

set.seed(123)
k.fit <- kmeans(pc.fit.x, 3, nstart = 10)
k.fit

table(k.fit$cluster, colnames(nci))

plot(pc.fit.x, col=(k.fit$cluster+1), main="K-Means Clustering", xlab="", ylab="", pch=20, cex=2)
