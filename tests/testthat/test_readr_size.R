context("readr_size")


test_that("readr_size works as expected", {

  tf <- tempfile()
  tdat <- replicate(10000, iris, simplify = FALSE)
  tdat <- data.table::rbindlist(tdat)
  readr::write_csv(tdat, tf)
  res <- read_csv(tf)


  object.size(res)
  read_csv_memsize(tf)


  tf <- tempfile()
  readr::write_csv(iris, tf)
  res <- read_csv(tf)
  object.size(res)
  read_csv_memsize(tf)

})
