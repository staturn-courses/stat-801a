# Load package
library(emmeans)

# Read in the data
data <- read.csv("notes/data/data_for_contrasts_mod.csv")

# Check number of each category
table(data$Condition)

# Fix missing value
data$Condition[70] <- "wheel"

# Visualize the responses
boxplot(Rating ~ Condition, data = data)

# Fit the model
fit <- aov(Rating ~ Condition, data = data)

# Get the ANOVA table
anova(fit)

# Obtain estimated marginal means
emm <- emmeans(fit, ~ Condition)

# Define planned contrasts
my_contrasts <- list(
  "Control vs. Agents" = c(4, -1, -1, -1, -1),
  "Biological vs. Chemical" = c(0, 1, 1, -1, -1),
  "Biological 1 vs. Biological 2" = c(0, 1, -1, 0, 0),
  "Chemical 1 vs. Chemical 2" = c(0, 0, 0, 1, -1)
)

# Conduct contrast tests
results <- contrast(emm, my_contrasts, adjust = "none")

# Display results
summary(results, infer = TRUE)
