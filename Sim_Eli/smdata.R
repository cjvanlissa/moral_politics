#simulate data function
simdata <- function(es, n, tau2){
  M <- rep(0,2)     #vector of means 
  S <- diag(2) * 1  #initiale covariance matrix
  
  S[row(S) != col(S)] <- es      #correlation between predictor and outcome
  sds <-  c(tau2,1)              #reliability of predictor and outcome, vary outcome
  S <- diag(sds)%*%S%*%diag(sds) #convert correlation to covariance matrix
  
  df <-  mvrnorm(n, M, S, tol = 1E-6, empirical = F) #generate data
  colnames(df) <- c('y', 'x') #give names
  return(df)
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
