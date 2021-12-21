#simulate data function
simdata <- function(es,var_n, n, tau2){
  var_n <- var_n + 1     #to include outcome variable in mvrnorm()
  M <- rep(0,var_n)      #set mean to 0 for identification
  
  S <- diag(var_n) * 1   #set initial variances to 1
  #diag(S)[-1] <- tau2   #add extra variance to predictors
  #diag(S)[1] <- tau2    #add extra noise to outcome measurement
  
  #this now sets all correlations s_y, s_xi to the same value.
  S[,1][-1] <- es #covariances with outcome variable 
  S[1,][-1] <- es  
  sds <- rep(tau2, var_n) #reliability of measurements
  S <- diag(sds)%*%S%*%diag(sds) #convert to covariance matrix
  
  df <-  mvrnorm(n, M, S, tol = 1E-6, empirical = F) #generate data
  colnames(df) <- c('y', sprintf("X%d", 1:(var_n-1))) #give names
  return(df)
}

#product BF
gPBF <- function(BFs){
  N  <- ifelse(is.null(nrow(BFs)), length(BFs), nrow(BFs)) #to distinguish between vectors and matrices
  
  res <- apply(BFs, 2, function(x){
    GP <- prod(x) ^ (1 / N) #Geometric mean
    ER <- abs((GP < 1) - sum(x > 1)/N) #Evidence Rate
    SR <- ifelse(GP < 1, #Stability Rate
                 sum(x < GP) / N, 
                 sum(x > GP) / N)
    c(GP, ER, SR)
  })
  
  rownames(res) <- c("Geometric Product", "Evidence Rate", "Stability Rate")
  out <- list("GPBF" = res, "BFs" = BFs, "N" = N)
  class(out) <- "gPBF"
  return(out)
}

