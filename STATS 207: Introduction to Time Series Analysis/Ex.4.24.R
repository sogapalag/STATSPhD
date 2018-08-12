par(mfrow=c(2,1))
m = 2 # L = 2m+1
sde <- mvspec(cbind(salt, saltemp), kernel("daniell",m))
f <- qf(.999, 2, sde$df-2)
C <- f/(2*m+f)
plot(sde, plot.type = 'coh', ci.lty = 2)
abline(h=C)
# based on .001 F-test; above C coherence only approx f in 0~0.1