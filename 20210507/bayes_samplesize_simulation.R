
ss <- 100


x_obs <- runif(ss,-10,10)
y_obs <- 6 + 2*x_obs + rnorm(ss,0,3)
d <- data.frame(x=x_obs,y=y_obs)
head(d)

library(brms)

df <- data.frame(x_obs,y_obs)

simple_lm_brms <- brm(
  formula = y_obs~x_obs,
  family = gaussian(link="identity"),  #Šú‘Ò’l‚Íalpha+beta*x,Œë·€‚Í³‹K•ª•z
  data = df,
  seed=1
)

plot(simple_lm_brms)


#
ss <- 10000


x_obs <- runif(ss,-10,10)
y_obs <- 6 + 2*x_obs + rnorm(ss,0,3)
d <- data.frame(x=x_obs,y=y_obs)
head(d)
library(brms)

df <- data.frame(x_obs,y_obs)

simple_lm_brms_10000 <- brm(
  formula = y_obs~x_obs,
  family = gaussian(link="identity"),  #Šú‘Ò’l‚Íalpha+beta*x,Œë·€‚Í³‹K•ª•z
  data = df,
  seed=1
)

plot(simple_lm_brms_10000)




