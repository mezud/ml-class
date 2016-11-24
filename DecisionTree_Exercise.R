# install package
if ( ! any(grepl("RWeka" , installed.packages()))) install.packages("RWeka")
# load the package
library(RWeka)
# load data
data(iris)
# fit model
fit <- J48(Species~., data=iris)
# summarize the fit
summary(fit)
# make predictions
predictions <- predict(fit, iris[,1:4])
# summarize accuracy
table(predictions, iris$Species)
#######################################################
# install package
if ( ! any(grepl("rpart" , installed.packages()))) install.packages("rpart")
if ( ! any(grepl("rpart.plot" , installed.packages()))) install.packages("rpart.plot")
if ( ! any(grepl("rattle" , installed.packages()))) install.packages("rattle")
if ( ! any(grepl("RColorBrewer" , installed.packages()))) install.packages("RColorBrewer")
if ( ! any(grepl("party" , installed.packages()))) install.packages("party")
if( ! any(grepl("partyKit" , installed.packages()))) install.packages("partykit")
#load the library
library(rpart)
library(rattle)					# Fancy tree plot
library(rpart.plot)				# Enhanced tree plots
library(RColorBrewer)				# Color selection for fancy tree plot
library(party)					# Alternative decision tree algorithm
library(partykit)				# Convert rpart object to BinaryTree
library(caret)					# Just a data source for this 
# load data
data(segmentationData)				# Get some data
data <- segmentationData[,-c(1,2)]

form <- as.formula(Class ~ .)
tree.1 <- rpart(form,data=data,control=rpart.control(minsplit=20,cp=0))
# 
plot(tree.1)					# Will make a mess of the plot
text(tree.1)
# 
prp(tree.1)					# Will plot the tree
prp(tree.1,varlen=3)# Shorten variable names
#
# Interatively prune the tree
new.tree.1 <- prp(tree.1,snip=TRUE)$obj # interactively trim the tree
prp(new.tree.1) # display the new tree
#
tree.2 <- rpart(form,data)			# A more reasonable tree
prp(tree.2)                                     # A fast plot													
fancyRpartPlot(tree.2)				# A fancy plot from rattle
