#install.packages("lavaan")
#install.packages("BFpack")
#install.packages("Matrix")
library(Matrix)
library(lavaan)
library(BFpack)

true_es <- .11
sample_sizes <- c(us = 517, dk = 522, nl = 350)

hypotheses <- lapply(c("fam", "grp", "rec", "her", "def", "fai", "pro"), function(x){
  if(!x == "fai"){
    paste0("(", paste0(grep(x, names(est), fixed = TRUE, value = TRUE), collapse = ", "), ") > .1")
  } else {
    paste0("(", paste0(grep(x, names(est), fixed = TRUE, value = TRUE), collapse = ", "), ") < -.1")
  }
})
hypotheses[[8]] <- gsub("[<>]", "=", gsub("\\b(fam|grp)_(.+?)_", "\\2ON\\1_", gsub("\\) > 0 & \\(", ", ", paste0(gsub("-?\\.1", "0", hypotheses[[1]]), " & ", gsub(".1", "0", hypotheses[[2]], fixed = TRUE)))))
hypotheses[[9]] <- gsub("fam", "rec", gsub("grp", "fai", hypotheses[[8]], fixed = TRUE), fixed = TRUE)


pop_mod_mac <- ' 
# Mac loadings
fam =~ 0.765* fam1
fam =~ 0.802* fam2
fam =~ 0.786* fam3
grp =~ 0.742* grp1
grp =~ 0.721* grp2
grp =~ 0.660* grp3
rec =~ 0.601* rec1
rec =~ 0.676* rec2
rec =~ 0.687* rec3
her =~ 0.576* her1
her =~ 0.772* her2
her =~ 0.722* her3
def =~ 0.661* def1
def =~ 0.693* def2
def =~ 0.619* def3
fai =~ 0.617* fai1
fai =~ 0.758* fai2
fai =~ 0.528* fai3
pro =~ 0.282* pro1
pro =~ 0.422* pro2
pro =~ 0.977* pro3

# Mac cors
grp ~~ 0.352250838 * fam
rec ~~ 0.617863656 * fam
rec ~~ 0.72133984 * grp
her ~~ 0.630540976 * fam
her ~~ 0.378574569 * grp
her ~~ 0.633589321 * rec
def ~~ 0.700641457 * fam
def ~~ 0.335291272 * grp
def ~~ 0.416013738 * rec
def ~~ 0.659839673 * her
fai ~~ 0.303770594 * fam
fai ~~ 0.587287885 * grp
fai ~~ 0.604198304 * rec
fai ~~ 0.272322174 * her
fai ~~ 0.110463577 * def
pro ~~ 0.011495686 * fam
pro ~~ -0.082318434 * grp
pro ~~ 0.124533513 * rec
pro ~~ 0.080395555 * her
pro ~~ -0.134813517 * def
pro ~~ 0.081893928 * fai
'

pop_mod_us <- paste0(pop_mod_mac,
'
# Cors with Social and Economic Conservatism Scale (Everett, 2013)
fam ~~ .1 * secs
grp ~~ .1 * secs
rec ~~ .1 * secs
her ~~ .1 * secs
def ~~ .1 * secs
fai ~~ -.1 * secs
pro ~~ .1 * secs

# Cors with Self-identified conservatism
fam ~~ .1 * sic
grp ~~ .1 * sic
rec ~~ .1 * sic
her ~~ .1 * sic
def ~~ .1 * sic
fai ~~ -.1 * sic
pro ~~ .1 * sic
')


pop_mod_dk <- paste0(pop_mod_mac,
'# Social and economic policy attitudes',
paste0("sepa =~ ", round(runif(10, .2,.9), 2), paste0(" * sepa",1:10), collapse = "\n"),
'
# Cors with Social and economic policy attitudes
fam ~~ .1 * sepa
grp ~~ .1 * sepa
rec ~~ .1 * sepa
her ~~ .1 * sepa
def ~~ .1 * sepa
fai ~~ -.1 * sepa
pro ~~ .1 * sepa

# Cors with Self-identified conservatism
fam ~~ .1 * sic
grp ~~ .1 * sic
rec ~~ .1 * sic
her ~~ .1 * sic
def ~~ .1 * sic
fai ~~ -.1 * sic
pro ~~ .1 * sic
')

pop_mod_nl <- paste0(pop_mod_mac,
                 '# Social and economic policy attitudes',
                 paste0("sepa =~ ", round(runif(10, .2,.9), 2), paste0(" * sepa",1:10), collapse = "\n"),
                 '# Self-identified conservatism',
                 paste0("sic =~ ", round(runif(3, .2,.9), 2), paste0(" * sic",1:3), collapse = "\n"),
                 '
# Cors with Social and Economic Conservatism Scale (Everett, 2013)
fam ~~ .1 * secs
grp ~~ .1 * secs
rec ~~ .1 * secs
her ~~ .1 * secs
def ~~ .1 * secs
fai ~~ -.1 * secs
pro ~~ .1 * secs

# Cors with Social and economic policy attitudes
fam ~~ .1 * sepa
grp ~~ .1 * sepa
rec ~~ .1 * sepa
her ~~ .1 * sepa
def ~~ .1 * sepa
fai ~~ -.1 * sepa
pro ~~ .1 * sepa

# Cors with Self-identified conservatism
fam ~~ .1 * sic
grp ~~ .1 * sic
rec ~~ .1 * sic
her ~~ .1 * sic
def ~~ .1 * sic
fai ~~ -.1 * sic
pro ~~ .1 * sic
')

pop_mods <- lapply(list(us = pop_mod_us,
                        dk = pop_mod_dk,
                        nl = pop_mod_nl), function(x){
                          gsub(".1 ", true_es, x, fixed = TRUE)
                        })

mods_cor <- lapply(pop_mods, gsub, pattern = "[0-9\\. -]{2,}\\s?\\*", replacement = "")
mods_8 <- lapply(mods_cor, function(x){
  x <- strsplit(x, split = "\\n")[[1]]
  x <- x[!grepl("(rec|her|def|fai|pro)", x)]
  x <- x[!grepl("#", x, fixed = TRUE)]
  gsub("^(fam|grp) ~~ (secs|sic|sepa)$", "\\2 ~ \\1", x)
})
mods_9 <- lapply(mods_8, function(x){
  gsub("fam", "rec", gsub("grp", "fai", x, fixed = TRUE), fixed = TRUE)
})

set.seed(1234)
sim_results <- replicate(100, {
  # generate data
  dfs <- lapply(names(sample_sizes), function(n){simulateData(model = mods[[n]], sample.nobs=sample_sizes[[n]])})
  names(dfs) <- names(sample_sizes)
  out_cors <- 
  tryCatch({
    # fit model
    res_list <- lapply(names(mods_cor), function(nam){sem(model = mods_cor[[nam]], data = dfs[[nam]])})
    names(res_list) <- names(mods_cor)
    
    res <- lapply(names(res_list), function(country){
      thisfit = res_list[[country]]
      tab <- bain:::lav_get_estimates(thisfit, standardize = TRUE, retain_which = "~~")
      keep_these <- which(grepl("~~(secs|sic|sepa)$", names(tab$estimate)) & !grepl("(secs|sic|sepa)~~", names(tab$estimate)))
      estimates <- tab$estimate[keep_these]
      Sigma <- tab$Sigma[[1]][keep_these, keep_these]
      names(estimates) <- paste0(gsub("~~", "_", names(estimates), fixed = TRUE), "_", country)
      colnames(Sigma) <- rownames(Sigma) <- names(estimates)
      list(est = estimates, sig = Sigma)
    })
    est <- unlist(lapply(res, `[[`, 1))
    sig <- as.matrix(Matrix::bdiag(lapply(res, `[[`, 2)))
    colnames(sig) <- rownames(sig) <- names(est)
    
    bf <- lapply(hypotheses[1:7], BF,
                 x = est,
                 Sigma = sig,
                 n = sum(sample_sizes))
    
    sapply(bf, function(x){x$BFmatrix_confirmatory[1,2]})
  }, error = function(e){
    return(rep(NA, 7))
  })
  out_8 <- 
    tryCatch({
      # fit model
      res_list <- lapply(names(mods_cor), function(nam){sem(model = mods_8[[nam]], data = dfs[[nam]])})
      names(res_list) <- names(mods_cor)
      
      res <- lapply(names(res_list), function(country){
        thisfit = res_list[[country]]
        tab <- bain:::lav_get_estimates(thisfit, standardize = TRUE, retain_which = "~")
        estimates <- tab$estimate
        Sigma <- tab$Sigma[[1]]
        names(estimates) <- paste0(gsub("~", "ON", names(estimates), fixed = TRUE), "_", country)
        colnames(Sigma) <- rownames(Sigma) <- names(estimates)
        list(est = estimates, sig = Sigma)
      })
      est <- unlist(lapply(res, `[[`, 1))
      sig <- as.matrix(Matrix::bdiag(lapply(res, `[[`, 2)))
      colnames(sig) <- rownames(sig) <- names(est)
      
      BF(x = est,
         Sigma = sig,
         hypothesis = hypotheses[[8]],
         n = sum(sample_sizes))$BFmatrix_confirmatory[2, 1]
      }, error = function(e){
      return(NA)
    })
  out_9 <- 
    tryCatch({
      # fit model
      res_list <- lapply(names(mods_cor), function(nam){sem(model = mods_9[[nam]], data = dfs[[nam]])})
      names(res_list) <- names(mods_cor)
      
      res <- lapply(names(res_list), function(country){
        thisfit = res_list[[country]]
        tab <- bain:::lav_get_estimates(thisfit, standardize = TRUE, retain_which = "~")
        estimates <- tab$estimate
        Sigma <- tab$Sigma[[1]]
        names(estimates) <- paste0(gsub("~", "ON", names(estimates), fixed = TRUE), "_", country)
        colnames(Sigma) <- rownames(Sigma) <- names(estimates)
        list(est = estimates, sig = Sigma)
      })
      est <- unlist(lapply(res, `[[`, 1))
      sig <- as.matrix(Matrix::bdiag(lapply(res, `[[`, 2)))
      colnames(sig) <- rownames(sig) <- names(est)
      
      BF(x = est,
         Sigma = sig,
         hypothesis = hypotheses[[9]],
         n = sum(sample_sizes))$BFmatrix_confirmatory[2, 1]
    }, error = function(e){
      return(NA)
    })
})

saveRDS(sim_results, "sim_results_0.RData")
sim_results <- readRDS("sim_results_3.RData")
df_plot <- do.call(rbind, lapply(1:7, function(i){
  data.frame(Variable = c("fam", "grp", "rec", "her", "def", "fai", "pro")[i],
             Value = sim_results[i, ],
             Median = median(sim_results[i, ], na.rm = TRUE))
}))
install.packages("ggplot2")
library(ggplot2)

ggplot(df_plot, aes(x = Value))+
  geom_density()+
  geom_vline(data = df_plot[!duplicated(df_plot$Variable), ], aes(xintercept = Median))+
  geom_text(data = df_plot[!duplicated(df_plot$Variable), ], aes(label = round(Median), x = Median), y = .2, hjust = -1)+
  facet_wrap(~Variable)+
  scale_x_log10() +
  labs(title = "Distribution of Bayes factors for each hypothesis across 100 replications")

apply(sim_results, 1, function(x){
  x <- na.omit(x)
  sum(x >3)/length(x)})