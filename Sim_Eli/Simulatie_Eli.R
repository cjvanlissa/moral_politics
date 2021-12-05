dependencies <- c('MASS', 'bain')
lapply(dependencies, function(x){library(x, character.only = T)})

rm(list=ls(all.names = T))
cat("\014")
source('./Sim_Eli/smdata.R')

### MINI SIMULATION CAN BE FOUND ON LINE 112 AND FURTHER ###

#specify hyperparameters
HyperPar <- list(
  es = c(0.1,0.2,0.3), #true effect size = true correlation with outcome
  #tau2 = c(0, 0.1, 0.3), #variance of measurements. maybe not necessary since correlations are used
  n = c(50,100,200), #sample size (can be divided by I to obtain different sample sizes per group )
  k = c(3,4,5), #number of groups
  hyp_val = c(0.1,0.2,0.3), #thresholds for informative hypotheses
  #hyp_n = c(5,6,7) #number of hypotheses
  var_n = c(2,4,6) #numer of predictors
)

#expand into grid
conditions <- do.call(expand.grid, HyperPar)
set.seed(6164900)
conditions$seeds <- sample(1:1E5, nrow(conditions), replace = F )

#to test
var_n <- 2
n <- 200
hyp_val <- 0.1
es <- 0.1
k <- 3


#simulate data for every group
dfs <- lapply(1:k, function(i){
  simdata(es, var_n, n) 
})

#obtain estimates for correlations and their standard errors
res <- lapply(dfs, function(x){
  r <- cor(x) #obtain correlation matrix for df
  ests <- r[,1][-1] #estimates
  df <- nrow(x) - (var_n + 1) #degrees of freedom
  se_ests <- sqrt((1 - ests^2)/df) #standard error sqrt((1-r^2)/df)
  return(cbind(ests,se_ests))
})
names(res) <- paste0('group', 1:k)

res.i <- lapply(res, function(x){
  ests <- x[,1] #extract estimate
  sig <- diag(x[,2]) #extract varcov matrix
  names(ests) <- paste0("r", 1:length(ests)) 
  return(list(est = ests, sig = sig))
})
names(res.i) <- paste0("group", 1:k)

#we give different names to r if it is in a different group, so that we can get the BF_together
# for(i in 1:length(res.i)){
#   names(res.i[[i]][["est"]]) <- paste0("g", i, "r", 1:var_n)
# }

#obtain for each group and every correlation the bayes factor
bf_individual <- lapply(res.i, function(x){
  ests <- x[['est']] #extract estimate
  sig <- x[['sig']] #extract varcov matrix
  bf <- lapply(paste0(names(ests), ">", hyp_val), #evaluate values on some hypothesized value
                          bain, #function bain::bain()
                          x = ests,
                          Sigma = sig,
                          n = n)
  names(bf) <- paste0(names(ests))
  return(bf)
})
#give appropriate names
names(bf_individual) <- paste0("group", 1:k)

#obtain fit of hypotheses
fit.i <- lapply(bf_individual, function(x){
  sapply(x, function(y){y$fit$Fit[1]})
})

#obtain BF of hypotheses.
BF.i <- lapply(bf_individual, function(x){
  sapply(x, function(y){y$fit$BF[1]})
})

#now we need BF together which is (group1_r1, group2_r2, group3_r2) > hyp_val
#so now we dont extract estimates per group apart, but together
res.t <- sigs <- nams <- c() #
for(i in 1:length(res)){
  res.t <- cbind(res.t,res[[i]][,1]) #matrix with correlations in rows, groups in columns
  sigs <- cbind(sigs, res[[i]][,2]) #matrix with se's in rows, groups in columns
}
colnames(res.t) <- paste0("group", 1:k) #for clarity give names

#the hypotheses are now (group1, group2, group3) > hyp_val where it is first run for r1, then for r2 etc...
hyps <- paste0("(", paste0(colnames(res.t), collapse = ", "), ") > ", hyp_val)

#create bf_together object to obtain the BFs for the (group1, group2, group3) > hyp_val hypothesis
bf_together <- list()
for(i in 1:var_n){
  bf_together[[i]] <- bain(res.t[i,], hyps, n = n , Sigma = diag(sigs[i,]))
}
names(bf_together) <- paste0('r', 1:var_n) #names for clarity

#obtain fit of hypotheses
fit.t <- sapply(bf_together, function(x){x$fit$Fit[1]})

#obtain BF of hypotheses.
BF.t <- sapply(bf_together, function(x){x$fit$BF[1]})

result <- list(fit.i = fit.i, BF.i = BF.i, BF.t = BF.t, fit.t = fit.t)



#########################
# start mini simulation #
#########################

## put in function
BFs <- function(es, var_n, n, hyp_val, k, seed = 6164900){
  #simulate data for every group
  set.seed(seed)
  
  dfs <- lapply(1:k, function(i){
    simdata(es, var_n, n) 
  })
  
  #obtain estimates for correlations and their standard errors
  res <- lapply(dfs, function(x){
    r <- cor(x) #obtain correlation matrix for df
    ests <- r[,1][-1] #estimates
    df <- nrow(x) - (var_n + 1) #degrees of freedom
    se_ests <- sqrt((1 - ests^2)/df) #standard error sqrt((1-r^2)/df)
    return(cbind(ests,se_ests))
  })
  names(res) <- paste0('group', 1:k)
  
  res.i <- lapply(res, function(x){
    ests <- x[,1] #extract estimate
    sig <- diag(x[,2]) #extract varcov matrix
    names(ests) <- paste0("r", 1:length(ests)) 
    return(list(est = ests, sig = sig))
  })
  names(res.i) <- paste0("group", 1:k)
  
  
  #obtain for each group and every correlation the bayes factor
  bf_individual <- lapply(res.i, function(x){
    ests <- x[['est']] #extract estimate
    sig <- x[['sig']] #extract varcov matrix
    bf <- lapply(paste0(names(ests), ">", hyp_val), #evaluate values on some hypothesized value
                 bain, #function bain::bain()
                 x = ests,
                 Sigma = sig,
                 n = n)
    names(bf) <- paste0(names(ests))
    return(bf)
  })
  #give appropriate names
  names(bf_individual) <- paste0("group", 1:k)
  
  #obtain fit of hypotheses
  fit.i <- lapply(bf_individual, function(x){
    sapply(x, function(y){y$fit$Fit[1]})
  })
  
  #obtain BF of hypotheses.
  BF.i <- lapply(bf_individual, function(x){
    sapply(x, function(y){y$fit$BF[1]})
  })
  
  res.t <- sigs <- nams <- c()
  for(i in 1:length(res)){
    res.t <- cbind(res.t,res[[i]][,1])
    sigs <- cbind(sigs, res[[i]][,2])
  }
  colnames(res.t) <- paste0("group", 1:k)
  hyps <- paste0("(", paste0(colnames(res.t), collapse = ", "), ") > ", hyp_val)
  
  bf_together <- list()
  for(i in 1:var_n){
    bf_together[[i]] <- bain(res.t[i,], hyps, n = n , Sigma = diag(sigs[i,]))
  }
  names(bf_together) <- paste0('r', 1:var_n)
  
  #obtain fit of hypotheses
  fit.t <- sapply(bf_together, function(x){x$fit$Fit[1]})
  
  #obtain BF of hypotheses.
  BF.t <- sapply(bf_together, function(x){x$fit$BF[1]})
  
  result <- list(fit.i = fit.i, BF.i = BF.i, BF.t = BF.t, fit.t = fit.t,
                 conds = c(es, var_n, n, hyp_val, k, seed))
  return(result)
}

#specify hyperparameters
HyperPar <- list(
  es = c(0, 0.4), #true effect size = true correlation with outcome
  #tau2 = c(0, 0.1, 0.3), #variance of measurements. maybe not necessary since correlations are used
  n = c(200), #sample size (can be divided by I to obtain different sample sizes per group )
  k = c(3, 5), #number of groups
  hyp_val = c(0.2), #thresholds for informative hypotheses
  #hyp_n = c(5,6,7) #number of hypotheses
  var_n = c(2,4) #numer of predictors
)

#expand into grid
conditions <- do.call(expand.grid, HyperPar)
set.seed(6164900)
conditions$seeds <- sample(1:1E5, nrow(conditions), replace = F )
conditions$id <- 1:nrow(conditions)

#run simulation
results <- apply(conditions, 1, function(x){
  print(paste0(x['id'], '/', nrow(conditions),  ' running...'))
  BFs(es = x['es'], var_n = x['var_n'], n = x['n'], hyp_val = x['hyp_val'], k = x['k'], seed = x['seeds'] )
})
names(results) <- sprintf("sim%02d", 1:length(results))
saveRDS(results, file = "./Sim_Eli/results_Eli1.RData")

#obtain bench time and memory of object
Time <- bench::bench_time(apply(conditions, 1, function(x){
  BFs(es = x['es'], var_n = x['var_n'], n = x['n'], hyp_val = x['hyp_val'], k = x['k'], seed = x['seeds'] )
})) #takes 1.58 seconds on my computer for 8 simulations
format(object.size(results), 'Kb') 

#how long would N simulations take
HowLong <- function(nsim, TiMe, df){
  seconds <- round(nsim * Time[2] / nrow(df), 2)
  minutes <- round(nsim * Time[2] / nrow(df) / 60, 2) 
  return(c(seconds = seconds, minutes = minutes))
}
HowLong(500, Time[2], conditions) #500 would take rougly 100 seconds. Larger values for k, var_n and n may increase benchtime.



