rm(list=ls())
library("ElemStatLearn")
library("clustvarsel")
data(nci)
dim(nci)

data <- t(nci)
data <- scale(data)
pc.fit <- prcomp(data, .scale=TRUE)
pc.fit.x <- pc.fit$x[,1:2]

dat <- apply(nci,1,var)
highdat <- order(dat, decreasing = T)[1:250]
nci <- nci[highdat, ]
ncicol <- as.factor(colnames(nci))
nci <- t(nci)
nci <- data.frame(cl = ncicol, nci)

clust.fit1 <- clustvarsel(nci, G = 1:5, search = "headlong")
clust.fit1
clust.fit1$subset
