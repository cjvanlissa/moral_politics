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
k <- 5
tau2 <- 1


#simulate data for every group
dfs <- lapply(1:k, function(i){
  n_df <- floor(rnorm(1, n, n/3)) #sample a sample size
  n_df <- ifelse(n_df < 10, 10, n_df) #make sure sample is at least of size 10
  simdata(es, var_n, n_df, tau2) 
})

n_tot <- sum(sapply(dfs, nrow))

groupnames <- paste0("group", 1:k)
effectnames <- sprintf("r%d", 1:var_n)
hypotheses <- lapply(seq(1, to = k*var_n, by = k), function(i){
  paste0(apply(expand.grid(groupnames, effectnames), 1, 
               paste, collapse="_")[i:(i+(k-1))], ">", hyp_val)
})



