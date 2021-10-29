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
# Logic is as follows: Each conceptual hypothesis can be tested across several scales, across several samples.
# For example, "fam" represents the correlation between family values and political orientation.
# secs and sepa are three scales of political orientation.
# us, dk, and nl are three countries in which data were collected.
# Not every scale is available in each country.
# Thus, the hypothesis "family values are correlated > .1 with political orientation" can be
# evaluated on all of these parameters:
# (fam_secs_us, fam_sepa_dk, fam_secs_nl, fam_sepa_nl)
 
hypotheses <- list("(fam_secs_soc_us, fam_secs_eco_us, fam_sepa_soc_dk, fam_sepa_eco_dk, fam_secs_soc_nl, fam_secs_eco_nl, fam_sepa_soc_nl, fam_sepa_eco_nl) > .1",
                   "(grp_secs_soc_us, grp_secs_eco_us, grp_sepa_soc_dk, grp_sepa_eco_dk, grp_secs_soc_nl, grp_secs_eco_nl, grp_sepa_soc_nl, grp_sepa_eco_nl) > .1",
                   "(rec_secs_soc_us, rec_secs_eco_us, rec_sepa_soc_dk, rec_sepa_eco_dk, rec_secs_soc_nl, rec_secs_eco_nl, rec_sepa_soc_nl, rec_sepa_eco_nl) > .1",
                   "(her_secs_soc_us, her_secs_eco_us, her_sepa_soc_dk, her_sepa_eco_dk, her_secs_soc_nl, her_secs_eco_nl, her_sepa_soc_nl, her_sepa_eco_nl) > .1",
                   "(def_secs_soc_us, def_secs_eco_us, def_sepa_soc_dk, def_sepa_eco_dk, def_secs_soc_nl, def_secs_eco_nl, def_sepa_soc_nl, def_sepa_eco_nl) > .1",
                   "(fai_secs_soc_us, fai_secs_eco_us, fai_sepa_soc_dk, fai_sepa_eco_dk, fai_secs_soc_nl, fai_secs_eco_nl, fai_sepa_soc_nl, fai_sepa_eco_nl) < -.1",
                   "(pro_secs_soc_us, pro_secs_eco_us, pro_sepa_soc_dk, pro_sepa_eco_dk, pro_secs_soc_nl, pro_secs_eco_nl, pro_sepa_soc_nl, pro_sepa_eco_nl) > .1"
                   )
hypotheses[[8]] <- gsub("[<>]", "=", gsub("\\b(fam|grp)_((sepa|secs)_(soc|eco))_", "\\2ON\\1_", gsub("\\) > 0 & \\(", ", ", paste0(gsub("-?\\.1", "0", hypotheses[[1]]), " & ", gsub(".1", "0", hypotheses[[2]], fixed = TRUE)))))
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
                     '# SECS\n',
                     paste0("secs_soc =~ ", round(runif(7, .2,.9), 2), paste0(" * secs",1:7), collapse = "\n"), '\n',
                     paste0("secs_eco =~ ", round(runif(5, .2,.9), 2), paste0(" * secs",8:12), collapse = "\n"),       '\n',          
'
# Cors with Social and Economic Conservatism Scale (Everett, 2013)
fam ~~ .1 * secs_soc
grp ~~ .1 * secs_soc
rec ~~ .1 * secs_soc
her ~~ .1 * secs_soc
def ~~ .1 * secs_soc
fai ~~ -.1 * secs_soc
pro ~~ .1 * secs_soc

fam ~~ .1 * secs_eco
grp ~~ .1 * secs_eco
rec ~~ .1 * secs_eco
her ~~ .1 * secs_eco
def ~~ .1 * secs_eco
fai ~~ -.1 * secs_eco
pro ~~ .1 * secs_eco

')


pop_mod_dk <- paste0(pop_mod_mac,
'# Social and economic policy attitudes\n',
paste0("sepa_soc =~ ", round(runif(5, .2,.9), 2), paste0(" * sepa",1:5), collapse = "\n"), '\n',
paste0("sepa_eco =~ ", round(runif(5, .2,.9), 2), paste0(" * sepa",6:10), collapse = "\n"), '\n',
'
# Cors with Social and economic policy attitudes
fam ~~ .1 * sepa_soc
grp ~~ .1 * sepa_soc
rec ~~ .1 * sepa_soc
her ~~ .1 * sepa_soc
def ~~ .1 * sepa_soc
fai ~~ -.1 * sepa_soc
pro ~~ .1 * sepa_soc

fam ~~ .1 * sepa_eco
grp ~~ .1 * sepa_eco
rec ~~ .1 * sepa_eco
her ~~ .1 * sepa_eco
def ~~ .1 * sepa_eco
fai ~~ -.1 * sepa_eco
pro ~~ .1 * sepa_eco

')

pop_mod_nl <- paste0(pop_mod_mac,
                 '# Social and economic policy attitudes\n',
                 paste0("sepa_soc =~ ", round(runif(5, .2,.9), 2), paste0(" * sepa",1:5), collapse = "\n"), '\n',
                 paste0("sepa_eco =~ ", round(runif(5, .2,.9), 2), paste0(" * sepa",6:10), collapse = "\n"), '\n',
                 '# SECS', '\n',
                 paste0("secs_soc =~ ", round(runif(7, .2,.9), 2), paste0(" * secs",1:7), collapse = "\n"), '\n',
                 paste0("secs_eco =~ ", round(runif(5, .2,.9), 2), paste0(" * secs",8:12), collapse = "\n"), '\n',
                 '
# Cors with Social and Economic Conservatism Scale (Everett, 2013)
fam ~~ .1 * secs_soc
grp ~~ .1 * secs_soc
rec ~~ .1 * secs_soc
her ~~ .1 * secs_soc
def ~~ .1 * secs_soc
fai ~~ -.1 * secs_soc
pro ~~ .1 * secs_soc

fam ~~ .1 * secs_eco
grp ~~ .1 * secs_eco
rec ~~ .1 * secs_eco
her ~~ .1 * secs_eco
def ~~ .1 * secs_eco
fai ~~ -.1 * secs_eco
pro ~~ .1 * secs_eco

# Cors with Social and economic policy attitudes
fam ~~ .1 * sepa_soc
grp ~~ .1 * sepa_soc
rec ~~ .1 * sepa_soc
her ~~ .1 * sepa_soc
def ~~ .1 * sepa_soc
fai ~~ -.1 * sepa_soc
pro ~~ .1 * sepa_soc

fam ~~ .1 * sepa_eco
grp ~~ .1 * sepa_eco
rec ~~ .1 * sepa_eco
her ~~ .1 * sepa_eco
def ~~ .1 * sepa_eco
fai ~~ -.1 * sepa_eco
pro ~~ .1 * sepa_eco

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
  gsub("^(fam|grp) ~~ (secs|sepa)_(soc|eco)$", "\\2_\\3 ~ \\1", x)
})
mods_9 <- lapply(mods_8, function(x){
  gsub("fam", "rec", gsub("grp", "fai", x, fixed = TRUE), fixed = TRUE)
})

removeothercountries <- function(hyp, cnt){
  gsub(",\\s+\\)", "\\)", gsub(paste0("\\b[a-zA-Z_]+(?<!", cnt, ")\\b,?"), "", hyp, perl = TRUE))
}

set.seed(1234)
sim_results <- replicate(100, {
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
      keep_these <- which(grepl("~~(secs|sepa)_(soc|eco)$", names(tab$estimate)) & !grepl("(secs|sepa)_(soc|eco)~~", names(tab$estimate)))
      estimates <- tab$estimate[keep_these]
      Sigma <- tab$Sigma[[1]][keep_these, keep_these]
      names(estimates) <- paste0(gsub("~~", "_", names(estimates), fixed = TRUE), "_", country)
      colnames(Sigma) <- rownames(Sigma) <- names(estimates)
      list(est = estimates, sig = Sigma)
    })

    # Get individual BFs for each sample
    bf_individual <- sapply(1:length(res_list), function(i){
      hyp <- paste0(unlist(lapply(hypotheses[1:7], removeothercountries, cnt = names(res_list)[i])), collapse = "; ")
      tmp <- BF(x = res[[i]]$est,
         hypothesis = hyp,
         Sigma = res[[i]]$sig,
         n = sample_sizes[i])
      tmp$BFtu_confirmatory[1:7]
    })
    apply(bf_individual, 1, prod)
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
      bf_individual <- sapply(1:length(res_list), function(i){
        hyp <- removeothercountries(hypotheses[8], cnt = names(res_list)[i])
        tmp <- BF(x = res[[i]]$est,
                  hypothesis = hyp,
                  Sigma = res[[i]]$sig,
                  n = sample_sizes[i])
        tmp$BFtu_confirmatory[1]
      })
      prod(bf_individual)
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
      bf_individual <- sapply(1:length(res_list), function(i){
        hyp <- removeothercountries(hypotheses[9], cnt = names(res_list)[i])
        tmp <- BF(x = res[[i]]$est,
                  hypothesis = hyp,
                  Sigma = res[[i]]$sig,
                  n = sample_sizes[i])
        tmp$BFtu_confirmatory[1]
      })
      prod(bf_individual)
    }, error = function(e){
      return(NA)
    })
  c(out_cors, out_8, out_9)
})
})

#saveRDS(sim_results, "sim_results_5.RData")
#saveRDS(sim_conditions, "sim_conditions2.RData")
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

apply(sim_conditions[[2]], 1, function(x){
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
rownames(tab_power) <- paste0("Hypothesis ", 1:9)

write.csv(tab_power, "tab_power.csv")