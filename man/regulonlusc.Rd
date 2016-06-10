
       \name{regulonlusc}
       \Rdversion{1.4}
       \alias{regulonlusc}
       \docType{data}
       \title{Human Lung Squamous Carcinoma context-specific ARACNe interactome}
       \description{
       The interactome is a human lung squamous carcinoma context-specific regulatory network reverse engineered by the ARACNE-AP algorithm. The interactome is contained in a list object of S3 class `regulon' where each element represents the transcriptional program of a regulatory protein and contains two vectors: (1) a named numeric vector indicating the mode of regulation (MoR) for each target gene, whose ID is indicated by the names attribute of the vector. (2) a numeric vector indicating the confidence score for the regulator-target interaction.
       }
       \usage{data(regulonlusc)}
       \examples{
            data(regulonlusc)
            write.regulon(regulonlusc,n=10)
       }
       \references{
       Giorgi,F.M. et al. (2016) ARACNe-AP: Gene Network Reverse Engineering through Adaptive Partitioning inference of Mutual Information. Bioinformatics doi: 10.1093/bioinformatics/btw216.
       }
       \keyword{datasets}
    