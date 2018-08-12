n <- 100
t <- 1:n
x1 <- 2*cos(2*pi*t*.06) + 3*sin(2*pi*t*.06)
x2 <- 4*cos(2*pi*t*.10) + 5*sin(2*pi*t*.10)
x3 <- 6*cos(2*pi*t*.40) + 7*sin(2*pi*t*.40)
x <- x1 + x2 + x3
#plot.ts(x)
P <- Mod(2*fft(x)/n)^2
Fr <- 0:(n-1)/n
y <- x + rnorm(n, 0, 5)
Py <- Mod(2*fft(y)/n)^2
par(mfrow = c(2,1))
plot(Fr, P, type = 'o')
plot(Fr, Py, type = 'o')