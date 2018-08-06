cs = 2*cos(2*pi*1:500/50 + .6*pi); w = rnorm(500,0,1)
acf(cs+w, lag.max = 100, type="correlation")
# period = 50, cos is correlated part; 
# both part var=1, thus amp of pho ~ 1/2.