tmp <- read.table("clipboard", header = T)
tmp <- tmp[8:14, grepl(".1", names(tmp), fixed = T)]
rownames(tmp) <- colnames(tmp) <- c("fam", "grp", "rec", "her", "def", "fai", "pro")

cors <- tmp[upper.tri(tmp)]
cors <- expand.grid(colnames(tmp), rownames(tmp))
cors$val <- paste0(" ~~ ", as.vector(as.matrix(t(tmp))), " * ")
cors <- cors[, c(1,3,2)]
cors <- matrix(apply(cors, 1, paste0, collapse = ""), ncol = 7, byrow = T)

cors <- cors[upper.tri(cors)]
cat(cors, sep = "\n")

tmp <- readClipboard()
tmp <- tmp[!tmp == ""]
tmp <- paste0(paste0("mac", rep(c("fam", "grp", "rec", "her", "def", "fai", "pro"), each = 3)), 
              " =~ ",
              tmp,
              "* ",
              paste0("mac", rep(c("fam", "grp", "rec", "her", "def", "fai", "pro"), each = 3), 1:3))
cat(tmp, sep = "\n")