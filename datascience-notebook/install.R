pkgs <- c(
"stringr",
"rJava",
"devtools"
)

install.packages(pkgs, repos="https://cran.r-project.org/")

bioCpkgs <- c(
"graph",
"RBGL",
"Rgraphviz"
)

source("https://bioconductor.org/biocLite.R")
biocLite(bioCpkgs)

library(devtools)
install_github('bd2kccd/r-causal')
