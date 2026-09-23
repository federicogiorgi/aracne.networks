## Zenodo record hosting the network files
## (https://doi.org/10.5281/zenodo.22918956)
.zenodoRecord <- "22918956"

.baseUrl <- function() {
    getOption(
        "aracne.networks.url",
        paste0("https://zenodo.org/records/", .zenodoRecord, "/files")
    )
}

.catalog <- function() {
    utils::read.csv(
        system.file("extdata", "regulons.csv", package = "aracne.networks"),
        stringsAsFactors = FALSE,
        colClasses = c(md5 = "character")
    )
}

.cache <- function() {
    cache <- getOption(
        "aracne.networks.cache",
        tools::R_user_dir("aracne.networks", which = "cache")
    )
    BiocFileCache::BiocFileCache(cache, ask = FALSE)
}

listRegulons <- function() {
    tab <- .catalog()
    tab[, c("network", "object", "tumor", "tcga", "regulators",
        "interactions", "bytes")]
}

getRegulon <- function(network, force = FALSE, verbose = TRUE) {
    tab <- .catalog()
    if (!is.character(network) || length(network) != 1L || is.na(network))
        stop("'network' must be a single character string, see listRegulons()")
    network <- tolower(sub("^regulon", "", network))
    if (!network %in% tab$network)
        stop("unknown network '", network, "'; available networks are: ",
            paste(tab$network, collapse = ", "))
    entry <- tab[tab$network == network, ]
    url <- paste(.baseUrl(), entry$file, sep = "/")

    bfc <- .cache()
    hit <- BiocFileCache::bfcquery(bfc, url, field = "rname", exact = TRUE)
    if (force && nrow(hit))
        BiocFileCache::bfcremove(bfc, hit$rid)
    if (verbose && (force || !nrow(hit)))
        message("Downloading ", entry$object, " (",
            round(entry$bytes / 1e6, 1), " MB), it will be cached for ",
            "future use")
    path <- tryCatch(
        suppressMessages(
            BiocFileCache::bfcrpath(bfc, rnames = url, exact = TRUE)),
        error = function(e)
            stop("could not download ", entry$file, " from ", url,
                "; please check your internet connection (see warnings() ",
                "for details)", call. = FALSE)
    )

    if (unname(tools::md5sum(path)) != entry$md5) {
        BiocFileCache::bfcremove(bfc, names(path))
        stop("checksum mismatch for ", entry$file, "; the corrupted ",
            "download was removed from the cache, please try again")
    }

    env <- new.env(parent = emptyenv())
    load(path, envir = env)
    env[[entry$object]]
}
