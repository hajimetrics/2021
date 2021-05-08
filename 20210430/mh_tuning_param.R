library(ggplot2)

# data
d <- c(2.4,3.2,2.2,4.6,3.3)

# likelihood function
likelihood <- function(theta) {
  l <-  1
  for (i in d) {
    l <- l * (1 / sqrt(2*pi)) * exp(-(i - theta)^2 / 2)
  }
  return (l)
}

# prior probability density function
prior <- function(theta) {
  return ( (1 / sqrt(20000*pi))^5 * exp(-(theta^2 / 20000)) )
}

# kernel function (simply likelihood * prior)
kernel <- function(theta) {
  return ( likelihood(theta) * prior(theta) )
}

# set random seed
set.seed(1)

# prepare empty random variable list
rand_list <- c()
accepted <- c()

# generate initial random variable
theta_rand_1 <- runif(1, min = -2, max = 2)

rand_list <- c(rand_list, theta_rand_1) # append to `rand_list` 

############## Tuning Parameter
sigma <- 1

for (i in 1:1999) {
  # suggest a candidate random variable
  last_rand <- rand_list[length(rand_list)]
  theta_rand_cand <- last_rand + rnorm(1, 0, sigma)
  
  # compare: calculate rate with kernel()
  rate <- kernel(theta_rand_cand) / kernel(last_rand)
  
  # evaluate candidate
  if (rate > 1) {
    # rate > 1: accept candidate as true random variable
    rand_list <- c(rand_list, theta_rand_cand)
    accepted <- c(accepted, TRUE)
  } else {
    # rate < 1: 
    # Bernoulli random variable
    a <- sample(x = c(1, 0),
                size = 1,
                replace = TRUE,
                prob = c(rate, 1-rate)
    )
    
    if (a == 1) {
      # accept candidate with probability of `rate`
      rand_list <- c(rand_list, theta_rand_cand)
      accepted <- c(accepted, TRUE)
    } else {
      # otherwise, reject candidate and accept the last random variable
      rand_list <- c(rand_list, last_rand)
      accepted <- c(accepted, FALSE)
    }
  }
}

# rand_list

df <- data.frame(iter = c(1:length(rand_list)),
                 theta_rand = rand_list)

ggplot(df, aes(iter, theta_rand)) + geom_point() + geom_step() + ggtitle("MH Random Variable Generation: 2000 iter")

# Acceptance rate
accept_rate <- mean(accepted)
print(accept_rate)

# mean of random samples
mean(rand_list[-(1:1000)])