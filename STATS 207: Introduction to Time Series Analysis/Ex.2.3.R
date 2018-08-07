par(mfrow=c(2,2), mar=c(2.5,2.5,0,0)+.5, mgp=c(1.6,.6,0)) # set up
for (i in 1:4){
  x <- ts(cumsum(rnorm(100,.01,1)))       # data
  regx <- lm(x~0+time(x), na.action=NULL) # regression
  plot(x, ylab='Random Walk w Drift')    # plots
  abline(a=0, b=.01, col=2, lty=2)       # true mean (red - dashed)
  abline(regx, col=4)                    # fitted line (blue - solid)
}
dev.new()
par(mfrow=c(2,2), mar=c(2.5,2.5,0,0)+.5, mgp=c(1.6,.6,0)) # set up
for (i in 1:4){
  y <- ts(.01*1:100+rnorm(100,0,1))
  regy <- lm(y~0+time(y), na.action = NULL)
  plot(y, ylab='noise with Drift')
  abline(a=0, b=.01, col=2, lty=2)
  abline(regy, col=4)
}
# RW will go far. noise regy work well.