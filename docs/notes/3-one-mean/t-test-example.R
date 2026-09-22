#----- Data creation process (optional)

# Generate data 
# set.seed(231)
# y <- round(rnorm(n=30, mean = 20, sd = 3),1)
# dput(y)

#----- Start Here

# Read in the data 
y <- c(18.4, 13.1, 17.1, 20.8, 18.6, 20.7, 20.2, 17.4, 21.7, 19.9, 
  19.3, 24.2, 16.4, 18.3, 24.2, 21, 23, 18.4, 19.6, 25, 24.3, 16.3, 
  19, 20, 18.2, 21.2, 19.9, 19.3, 20.6, 21.3)

# Check normality
qqnorm(y); qqline(y)

library(ggplot2)
ggplot(mapping = aes(x = y)) + geom_histogram(binwidth = diff(range(y))/20,
                                              color = 'black', fill = 'skyblue')

ggplot(mapping = aes(x = y)) + geom_boxplot(color = 'black', fill = 'skyblue')

# Define test
# H0: mu = 20
# HA: mu ≠ 20 (two-tailed test)
# alpha = 0.05

# Define symbols
ybar <- mean(y)
s <- sd(y)
n <- length(y)
mu <- 20

#----- Test by hand

# Compute t_c and t_a to test if t_c in rejection region
t_c <- (ybar-mu)/(s/sqrt(n))
t_a <- qt(1-alpha/2, df=n-1)

abs(t_c) > t_a # FALSE = not in rejection region

# Compute (1-alpha)100% CI
ybar + c(-1,1)*t_a*s/sqrt(n)

# Compute p-value
2*pt(abs(t_c), df=n-1, lower.tail = F)



#----- Test by t.test
t.test(y, mu = 20, conf.level = 1-alpha)

#----- Conclusion
# There is not evidence to support that the population mean is different than 20.
# This is because t_c is in the rejection region, and the p-value is greater than 0.05, 
#   and 20 is inside of the confidence interval.