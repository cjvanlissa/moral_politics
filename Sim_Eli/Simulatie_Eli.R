dependencies <- c('MASS', 'bain')
lapply(dependencies, function(x){library(x, character.only = T)})

rm(list=ls(all.names = T))
cat("\014")
source('./Sim_Eli/smdata.R')

#results of mini simulation, outcomes are BF_together and Geometric product of BFs_individual
#Evidence Rate and Stability Rate are measures of validity for 'Geometric product'
results2 <- readRDS("./Sim_Eli/results_Eli2.RData")

### MINI SIMULATION CAN BE FOUND ON LINE 133 AND FURTHER ###

#to test
var_n <- 4
n <- 200 #mean sample size per group
hyp_val <- 0.2
es <- 0
k <- 5
tau2 <- 1.5


#########################
# start mini simulation #
#########################

## put in function
BFs <- function(es, var_n, n, hyp_val, k, tau2){
  
  #specify true BF, is either 3, between 0.33 and 3 and 0.33
  BF_threshold <- if(es > hyp_val){3}else if(es == hyp_val){range(0.33,3)}else{0.33}
  
  #difference true effect size and hypothesized value
  es_min_hypval <- es - hyp_val
  
  #simulate data for every group
  dfs <- lapply(1:k, function(i){
    n_df <- floor(rnorm(1, n, n/3)) #sample a sample size
    n_df <- ifelse(n_df < 10, 10, n_df) #make sure sample is at least of size 10
    simdata(es, var_n, n_df, tau2) 
  })
  
  n_tot <- sum(sapply(dfs, nrow))
  
  #obtain estimates for correlations and their standard errors
  res <- lapply(dfs, function(x){
    n_group <- rep(nrow(x), var_n)
    r <- cor(x) #obtain correlation matrix for df
    ests <- r[,1][-1] #estimates
    df <- nrow(x) - (var_n + 1) #degrees of freedom
    se_ests <- sqrt((1 - ests^2)/df) #standard error sqrt((1-r^2)/df)
    return(cbind(ests,se_ests,n_group))
  })
  names(res) <- paste0('group', 1:k)
  
  #prepare for bain()
  res.i <- lapply(res, function(x){
    ests <- x[,1] #extract estimate
    sig <- diag(x[,2]) #extract varcov matrix
    names(ests) <- paste0("r", 1:length(ests)) 
    return(list(est = ests, sig = sig, n_group = x[1,3]))
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
                 n = x[['n_group']])
    names(bf) <- paste0(names(ests))
    return(bf)
  })
  #give appropriate names
  names(bf_individual) <- paste0("group", 1:k)
  
  #obtain BF_ic for every group and every hypothesis
  BFs <- matrix(NA, nrow = k, ncol = var_n*2) # create output table with N rows and 2 columns
  colnames(BFs) <- c(paste0("BF_ic: ", sprintf("X%d", 1:var_n), ">", hyp_val),
                     paste0("BF_iu: ", sprintf("X%d", 1:var_n), ">", hyp_val)    )
  rownames(BFs) <- paste0("group", 1:k)
  for(i in 1:k){
    for(j in 1:var_n){
      BFs[i,j] <- bf_individual[[i]][[j]]$fit$BF.c[1] #BF of Hi against Hc
      BFs[i,(j+var_n)] <- bf_individual[[i]][[j]]$fit$BF.u[1] #BF of Hi against Hu
    }
  }
  
  #obtain geometric mean, could be could to also include SR and ER
  results_i <- gPBF(BFs)$GPBF[1,]
  #obtain product BF
  results_i_prod <- apply(BFs, 2, prod)
  
  ###prepare for BF together
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
    bf_together[[i]] <- bain(res.t[i,], hyps, n = n_tot , Sigma = diag(sigs[i,])) #should n be total sample size combined?
  }
  names(bf_together) <- paste0('r', 1:var_n) #names for clarity
  
  BFs.t <- matrix(NA, nrow = var_n, ncol = 2) # create output table with N rows and 2 columns
  colnames(BFs.t) <- c("BF_ic", "BF_iu")
  rownames(BFs.t) <- paste0("BF.t: ", sprintf("X%02d", 1:var_n), ">", hyp_val)
  for(i in 1:var_n){
    BFs.t[i,1] <- bf_together[[i]]$fit$BF.c[1] #BF of Hi against Hc
    BFs.t[i,2] <- bf_together[[i]]$fit$BF.u[1] #BF of Hi against Hu
  }
  
  
  ### combine all results
  all_BFs <- cbind(as.vector(t(BFs.t)), results_i, results_i_prod)
  colnames(all_BFs) <- c("BF_together", "gPBF", "BF_prod")
  BFs_ic <- all_BFs[1:var_n, ]
  BFs_iu <- all_BFs[(var_n+1):(var_n*2),]
  
  
  #calculate percentage correct
  prop_cor_ic <- apply(BFs_ic, 2, function(x) prop_correct(x, BF_threshold = BF_threshold, var_n))
  prop_cor_iu <- apply(BFs_iu, 2, function(x) prop_correct(x, BF_threshold = BF_threshold, var_n))
  proportion_correct <- rbind(H_ic = prop_cor_ic, H_iu = prop_cor_iu)
  
  result <- list(Bayes_Factors = all_BFs,
                 conds = c(es = es, var_n = var_n, n = n, hyp_val = hyp_val, k = k, tau2 = tau2),
                 proportion_correct = proportion_correct)
  return(result)
}

tst <- BFs(es = 0.1, var_n = 5, n = 100,k = 5, hyp_val = 0.1, tau2 = 4)

#specify hyperparameters
HyperPar <- list(
  es = c(0, 0.1), #true effect size = true correlation with outcome
  tau2 = c(1, 4), #reliability of measurement (variance of measurements)
  n = c(100,500), #sample size (can be divided by I to obtain different sample sizes per group )
  k = c(3, 10), #number of groups
  hyp_val = c(0, 0.1), #thresholds for informative hypotheses
  #hyp_n = c(5,6,7) #number of hypotheses
  var_n = c(2,5) #numer of predictors
)

#expand into grid
conditions <- do.call(expand.grid, HyperPar)
conditions$id <- 1:nrow(conditions)

#run simulation
set.seed(6164900)
results <- apply(conditions, 1, function(x){
  print(paste0(x['id'], '/', nrow(conditions),  ' running...'))
  BFs(es = x['es'], var_n = x['var_n'], n = x['n'], hyp_val = x['hyp_val'], k = x['k'], tau2 = x['tau2'])
})
names(results) <- sprintf("sim%d", 1:length(results))
saveRDS(results, file = "./Sim_Eli/results_Eli2.RData")


format(object.size(results), units = "Mb")



#quickly check how algorithms did on both H_ic en H_iu.
algorithms <- c("BF_t", "gPBF", "BF_prod")
H_ic <- matrix(NA,length(results), length(algorithms))
H_iu <- H_ic
colnames(H_iu) <- colnames(H_ic) <- algorithms
for(i in 1:nrow(H_ic)){
  H_ic[i,] = results[[i]]$proportion_correct[1,]
  H_iu[i,] = results[[i]]$proportion_correct[2,]
}

