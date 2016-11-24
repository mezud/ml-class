install.packages('MASS')
library(MASS)
data(iris3)
s <-1 
Iris <- data.frame(rbind(iris3[,,1], iris3[,,2], iris3[,,3]), Sp = rep(c("setosa","versicolor","verginica"), rep(50,3)))
train <- sample(1:150, 75)
table(Iris$Sp[train])
## your answer may differ
##  c  s  v
## 22 23 30
z <- lda(Sp ~ ., Iris, prior = c(1,1,1)/3, subset = train)
predict(z, Iris[-train, ])$class
##  [1] s s s s s s s s s s s s s s s s s s s s s s s s s s s c c c
## [31] c c c c c c c v c c c c v c c c c c c c c c c c c v v v v v
## [61] v v v v v v v v v v v v v v v

z$counts

# class means
classMeans <- z$means
# Within class scatter/covariance
# Sw <- t(as.matrix(Iris[,1:4] - classMeans)) %*% as.matrix(Iris[,1:4] - classMeans) 
# Sb <- t(as.matrix(sapply(Iris[,1:4], mean) - z$means)) %*% as.matrix(sapply(Iris[,1:4], mean) - z$means) 

 x1 <- setosaData[,1] - setosaMeans[1]
 x2 <- setosaData[,2] - setosaMeans[2]
 x3 <- setosaData[,3] - setosaMeans[3]
 x4 <- setosaData[,4] - setosaMeans[4]
 setodaMinusMean <- cbind(x1, x2, x3, x4)
 covSetosa <- t(setodaMinusMean) %*% setodaMinusMean
 x1 <- verginicaData[,1] - verginicaMeans[1]
 x2 <- verginicaData[,2] - verginicaMeans[2]
 x3 <- verginicaData[,3] - verginicaMeans[3]
 x4 <- verginicaData[,4] - verginicaMeans[4]
 verginicaMinusMean <- cbind(x1, x2, x3, x4)
 covVerginica <- t(verginicaMinusMean) %*% verginicaMinusMean
 x1 <- versicolorData[,1] - versicolorMeans[1]
 x2 <- versicolorData[,2] - versicolorMeans[2]
 x3 <- versicolorData[,3] - versicolorMeans[3]
 x4 <- versicolorData[,4] - versicolorMeans[4]
 versicolorMinusMean <- cbind(x1, x2, x3, x4)
 covVersicolor  <- t(versicolorMinusMean) %*% versicolorMinusMean
 covVersicolor + covVerginica + covSetosa

# eigen(solve(1/Sw) %*% Sb)$values

# the linear combination coefficients 
z$scaling
# as.matrix(Iris[,1:4]) %*% as.matrix(z$scaling)
# plot (x)

# the singular values, which give the ratio of the between- and within-group standard deviations
# on the linear discriminant variables. 
z$svd


# What LDA aims to achieve, is minimal variance within groups and maximal variance between groups. 
# the ratio of the between- and within-group standard deviations 
prop = z$svd^2/sum(z$svd^2)
