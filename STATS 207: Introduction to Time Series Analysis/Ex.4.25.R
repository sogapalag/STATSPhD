set.seed(1234)
n <- 1024
x <- rnorm(n)
phi <- .9
y <- phi*x + rnorm(n)
par(mfrow = c(2,2))
simu <- function(L){
  sde <- mvspec(cbind(x,y),  kernel("daniell",(L-1)/2), plot = FALSE)
  plot(sde, plot.type = 'coh')
}
simu(1); simu(3); simu(41); simu(101)
# when L=101 (low pass), clearly showed scoh~ .5 const