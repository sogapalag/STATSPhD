clinic_proc <- function(){
  start_time <- 9*60 # 9:00 am
  end_time <- (12+4)*60 # 4:00 pm
  DT <- end_time - start_time
  dt <- 0 # pass_time
  beta <- 10 # next mean =10min
  mt <- 5
  Mt <- 20
  patients <- c() # patients comming time
  pspends <- c() # each spend time
  # generate patients, with their spends
  repeat{
    pnext_time <- rexp(1, rate = 1/beta)
    if (pnext_time > DT - dt){break}
    dt <- dt + pnext_time
    patients <- c(patients, dt)
    pspends <- c(pspends, runif(1,mt,Mt))
  }
  a <- length(patients)
  b <- c() # wating time (>0)
  pends <- c()
  for (i in 1:3){
    pends <- c(pends, patients[i]+pspends[i])
  }
  m3x <- sort(pends) # max 3 leaving time
  for (i in 4:a){
    wt <- max(0, m3x[1] - patients[i]) # i's wait time
    if (wt > 0){b <- c(b, wt)}
    m3x[1] <- patients[i] + wt + pspends[i] 
    m3x <- sort(m3x)
  }
  d <- max(0, m3x[3] - DT) #closing
  mb <- 0
  if (length(b)>0){
    mb <- mean(b)
  }
  #  #patients, #wated, #wating-t,  #closing
  return(c(a, length(b), mb, d))
}
n <- 100
clinic_data <- c()
for (i in 1:n){
  clinic_data <- c(clinic_data, clinic_proc())
}
clinic_data <- matrix(clinic_data, nrow=4, ncol=n)
for (i in 1:4){
  print(c(median(clinic_data[i,]), 
          quantile(clinic_data[i,],probs = seq(0,1,.25))))
}

