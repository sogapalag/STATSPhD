y <- 0:2
C <- sum(choose(10,y)*beta(3+y+1, 3+10-y+1))
theta <- seq(0,1, length=1000)
f <- function(k,t) {
  s <- 0
  for (i in 0:k){
    s <- s + choose(10,i)*t^(3+i)*(1-t)^(13-i)/C 
  }
  return(s)
}
plot(theta, f(2,theta), 'l')
#test
#integrate(nf <- function(x)f(2,x), lower = 0, upper = 1)