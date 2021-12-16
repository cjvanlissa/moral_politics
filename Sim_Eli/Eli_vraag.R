dependencies <- c('MASS', 'bain')
lapply(dependencies, function(x){library(x, character.only = T)})

# rm(list=ls(all.names = T))
# cat("\014")
source('./Sim_Eli/smdata.R')


#fix conditions for testing purposes
var_n <- 3       # number of predictors
n <- 100         # sample size per group
hyp_val <- 0.1   # hypothesis threshold
es <- 0.1        # true effect size
k <- 10          # number of groups
#tau2 <- 0       # variance of outcome variable

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

#prepare for bain() to obtain individual Bayes Factors
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
  ests <- x[['est']]                        #extract estimate
  sig <- x[['sig']]                         #extract varcov matrix
  bf <- lapply(paste0(names(ests), ">", hyp_val), #evaluate each parameter on some hypothesized value for every group
               bain,                        #function bain::bain()
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

#obtain geometric product over all groups for every predictor, evidence rate and stability rate 
results_i <- gPBF(BFs)
results_i$GPBF 

#prepare for BF_together; (group1_rj, group2_rj, ...,  groupk_rj) > hyp_val
res.t <- sigs <- c() 
for(i in 1:length(res)){
  res.t <- cbind(res.t,res[[i]][,1]) #matrix with correlations in rows, groups in columns
  sigs <- cbind(sigs, res[[i]][,2]) #matrix with se's in rows, groups in columns
}
colnames(res.t) <- paste0("group", 1:k) #for clarity give names

#Hypotheses will be first applied to r1, then r2 etc...
hyps <- paste0("(", paste0(colnames(res.t), collapse = ", "), ") > ", hyp_val)

#create bf_together object to obtain the BFs for the (group1, group2, group3) > hyp_val hypothesis
bf_together <- list()
for(i in 1:var_n){
  bf_together[[i]] <- bain(res.t[i,], hyps, n = n , Sigma = diag(sigs[i,]))
}
names(bf_together) <- paste0('r', 1:var_n)

BFs.t <- matrix(NA, nrow = var_n, ncol = 1) # create output table with N rows and 2 columns
colnames(BFs.t) <- "BF_ic"
rownames(BFs.t) <- paste0("BF.t: ", sprintf("X%02d", 1:var_n), ">", hyp_val)
for(i in 1:var_n){
  BFs.t[i,1] <- bf_together[[i]]$fit$BF.c[1] #BF of Hi against Hc
  #BFs.t[i,2] <- bf_together[[i]]$fit$BF.u[1] #BF of Hi against Hu
}

t(BFs.t) #BF together
results_i[["GPBF"]][1,] #GPBF individual

results <- cbind(as.vector(t(BFs.t)), t(results_i[["GPBF"]]))
colnames(results) <- c("BF_together", colnames(results[,2:4]))

print(results)


results <- readRDS("./Sim_Eli/results_Eli2.RData")
results[[2]] #this is what the output for 1 simulation is.

# pop_effect <- ifelse(es >= hyp_val, 1, 0)
# if(pop_effect == 1 & BF < 3){
#   performance <- 0
# } else if(pop_effect == 1 & BF > 3){
#   performance <- 1
# } else if(... etc)



# Simuleer blok condities en simuleer data voor elke conditie.
# Elk algoritme produceert een BFic en BFiu (output)
# - (algoritmes staan o.a. in analysis.R en zijn bv prod(BF_individual), BF_together, gPBF))
# We checken dus Hi tegen zowel Hc als Hu
# De condities (en de daaruit volgende data) vertellen of de hypothese wel of niet kloppen.
# Als de hypothese klopt, dan heeft het algoritme het goed gedaan als hij BF > 3 produceert. 
# ALs de hypothese niet klopt, dan moet BF < 3.

# BF_together lijkt afhankelijk van het aantal groepen. (misschien manier vinden om daarvoor te corrigeren zoals geometric mean ipv arithmetic mean.)
# Andreas Brandmeijer = computer scientist die ook veel statistiek doet. Mail Caspar als je met hem wil praten
# Caspar heeft Pema aangepast, goed om te bekijken

