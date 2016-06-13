\name{write.regulon}
\alias{write.regulon}
\title{Print a regulon object into a text file}
\usage{
write.regulon(
    regulon,
    file="",
    sep="\t",
    header=TRUE,
    n=Inf
)
}
\description{
This function will print the network into an output stream. Four columns will
be printed: the Regulator id, the Target id, the Mode of Action (MoA, based on
Spearman correlation that indicates the sign of the connection and
ranges between -1 and +1), the Likelihood (essentially an edge weight that
indicates how strong the mutual information for an edge is
when compared to the maximum observed MI in the network, it ranges between 0
and 1).
}
\arguments{
  \item{regulon}{An object of class regulon}
  \item{file}{File name where the network will be printed}
  \item{sep}{String, a separator for the fields (default = "\\t")}
  \item{header}{Logical. If a header should be printed. Default is TRUE}
  \item{n}{Numeric. How many interactions to print. Default is Inf}
}
\value{
    Text output containing the network in tabular format.
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
data(regulonblca)
write.regulon(regulonblca,file="",n=10)
}
