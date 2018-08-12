a <- c(1,4,6,4,1)
x0 <- sum(a^2)
x1 <- sum(a[1:4]*a[2:5])
x2 <- sum(a[1:3]*a[3:5])
x3 <- sum(a[1:2]*a[4:5])
x4 <- 1
x <- c(x0, x1,x2,x3,x4)
sped <- function(w){
  s <- 0
  for (i in 1:5){
    s <- s + x[i]* 2 * cos(2*pi*w*(i-1))
  }
  return(s)
}
t <- seq(0, .5, .001)
plot(t, sped(t), type='l')