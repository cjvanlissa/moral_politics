library(worcs)
library(lavaan)
library(BFpack)
library(ggplot2)
library(tidySEM)
set.seed(22)
sample_sizes <- sapply(dat, nrow)
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


mods_cor <- lapply(names(dat), function(country){
  cntdat <- dat[[country]][unlist(use_scales[[country]])]
  mod <- tidy_sem(cntdat)
  measurement(mod)
})
names(mods_cor) <- names(dat)
mods_8 <- lapply(mods_cor, function(x){
  add_paths(x,   paste0((t(outer(paste0(unique(grep("^se", x$dictionary$scale, value = TRUE)), " ~ "),
                                 unique(grep("^(fam|grp)", x$dictionary$scale, value = TRUE)), paste0))), collapse = "\n"))
})
mods_9 <- lapply(mods_cor, function(x){
  add_paths(x,   paste0((t(outer(paste0(unique(grep("^se", x$dictionary$scale, value = TRUE)), " ~ "),
                                 unique(grep("^(rec|fai)", x$dictionary$scale, value = TRUE)), paste0))), collapse = "\n"))
})

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

out_8 <- 
  {
    # fit model
    res_list <- lapply(mods_8, function(x){estimate_lavaan(x)})
    res_list8 <- res_list
    res <- lapply(names(res_list), function(country){
      thisfit = res_list[[country]]
      tab <- bain:::lav_get_estimates(thisfit, standardize = TRUE, retain_which = "~")
      estimates <- tab$estimate
      Sigma <- tab$Sigma[[1]]
      names(estimates) <- paste0(gsub("~", "ON", names(estimates), fixed = TRUE), "_", country)
      colnames(Sigma) <- rownames(Sigma) <- names(estimates)
      list(est = estimates, sig = Sigma)
    })
    res8 <- res
    bf_individual8 <- sapply(1:length(res_list), function(i){
      hyp <- removeparameters(removeothercountries(hypotheses[8], cnt = names(res_list)[i]), est = res[[i]]$est)
      tmp <- BF(x = res[[i]]$est,
                hypothesis = hyp,
                Sigma = res[[i]]$sig,
                n = sample_sizes[i])
      tmp$BFtu_confirmatory[1]
    })
    prod(bf_individual8)
  }
out_9 <- 
  {
    # fit model
    res_list <- lapply(mods_9, function(x){estimate_lavaan(x)})
    res_list9 <- res_list
    res <- lapply(names(res_list), function(country){
      thisfit = res_list[[country]]
      tab <- bain:::lav_get_estimates(thisfit, standardize = TRUE, retain_which = "~")
      estimates <- tab$estimate
      Sigma <- tab$Sigma[[1]]
      names(estimates) <- paste0(gsub("~", "ON", names(estimates), fixed = TRUE), "_", country)
      colnames(Sigma) <- rownames(Sigma) <- names(estimates)
      list(est = estimates, sig = Sigma)
    })
    res9 <- res
    bf_individual9 <- sapply(1:length(res_list), function(i){
      hyp <- removeparameters(removeothercountries(hypotheses[9], cnt = names(res_list)[i]), est = res[[i]]$est)
      tmp <- BF(x = res[[i]]$est,
                hypothesis = hyp,
                Sigma = res[[i]]$sig,
                n = sample_sizes[i])
      tmp$BFtu_confirmatory[1]
    })
    prod(bf_individual9)
  }
bayesfactors <- c(out_cors, 1/out_8, 1/out_9)
est_for_hyp <- lapply(hypotheses, function(h){
  pars = bain:::params_in_hyp(h)
  tmp <- unlist(lapply(c(res_h17, res8, res9), function(i){
    i$est[which(names(i$est) %in% pars)]
  }))
  nams <- names(tmp)
  tmp <- data.frame(Value = tmp, Country = gsub("^.+(.{2})$", "\\1", nams), Parameter = gsub("^(.{2}\\.)?(.+?)_.{2}$", "\\2", nams))
  tmp <- reshape(tmp, direction = "wide", idvar = "Country", timevar =  "Parameter")
  rownames(tmp) <- NULL
  names(tmp) <- gsub("Value\\.", "", names(tmp))
  tmp
})

