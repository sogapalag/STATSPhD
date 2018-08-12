lp <- log(Mod(fft(speech))) # log-periodogram
fit <- lm(lp~time(lp), na.action = NULL)
dtlp <- resid(fit) # detrend
dilp <- diff(lp) # first-diff
P1 <- (Mod(2*fft(dtlp)/1020))^2
P2 <- (Mod(2*fft(dilp)/1019))^2
plot(P1)
plot(P2)