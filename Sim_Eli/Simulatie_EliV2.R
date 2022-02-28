#clear console and env
rm(list=ls(all.names = T))
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
source('./Sim_Eli/functions.R')

#set conditions for simulation
hyper_parameters<-list(
  es = c(0, 0.1),       #true effect size = true correlation with outcome
  tau2 = c(1,4),       #reliability of measurement (variance of measurements)
  n = c(100,500),       #sample size (can be divided by I to obtain different sample sizes per group )
  k = c(3, 10),         #number of groups
  hyp_val = c(0,0.1)   #thresholds for informative hypotheses
)

# Create grid with simulation parameters and save it
summarydata <- expand.grid(hyper_parameters, stringsAsFactors = FALSE)
summarydata <- cbind(V1 = 1:nrow(summarydata), summarydata)

saveRDS(summarydata, file = "./Sim_Eli/summarydata.RData")
summarydata<-readRDS("./Sim_Eli/summarydata.RData")

# prepare multicluster
library(doSNOW)
nclust <- parallel::detectCores() - 1
cl <- makeCluster(nclust) 
registerDoSNOW(cl) 

nreps <- 3 #we replicate a condition n times
nalg <- 6 # there are, as of now 6 algorithms: prodbf, tbf, gpbf, all having ic and iu

# add progression bar
pb <- txtProgressBar(min = 0, max = nrow(summarydata), style = 3)
opts <- list(progress = function(n) setTxtProgressBar(pb, n))

# export nalg and nreps and set seed over clusters
clusterExport(cl, c('nalg', 'nreps'))
clusterEvalQ(cl, set.seed(6164900)) #set seed for all processors.

# create folder to store results in
unlink("./sim_Eli/Results", recursive = T)
dir.create("./Sim_Eli/Results")

# run parallel computation
foreach(rownum = 1:nrow(summarydata), .options.snow = opts, .packages = c("bain", "MASS")) %dopar% {
  res <-  replicate(nreps,tryCatch(
    c(rownum, 
      BFs(es = summarydata[rownum, "es"],
             n = summarydata[rownum, "n"],
             hyp_val = summarydata[rownum, "hyp_val"],
             k =summarydata[rownum, "k"],
             tau2 = summarydata[rownum, "tau2"])),
             error = function(e){c(rownum, rep(NA, nalg))}
    ))
  
  # every cluster creates it own .txt file where the results are stored
  write.table(x = t(res), file = sprintf("./Sim_Eli/Results/results%d.txt" , Sys.getpid()), 
              sep = "\t", append = TRUE, row.names = FALSE, col.names = FALSE)
}


#Close cluster
stopCluster(cl)


# End of simulation -------------------------------------------------------
stop("End of simulation")

# Merge files -------------------------------------------------------------
#library(data.table)

#obtain colnames of output values
algorithms <- c("gpbf", "prodbf", "tbf")
hyps <- c("_ic", "_iu")
alg_names <- paste0(rep(algorithms, each = length(hyps)), hyps)

# read in the simulation conditions 
#res <- as.data.table(readRDS("./Sim_Eli/summarydata.RData"))
res <- readRDS("./Sim_Eli/summarydata.RData")
conditions <- colnames(res)

# read in the simulation results
f <- list.files(path = "./Sim_Eli/Results", pattern = "result", full.names = T)
tab <- do.call(rbind, lapply(f, function(file){
  fread(file) #fread_many() is, as of now, beyond my understanding.
}))


# merge conditions and results and omit id variable
res <- merge(res, tab, by = "V1")
rm(tab)
colnames(res) <- c(conditions, alg_names)
res <- res[-1]

# save as .csv and .RData file
fwrite(res, file.path("./Sim_Eli", paste0("sim_results_", Sys.Date(), ".csv"))) 
saveRDS(res, file.path("./Sim_Eli", paste0("sim_results_", Sys.Date(), ".RData"))) 

#omit env
#rm(list=ls())
res <- readRDS(file.path("./Sim_Eli", paste0("sim_results_", Sys.Date(), ".RData")))



#######################
# TRYING fread_many() #
#######################
dir <- paste0(getwd(), "/Sim_Eli/Results")
files <- list.files(path = dir, pattern = "result", full.names = T)


fread_many = function(files,header=F,...){
  if(length(files)==0) return()
  if(typeof(files)!='character') return()
  files = files[file.exists(files)]
  if(length(files)==0) return()
  tmp = tempfile(fileext = ".csv") #gives names that can be used as temporary files, we specify it to be of .csv extension
  
  #I cannot get this part to work and I dont understand it.
  if(header==T){
    system(paste0('head -n1 ',files[1],' > ',tmp))
    system(paste0("xargs awk 'FNR>1' >> ",tmp),input=files)
  } else {
    system2(paste0("xargs awk '1' > ",tmp),input=files) #invokes OS command, but I have little OS knowledge
  }
  
  DT = fread(file=tmp,header=header,...)
  file.remove(tmp)
  DT
}
tmp = tempfile(fileext = ".csv")
setwd(dir = dir)
tmp <- gsub("\\\\", "/", tempfile(tmpdir = dir, fileext = ".csv"))
tempdir()

cmd <- paste0("echo", files[1])
