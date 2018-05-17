context("readr_size")


test_that("readr_size works as accross table sizes", {

  tf <- tempfile()

  tdat <- data.frame(
    x = 1L:100L
  )

  tdat <- replicate(1e4, tdat, simplify = FALSE)

  long_table <- dplyr::bind_rows(tdat)
  readr::write_csv(long_table, tf)
  res <- readr::read_csv(tf)

  isit::equalish_frac(
    as.double(object.size(res)),
    as.double(read_csv_memsize(tf)),
    tolerance = 0.02
  )


  wide_table <- dplyr::bind_cols(tdat)
  readr::write_csv(wide_table, tf)
  res <- readr::read_csv(tf)

  isit::equalish_frac(
    as.double(object.size(res)),
    as.double(read_csv_memsize(tf)),
    tolerance = 0.01
  )

  tf <- tempfile()
  readr::write_csv(iris, tf)
  res <- read_csv(tf)
  object.size(res)
  read_csv_memsize(tf)

})




test_that("readr_size works as expected", {


})
