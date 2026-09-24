# Data from experiment
set.seed(312)
y <- round(rlnorm(30, meanlog = 1, sdlog = 1),2)

# Histogram
library(ggplot2)

ggplot(mapping = aes(x = y)) + 
  geom_histogram(bins = 10, color = 'black', fill = 'skyblue') + 
  theme_bw()


# Regular t.test
y_test <- t.test(y, mu = 5)
y_test
y_test$conf.int

# Log transform
log_y <- log(y)
log_y_test <- t.test(log_y, mu = log(5))
log_y_test
exp(log_y_test$conf.int)
