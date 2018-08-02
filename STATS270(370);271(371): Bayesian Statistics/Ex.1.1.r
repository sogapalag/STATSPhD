th <- function(v){
    dnorm(1,1,v)/(dnorm(1,1,v)+dnorm(1,2,v))
}
va <- seq(0,50,length=1000)
plot(va, th(va), type='l')