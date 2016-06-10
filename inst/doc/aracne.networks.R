### R code from vignette source 'aracne.networks.Rnw'

###################################################
### code chunk number 1: aracne.networks.Rnw:15-16
###################################################
library(aracne.networks)


###################################################
### code chunk number 2: aracne.networks.Rnw:33-35
###################################################
library(aracne.networks)
data(package="aracne.networks")$results[,"Item"]


###################################################
### code chunk number 3: aracne.networks.Rnw:42-44
###################################################
data(regulonblca)
write.regulon(regulonblca,n=10)


