
data {
  int<lower=0> N;
  vector[N] x;
  vector[N] y;
  
  int N_p;            //�\������f�[�^(x)�̐�
  vector[N_p] x_next; //�\���ɗp����x�̃x�N�g��
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
  //y�̗\���l
  for (i in 1:N_p){
    y_next_hat[i] = normal_rng(alpha + beta*x_next[i], sigma);
  }
  //Normal(alpha + beta*x_next, sigma)���痐���𔭐�
  //�����y�̗\���l�Ƃ���
}


