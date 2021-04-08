data {
  int ndet;
  vector[ndet] xobs;
  vector[ndet] sigma_xobs;
}

parameters {
  real mu;  
  real<lower=0> sigma;
  vector[ndet] unit;
}

transformed parameters {
  vector[ndet] xtrue;
  xtrue = mu+sigma*unit;
}

model {
  unit ~ normal(0,1);
  xobs ~ normal(xtrue, sigma_xobs);
}
