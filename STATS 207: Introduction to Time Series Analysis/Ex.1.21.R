n <- 502
w <- rnorm(n)
x <- filter(w, filter=rep(1/3,3), sides=2)[-c(1,n)]
acf(x, lag.max = 20, type="correlation")
# actual 1,2/3,1/3; 0 otherwise 