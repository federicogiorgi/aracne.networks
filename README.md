# aracne.networks

ARACNe-inferred gene regulatory networks (regulons) from TCGA tumor datasets,
distributed through [Bioconductor](https://bioconductor.org/packages/aracne.networks).

The 25 networks are hosted on Zenodo
([doi:10.5281/zenodo.ZENODO_RECORD](https://doi.org/10.5281/zenodo.ZENODO_RECORD)),
downloaded on demand and cached locally with BiocFileCache.

## Installation

```r
if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
BiocManager::install("aracne.networks")
```

## Usage

```r
library(aracne.networks)

# available networks
listRegulons()

# download (first time only) and load the Bladder Carcinoma network
regulonblca <- getRegulon("blca")

# export it as a text table
write.regulon(regulonblca, file = "blca_network.txt")
```

Since version 1.39.1 the networks are no longer bundled in the package:
replace `data(regulonblca)` with `regulonblca <- getRegulon("blca")`.

## References

Giorgi, F.M. et al. (2016) ARACNe-AP: Gene Network Reverse Engineering through
Adaptive Partitioning inference of Mutual Information. *Bioinformatics*
32(14):2233-2235. doi:10.1093/bioinformatics/btw216

Alvarez, M.J. et al. (2016) Functional characterization of somatic mutations in
cancer using network-based inference of protein activity. *Nature Genetics*
48(8):838-847. doi:10.1038/ng.3593
