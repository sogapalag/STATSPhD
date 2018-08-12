sunspotz.per <- mvspec(sunspotz, log='no')
U <- qchisq(.025, 2)
L <- qchisq(.975, 2)
x <- c(sunspotz.per$spec[22]/L, sunspotz.per$spec[22]/U)
y <- c(sunspotz.per$spec[24]/L, sunspotz.per$spec[24]/U)
a <- c(sunspotz.per$spec[3]/L, sunspotz.per$spec[3]/U)
cat(c(x,y,a))
# chisq not suitable, var not->0
# though from plot, it's obvious 1/f=11year.