rm(list=ls())
library("ElemStatLearn")
library("dbscan")
data(nci)
dim(nci)

data <- t(nci)
data <- scale(data)
pc.fit <- prcomp(data, .scale=TRUE)
pc.fit.x <- pc.fit$x[,1:2]

dat <- apply(nci,1,var)
highdat <- order(dat, decreasing = T)[1:250]
ncivar <- nci[highdat, ]
ncicol <- as.factor(colnames(nci))
ncivar <- t(ncivar)
ncivar <- data.frame(cl = ncicol, ncivar)
ncivar <- data.matrix(ncivar)

res <- dbscan::dbscan(ncivar, eps = 33.8, minPts = 4) 
res
res$cluster

res1 <- dbscan::dbscan(ncivar, eps = 33.8, minPts = 7) 
res1
res1$cluster

res2 <- dbscan::dbscan(ncivar, eps = 33.8, minPts = 10) 
res2
res2$cluster

res3 <- dbscan::dbscan(ncivar, eps = 33.8, minPts = 20) 
res3
res3$cluster

x11()
par(mfrow=c(3,3))
plot(pc.fit.x, col = res$cluster+1L, main="MinPts as 4")
plot(pc.fit.x, col = res1$cluster+1L, main="MinPts as 7")
plot(pc.fit.x, col = res$cluster+1L, main="MinPts as 10")
plot(pc.fit.x, col = res$cluster+1L, main="MinPts as 15")
plot(pc.fit.x, col = res2$cluster+1L, main="MinPts as 18")
plot(pc.fit.x, col = res3$cluster+1L, main="MinPts as 20")

plot(res$cluster)
pairs(pc.fit.x, col = res$cluster+1L)
x11()
plot(pc.fit.x, col = res$cluster+1L)

x11()
kNNdistplot(ncivar,k=4)
knn.fit <- kNNdist(ncivar,k=4,search = "kd")
knn.fit

