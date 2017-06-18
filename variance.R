rm(list=ls())
library("ElemStatLearn")
library("clustvarsel")
data(nci)
dim(nci)

dat <- apply(nci,1,var)
highdat <- order(dat, decreasing = T)[1:250]
nci <- nci[highdat, ]
ncicol <- as.factor(colnames(nci))
nci <- t(nci)
nci <- data.frame(cl = ncicol, nci)
