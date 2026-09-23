test_that("listRegulons returns the network catalog", {
    tab <- listRegulons()
    expect_s3_class(tab, "data.frame")
    expect_equal(nrow(tab), 25L)
    expect_false(anyDuplicated(tab$network) > 0)
    expect_true(all(c("blca", "brca", "net", "ucec") %in% tab$network))
    expect_identical(tab$object, paste0("regulon", tab$network))
})

test_that("getRegulon validates its input", {
    expect_error(getRegulon(1), "single character string")
    expect_error(getRegulon(c("blca", "brca")), "single character string")
    expect_error(getRegulon("nonexistent"), "unknown network")
})

test_that("write.regulon prints the expected table", {
    regulon <- list(
        hub1 = list(tfmode = c(a = 0.5, b = -0.2), likelihood = c(0.9, 0.1)),
        hub2 = list(tfmode = c(c = 1), likelihood = 0.3)
    )
    class(regulon) <- "regulon"
    f <- tempfile()
    write.regulon(regulon, file = f)
    tab <- read.delim(f, stringsAsFactors = FALSE)
    expect_identical(colnames(tab),
        c("Regulator", "Target", "MoA", "likelihood"))
    expect_equal(nrow(tab), 3L)
    expect_identical(tab$Regulator, c("hub1", "hub1", "hub2"))

    f <- tempfile()
    write.regulon(regulon, file = f, regulator = "hub2", header = FALSE)
    expect_identical(readLines(f), "hub2\tc\t1\t0.3")

    write.regulon(regulon, file = f, n = 1)
    expect_length(readLines(f), 2L)
})
