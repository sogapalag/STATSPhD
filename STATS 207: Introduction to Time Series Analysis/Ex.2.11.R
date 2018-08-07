plot(globtemp)
lines(lowess(globtemp, f=.05), lwd=2, col=2) # red
lines(lowess(globtemp), lty=2, col=2)        # red dash
lines(ksmooth(time(globtemp), globtemp, "normal",
              bandwidth = 2), lwd=1, col=4)  # blue