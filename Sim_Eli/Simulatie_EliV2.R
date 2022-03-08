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
res <- readRDS(file.path("Sim_Eli", paste0("sim_results_", Sys.Date(), ".RData")))
lc <- length(conditions)

#obtain unique conditions
unique_conds <- unique(summarydata[,2:lc])
unique_conds <- t(apply(unique_conds, 1, function(x){
  paste(paste0(colnames(unique_conds), " == ", x), collapse = " & ")
}))

res <- as.data.table(res)
res[, c(lc:ncol(res)):=lapply(.SD, as.numeric), .SDcols=c(lc:ncol(res))]

colfunc <- colorRampPalette(c("red", "blue"))
colors <- colfunc(16)

library(ggplot2)
#function to plot the conditions
plotcond <- function(outcome, name, condition, col){
  condition <- unlist(strsplit(condition, "&"))
  condition <- gsub("==", "=", condition)
  condition <- paste(condition, collapse = " ")
  propBF3 <- sum(outcome > 3) / length(outcome)
  hist(outcome, main = condition, col = col,
       xlab = paste0("median: ", round(median(outcome),2), "; sd: ", round(sd(outcome),2), 
                     "; prop BF > 3: ", round(propBF3,2)))
  #legend("topright", condition, cex = 0.8)
}

set.seed(6164900)
sample_cond <- sample(1:length(unique_conds), 16)
plot16 <- function(name){
  par(mfrow = c(4,4))
  for(i in seq_along(sample_cond)){
    res[eval(parse(text=unique_conds[i])),
        .(plotcond(eval(parse(text = name)), name, unique_conds[i], col = colors[i]))]
  }
}

plot16("gpbf_iu")












plotcond2 <- function(cond){
  subcond <- res[eval(parse(text=cond))]
  outcome <- subcond$gpbf_ic
  propBF3 <- sum(outcome > 3) / length(outcome)
  
  ggplot(subcond, aes(x = gpbf_ic)) +
    geom_density() +
    theme_bw() +
    xlab(paste0("median: ", round(median(outcome),2), "; sd: ", round(sd(outcome),2), 
                "; prop BF > 3: ", round(propBF3,2))) +
    legend()
}
plotcond2(unique_conds[1])


ggplot(tt, aes(x = gpbf_ic))+
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
tab_power[8:9, ] <- 1-tab_power[8:9, ]
rownames(tab_power) <- paste0("Hypothesis ", 1:9)

write.csv(tab_power, "tab_power.csv")
