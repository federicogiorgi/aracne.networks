\name{regulons}
\alias{regulons}
\alias{regulonblca}
\alias{regulonbrca}
\alias{reguloncesc}
\alias{reguloncoad}
\alias{regulonesca}
\alias{regulongbm}
\alias{regulonhnsc}
\alias{regulonkirc}
\alias{regulonkirp}
\alias{regulonlaml}
\alias{regulonlihc}
\alias{regulonluad}
\alias{regulonlusc}
\alias{regulonnet}
\alias{regulonov}
\alias{regulonpaad}
\alias{regulonpcpg}
\alias{regulonprad}
\alias{regulonread}
\alias{regulonsarc}
\alias{regulonstad}
\alias{regulontgct}
\alias{regulonthca}
\alias{regulonthym}
\alias{regulonucec}
\docType{data}
\title{Context-specific ARACNe interactomes of human tumors}
\description{
The package provides 25 human context-specific transcriptional regulatory
networks (interactomes) reverse engineered by the ARACNe-AP algorithm from
tumor RNA-Seq expression profiles, mostly from TCGA. Each interactome is a
list object of S3 class `regulon' where each element represents a
transcriptional regulator and contains two vectors: (1) a named numeric
vector indicating the mode of regulation (MoR) for each target gene, whose
ID is indicated by the names attribute of the vector; (2) a numeric vector
indicating the confidence score (likelihood) for the regulator-target
interaction. Genes are identified by Entrez Gene IDs.

Up to version 1.39.0 the networks were bundled in the package as data sets
(e.g. \code{data(regulonblca)}). They are now hosted on Zenodo and
retrieved with \code{\link{getRegulon}}, e.g.
\code{regulonblca <- getRegulon("blca")}.
}
\details{
\tabular{llrr}{
  \bold{network} \tab \bold{tumor} \tab \bold{regulators} \tab \bold{interactions} \cr
  \code{"blca"} \tab Bladder Carcinoma \tab 6,054 \tab 489,101 \cr
  \code{"brca"} \tab Breast Carcinoma \tab 6,054 \tab 331,919 \cr
  \code{"cesc"} \tab Cervical Squamous Carcinoma \tab 6,056 \tab 583,961 \cr
  \code{"coad"} \tab Colon Adenocarcinoma \tab 6,056 \tab 413,789 \cr
  \code{"esca"} \tab Esophageal Carcinoma \tab 5,951 \tab 529,286 \cr
  \code{"gbm"} \tab Glioblastoma \tab 6,056 \tab 563,850 \cr
  \code{"hnsc"} \tab Head and Neck Squamous Carcinoma \tab 6,055 \tab 423,104 \cr
  \code{"kirc"} \tab Kidney Renal Clear Cell Carcinoma \tab 6,054 \tab 350,478 \cr
  \code{"kirp"} \tab Kidney Papillary Carcinoma \tab 6,055 \tab 452,653 \cr
  \code{"laml"} \tab Acute Myeloid Leukemia \tab 6,007 \tab 531,535 \cr
  \code{"lihc"} \tab Liver Hepatocellular Carcinoma \tab 6,056 \tab 469,922 \cr
  \code{"luad"} \tab Lung Adenocarcinoma \tab 6,055 \tab 399,513 \cr
  \code{"lusc"} \tab Lung Squamous Carcinoma \tab 6,054 \tab 455,032 \cr
  \code{"net"} \tab Neuroendocrine Tumor \tab 6,129 \tab 666,241 \cr
  \code{"ov"} \tab Ovarian Carcinoma \tab 6,007 \tab 647,358 \cr
  \code{"paad"} \tab Pancreas Carcinoma \tab 6,056 \tab 520,756 \cr
  \code{"pcpg"} \tab Pheochromocytoma and Paraganglioma \tab 6,056 \tab 603,617 \cr
  \code{"prad"} \tab Prostate Carcinoma \tab 6,053 \tab 330,922 \cr
  \code{"read"} \tab Rectal Adenocarcinoma \tab 6,056 \tab 557,911 \cr
  \code{"sarc"} \tab Sarcoma \tab 6,112 \tab 526,591 \cr
  \code{"stad"} \tab Stomach Adenocarcinoma \tab 6,056 \tab 561,858 \cr
  \code{"tgct"} \tab Testicular Cancer \tab 6,056 \tab 432,621 \cr
  \code{"thca"} \tab Thyroid Carcinoma \tab 6,053 \tab 317,582 \cr
  \code{"thym"} \tab Thymoma \tab 6,056 \tab 387,923 \cr
  \code{"ucec"} \tab Uterine Corpus Endometrial Carcinoma \tab 6,055 \tab 469,845 \cr
}
}
\format{
Objects of class regulon (\link[viper]{regulon-class}).
}
\source{
\url{https://doi.org/10.5281/zenodo.ZENODO_RECORD}
}
\references{
Giorgi, F.M. et al. (2016) ARACNe-AP: Gene Network Reverse Engineering through
Adaptive Partitioning inference of Mutual Information. Bioinformatics 32(14):2233-2235.
doi: 10.1093/bioinformatics/btw216.

Alvarez, M.J. et al. (2016) Functional characterization of somatic mutations
in cancer using network-based inference of protein activity. Nature Genetics
48(8):838-847. doi: 10.1038/ng.3593.
}
\seealso{
\code{\link{getRegulon}}, \code{\link{listRegulons}}, \code{\link{write.regulon}}
}
\examples{
regulonblca <- getRegulon("blca")
write.regulon(regulonblca, regulator = "399")
}
\keyword{datasets}
