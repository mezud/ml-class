install.packages('labeling')
library('labeling')
install.packages('devtools')
library(devtools)
install.packages('munsell')
library('munsell')
install.packages('ggplot2')
library('ggplot2')
install_github("vqv/ggbiplot")
library(ggbiplot)

g <- ggbiplot(ir.pca, obs.scale = 1, var.scale = 1, 
              groups = ir.species, ellipse = TRUE, 
              circle = TRUE)
g <- g + scale_color_discrete(name = '')
g <- g + theme(legend.direction = 'horizontal', 
               legend.position = 'top')
print(g)


data(wine)
wine.pca <- prcomp(wine, scale. = TRUE)
print(ggbiplot(wine.pca, obs.scale = 1, var.scale = 1, groups = wine.class, ellipse = TRUE, circle = TRUE))

