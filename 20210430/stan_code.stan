// <Stan code>

// Stan documents
// https://mc-stan.org/users/documentation/

// The input data is a vector 'data_vec' of length 'N'.
// needed to be defined same name as R data list
data {
  int N;                  // sample size
  vector[N] data_vec;            // data (vector)
}


// The parameters accepted by the model. Our model
// accepts 1 parameter 'theta' (sigma = 1)
parameters {
  real theta;                // mean
}

// We model the output
model {
  // <set prior>
  theta ~ normal(0, 100);
  
  // <set likelihood>
  // we assume 'data_vec' as normally distributed with mean 'theta' and standard deviation 1.
  // for loop
  for (i in 1:N) {
    data_vec[i] ~ normal(theta, 1);
  }
  
  // vectorize
  // data_vec ~ normal(theta, 1);
}
