dependencies <- c('MASS', 'bain', 'profvis')
lapply(dependencies, function(x){library(x, character.only = T)})

rm(list=ls(all.names = T))
cat("\014")
source('./Sim_Eli/functions.R')


#to test
n <- 1000
hyp_val <- 0.1
es <- 0.1
k <- 20
tau2 <- 2

# Below I run an R profiler to see where the code can be optimized. 
# The results:
# 1.) It does well, all time and memory seems to go into lapply() for the bf_individual.
#    This makes sense as the simulation has to call k bain() functions and use RAM for k bain objects, all stored in bf_individual.
#    And indeed, the only parameter that seems to increase time is k (number of groups).
#    I don't see how I can speed that up as it depends on bain.
#
# 2.) bf_individual invokes garbage collection.  
#     I do not know whether it is faster and memory-efficient to rm(bf_individual) in script or that it makes no difference.
profvis({
  # create dataframe for each group
  dfs <- lapply(1:k, function(i){
    n_df <- floor(rnorm(1, n, n/3)) #sample a sample size
    n_df <- ifelse(n_df < 10, 10, n_df) #make sure sample is at least of size 10
    simdata(es, n_df, tau2) 
  })
  
  # obtain estimates for correlations and their standard errors
  res <- sapply(dfs, function(x){
    est <- cor(x)[,1][-1]                     #estimate for correlation between x and y
    se_est <- sqrt((1 - est^2)/(nrow(x) - 2)) #standard error = sqrt((1-r^2)/df) with df = N - 2
    cbind(est, se_est, nrow(x))
  })
  
  # necessary naming for bain
  colnames(res) <- paste0('r', 1:k)
  
  sig <- lapply(res[2,], matrix)   #make list of covariance matrices for the datasets, as shown in the bain vignette
  ngroup = sapply(dfs, nrow)       #obtain sample size per group
  names(ngroup) = paste0("r", 1:k) #not sure if necessary, but in bain vignette ngroup is a named vector
  bf_individual <- lapply(paste0(colnames(res), ">", hyp_val),
                          bain,
                          x = res[1,],
                          Sigma = sig,          #all rho's are assumed to be independent
                          n = ngroup,
                          group_parameters = 1, #every group k has 1 parameter which is rho_xy
                          joint_parameters = 0) #they do not share parameters 
  
  # extract BF_ic and BF_iu for the parameter of every group
  BFs <- t(sapply(bf_individual, function(x){
    c(x$fit$BF.c[1], x$fit$BF.u[1])
  }))
  rm(bf_individual) # bf_individual invokes garbage collection, idk if its faster to use rm() instead of R doing it itself.
  
  #obtain geometric mean
  gp_and_prod <- apply(BFs, 2, function(x){
    prod_bf <- prod(x)         #obtain product bf
    c(prod_bf^(1/k), prod_bf)  #concatenate geometric product and regular product
  })
  
  # create bf_together object to obtain the BFs for the (group1, group2, group3) > hyp_val
  bf_together <- bain(res[1,], 
                      hypothesis = paste0("(", paste0(colnames(res), collapse = ", "), ") > ", hyp_val), 
                      n = sum(sapply(dfs, nrow)), #should n be total sample size combined? --> infHyp.rmd seems suggest so
                      Sigma = diag(res[2,]))      #assume independence between groups
  
  #returns in order: gpbf_ic, gpbf_iu, prodbf_ic, prodbf_iu, tbf_ic, tbf_iu
  c(gp_and_prod[1,], 
           gp_and_prod[2,], 
           c(bf_together$fit$BF.c[1], bf_together$fit$BF.u[1]))
})


rm(list = ls())
gc(reset = T, full = T)



#simulate data for every group
dfs <- lapply(1:k, function(i){
  n_df <- floor(rnorm(1, n, n/3)) #sample a sample size
  n_df <- ifelse(n_df < 10, 10, n_df) #make sure sample is at least of size 10
  simdata(es, n_df, tau2) 
})

n_tot <- sum(sapply(dfs, nrow))

groupnames <- paste0("group", 1:k)
effectnames <- sprintf("r%d", 1:var_n)
hypotheses <- lapply(seq(1, to = k*var_n, by = k), function(i){
  paste0(apply(expand.grid(groupnames, effectnames), 1, 
               paste, collapse="_")[i:(i+(k-1))], ">", hyp_val)
})


