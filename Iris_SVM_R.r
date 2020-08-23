library(ISLR)

head(iris)

library(e1071)

model <- svm(Species ~., data=iris)
summary(model)

pred.values <- predict(model, iris[1:4])
table(pred.values, iris[,5])

tune.results <- tune(svm, train.x = iris[1:4], train.y=iris[,5], kernel='radial', ranges = list(cost=c(0.1,1,10), gamma=c(0.5,1,2)))

summary(tune.results)

tune.results <- tune(svm, train.x = iris[1:4], train.y=iris[,5], kernel='radial', ranges = list(cost=c(0.5,1,1.5), gamma=c(0.1,0.5,0.7)))
summary(tune.results)

tuned.svm <- svm(Species ~ ., data=iris, kernel='radial', cost=1, gamma=0.1)
summary(tuned.svm)

pred.values2 <- predict(tuned.svm, iris[1:4])
table(pred.values2, iris[,5])


