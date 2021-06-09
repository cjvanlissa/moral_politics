install.packages("lavaan")
install.packages("BFpack")
library(lavaan)
library(BFpack)

H1. Family values is positively associated with conservative-right orientation with an effect size of at least r = .1.  
H2. Group loyalty is positively associated with conservative-right orientation with an effect size of at least r = .1.  
H3. Reciprocity is positively associated with conservative-right orientation with an effect size of at least r = .1.
H4. Heroism is positively associated with conservative-right orientation with an effect size of at least r = .1.
H5. Deference is positively associated with conservative-right orientation with an effect size of at least r = .1.
H6. Fairness is associated with progressive-left orientation with an effect size of at least r = .1. 
H7. Property rights is positively associated with conservative-right orientation with an effect size of at least r = .1.



mod_pop <- ' macfam =~ macfam1 + 0.8*macfam2 + 1.2*macfam3
             macgrp =~ macgrp1 + 0.8*macgrp2 + 1.2*macgrp3
             macrec =~ macrec1 + 0.8*macrec2 + 1.2*macrec3
             macher =~ macher1 + 0.8*macher2 + 1.2*macher3
             macdef =~ macdef1 + 0.8*macdef2 + 1.2*macdef3
             macfai =~ macfai1 + 0.8*macfai2 + 1.2*macfai3
             macpro =~ macpro1 + 0.8*macpro2 + 1.2*macpro3
             macfam ~~ .12 * conservative
             macgrp ~~ .1 * conservative
             macrec ~~ .14 * conservative
             macher ~~ .1 * conservative
             macdef ~~ .16 * conservative
             macfai ~~ -.2 * conservative
             macpro ~~ .1 * conservative
'

# generate data
set.seed(1234)
df <- simulateData(mod_pop, sample.nobs=100L)

# fit model
mod <- gsub("\\d\\.\\d\\*", "", mod_pop)
fit <- sem(mod, data=df)

tab <- standardizedsolution(fit)
keep_these <- which(tab$op == "~~" & tab$rhs == "conservative" & !tab$lhs == "conservative")
estimates <- tab[keep_these, ]$est.std
names(estimates) <- c("fam", "grp", "rec", "her", "def", "fai", "pro")

Sigma <- lavInspect(fit, "vcov.std.all")[keep_these, keep_these]
colnames(Sigma) <- rownames(Sigma) <- names(estimates)

BF(x = estimates,
   hypothesis = "(fam, grp, rec, her, def, pro) > .1 & fai < .1",
   Sigma = Sigma,
   n = 100
)
