pkgs <- c(
"stringr",
"rJava",
"devtools"
)

install.packages(pkgs)

library(devtools)
install_github('bd2kccd/r-causal')
