read_csv_memsize <- function(x, guess_max = 1000, ...){
  rows     <- count_lines(x) - 1L # 1L for header
  guess_max <- min(guess_max, rows)

  dat   <- readr::read_csv(x, n_max = guess_max)

  size_attr     <- extrapolate_attributes_size(dat, rows)
  overhead_cols <- col_overhead(dat)

  raw_memsize(x) / guess_max * rows + size_attr
}



raw_memsize <- function(x){
  object.size(x) - object.size(attributes(x))
}




extrapolate_attributes_size <- function(x, n){
  stopifnot(is.data.frame(x))

  x0 <- x[0, ]
  attributes(x0) <- attributes(x)
  attr(x0, "row.names") <- integer()

  object.size(attributes(x0)) + as.integer(n) * 4L
}




col_overhead <- function(x){
  stopifnot(is.data.frame(x))
  ncol(x) * 40L
}
