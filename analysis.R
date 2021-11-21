library(worcs)
library(lavaan)
library(BFpack)
library(ggplot2)
library(tidySEM)
set.seed(22)
sample_sizes <- sapply(dat, nrow) #obtain sample sizes per country
hypotheses <- list("(fam_secs_soc_us, fam_secs_eco_us, fam_sepa_soc_dk, fam_sepa_eco_dk, fam_secs_soc_nl, fam_secs_eco_nl, fam_sepa_soc_nl, fam_sepa_eco_nl) > .1",
                   "(grp_secs_soc_us, grp_secs_eco_us, grp_sepa_soc_dk, grp_sepa_eco_dk, grp_secs_soc_nl, grp_secs_eco_nl, grp_sepa_soc_nl, grp_sepa_eco_nl) > .1",
                   "(rec_secs_soc_us, rec_secs_eco_us, rec_sepa_soc_dk, rec_sepa_eco_dk, rec_secs_soc_nl, rec_secs_eco_nl, rec_sepa_soc_nl, rec_sepa_eco_nl) > .1",
                   "(her_secs_soc_us, her_secs_eco_us, her_sepa_soc_dk, her_sepa_eco_dk, her_secs_soc_nl, her_secs_eco_nl, her_sepa_soc_nl, her_sepa_eco_nl) > .1",
                   "(def_secs_soc_us, def_secs_eco_us, def_sepa_soc_dk, def_sepa_eco_dk, def_secs_soc_nl, def_secs_eco_nl, def_sepa_soc_nl, def_sepa_eco_nl) > .1",
                   "(fai_secs_soc_us, fai_secs_eco_us, fai_sepa_soc_dk, fai_sepa_eco_dk, fai_secs_soc_nl, fai_secs_eco_nl, fai_sepa_soc_nl, fai_sepa_eco_nl) < -.1",
                   "(pro_secs_soc_us, pro_secs_eco_us, pro_sepa_soc_dk, pro_sepa_eco_dk, pro_secs_soc_nl, pro_secs_eco_nl, pro_sepa_soc_nl, pro_sepa_eco_nl) > .1"
                   )


mods_cor <- lapply(names(dat), function(country){
  cntdat <- dat[[country]][unlist(use_scales[[country]])]
  mod <- tidy_sem(cntdat)
  measurement(mod)
})
names(mods_cor) <- names(dat)


removeothercountries <- function(hyp, cnt){
  gsub(",\\s+\\)", "\\)", gsub(paste0("\\b[a-zA-Z_]+(?<!", cnt, ")\\b,?"), "", hyp, perl = TRUE))
}

removeparameters <- function(hyp, est){
  params_in_hyp <- bain:::params_in_hyp(hyp)
  est <- names(est)
  if(any(!params_in_hyp %in% est)){
    for(param in params_in_hyp[!params_in_hyp %in% est]){
      hyp <- gsub(paste0("\\b", param, "\\b,?"), "", hyp)
    }
    hyp <- gsub(",\\s+\\)", "\\)", hyp)
    hyp <- gsub("\\(\\s+", "\\(", hyp)
  }
  hyp <- gsub("\\(([a-zA-Z_]+)\\)", "\\1", hyp)
  if(length(bain:::params_in_hyp(hyp)) == 0) return(NA)
  hyp
}

res_list <- lapply(mods_cor, function(x){estimate_lavaan(x)})
res_list17 <- res_list
res <- lapply(names(res_list), function(country){
  thisfit = res_list[[country]]
  tab <- bain:::lav_get_estimates(thisfit, standardize = TRUE, retain_which = "~~")
  keep_these <- which(!grepl("~~(secs|sepa)_(soc|eco)$", names(tab$estimate)) & grepl("(secs|sepa)_(soc|eco)~~", names(tab$estimate)))
  estimates <- tab$estimate[keep_these]
  Sigma <- tab$Sigma[[1]][keep_these, keep_these]
  names(estimates) <- paste0(gsub("~~", "_", names(estimates), fixed = TRUE), "_", country)
  names(estimates) <- gsub("^(sepa|secs)_(.+?)_(.+?)_(.+)$", "\\3_\\1_\\2_\\4", names(estimates))
  colnames(Sigma) <- rownames(Sigma) <- names(estimates)
  list(est = estimates, sig = Sigma)
})
names(res) <- names(res_list)
res_h17 <- res

# Get individual BFs for each sample
bf_individual <- sapply(1:length(res_list), function(i){
  hyp <- paste2(unlist(
    lapply(
      lapply(hypotheses[1:7], removeothercountries, cnt = names(res_list)[i]),
      removeparameters, est = res[[i]]$est)
    ), collapse = "; ")
  tmp <- BF(x = res[[i]]$est,
            hypothesis = hyp,
            Sigma = res[[i]]$sig,
            n = sample_sizes[i])
  tmp$BFtu_confirmatory[1:7]
})
out_cors <- apply(bf_individual, 1, prod)

