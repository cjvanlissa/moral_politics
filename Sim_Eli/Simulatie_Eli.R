dependencies <- c('MASS', 'bain')
lapply(dependencies, function(x){library(x, character.only = T)})

rm(list=ls(all.names = T))
cat("\014")
source('./Sim_Eli/smdata.R')

#results of mini simulation, outcomes are BF_together and Geometric product of BFs_individual
#Evidence Rate and Stability Rate are measures of validity for 'Geometric product'
results <- readRDS("./Sim_Eli/results_Eli2.RData")

### MINI SIMULATION CAN BE FOUND ON LINE 133 AND FURTHER ###

#to test
var_n <- 3
n <- 100
hyp_val <- 0.1
es <- 0.1
k <- 10


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

#prepare for bain()
res.i <- lapply(res, function(x){
  ests <- x[,1] #extract estimate
  sig <- diag(x[,2]) #extract varcov matrix
  names(ests) <- paste0("r", 1:length(ests)) 
  return(list(est = ests, sig = sig))
})
names(res.i) <- paste0("group", 1:k)

#we could also use lm() instead of cor()
# res <- lapply(dfs, function(x){
#   fit.lin <- lm(y ~ .,data = as.data.frame(x))
#   return(fit.lin)
# })
# names(res) <- paste0('group', 1:k)
# 
# #obtain for each group and every correlation the bayes factor
# bf_individual <- lapply(res, function(x){
#   bf <- bain(x, paste(paste0(sprintf("X%02d", 1:var_n), ">", hyp_val), collapse = '&'))
#   #names(bf) <- paste0(names(ests))
#   return(bf)
# })


#obtain for each group and every correlation the bayes factor
bf_individual <- lapply(res.i, function(x){ #for all groups
  ests <- x[['est']] #extract estimate
  sig <- x[['sig']] #extract varcov matrix
  bf <- lapply(paste0(names(ests), ">", hyp_val), #evaluate each parameter on some hypothesized value for every group
                          bain, #function bain::bain()
                          x = ests,
                          Sigma = sig,
                          n = n)
  names(bf) <- paste0(names(ests))
  return(bf)
})
#give appropriate names
names(bf_individual) <- paste0("group", 1:k)

#obtain BF_ic for every group and every hypothesis
BFs <- matrix(NA, nrow = k, ncol = var_n) # create output table with N rows and 2 columns
colnames(BFs) <- paste0("BF: ", sprintf("X%02d", 1:var_n), ">", hyp_val)
rownames(BFs) <- paste0("group", 1:k)
for(i in 1:k){
  for(j in 1:var_n){
    BFs[i,j] <- bf_individual[[i]][[j]]$fit$BF.c[1] #BF of Hi against Hc
  }
}
results_i <- gPBF(BFs)
results_i$GPBF[1,] #Geometric Product is average relative evidence for Hi over Hc for the groups.
#if 1, This means equal support for both Hi and Hc
results_i$GPBF[2,] #Evidence Rate = proportion of groups that favor the hypothesis that GmPBF also supports. 
#If 0.5, half of the groups have BFac < gPBF and half have BFac > gPBF
results_i$GPBF[3,] #Stability rate = proportion of groups that provide even stronger evidence for Hi vs Hc 
#than gmPBF suggests.
#if 0.5, half of groups provide stronger evidence than gPBF suggest, half provide weaker evidence. 



#now we need BF together which is (group1_rj, group2_rj, groupk_rj) > hyp_val
#equivalent to group1_rj > hyp_val & group2_rj > hyp_val & ...  & groupk_rj > hyp_val
#so now we dont extract estimates per group apart, but together on one parameter estimates hypothesized value
#prepare
res.t <- sigs <- c() 
for(i in 1:length(res)){
  res.t <- cbind(res.t,res[[i]][,1]) #matrix with correlations in rows, groups in columns
  sigs <- cbind(sigs, res[[i]][,2]) #matrix with se's in rows, groups in columns
}
colnames(res.t) <- paste0("group", 1:k) #for clarity give names

hyps <- paste0("(", paste0(colnames(res.t), collapse = ", "), ") > ", hyp_val)

#create bf_together object to obtain the BFs for the (group1, group2, group3) > hyp_val hypothesis
bf_together <- list()
for(i in 1:var_n){
  bf_together[[i]] <- bain(res.t[i,], hyps, n = n , Sigma = diag(sigs[i,]))
}
names(bf_together) <- paste0('r', 1:var_n) #names for clarity

BFs.t <- matrix(NA, nrow = var_n, ncol = 2) # create output table with N rows and 2 columns
colnames(BFs.t) <- c("BF_ic", "BF_iu")
rownames(BFs.t) <- paste0("BF.t: ", sprintf("X%02d", 1:var_n), ">", hyp_val)
for(i in 1:var_n){
    BFs.t[i,1] <- bf_together[[i]]$fit$BF.c[1] #BF of Hi against Hc
    BFs.t[i,2] <- bf_together[[i]]$fit$BF.u[1] #BF of Hi against Hu
  }

t(BFs.t) #BF together
results_i[["GPBF"]][1,] #GPBF individual

results <- cbind(as.vector(t(BFs.t)), t(results_i[["GPBF"]]))
colnames(results) <- c("BF_together", colnames(results[,2:4]))



#########################
# start mini simulation #
#########################

## put in function
BFs <- function(es, var_n, n, hyp_val, k){

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
  
  #prepare for bain()
  res.i <- lapply(res, function(x){
    ests <- x[,1] #extract estimate
    sig <- diag(x[,2]) #extract varcov matrix
    names(ests) <- paste0("r", 1:length(ests)) 
    return(list(est = ests, sig = sig))
  })
  names(res.i) <- paste0("group", 1:k)
  
  #obtain individual Bfs
  bf_individual <- lapply(res.i, function(x){ #for all groups
    ests <- x[['est']] #extract estimate
    sig <- x[['sig']] #extract varcov matrix
    bf <- lapply(paste0(names(ests), ">", hyp_val), #evaluate each parameter on some hypothesized value
                 bain, #function bain::bain()
                 x = ests,
                 Sigma = sig,
                 n = n)
    names(bf) <- paste0(names(ests))
    return(bf)
  })
  #give appropriate names
  names(bf_individual) <- paste0("group", 1:k)
  
  #obtain BF_ic for every group and every hypothesis
  BFs <- matrix(NA, nrow = k, ncol = var_n) # create output table with N rows and 2 columns
  colnames(BFs) <- paste0("BF: ", sprintf("X%02d", 1:var_n), ">", hyp_val)
  rownames(BFs) <- paste0("group", 1:k)
  for(i in 1:k){
    for(j in 1:var_n){
      BFs[i,j] <- bf_individual[[i]][[j]]$fit$BF.c[1] #BF of Hi against Hc
    }
  }
  #obtain geometric mean, ER and SR
  results_i <- gPBF(BFs)
  
  #prepare for BF together
  res.t <- sigs <- c() 
  for(i in 1:length(res)){
    res.t <- cbind(res.t,res[[i]][,1]) 
    sigs <- cbind(sigs, res[[i]][,2])
  }
  colnames(res.t) <- paste0("group", 1:k) 
  
  hyps <- paste0("(", paste0(colnames(res.t), collapse = ", "), ") > ", hyp_val)
  
  #create bf_together object to obtain the BFs for the (group1, group2, group3) > hyp_val hypothesis
  bf_together <- list()
  for(i in 1:var_n){
    bf_together[[i]] <- bain(res.t[i,], hyps, n = n , Sigma = diag(sigs[i,]))
  }
  names(bf_together) <- paste0('r', 1:var_n) #names for clarity
  
  BFs.t <- matrix(NA, nrow = var_n, ncol = 1) # create output table with N rows and 2 columns
  colnames(BFs.t) <- paste0("k = ", k)
  rownames(BFs.t) <- paste0("BF.t: ", sprintf("X%02d", 1:var_n), ">", hyp_val)
  for(i in 1:var_n){
    BFs.t[i,1] <- bf_together[[i]]$fit$BF.c[1] #BF of Hi against Hc
  }
  
  t(BFs.t) #BF together
  results_i[["GPBF"]][1,] #GPBF individual
  
  results <- cbind(as.vector(t(BFs.t)), t(results_i[["GPBF"]]))
  colnames(results) <- c("BF_together", colnames(results[,2:4]))
  
  
  result <- list(result = results,
                 conds = c(es, var_n, n, hyp_val, k))
  return(result)
}

#specify hyperparameters
HyperPar <- list(
  es = c(0, 0.2, 0.4), #true effect size = true correlation with outcome
  #tau2 = c(0, 0.1, 0.3), #reliability of measurement
  n = c(200), #sample size (can be divided by I to obtain different sample sizes per group )
  k = c(5, 10), #number of groups
  hyp_val = c(0.2), #thresholds for informative hypotheses
  #hyp_n = c(5,6,7) #number of hypotheses
  var_n = c(3) #numer of predictors
)

#expand into grid
conditions <- do.call(expand.grid, HyperPar)
conditions$id <- 1:nrow(conditions)

#run simulation
set.seed(6164900)
results <- apply(conditions, 1, function(x){
  print(paste0(x['id'], '/', nrow(conditions),  ' running...'))
  BFs(es = x['es'], var_n = x['var_n'], n = x['n'], hyp_val = x['hyp_val'], k = x['k'])
})
names(results) <- sprintf("sim%02d", 1:length(results))
saveRDS(results, file = "./Sim_Eli/results_Eli2.RData")




#obtain bench time and memory of object
Time <- bench::bench_time(apply(conditions, 1, function(x){
  BFs(es = x['es'], var_n = x['var_n'], n = x['n'], hyp_val = x['hyp_val'], k = x['k'])
})) #takes 1.58 seconds on my computer for 8 simulations
format(object.size(results), 'Kb') 

#how long would N simulations take
HowLong <- function(nsim, TiMe, df){
  seconds <- round(nsim * Time[2] / nrow(df), 2)
  minutes <- round(nsim * Time[2] / nrow(df) / 60, 2) 
  return(c(seconds = seconds, minutes = minutes))
}
HowLong(500, Time[2], conditions) #500 would take rougly 100 seconds. Larger values for k, var_n and n may increase benchtime.



