yoil <- diff(log(oil))
ygas <- diff(log(gas))
par(mfrow=c(2,2))
ts.plot(yoil)
acf(yoil)
ts.plot(ygas)
acf(ygas)
# which shows growth rate is random(non-correlated)
dev.new()
ccf(yoil, ygas)
# ccf shows current growth rate correlated, but lag non-cor.
dev.new()
lag2.plot(oil, yoil, 3)
dev.new()
lag2.plot(oil, ygas, 3)
# growth rate, (laged,current)price noncorrelated.
indi <- ifelse(yoil<0, 0, 1)
mess <- ts.intersect(ygas, yoil, yoilL1 = lag(yoil, -1), indi)
fit <- lm(ygas~ yoil + yoilL1 + indi, data=mess)
summary(fit)
# when yoil<0, the intercept part is showed.
# by summary, 2 * intercept + indi = 0, implies non asym-hypo.