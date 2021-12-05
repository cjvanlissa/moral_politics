dependencies <- c('MASS')
lapply(dependencies, function(x){library(x, character.only = T)})

HyperPar <- list(
  es = c(0.1,0.2,0.3), #true effect size = true correlation with outcome
  #tau2 = c(0, 0.1, 0.3), #variance of measurements. maybe not necessary since correlations are used
  n = c(50,100,200), #sample size (can be divided by I to obtain different sample sizes per group )
  k = c(3,4,5), #number of groups
  hyp_val = c(0.1,0.2,0.3), #thresholds for informative hypotheses
  #hyp_n = c(5,6,7) #number of hypotheses
  var_n = c(2,4,6) #numer of predictors
)

conditions <- do.call(expand.grid, HyperPar)

simdata <- function(es,var_n, n){
  var_n <- var_n + 1 #to include outcome variable
  M <- rep(0,var_n)
  S <- diag(var_n) * 1
  S[,1][-1] <- es #correlations with outcome variable
  #diag(S)[-1] <- tau2 #something like this could add some more noise to the predictors
  df <-  mvrnorm(n, M, S, tol = 1E-6, empirical = F)
  colnames(df) <- c('y', sprintf("X%02d", 1:(var_n-1))) #give names
  return(df)
}


dfs <- lapply(1:k, function(i){
  simdata(es, var_n, n)
})

res <- lapply(dfs, function(x){
  r <- cor(x)
  ests <- r[,1][-1]
  df <- nrow(x) - (var_n + 1)
  se_ests <- sqrt((1 - ests^2)/df)
  return(cbind(ests,se_ests))
})



