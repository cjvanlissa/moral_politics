#install.packages("lavaan")
#install.packages("BFpack")
#install.packages("Matrix")
library(Matrix)
library(lavaan)
library(BFpack)
library(ggplot2)

sim_conditions <- lapply(c(0, .1, .2, .3), function(true_es){
#true_es <- .2
sample_sizes <- c(us = 517, dk = 522, nl = 350)

hypotheses <- list("(fam_secs_us, fam_sic_us, fam_sepa_dk, fam_sic_dk, fam_secs_nl, fam_sepa_nl, fam_sic_nl) > .1",
                   "(grp_secs_us, grp_sic_us, grp_sepa_dk, grp_sic_dk, grp_secs_nl, grp_sepa_nl, grp_sic_nl) > .1",
                   "(rec_secs_us, rec_sic_us, rec_sepa_dk, rec_sic_dk, rec_secs_nl, rec_sepa_nl, rec_sic_nl) > .1",
                   "(her_secs_us, her_sic_us, her_sepa_dk, her_sic_dk, her_secs_nl, her_sepa_nl, her_sic_nl) > .1",
                   "(def_secs_us, def_sic_us, def_sepa_dk, def_sic_dk, def_secs_nl, def_sepa_nl, def_sic_nl) > .1",
                   "(fai_secs_us, fai_sic_us, fai_sepa_dk, fai_sic_dk, fai_secs_nl, fai_sepa_nl, fai_sic_nl) < -.1",
                   "(pro_secs_us, pro_sic_us, pro_sepa_dk, pro_sic_dk, pro_secs_nl, pro_sepa_nl, pro_sic_nl) > .1"
                   )

hypotheses <- c(
  hypotheses,
  lapply(hypotheses, function(x){ gsub("[a-z_]+?_(dk|nl)[, ]{0,2}", "", x) }),
  lapply(hypotheses, function(x){ gsub("[a-z_]+?_(us|nl)[, ]{0,2}", "", x) }),
  lapply(hypotheses, function(x){ gsub("[a-z_]+?_(dk|us)[, ]{0,2}", "", x) })
)
hypotheses <- lapply(hypotheses, function(x){ gsub(", )", ")", x, fixed = T) })

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

set.seed(1234)
sim_results <- replicate(2, {
  # generate data
  dfs <- lapply(names(sample_sizes), function(n){simulateData(model = pop_mods[[n]], sample.nobs=sample_sizes[[n]])})
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
    
    bf <- lapply(hypotheses, BF,
                 x = est,
                 Sigma = sig,
                 n = sum(sample_sizes))
    
    sapply(bf, function(x){x$BFmatrix_confirmatory[1,2]})
  }, error = function(e){
    return(rep(NA, length(hypotheses)))
  })
  out_cors
})
})

#saveRDS(sim_results, "sim_results_2.RData")
#saveRDS(sim_conditions, "sim_conditions.RData")
#sim_results <- readRDS("sim_results_3.RData")
df_plot <- do.call(rbind, lapply(1:length(sim_conditions), function(thiscond){
  sim_results <- sim_conditions[[thiscond]]
  df_plot <- do.call(rbind, lapply(1:nrow(sim_results), function(i){
    themed <- median(sim_results[i, ], na.rm = TRUE)
    prop3 <- na.omit(sim_results[i, ])
    prop3 <- sum(prop3 >3)/length(prop3)
    data.frame(Hypothesis = paste0("H", i, ", BFmed = ", formatC(themed, 2, format = "f"), ", p(BF > 3) = ", formatC(prop3, 2, format = "f")),
               Value = sim_results[i, ],
               Median = median(sim_results[i, ], na.rm = TRUE))
  }))
  df_plot$Condition <- paste0("R = ", c(0, .1, .2, .3)[thiscond])
  df_plot
}))



ggplot(df_plot, aes(x = Value))+
  geom_density()+
  #geom_vline(data = df_plot[!duplicated(df_plot$Variable), ], aes(xintercept = Median))+
  #geom_text(data = df_plot[!duplicated(df_plot$Variable), ], aes(label = round(Median), x = Median), y = .2, hjust = -1)+
  facet_grid(Hypothesis~Condition, scales = "free")+
  scale_x_log10() +
  labs(title = "Distribution of Bayes factors for each hypothesis across 100 replications")

apply(sim_results, 1, function(x){
  x <- na.omit(x)
  sum(x >3)/length(x)})


df_plot <- do.call(rbind, lapply(1:length(sim_conditions), function(thiscond){
  sim_results <- sim_conditions[[thiscond]]
  #browser()
  sapply(1:nrow(sim_results), function(i){
    prop3 <- na.omit(sim_results[i, ])
    c(median(sim_results[i, ], na.rm = TRUE), sd(sim_results[i, ], na.rm = TRUE), sum(prop3 >3)/length(prop3))
  })
  
}))


tab_power <- data.frame(t(do.call(rbind, lapply(1:length(sim_conditions), function(thiscond){
  sim_results <- sim_conditions[[thiscond]]
  #browser()
  sapply(1:nrow(sim_results), function(i){
    prop3 <- na.omit(sim_results[i, ])
    sum(prop3 >3)/length(prop3)
  })
  
}))))

names(tab_power) <- paste0("R = ", c(0, .1, .2, .3))
rownames(tab_power) <- paste0("Hypothesis ", 1:length(hypoth))

write.csv(tab_power, "tab_power.csv")

tmp <- sim_conditions[[3]][, 1]
tmp[seq(from = 8, to = 28, by = 7)]

prod(tmp[seq(from = 8, to = 28, by = 7)])