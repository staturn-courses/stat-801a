# Read and explore data
my_data <- read.csv('https://staturn-courses.github.io/stat-801a/notes/data/fertilizer-experiment.csv')
with(my_data, boxplot(Yield ~ Treatment))

# Fit the model
fit <- aov(Yield ~ Treatment, data = my_data)
anova(fit)

# Get estimated marginal means
library(emmeans)
emm <- emmeans(fit, ~Treatment)
emm

# Contrasts
# 1. Fertilizer vs. no fertilizer
# 2. Nitrogen vs. organic 
# 3. Combination vs. Nitrogen
# 4. Combination vs. Organic
# 5. Combination vs. avg of Nitrogen + Organic
my_contrasts <- contrast(emm, list(
  'Fertilizer vs. no fertilizer' = c(1,-3,1,1)/3,
  'Nitrogen vs. Organic' = c(0, 0, 1, -1),
  'Combination vs. Nitrogen' = c(1,0,-1,0),
  'Combination vs. Organic' = c(1,0,0,-1),
  'Combination vs. N + O' = c(2,0,-1,-1)/2
))
summary(my_contrasts)
