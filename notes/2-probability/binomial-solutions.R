#| pi = 0.7
#| n = 30

# Set variables
pi <- 0.7
n <- 30

# P(Y = 15)
dbinom(x=15, size=n, prob=pi)

# P(Y ≥ 13)
pbinom(q=12, size=n, prob=pi, lower.tail=F)

1 - pbinom(q=12, size=n, prob=pi)

sum(dbinom(x=13:n, size=n, prob=pi))

# P(16 ≤ Y < 20)
sum(dbinom(x=16:19, size=n, prob=pi))

pbinom(q=19, size=n, prob=pi) -
  pbinom(q=15, size=n, prob=pi)

# P(16 < Y ≤ 20)
sum(dbinom(x=17:20, size=n, prob=pi))

pbinom(q=20, size=n, prob=pi) - 
  pbinom(q=16, size=n, prob=pi)
