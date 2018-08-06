sa <- c(rep(0,100), 10*exp(-(1:100)/20)*cos(2*pi*1:100/4))
xa <- sa + rnorm(200)
acf(xa, type="correlation")
# intuition, in sa late, amp 10> 1 noise
# and exp is decay, cos is period=4, so the plot is obvious. 