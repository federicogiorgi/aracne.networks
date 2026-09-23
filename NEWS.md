# aracne.networks 1.39.1

* The networks are no longer bundled in the package. They are hosted on
  Zenodo (https://doi.org/10.5281/zenodo.ZENODO_RECORD) and downloaded on
  demand, keeping the package size well below the 100 MB limit of the
  Bioconductor build system. The network files are identical to the ones
  distributed in previous versions.
* New function `getRegulon()` downloads a network, caches it locally with
  BiocFileCache and returns the `regulon` object. Replace
  `data(regulonblca)` with `regulonblca <- getRegulon("blca")`.
* New function `listRegulons()` lists the available networks.
* The documentation of the individual networks is merged into `?regulons`.
* The vignette is converted to R Markdown.
* Added unit tests.
