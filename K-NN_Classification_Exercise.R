# load the data
data(iris)
# understand your data

if ( ! any(grepl("ggvis", installed.packages()))) install.packages("ggvis")
if ( ! any(grepl("class", installed.packages()))) install.packages("class")
library(ggvis)
library(class)
iris %>% ggvis(~Sepal.Length, ~Sepal.Width, fill = ~Species) %>% layer_points()
# see any correlation between the sepal length and the sepal width of the Setosa iris flowers?
iris %>% ggvis(~Petal.Length, ~Petal.Width, fill = ~Species) %>% layer_points()
# see any correlation between the Petal length and the Petal?
# see class proportions
round(prop.table(table(iris$Species)) * 100, digits = 1)

# preprocessing, normalization, scaling etc 

# subset train-test data

set.seed(1234)

ind <- sample(2, nrow(iris), replace=TRUE, prob=c(0.67, 0.33))
iris.training <- iris[ind==1, 1:4]
iris.test <- iris[ind==2, 1:4] 
iris.trainLabels <- iris[ind==1, 5]
iris.testLabels <- iris[ind==2, 5] 
iris_pred <- knn(train = iris.training, test = iris.test, cl = iris.trainLabels, k=3) 

# evaluate model
table(iris_pred, iris.testLabels)
