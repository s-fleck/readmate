context("hello")


test_that("hello works as expected", {

  tf <- tempfile()
  write.csv(iris, tf)

  expect_identical(count_lines(tf), nrow(iris) + 1L)



})
