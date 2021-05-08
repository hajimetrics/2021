
data {
  int<lower=0> N;
  vector[N] x;
  vector[N] y;
  
  int N_p;            //予測するデータ(x)の数
  vector[N_p] x_next; //予測に用いるxのベクトル
}


parameters {
  real alpha;
  real beta;
  real<lower=0> sigma;
}


model {
  y ~ normal(alpha + beta*x, sigma);
}

generated quantities{
  vector[N_p] y_next_hat; 
  //yの予測値
  for (i in 1:N_p){
    y_next_hat[i] = normal_rng(alpha + beta*x_next[i], sigma);
  }
  //Normal(alpha + beta*x_next, sigma)から乱数を発生
  //それをyの予測値とする
}


