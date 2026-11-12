# Simulate data
set.seed(801)
x <- 10:20
y <- 2*x + rnorm(length(x), 0, 2)

plot(x,y)

# Estimate beta0 and beta1
sxx <- sum((x-mean(x))^2)
syy <- sum((y-mean(y))^2)
sxy <- sum((x-mean(x))*(y-mean(y)))

beta1 <- sxy/sxx
beta0 <- mean(y)-beta1*mean(x)
beta0; beta1

# Sums of squares
yhat <- beta0 + beta1*x
ssreg <- sum((yhat-mean(y))^2)
sse <- sum((y-yhat)^2)

# Mean square
msreg <- ssreg/1
mse <- sse/(length(y)-2)

# F
f <- msreg/mse

# p-value
pf(f, 1, length(y)-2, lower.tail = F)

# Standard errors
sb1 <- sqrt(mse/sxx)
sb0 <- sqrt(mse*(1/length(y)+mean(x)^2/sxx))
sb0; sb1

# Using the lm function
fit <- lm(y~x)
summary(fit)
anova(fit)
