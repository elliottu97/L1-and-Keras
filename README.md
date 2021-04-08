# L1-and-Keras
Finding the value of the penalty parameter in the L1 regularizer that maximizes the accuracy on the test data using the keras package.

Uses the keras_MNIST dataset. I find the value of the penalty parameter among the values (.00001, .0001, .001, .005, .01, .05) 
in the L1 regularizer that maximizes the accuracy of the test data. We find that as L1 increases, the accuracy decreases so the .00001 parameter value maximizes accuracy.

Uses 1 dataset and 2 R packages, tensorflow and keras
