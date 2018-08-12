set.seed(4321)
n <- 1024
x <- ts(rnorm(n))
phi <- .9
D <- 1
y <- lag(x, -D) + rnorm(n)
par(mfrow = c(2,2))
simu <- function(L){
  sde <- mvspec(ts.intersect(x,y),  kernel("daniell",(L-1)/2)
                , plot = FALSE)
  plot(sde, plot.type = 'coh')
}
simu(1); simu(3); simu(41); simu(101)
# as 4.25(a) proved, coh is const, not dep omega or D