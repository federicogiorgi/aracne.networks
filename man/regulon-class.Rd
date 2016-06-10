\name{regulon-class}
\alias{regulon-class}
\title{The regulon class}
\description{
This class contains interactome data
}
\section{Slots}{

 List of regulators with the following slots:
 \describe{
   \item{\code{tfmode}:}{Named vector of class \code{"numeric"} containing the regulator mode of action scores, with target genes as name attribute}
   \item{\code{likelihood}:}{Vector of class \code{"numeric"} containing the relative likelihood for each target gene}
 }
}

