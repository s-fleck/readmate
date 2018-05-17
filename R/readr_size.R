read_csv_memsize <- function(x, guess_max = 1000, ...){
  lines     <- count_lines(x) - 1L # 1L for header
  guess_max <- min(guess_max, lines)

  dat   <- readr::read_csv(x, n_max = guess_max)


  dat0 <- dat[0, ]
  attributes(dat0) <- attributes(dat)
  attr(dat0, "row.names") <- integer()


  size_attr <- object.size(attributes(dat0)) + lines * 4L  # rownames
  size_df   <- object.size(dat0)
  overhead_cols <- ncol(dat) * 40L


  raw_size <- (object.size(dat) - object.size(attributes(dat)))

  raw_size / guess_max * lines + size_attr
}

