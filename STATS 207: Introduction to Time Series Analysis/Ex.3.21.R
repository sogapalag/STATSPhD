for (i in 1:10)
{
  x <- arima.sim(n=200, list(ar=.9, ma=.5))
  fit <- arima(x, order = c(1,0,1), method = "ML")
  cat(fit$coef[-3], sd(fit$residuals),'\n') # ar, ma, sd
}