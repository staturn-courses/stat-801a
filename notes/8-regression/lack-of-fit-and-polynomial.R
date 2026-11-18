# Generate data ----------------------------------------------------------

set.seed(801)

x <- sample(2:10, size = 100, replace = TRUE)
y <- 2 + x + rnorm(100, 0, 2)

dat <- data.frame(x, y)

# Plot data --------------------------------------------------------------

plot(y ~ x, data = dat,
     main = "Relationship Between X and Y",
     xlab = "X",
     ylab = "Y",
     pch = 19)

# 1. Simple linear regression --------------------------------------------

linear_model <- lm(y ~ x, data = dat)

summary(linear_model)

# Add fitted regression line
abline(linear_model, col = "blue", lwd = 2)

# Examine residuals
plot(x, residuals(linear_model),
     xlab = "X",
     ylab = "Residual",
     main = "Residual Plot",
     pch = 19)
abline(h = 0, col = "red")

# Also use Q-Q plot
qqnorm(resid(linear_model)); qqline(resid(linear_model))

# 2. Lack-of-fit test ----------------------------------------------------

# Fit a model with a separate mean for each unique X value
means_model <- lm(y ~ factor(x), data = dat)

# Compare the linear model against the means model
anova(linear_model, means_model)

# Alternatively, use Type I sums of squares
anova(lm(y ~ x + factor(x), data = dat))

# 3. Confidence and prediction intervals ---------------------------------

# Values of X at which we want intervals
new_data <- data.frame(
  x = seq(min(x), max(x), length.out = 100)
)

# Confidence interval for the mean response
mean_ci <- predict(
  linear_model,
  newdata = new_data,
  interval = "confidence"
)

# Prediction interval for individual observations
prediction_ci <- predict(
  linear_model,
  newdata = new_data,
  interval = "prediction"
)

# Plot fitted line and intervals
plot(y ~ x, data = dat,
     pch = 19,
     main = "Regression with Confidence and Prediction Intervals",
     xlab = "X",
     ylab = "Y")

# Mean confidence interval
matlines(new_data$x, mean_ci,
         col = "blue",
         lty = c(1, 2, 2),
         lwd = 2)

# Individual prediction interval
matlines(new_data$x, prediction_ci,
         col = "red",
         lty = c(1, 3, 3),
         lwd = 2)

legend("topleft",
       legend = c("Fitted line",
                  "95% Confidence interval",
                  "95% Prediction interval"),
       col = c("blue", "blue", "red"),
       lty = c(1, 2, 3),
       lwd = 2)
