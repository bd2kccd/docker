pkgs <- c(
"stringr",
"rJava",
"devtools"
)

install.packages(pkgs, repos="https://cran.r-project.org/")

library(devtools)
install_github('bd2kccd/r-causal')
