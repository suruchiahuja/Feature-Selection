source("https://bioconductor.org/biocLite.R")
biocLite("made4")

library(made4)
data <- data(NCI60)
View(data)
summary(data)

res <- dbscan::dbscan(data, eps = 5000.0, minPts = 2)
