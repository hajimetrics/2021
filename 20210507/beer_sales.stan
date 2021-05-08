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
  int N;                //�T���v���T�C�Y
  vector[N] sales;      //�f�[�^
}

parameters {
  real mu;               //���ς̃p�����[�^
  real<lower=0> sigma;   //�W���΍��̃p�����[�^
}

model {
  for (i in 1:N) {
    sales[i] ~ normal(mu,sigma);
  }           // sales��i�Ԗڂ̒l������mu,�W���΍�sigam�̐��K���z���瓾��ꂽ
}



