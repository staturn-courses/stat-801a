# Packages
library(mvtnorm)
library(tidyverse)
set.seed(801)

# R
R   <- matrix(c(1.0, 0.5, 0.5,
                0.5, 1.0, 0.7,
                0.5, 0.7, 1.0), nrow = 3, byrow = TRUE)

# iCBT
means1 <- c(55.01, 27.88, 22.85)
sds1 <- c(21.58, 20.84, 19.26)
Sigma1 <- diag(sds1) %*% R %*% diag(sds1)

icbt <- round(rmvnorm(1000, mean=means1, sigma=Sigma1),0)
icbt_valid <- icbt[apply(icbt>=0 & icbt <= 100, 1, all),]
icbt_sample <- icbt_valid[sample(1:nrow(icbt_valid), size=46),]


# F2F
means2 <- c(56.57, 34.88, 32.51)
sds2 <- c(20.61, 24.91, 23.28)
Sigma2 <- diag(sds2) %*% R %*% diag(sds2)

f2f <- round(rmvnorm(1000, mean=means2, sigma=Sigma2),0)
f2f_valid <- f2f[apply(f2f>=0 & f2f <= 100, 1, all),]
f2f_sample <- f2f_valid[sample(1:nrow(f2f_valid), size=46),]

# Combine data
lost1 <- sample(1:46, size=(46-37))
lost2 <- sample(47:(46*2), size=(46-37))

dat <- data.frame(
  id = 1:(46*2),
  group = rep(c('iCBT', 'F2F'), each = 46),
  rbind(icbt_sample, f2f_sample)
)

dat$X3[c(lost1,lost2)] <- NA
colnames(dat) <- c('id', 'group', 'T0', 'T1', 'T2')


write.csv(dat, 'projects/midterm/responses-tfi.csv', row.names = F)

