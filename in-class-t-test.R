# For reproducibility
set.seed(801)

# Food Science - log CFU of bacteria
my_sample <- rnorm(30, mean=2, sd=0.9)

# H0: µ = 1
# HA: µ > 1

# Compute the CI and R.R. for alpha = 0.05
# What can we conclude about H0? The data?

ybar <- mean(my_sample)
s <- sd(my_sample)
n <- length(my_sample)
alpha <- 0.05
mu <- 1

t_a <- qt(1-alpha, df=n-1)
t_a

t_c <- (ybar-mu)/(s/sqrt(n))
t_c

t_c > t_a

ci95 <- ybar + c(-1,1)*t_a*(s/sqrt(n))
ci95
qqnorm(my_sample); qqline(my_sample)
hist(my_sample)
boxplot(my_sample)

t.test(my_sample,
       alternative = 'greater',
       mu = 1,
       conf.level = 1-alpha)






