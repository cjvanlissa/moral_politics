#simulate data function
simdata <- function(es,var_n, n){
  var_n <- var_n + 1 #to include outcome variable in mvrnorm()
  M <- rep(0,var_n) #set mean to 0 for identification
  
  # 1 can be replaced with some value for the desired variance of the outcome and predictors.
  S <- diag(var_n) * 1 #predictors have variances of 1
  #diag(S)[-1] <- tau2 #something like this could add some more noise to the predictors
  #diag(S)[1] <- tau2 #add more noise to outcome measurement
  
  #this now sets all covariances s_y, s_xi to the same value. we can add some variability in the covariances
  S[,1][-1] <- es #covariances with outcome variable 
  
  df <-  mvrnorm(n, M, S, tol = 1E-6, empirical = F) #generate data
  colnames(df) <- c('y', sprintf("X%02d", 1:(var_n-1))) #give names
  return(df)
}