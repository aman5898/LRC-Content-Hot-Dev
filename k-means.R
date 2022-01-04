


# Loading package
library(ClusterR)
library(cluster)



iris

iris_1 <- iris[, -5]

iris_1

set.seed(240)

kmeans.model <- kmeans(iris_1, centers = 3, nstart = 20)
kmeans.model

# Cluster identification for
# each observation
kmeans.model$cluster

# Confusion Matrix
cm <- table(iris$Species, kmeans.model$cluster)
cm

# Model Evaluation and visualization
plot(iris_1[c("Sepal.Length", "Sepal.Width")])
plot(iris_1[c("Sepal.Length", "Sepal.Width")],
     col = kmeans.model$cluster)
plot(iris_1[c("Sepal.Length", "Sepal.Width")],
     col = kmeans.model$cluster,
     main = "K-means with 3 clusters")

## Plotiing cluster centers
kmeans.model$centers
kmeans.model$centers[, c("Sepal.Length", "Sepal.Width")]

# cex is font size, pch is symbol
points(kmeans.model$centers[, c("Sepal.Length", "Sepal.Width")],
       col = 1:3, pch = 8, cex = 3)




V_kmeans <- kmeans.model$cluster

clusplot(iris_1[, c("Sepal.Length", "Sepal.Width")],
         V_kmeans,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels = 2,
         plotchar = FALSE,
         span = TRUE,
         main = paste("Cluster iris"),
         xlab = 'Sepal.Length',
         ylab = 'Sepal.Width')
