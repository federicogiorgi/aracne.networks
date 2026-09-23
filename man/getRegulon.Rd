\name{getRegulon}
\alias{getRegulon}
\alias{listRegulons}
\title{Retrieve ARACNe networks from the online repository}
\usage{
listRegulons()

getRegulon(network, force = FALSE, verbose = TRUE)
}
\description{
The ARACNe networks are stored on Zenodo
(\url{https://doi.org/10.5281/zenodo.ZENODO_RECORD}).
\code{listRegulons} returns the table of available networks.
\code{getRegulon} downloads one network, stores it in a local
\code{BiocFileCache} cache and returns it as a \code{regulon} object.
Each network is downloaded only once; subsequent calls read it from the
cache and do not require an internet connection.
}
\arguments{
  \item{network}{Character string. The network to retrieve, either the
    short name in the \code{network} column of \code{listRegulons()}
    (e.g. \code{"blca"}) or the name of the object that was distributed
    with previous versions of the package (e.g. \code{"regulonblca"}).}
  \item{force}{Logical. If TRUE, the network is downloaded again even if
    it is already present in the cache.}
  \item{verbose}{Logical. If TRUE, a message is printed when a network
    is downloaded.}
}
\details{
Downloaded files are checked against their MD5 checksums before being
loaded. The cache is located in
\code{tools::R_user_dir("aracne.networks", "cache")}; a different
location can be set with \code{options(aracne.networks.cache = "path")}.
The cache can be inspected and cleaned with the functions of the
\code{BiocFileCache} package, e.g.
\code{BiocFileCache::bfcinfo(BiocFileCache::BiocFileCache(
tools::R_user_dir("aracne.networks", "cache")))}.
}
\value{
\code{listRegulons} returns a data.frame with one row per network and
the columns \code{network} (short name), \code{object} (name of the object
in previous versions of the package), \code{tumor}, \code{tcga} (TCGA
project code), \code{regulators}, \code{interactions} and \code{bytes}
(size of the download).

\code{getRegulon} returns an object of class regulon
(\link[viper]{regulon-class}); see \link{regulons}.
}
\seealso{
\link{regulons}, \code{\link{write.regulon}}
}
\examples{
listRegulons()

### Retrieve the Bladder Carcinoma network (downloaded once, then cached)
regulonblca <- getRegulon("blca")
length(regulonblca)
write.regulon(regulonblca, n = 10)
}
