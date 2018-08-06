n <- 50
x <- rnorm(n)
acf(x, lag.max = 20, type="correlation")