z_c <- function(y, mu = 0, sigma = 1) {
  
  # Remove missing values
  count_missing <- sum(is.na(y))
  message(paste('Number of missing observations that are excluded:', count_missing))
  y <- y[!is.na(y)]
  
  # Compute from data
  ybar <- mean(y)
  n <- length(y)
  
  # Compute test statistic
  test_statistic <- (ybar - mu) / (sigma / sqrt(n))
  
  # Return value
  return(test_statistic)
}