# Load data
data(iris)
head(iris, 3)

ir.data <- iris[, 1:4]
ir.species <- iris[, 5]
ir.pca <- prcomp(ir.data) 

summary(ir.pca)
# print 
print(ir.pca)
# plot
plot(ir.pca, type = "l")



# apply PCA with data standardization
ir.pca <- prcomp(iris[, 1:4], center = TRUE, scale. = TRUE) 
# print 
print(ir.pca)
# plot
plot(ir.pca, type = "l")


# log transform 
log.ir <- log(iris[, 1:4])
ir.species <- iris[, 5]
# apply PCA - scale. = TRUE is highly 
# advisable, but default is FALSE. 
ir.pca <- prcomp(log.ir, center = TRUE, scale. = TRUE) 
# print 
print(ir.pca)
# plot
plot(ir.pca, type = "l")

summary(ir.pca)

# PREDICTION USING PCA-Applied Data
# Predict PCs
predict(ir.pca, newdata=tail(log.ir, 2))


# https://www.r-bloggers.com/computing-and-visualizing-pca-in-r/
