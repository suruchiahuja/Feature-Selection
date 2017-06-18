install.packages("HDclassif");
library(MASS)

data = crabs
x <- data[, -1]
cls <- data[, 1]
set.seed(1)
prms < - hddc(X,4)
res <- predict(prms, X, cls)

prms1 <- hddc(X)