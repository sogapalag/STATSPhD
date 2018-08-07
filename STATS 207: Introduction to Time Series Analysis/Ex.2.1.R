x <- log(jj)  # Johnson & Johnson data
trend <- time(jj) - 1970 # centered
Q <- factor(cycle(jj))
reg <- lm(x ~ 0 + trend + Q, na.action = NULL) # no intercept
summary(reg)
# note: trend centering, intercept, all equiv muptiply some A
# which equiv add to Q's coeffs.
eaai <- mean(diff(fitted(reg),4)) # which is exactly trend's coeff