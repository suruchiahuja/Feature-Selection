#install.packages("dbscan")
library(dbscan)
library("fpc")
library("cluster")

data <- read.csv("C:/Users/Suruchi Ahuja/Desktop/R prog/Masters/NCI60_U133A_20070815.raw.csv/NCI60_U133A_20070815.raw.csv")
View(data)


#data <- as.matrix(data[,100])
data <- data.matrix(data[-1000,-10], rownames.force = NA)
res <- dbscan(data, eps = .2)
res
###
#dbscan Pts=22282 MinPts=5 eps=0.4

#0 
#22282 
###
pairs(data, col = res$cluster + 1L)


## compare with dbscan from package fpc (only if installed)
if (requireNamespace("fpc", quietly = TRUE)) 
{
  res2 <- fpc::dbscan(data, eps = .4, MinPts = 4)
  pairs(data, col = res2$cluster + 1L)
  ## make sure both version produce the same results
  all(res$cluster == res2$cluster)
}
## find suitable eps parameter (look at knee)
kNNdistplot(data, k = 4)

## example data from fpc
set.seed(123)
n <- 100
x <- cbind(
  x = runif(10, 0, 10) + rnorm(n, sd = 0.2),
  y = runif(10, 0, 10) + rnorm(n, sd = 0.2)
)
res <- dbscan::dbscan(data, eps = 5000.0, minPts = 2)
res
plot(data, col=res$cluster + 1L)


