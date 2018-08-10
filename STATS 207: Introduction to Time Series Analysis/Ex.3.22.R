set.seed(111)
y <- arima.sim(n=50, list(ar=.99))
fit <- ar.yw(y, order=1)
m <- fit$x.mean
phi <- fit$ar
B <- 200  # bootstrap num
r <- fit$resid[-1]
x.star <- y
phi.star.yw <- rep(NA, B)
# Bootstrap
for (i in 1:B)
{
  sr.star <- sample(r, replace = TRUE)
  for (t in 1:49){
    x.star[t+1] <- m + phi*(x.star[t]-m) + sr.star[t]
  }
  phi.star.yw[i] <- ar.yw(x.star, order=1)$ar
}
# graphics
culer = rgb(.5,.7,1,.5)
hist(phi.star.yw, 15, main = "", prob=TRUE, xlim=c(.5, 1.05),
     ylim=c(0, 15), col=culer, xlab = expression(hat(phi)))
lines(density(phi.star.yw), lwd=2)
u <- seq(0.8,1.2,0.01)
# recall (3.134)
lines(u, dnorm(u, mean=.99, sd=(.02*(1-.99^2))^.5 ),
      lty=2, lwd=2) # dash
legend(.65, 14, legend=c('true distribution', 'bootstrap distribution',
                         'normal approximation'), bty='n', lty=c(1,0,2), lwd=c(2,0,2),
       col=1, pch=c(NA,22,NA), pt.bg=c(NA,culer,NA), pt.cex=2.5)
# which shows n=50 small sample still far to AN