# install and link libraries/packages
library(e1071)
library(mlbench) 

#load & link the data set from mlbench library
data(HouseVotes84)
attach(HouseVotes84)
# Go online and read about the data http://www.ugrad.stat.ubc.ca/R/library/mlbench/html/HouseVotes84.html
#Eplore names
names(HouseVotes84)
head(HouseVotes84)

# Train/Create a naiveBayes model
model <- naiveBayes(Class ~ ., data = HouseVotes84)
# predict(model, HouseVotes84[1:10,-1])
# predict(model, HouseVotes84[1:10,-1], type = "raw")
# Predict 
pred <- predict(model, HouseVotes84[,-1])
table(pred, HouseVotes84$Class)

## Example of using a contingency table:
data(Titanic)
# Go Online and read about the data http://www.public.iastate.edu/~hofmann/data/titanic.html
model <- naiveBayes(Survived ~ ., data = Titanic)
model
pred <- predict(model, as.data.frame(Titanic)[,1:3])
table(pred, Titanic$Survived)

## Example with metric predictors:
data(iris)
# Go online and read about the data https://stat.ethz.ch/R-manual/R-devel/library/datasets/html/iris.html
model <- naiveBayes(Species ~ ., data = iris)
## alternatively:
#model <- naiveBayes(iris[,-5], iris[,5])
table(predict(model, iris[,-5]), iris[,5])



