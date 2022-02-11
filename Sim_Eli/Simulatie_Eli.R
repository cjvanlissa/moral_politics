dependencies <- c('MASS', 'bain')
lapply(dependencies, function(x){library(x, character.only = T)})

rm(list=ls(all.names = T))
cat("\014")
source('./Sim_Eli/smdata.R')

#results of mini simulation, outcomes are BF_together and Geometric product of BFs_individual
#Evidence Rate and Stability Rate are measures of validity for 'Geometric product'
results_Eli <- readRDS("./Sim_Eli/results_Eli2.RData")

### MINI SIMULATION CAN BE FOUND ON LINE 133 AND FURTHER ###

#to test
n <- 200       # Mean sample size per group
hyp_val <- 0   # Value to be tested against in bain
es <- 0        # True effect size
k <- 5         # Number of groups
tau2 <- 1      # SD of outcome


#########################
# start mini simulation #
#########################

## put in function
BFs <- function(es, n, hyp_val, k, tau2){
  
  # simulate data for every group
  dfs <- lapply(1:k, function(i){
    n_df <- floor(rnorm(1, n, n/3)) #sample a sample size
    n_df <- ifelse(n_df < 10, 10, n_df) #make sure sample is at least of size 10
    simdata(es, n_df, tau2) 
  })
  
  # obtain estimates for correlations and their standard errors
  res <- sapply(dfs, function(x){
    est <- cor(x)[,1][-1]                     #estimate for correlation between x and y
    se_est <- sqrt((1 - est^2)/(nrow(x) - 2)) #standard error = sqrt((1-r^2)/df) with df = N - 2
    return(cbind(est = est, se_est, n_group = nrow(x)))
  })
  
  # necessary naming for bain
  colnames(res) <- paste0('r', 1:k)
  
  #### this would be ideal but does not work, cause Sigma needs to be a matrix
  #obtain individual Bfs
  # bf_individual <- lapply(1:k, function(i){
  #   bain(x = res[i,1],
  #        hypothesis = paste0(paste0("r",i), ">", hyp_val),
  #        n = res[3,i],
  #        Sigma = list(as.matrix(res[2,i])))
  # }) 
  
  sig <- lapply(res[2,], matrix) #make list of covariance matrices for the datasets
  bf_individual <- lapply(paste0(colnames(res), ">", hyp_val), 
                          bain,
                          x = res[1,],
                          Sigma = sig,
                          n = sapply(dfs, nrow),
                          group_parameters = 1,
                          joint_parameters = 0) #need to find a way to make n vary


  #give appropriate names
  #names(bf_individual) <- paste0("group", 1:k)
  
  #obtain BF_ic for every group and every hypothesis
  BFs <- t(sapply(bf_individual, function(x){
    c(x$fit$BF.c[1], x$fit$BF.u[1])
  }))
  #colnames(BFs) <- c(paste0("BF_ic: ", "r", ">", hyp_val),
  #                   paste0("BF_iu: ", "r", ">", hyp_val))
  
  #obtain geometric mean, could be could to also include SR and ER
  gp_bf <- apply(BFs, 2, function(x){prod(x) ^ (1 / k)})
  prod_bf <- apply(BFs, 2, prod)
  
  ### prepare for BF together
  hyp_t <- paste0("(", paste0(colnames(res), collapse = ", "), ") > ", hyp_val)
  
  # create bf_together object to obtain the BFs for the (group1, group2, group3) > hyp_val
  bf_together <- bain(res[1,], hyp_t, n = sum(sapply(dfs, nrow)), Sigma = diag(res[2,])) #should n be total sample size combined? --> infHyp.rmd seems suggest so
  
  BFs.t <- c(bf_together$fit$BF.c[1], bf_together$fit$BF.u[1])
  names(BFs.t) <- c(paste0("BF_ic: r>", hyp_val),  paste0("BF_iu: r>", hyp_val))

  ### combine all results
  result <- cbind(gpbf = gp_bf, prodbf = prod_bf, t_bf = BFs.t)
  
  return(list(result))
}



set.seed(6164900)
BFs(es = 0, n = 200, k = 5, hyp_val = 0, tau2 = 1.5)

#specify hyperparameters
HyperPar <- list(
  es = c(0, 0.1), #true effect size = true correlation with outcome
  tau2 = c(1, 4), #reliability of measurement (variance of measurements)
  n = c(100,500), #sample size (can be divided by I to obtain different sample sizes per group )
  k = c(3, 10), #number of groups
  hyp_val = c(0, 0.1) #thresholds for informative hypotheses
)

#expand into grid
conditions <- do.call(expand.grid, HyperPar)
conditions$id <- 1:nrow(conditions)

#run simulation
set.seed(6164900)
results <- apply(conditions, 1, function(x){
  print(paste0(x['id'], '/', nrow(conditions),  ' running...'))
  BFs(es = x['es'], n = x['n'], hyp_val = x['hyp_val'], k = x['k'], tau2 = x['tau2'])
})
names(results) <- sprintf("sim%d", 1:length(results))
saveRDS(results, file = "./Sim_Eli/results_Eli2.RData")


format(object.size(results), units = "B")
