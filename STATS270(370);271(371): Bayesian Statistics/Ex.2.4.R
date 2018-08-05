theta = c(1/12, 1/6, 1/4)
pta <- c(.25, .5, .25)
n <- 1000
ydist <- function(y){
  s <- 0
  for (i in 1:3){
    s <- s + pta[i]*dnorm(y,n*theta[i], 
                          (n*theta[i]*(1-theta[i]))^.5)
  }
  return(s)
}
plot(ydist, 0, 500)