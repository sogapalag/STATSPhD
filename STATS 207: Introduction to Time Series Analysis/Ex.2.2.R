temp <- tempr-mean(tempr) # center temperature
temp2 <- temp^2 
trend <- time(cmort) # time
# align
dataf <- ts.intersect(cmort, trend, temp, temp2, part,
                      partL4 = lag(part, -4), dframe = TRUE) 
fit <- lm(cmort ~ trend + temp + temp2 + part + partL4, 
          data=dataf, na.action = NULL)
panel.cor <- function(x, y, digits = 2, prefix = "", cex.cor)
{
  usr <- par("usr"); on.exit(par(usr))
  par(usr = c(0, 1, 0, 1))
  r <- round(cor(x, y), 2)
  txt <- paste0(prefix, r)
  if(missing(cex.cor)) cex.cor <- 0.8/strwidth(txt)
  text(0.5, 0.5, txt, cex = cex.cor * r)
}
dev.new()
pairs(cbind(dataf$cmort, dataf$temp, dataf$part, dataf$partL4), 
      upper.panel=panel.cor)