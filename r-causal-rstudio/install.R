pkgs <- c(
"stringr",
"rJava",
"devtools"
)

install.packages(pkgs)

bioCpkgs <- c(
"graph",
"RBGL",
"Rgraphviz"
)

source("https://bioconductor.org/biocLite.R")
biocLite(bioCpkgs)

library(devtools)
install_github('bd2kccd/r-causal')