library(worcs)
library(lavaan)
library(BFpack)
library(ggplot2)
library(tidySEM)
tris <- load_data(to_envir = FALSE)[["tris"]]


# Descriptives ------------------------------------------------------------
scales_tris <-
  lapply(unique(gsub("_\\d+$", "", names(tris))), function(i)
    grep(i, names(tris), value = T))
names(scales_tris) <- unique(gsub("_\\d+$", "", names(tris)))

cfa_tris <- t(sapply(names(scales_tris), function(scal) {
  scal <- paste0(scal, "_", 1:length(scales_tris[[scal]]))
  out <-
    cfa(paste0("F =~ ", paste0(scal, collapse = "+")), std.lv = TRUE, data = tris)
  paran <- fa.parallel(tris[, scal])
  tab <- table_results(out, columns = NULL, digits = 3)
  tab <- tab[-nrow(tab),]
  loadns <- as.numeric(tab$est_std)[tab$op == "=~"]
  r2s <- lavInspect(out, "r2")
  omga <- semTools::reliability(out, what = "omega")[1, 1]
  c(
    Subscale = gsub("_\\d$", "", scal[1]),
    Items = length(scal),
    n = out@Data@nobs[[1]],
    formatC(unlist(table_fit(out)[1, c("chisq", "cfi", "tli", "rmsea", "srmr")]), digits = 3, format = "f"),
    formatC(
      c(
        min_load = min(loadns),
        max_load = max(loadns),
        min_r2 = min(r2s),
        max_r2 = max(r2s),
        omega = omga
      ),
      digits = 3,
      format = "f"
    ),
    Reliability = tidySEM:::interpret(omga),
    Factors = paran$nfact
  )
}))

sample_sizes <- nrow(tris)
hypotheses <-
  list(
    "(fam_secs_soc_us, fam_secs_eco_us, fam_sepa_soc_dk, fam_sepa_eco_dk, fam_secs_soc_nl, fam_secs_eco_nl, fam_sepa_soc_nl, fam_sepa_eco_nl) > .1",
    "(grp_secs_soc_us, grp_secs_eco_us, grp_sepa_soc_dk, grp_sepa_eco_dk, grp_secs_soc_nl, grp_secs_eco_nl, grp_sepa_soc_nl, grp_sepa_eco_nl) > .1",
    "(rec_secs_soc_us, rec_secs_eco_us, rec_sepa_soc_dk, rec_sepa_eco_dk, rec_secs_soc_nl, rec_secs_eco_nl, rec_sepa_soc_nl, rec_sepa_eco_nl) > .1",
    "(her_secs_soc_us, her_secs_eco_us, her_sepa_soc_dk, her_sepa_eco_dk, her_secs_soc_nl, her_secs_eco_nl, her_sepa_soc_nl, her_sepa_eco_nl) > .1",
    "(def_secs_soc_us, def_secs_eco_us, def_sepa_soc_dk, def_sepa_eco_dk, def_secs_soc_nl, def_secs_eco_nl, def_sepa_soc_nl, def_sepa_eco_nl) > .1",
    "(fai_secs_soc_us, fai_secs_eco_us, fai_sepa_soc_dk, fai_sepa_eco_dk, fai_secs_soc_nl, fai_secs_eco_nl, fai_sepa_soc_nl, fai_sepa_eco_nl) < -.1",
    "(pro_secs_soc_us, pro_secs_eco_us, pro_sepa_soc_dk, pro_sepa_eco_dk, pro_secs_soc_nl, pro_secs_eco_nl, pro_sepa_soc_nl, pro_sepa_eco_nl) > .1"
  )
hypotheses[[8]] <-
  gsub("[<>]",
       "=",
       gsub(
         "\\b(fam|grp)_((sepa|secs)_(soc|eco))_",
         "\\2ON\\1_",
         gsub("\\) > 0 & \\(", ", ", paste0(
           gsub("-?\\.1", "0", hypotheses[[1]]),
           " & ",
           gsub(".1", "0", hypotheses[[2]], fixed = TRUE)
         ))
       ))
hypotheses[[9]] <-
  gsub("fam",
       "rec",
       gsub("grp", "fai", hypotheses[[8]], fixed = TRUE),
       fixed = TRUE)


mod <- tidy_sem(tris)
mod_cor <- measurement(mod)

mod_8 <-
  add_paths(mod_cor, paste0((t(
    outer(paste0(unique(
      grep("^se", mod_cor$dictionary$scale, value = TRUE)
    ), " ~ "),
    unique(
      grep("^(fam|grp)", mod_cor$dictionary$scale, value = TRUE)
    ), paste0)
  )), collapse = "\n"))

mod_9 <-
  add_paths(mod_cor,   paste0((t(
    outer(paste0(unique(
      grep("^se", mod_cor$dictionary$scale, value = TRUE)
    ), " ~ "),
    unique(
      grep("^(rec|fai)", mod_cor$dictionary$scale, value = TRUE)
    ), paste0)
  )), collapse = "\n"))

removeothercountries <- function(hyp, cnt) {
  gsub(",\\s+\\)", "\\)", gsub(paste0("\\b[a-zA-Z_]+(?<!", cnt, ")\\b,?"), "", hyp, perl = TRUE))
}

removeparameters <- function(hyp, est) {
  params_in_hyp <- bain:::params_in_hyp(hyp)
  est <- names(est)
  if (any(!params_in_hyp %in% est)) {
    for (param in params_in_hyp[!params_in_hyp %in% est]) {
      hyp <- gsub(paste0("\\b", param, "\\b,?"), "", hyp)
    }
    hyp <- gsub(",\\s+\\)", "\\)", hyp)
    hyp <- gsub("\\(\\s+", "\\(", hyp)
  }
  hyp <- gsub("\\(([a-zA-Z_]+)\\)", "\\1", hyp)
  if (length(bain:::params_in_hyp(hyp)) == 0)
    return(NA)
  hyp
}

res17 <- estimate_lavaan(mod_cor)
res_tris <- res17
tab <-
  bain:::lav_get_estimates(res17, standardize = TRUE, retain_which = "~~")
keep_these <-
  which(
    !grepl("~~(secs|sepa)_(soc|eco)$", names(tab$estimate)) &
      grepl("(secs|sepa)_(soc|eco)~~", names(tab$estimate))
  )
estimates <- tab$estimate[keep_these]
Sigma <- tab$Sigma[[1]][keep_these, keep_these]
names(estimates) <-
  gsub("~~", "_", names(estimates), fixed = TRUE)
names(estimates) <-
  gsub("^(sepa|secs)_(.+?)_(.+?)$", "\\3_\\1_\\2", names(estimates))
colnames(Sigma) <- rownames(Sigma) <- names(estimates)
res <- list(est = estimates, sig = Sigma)
res17 <- res
# Get BF
hyp <- paste2(unlist(lapply(
  gsub("_us", "", lapply(hypotheses[1:7], removeothercountries, cnt = "us")),
  removeparameters, est = res$est
)), collapse = "; ")
tmp <- BF(
  x = res$est,
  hypothesis = hyp,
  Sigma = res$sig,
  n = sample_sizes
)

out_cors <- tmp$BFtu_confirmatory[1:7]

out_8 <-
  {
    # fit model
    res <- estimate_lavaan(mod_8)
    res <- {
      thisfit = res
      tab <-
        bain:::lav_get_estimates(thisfit, standardize = TRUE, retain_which = "~")
      estimates <- tab$estimate
      Sigma <- tab$Sigma[[1]]
      names(estimates) <-
        gsub("~", "ON", names(estimates), fixed = TRUE)
      colnames(Sigma) <- rownames(Sigma) <- names(estimates)
      list(est = estimates, sig = Sigma)
    }
    res_tris8 <- res
    
    hyp <- paste2(removeparameters(gsub(
      "_us",
      "",
      lapply(hypotheses[8], removeothercountries, cnt = "us")
    ),
    est = res$est))
    tmp <- BF(
      x = res$est,
      hypothesis = hyp,
      Sigma = res$sig,
      n = sample_sizes
    )
    tmp$BFtu_confirmatory[1]
    
  }
out_9 <-
  {
    # fit model
    res <- estimate_lavaan(mod_9)
    res <- {
      thisfit = res
      tab <-
        bain:::lav_get_estimates(thisfit, standardize = TRUE, retain_which = "~")
      estimates <- tab$estimate
      Sigma <- tab$Sigma[[1]]
      names(estimates) <-
        gsub("~", "ON", names(estimates), fixed = TRUE)
      colnames(Sigma) <- rownames(Sigma) <- names(estimates)
      list(est = estimates, sig = Sigma)
    }
    res_tris9 <- res
    
    hyp <- paste2(removeparameters(gsub(
      "_us",
      "",
      lapply(hypotheses[9], removeothercountries, cnt = "us")
    ),
    est = res$est))
    tmp <- BF(
      x = res$est,
      hypothesis = hyp,
      Sigma = res$sig,
      n = sample_sizes
    )
    tmp$BFtu_confirmatory[1]
    
  }
bayesfactors_tris <- c(out_cors, 1 / out_8, 1 / out_9)
est_for_hyp_tris <- lapply(hypotheses, function(h) {
  pars = gsub("_us", "", bain:::params_in_hyp(h))
  tmp <- unlist(lapply(list(res17, res_tris8, res_tris9), function(i) {
    tryCatch(i$est[which(names(i$est) %in% pars)], error = function(e){ NA })
  }))
  tmp
})
