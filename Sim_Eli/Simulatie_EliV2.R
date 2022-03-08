#clear console and env
rm(list=ls(all.names = T))
gc(reset = T, full = T)
cat("\014")

#load necessary packages
dependencies <- c('MASS', 'bain')
lapply(dependencies, function(x){library(x, character.only = T)})


# Check package versions
versions <- c(
  compareVersion(as.character(packageVersion("bain")), "0.2.8"),
  compareVersion(as.character(packageVersion("MASS")), "7.3.55"))
if(!all(versions == 0)) stop("Using the incorrect version of one or more packages.")

# Load simulation functions from source -----------------------------------
source('Sim_Eli/functions.R')

#set conditions for simulation
nreps <- 50 #can be changed to hundred
hyper_parameters<-list(
  ndataset = 1:nreps,
  es = c(0, 0.1, 0.5),       # true effect size = true correlation with outcome
  tau2 = c(1, 4),             # reliability of outcome (standard deviation of outcome)
  n = c(100, 500),            # mean sample size 
  k = c(3, 10),           # number of groups
  hyp_val = c(0, 0.1, 0.5)     # thresholds for informative hypotheses
)

# Create grid with simulation parameters and save it
summarydata <- expand.grid(hyper_parameters, stringsAsFactors = FALSE)

saveRDS(summarydata, file = "./Sim_Eli/summarydata.RData")
# summarydata<-readRDS("./Sim_Eli/summarydata.RData")


# create folder to store results in and delete folder where previous results are in.
unlink("./sim_Eli/Results", recursive = T)
dir.create("./Sim_Eli/Results")

# number of algorithms used
nalg <- 6

# prepare multicluster
set.seed(6164900)
library(doSNOW)
nclust <- parallel::detectCores() 
cl <- makeCluster(nclust) 
registerDoSNOW(cl) 

# add progression bar
pb <- txtProgressBar(min = 0, max = nrow(summarydata), style = 3)
opts <- list(progress = function(n) setTxtProgressBar(pb, n))

# export nalg and nreps and set seed over clusters
set.seed(6164900)
seeds <- sample(1:.Machine$integer.max, nrow(summarydata))
clusterExport(cl, c('nalg', 'seeds'))


# run parallel computation
foreach(rownum = 1:nrow(summarydata), .options.snow = opts, .packages = c("bain", "MASS")) %dopar% {
  set.seed(seeds[rownum])
  res <-  tryCatch(
    c(rownum, 
      BFs(es = summarydata[rownum, "es"],
             n = summarydata[rownum, "n"],
             hyp_val = summarydata[rownum, "hyp_val"],
             k =summarydata[rownum, "k"],
             tau2 = summarydata[rownum, "tau2"])),
             error = function(e){c(rownum, rep(NA, nalg))}
    )
  
  # every cluster creates it own .txt file where the results are stored
  write.table(x = t(res), file = sprintf("./Sim_Eli/Results/results%d.txt" , Sys.getpid()), 
              sep = "\t", append = TRUE, row.names = FALSE, col.names = FALSE)
}

#Close cluster
stopCluster(cl)


# End of simulation -------------------------------------------------------
stop("End of simulation")

# Merge files -------------------------------------------------------------
library(data.table)

#algorithms
algorithms <- c("gpbf", "prodbf", "tbf")
hyps <- c("_ic", "_iu")
alg_names <- paste0(rep(algorithms, each = length(hyps)), hyps)

# read in the simulation conditions 
res <- readRDS("./Sim_Eli/summarydata.RData")
conditions <- colnames(res)

# read in the simulation results
f <- list.files(path = "./Sim_Eli/Results", pattern = "result", full.names = T)
tab <- setorderv(
  do.call(rbind, lapply(f, function(file){
    fread(file) #fread_many() is, as of now, beyond my understanding.
  })),
  cols = "V1", order = 1L, na.last = F)
if(!(tab$V1[1] == 1 & tail(tab$V1, 1) == nrow(res) & length(unique(tab$V1)) == nrow(res))){
  stop()
}
names(tab) <- c("V1", alg_names)
tab[, "V1" := NULL]


# merge conditions and results and omit id variable
res<- cbind(res, tab)
rm(tab)

fwrite(res, file.path("Sim_Eli", paste0("sim_results_", Sys.Date(), ".csv")))
saveRDS(res, file.path("Sim_Eli", paste0("sim_results_", Sys.Date(), ".RData")))
f <- list.files("./Sim_Eli/Results", full.names = TRUE)
file.remove(f)


########################
# Prelimanary Analyses #
########################
library(data.table)

#algorithms we used
algorithms <- c("gpbf", "prodbf", "tbf")
hyps <- c("_ic", "_iu")
alg_names <- paste0(rep(algorithms, each = length(hyps)), hyps)

#some preparation
summarydata <- readRDS("./Sim_Eli/summarydata.RData")
conditions <- c("ndataset", "es", "tau2", "n", "k", "hyp_val")
res <- readRDS(file.path("Sim_Eli", paste0("sim_results_", Sys.Date(), ".RData")))
lc <- length(conditions)

#obtain unique conditions
unique_conds <- unique(summarydata[,2:lc])
unique_conds <- t(apply(unique_conds, 1, function(x){
  paste(paste0(colnames(unique_conds), " == ", x), collapse = " & ")
}))

#convert res to datatable and make outcome values numeric
res <- as.data.table(res)
res[, c(lc:ncol(res)):=lapply(.SD, as.numeric), .SDcols=c(lc:ncol(res))]

#we will sample 16 conditions to plot and make a nice colorgradient for fun
N <- 16
colfunc <- colorRampPalette(c("red", "blue"))
colors <- colfunc(N)

#function to plot histogram of BFs of a condition
plotcond <- function(outcome, name, condition, col){
  condition <- unlist(strsplit(condition, "&"))
  condition <- gsub("==", "=", condition)
  condition <- paste(condition, collapse = " ")
  propBF3 <- sum(outcome > 3) / length(outcome)
  hist(outcome, main = condition, col = col,
       xlab = paste0("median: ", round(median(outcome),2),
                     ";    sd: ", round(sd(outcome),2), 
                     ";    prop BF > 3: ", round(propBF3,2)),
       cex.lab = 1.3)
}

#Sample 16 integers from 1 to length(unique_conds)
set.seed(6164900)
sample_cond <- sample(1:length(unique_conds), 16)

#plot histogram s of the calculated BayesFactors from 16 random conditions in a single grid
plot16 <- function(name, line = -1.5){
  par(mfrow = c(4,4))
  for(i in seq_along(sample_cond)){
    res[eval(parse(text=unique_conds[sample_cond[i]])),
        .(plotcond(eval(parse(text = name)), name, unique_conds[sample_cond[i]], col = colors[i]))]
  }
  mtext(paste0("Density of ", name, " for 16 randomly sampled conditions"), side = 3, line = line, outer = T, cex = 1)
}

#save to pdf
pdf(file = paste0("Sim_Eli/first_results.pdf"), width = 15, height = 10)
for(i in 1:length(alg_names)){plot16(alg_names[i])}
dev.off()
