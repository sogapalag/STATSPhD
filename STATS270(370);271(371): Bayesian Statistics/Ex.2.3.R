n <- 1000
p <- 1/6
mu <- n*p
sigma <- (p*(1-p))^.5
Y <- function(y) dnorm(y, mu, n^.5*sigma)
plot(Y, 100, 300)
qua <- c(.05, .25, .5, .75, .95)
qY <- mu + n^.5*sigma*qnorm(qua)