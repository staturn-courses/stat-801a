# Read in data
welch_data <- read.csv('notes/data/welch-t-test.csv')

# Test
# H0: µ1 - µ2 = 0
# HA: µ1 - µ2 ≠ 0
# alpha = 0.05

# Extract values from groups for easier calculations
a <- welch_data$response[welch_data$group=='a']
b <- welch_data$response[welch_data$group=='b']

# Explore the data
qqnorm(a); qqline(a)
qqnorm(b); qqline(b)

print(data.frame(
  sd_a=sd(a), sd_b=sd(b)
))

library(ggplot2)
ggplot(welch_data, mapping = aes(x = group, y = response)) + 
  geom_boxplot(fill = '#1a80bb', color = 'black') + 
  theme_bw()

# Shared values
ybar_a <- mean(a)
ybar_b <- mean(b)
sd_a <- sd(a)
sd_b <- sd(b)
n_a <- length(a)
n_b <- length(b)
alpha <- 0.05

# Two-sample t-test (equal variance assumption)

sp <- sqrt(((n_a-1)*sd_a^2+(n_b-1)*sd_b^2) / (n_a+n_b-2))
se <- sp*sqrt((1/n_a + 1/n_b))
t_df <- n_a+n_b-2

t_c <- (ybar_a-ybar_b)/se
p_val <- 2*pt(abs(t_c), df=t_df, lower.tail = F)
ci <- ybar_a-ybar_b + c(-1,1)*qt(1-alpha/2, df=t_df)*se

print(data.frame(
  t=t_c, df=t_df, p_value=p_val, lcl=ci[1], ucl=ci[2]
))

t.test(a,b, var.equal = T)

# Welch's t-test (unequal variance assumption)
w_se <- sqrt(sd_a^2/n_a + sd_b^2/n_b)

w_t_c <- (ybar_a-ybar_b)/w_se

w_c <- (sd_a^2/n_a)/(sd_a^2/n_a + sd_b^2/n_b)
w_df <- ((n_a-1)*(n_b-1)) / ((n_b-1)*w_c^2+(1-w_c)^2*(n_a-1))

w_p_val <- 2*pt(abs(w_t_c), df=w_df, lower.tail = F)
w_ci <- ybar_a-ybar_b + c(-1,1)*qt(1-alpha/2, df=w_df)*w_se

print(data.frame(
  t=w_t_c, df=w_df, p_value=w_p_val, lcl=w_ci[1], ucl=w_ci[2]
))

t.test(a,b, var.equal=F)
