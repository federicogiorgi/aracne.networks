\name{aracne.networks-package}
\Rdversion{1.4}
\alias{aracne.networks-package}
\alias{aracne.networks}
\docType{package}
\title{
ARACNe-inferred gene networks from TCGA tumor datasets
}
\description{
This package contains ARACNe-inferred networks from TCGA tumor
datasets and functions to import new ones and export them into text form.}
\details{
\tabular{ll}{
Package: \tab aracne.networks\cr
Type: \tab Package\cr
License: \tab LGPL-3\cr
LazyLoad: \tab yes\cr
}
}
\author{
Federico M. Giorgi

Maintainer: Federico M. Giorgi <federico.giorgi@gmail.com>
}
\references{
Giorgi,F.M. et al. (2016) ARACNe-AP: Gene Network Reverse Engineering through Adaptive Partitioning inference of Mutual Information. Bioinformatics 2016
Alvarez, M.J. et al. (2016) Functional characterization of somatic mutations in cancer using network-based inference of protein activity. Nature Genetics 2016
}

\examples{
### Create a random regulon with two hubs
# The first hub will have 100 targets
# The second hub will have 67 targets
regulon<-list()
regulon[["hub1"]]<-list(
    tfmode=setNames(runif(100,-1,1),paste0("target",sample(1:1000,100))),
    likelihood=runif(100,0,1)
)
regulon[["hub2"]]<-list(
    tfmode=setNames(runif(67,-1,1),paste0("target",sample(1:1000,67))),
    likelihood=runif(67,0,1)
)
class(regulon)<-"regulon"
write.regulon(regulon,file="network.txt")


### Print a the Prostate Adenocarcinoma (prad) network to standard output
# The gene ids are in Entrez format
data(regulonprad)
write.regulon(regulonblca,file="",n=10)
}
