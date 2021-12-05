#simulate data function
simdata <- function(es,var_n, n){
  var_n <- var_n + 1 #to include outcome variable in mvrnorm()
  M <- rep(0,var_n) #set mean to 0 for identification
  S <- diag(var_n) * 1 #predictors have correlations of 1 with themselves
  S[,1][-1] <- es #correlations with outcome variable
  #diag(S)[-1] <- tau2 #something like this could add some more noise to the predictors
  df <-  mvrnorm(n, M, S, tol = 1E-6, empirical = F) #generate data
  colnames(df) <- c('y', sprintf("X%02d", 1:(var_n-1))) #give names
  return(df)
}