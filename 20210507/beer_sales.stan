//
// This Stan program defines a simple model, with a
// vector of values 'y' modeled as normally distributed
// with mean 'mu' and standard deviation 'sigma'.
//
// Learn more about model development with Stan at:
//
//    http://mc-stan.org/users/interfaces/rstan.html
//    https://github.com/stan-dev/rstan/wiki/RStan-Getting-Started
//

data {
  int N;                //サンプルサイズ
  vector[N] sales;      //データ
}

parameters {
  real mu;               //平均のパラメータ
  real<lower=0> sigma;   //標準偏差のパラメータ
}

model {
  for (i in 1:N) {
    sales[i] ~ normal(mu,sigma);
  }           // salesのi番目の値が平均mu,標準偏差sigamの正規分布から得られた
}



