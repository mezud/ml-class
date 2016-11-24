install.packages('neuralnet')
library(neuralnet)
data(infert)
colnames(infert)

nn <- neuralnet(case~age+parity+induced+spontaneous, data=infert, hidden=2, err.fct="ce", linear.output=FALSE)
nn$result.matrix
plot(nn)
