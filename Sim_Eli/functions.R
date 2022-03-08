#simulate data function
simdata <- function(es, n, tau2){
  S <- diag(2) * 1                  # initiate covariance matrix
  
  S[row(S) != col(S)] <- es         # correlation between predictor and outcome (off-diagonals)
  sds <-  c(tau2,1)                 # reliability of predictor and outcome, vary outcome reliability
  S <- diag(sds)%*%S%*%diag(sds)    # convert correlation to covariance matrix
  
  df <-  mvrnorm(n, mu = rep(0,2), S, tol = 1E-6, empirical = F) #generate data
  colnames(df) <- c('y', 'x')       # give names
  return(df)
}


BFs <- function(es, n, hyp_val, k, tau2){
  
  # create dataframe for each group
  dfs <- lapply(1:k, function(i){
    n_df <- floor(rnorm(1, n, n/3))     # sample a sample size
    n_df <- ifelse(n_df < 10, 10, n_df) # make sure sample is at least of size 10
    simdata(es, n_df, tau2)             # return for every group a dataset
  })
  
  # obtain estimates for correlations and their standard errors for every dataset
  res <- sapply(dfs, function(x){
    est <- cor(x)[,1][-1]                     #estimate for correlation between x and y
    se_est <- sqrt((1 - est^2)/(nrow(x) - 2)) #estimate for standard error = sqrt((1-r^2)/df) with df = N - 2
    cbind(est, se_est, nrow(x))               #return estimate, se and sample size of particular set
  })
  
  # necessary naming for bain
  colnames(res) <- paste0('r', 1:k)
  
  sig <- lapply(res[2,], matrix)    # make list of covariance matrices for the datasets, as shown in the bain vignette
  ngroup <- sapply(dfs, nrow)       # obtain sample size per group
  names(ngroup) <- paste0("r", 1:k) # not sure if necessary, but in bain vignette ngroup is a named vector
  bf_individual <- lapply(paste0(colnames(res), ">", hyp_val), # for every group r > 1
                          bain,                 # call bain
                          x = res[1,],          # estimates
                          Sigma = sig,          # all rho's are assumed to be independent
                          n = ngroup,           # pass the named vector of sample sizes per group to bain
                          group_parameters = 1, # every group k has 1 parameter which is rho_xy
                          joint_parameters = 0) # they do not share parameters 
  
  # extract BF_ic and BF_iu for the parameter of every group
  BFs <- t(sapply(bf_individual, function(x){
    c(x$fit$BF.c[1], x$fit$BF.u[1])
  }))
  rm(bf_individual) # bf_individual invokes garbage collection, idk if its faster to use rm() instead of R doing it itself.
  
  # obtain geometric mean
  gp_and_prod <- apply(BFs, 2, function(x){
    prod_bf <- prod(x)         #obtain product bf
    c(prod_bf^(1/k), prod_bf)  #concatenate geometric product and regular product
  })
  
  # create bf_together object to obtain the BFs for the (group1, group2, group3) > hyp_val
  bf_together <- bain(res[1,], 
                      hypothesis = paste0("(", paste0(colnames(res), collapse = ", "), ") > ", hyp_val), 
                      n = sum(sapply(dfs, nrow)), # should n be total sample size combined? --> infHyp.rmd seems suggest so
                      Sigma = diag(res[2,]))      # assume independence between groups
  
  # returns in order: gpbf_ic, gpbf_iu, prodbf_ic, prodbf_iu, tbf_ic, tbf_iu
  return(c(gp_and_prod[1,], 
              gp_and_prod[2,], 
              c(bf_together$fit$BF.c[1], bf_together$fit$BF.u[1])))
}




#product BF
# gPBF <- function(BFs){
#   N  <- ifelse(is.null(nrow(BFs)), length(BFs), nrow(BFs)) #to distinguish between vectors and matrices
#   
#   res <- apply(BFs, 2, function(x){
#     GP <- prod(x) ^ (1 / N) #Geometric mean
#     ER <- abs((GP < 1) - sum(x > 1)/N) #Evidence Rate
#     SR <- ifelse(GP < 1, #Stability Rate
#                  sum(x < GP) / N, 
#                  sum(x > GP) / N)
#     c(GP, ER, SR)
#   })
#   
#   rownames(res) <- c("Geometric Product", "Evidence Rate", "Stability Rate")
#   out <- list("GPBF" = res, "BFs" = BFs, "N" = N)
#   class(out) <- "gPBF"
#   return(out)
# }
# 
# 
# prop_correct <- function(x, BF_threshold, var_n){
#   if(length(BF_threshold) == 1 && BF_threshold == 3){
#     sum(x >= BF_threshold) / (var_n)
#   } else if(length(BF_threshold) == 1 && BF_threshold == 0.33){
#     sum(x <= 0.33) / (var_n)
#   }else{
#     sum(x > min(BF_threshold) & x < max(BF_threshold)) / (var_n)
#   }
# }
