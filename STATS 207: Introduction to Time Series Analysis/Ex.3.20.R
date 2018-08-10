x <- arima.sim(n=500, list(ar=.9, ma=-.9))
par(mfrow=c(2,1))
acf(x)
pacf(x)
fit <- arima(x, order = c(1,0,1))
cat(fit$coeff)
# every sim different
# reason: this is indeed phi(z),theta(z) has same factor (1-.9 B)
# so solution is x_t = w_t which is indeed white noise
# so overparameter result the situation.