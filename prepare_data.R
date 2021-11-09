# In this file, write the R-code necessary to load your original data file
# (e.g., an SPSS, Excel, or SAS-file), and convert it to a data.frame. Then,
# use the function open_data(your_data_frame) or closed_data(your_data_frame)
# to store the data.

library(worcs)
library(foreign)
library(haven)
source("scales_list.r")
nl <- read.spss("nl.sav", to.data.frame = TRUE, use.value.labels = TRUE)
names(nl) <- tolower(names(nl))
all(unlist(scales_list$nl) %in% names(nl))
unlist(scales_list$nl)[!(unlist(scales_list$nl) %in% names(nl))]
nl <- nl[unlist(scales_list$nl)]
# Rescale variables, because otherwise the observed covariances for some
# variables will be a factor 1000 larger than for others. This complicates model
# convergence.
desc <- descriptives(nl)
rescale_these <- desc$name[which(desc$max > 90)]
nl[,rescale_these] <- nl[, rescale_these]/10
names(nl) <- unlist(lapply(names(scales_list$nl), function(nam){paste0(nam, "_", 1:length(scales_list$nl[[nam]]))}))
nl[sapply(nl, inherits, what = "factor")] <- lapply(nl[sapply(nl, inherits, what = "factor")], as.numeric)
rev_these <- which(unlist(reverse_coded[["nl"]]))
maxval <- sapply(nl[rev_these], max, na.rm = TRUE) + 1
nl[rev_these] <- mapply(function(c, vec){c-vec}, c = maxval, vec = nl[rev_these])
closed_data(nl, synthetic = FALSE)

dk <- read_dta("dk.dta")
names(dk) <- tolower(names(dk))
all(unlist(scales_list$dk) %in% names(dk))
dk <- dk[unlist(scales_list$dk)]
names(dk) <- unlist(lapply(names(scales_list$dk), function(nam){paste0(nam, "_", 1:length(scales_list$dk[[nam]]))}))
rev_these <- which(unlist(reverse_coded[["dk"]]))
maxval <- sapply(dk[rev_these], max, na.rm = TRUE) + 1
dk[rev_these] <- mapply(function(c, vec){c-vec}, c = maxval, vec = dk[rev_these])
closed_data(dk, synthetic = FALSE)

us <- read.csv("us_original.csv", stringsAsFactors = FALSE, skip = 2, header = FALSE)
names_us <- read.csv("us_original.csv", stringsAsFactors = FALSE)
names(us) <- tolower(names(names_us))
all(unlist(scales_list$us) %in% names(us))
us <- us[unlist(scales_list$us)]
names(us) <- unlist(lapply(names(scales_list$us), function(nam){paste0(nam, "_", 1:length(scales_list$us[[nam]]))}))
rev_these <- which(unlist(reverse_coded[["us"]]))
maxval <- sapply(us[rev_these], max, na.rm = TRUE) + 1
us[rev_these] <- mapply(function(c, vec){c-vec}, c = maxval, vec = us[rev_these])
closed_data(us, synthetic = FALSE)