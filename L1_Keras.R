rm(list = ls())

library(tensorflow)
library(keras)

data <- dataset_mnist()
attach(data)
set.seed(1)

xtrain <- mnist$train$x
ytrain <- mnist$train$y
xtest <- mnist$test$x
ytest <- mnist$test$y
xtrain <- array_reshape(xtrain, c(nrow(xtrain), 784))
xtest <- array_reshape(xtest, c(nrow(xtest), 784))
xtrain <- xtrain / 255
xtest <- xtest / 255

testl1s <- c(.00001, .0001, .001, .005, .01, .05)
scorelist <- c()
for (i in (testl1s)) {
  model <- keras_model_sequential()
  model %>%
    layer_dense(units = 256, activation = 'relu', input_shape = c(784), kernal_regularizer = regularizer_l1(1 = i)) %>%
    layer_dense (units = 128, activation = 'relu', kernal_regularizer = regularizer_l1(1=i)) %>%
    layer_dense(units = 10, activation = 'softmax')
  model %>% compile(
    loss = 'categorical_crossentropy'
    optimizer = optimizer_sgd()
    metrics = 'accuracy'
    
  )
  hist <- model %>% fit(xtrain, ytrain, epochs = 30, batch_size = 128, validation_split = .2)
  score <- model %>% evaluate(xtest, ytest)
  print(i)
  print(score)
  scorelist <- append(scorelist, score[2])
  
}
plot(scorelist)