calO = calO_1066()
ages = ages_1066()
vecI = matrix(0,1,66)

PIT.wT = function(alpha, wT, vecI, calO, N=1){
  if(length(alpha)==1){
    alpha = rep(alpha, N)
  } else {
    N = length(alpha) 
  }
  mn = 0.00001 
  for(t in 1:N){
    vecI = pmax(vecI, mn)
    vecI = ((1 + w*alpha[t] - wT)*vecI*(1-vecI))%*% calO
  }
  return(vecI)
}

PIT.recent = function(alpha, wn, vecI, calO, N=1){
  if(length(alpha)==1){
    alpha = rep(alpha, N)
  } else {
    N = length(alpha) 
  }

  for(t in 1:N){
    vecI = (wn*vecI + w*alpha[t])%*%calO
  } 
  return(vecI)
}

tt = 1:200
alpha = tt/2000
alpha = c(alpha, rev(alpha))

alphaT_f = function(tmax, a=.5, b=10){ 
  tt = 1:tmax
  rbeta(tmax, a*(1+sin(2*pi*tt/36.5)), b)
}


alpha = alphaT_f(400)
alpha = c(rep(0.1, 200), rep(0,200))
plot(1:400, alpha, type = "l")

I2=0
vecI2 = I2
for(t in 1:400){
  I2 = .8*I2 + alpha[t]
  vecI2 = c(vecI2, I2)
}
I2.8 = vecI2

#plot(c(1:400)/36.5, vecI2[-1], type = "l", ylim = range(0, vecI2))
#lines(c(1:400)/36.5, alpha*max(vecI2)/max(alpha), col = "red")

ix = 200:250
plot((ix-200)*10/365, I2.95[ix], type = "l", ylim = range(I2.95))
lines((ix-200)*10/365, I2.9[ix]*max(I2.95)/max(I2.9))
lines((ix-200)*10/365, I2.85[ix]*max(I2.95)/max(I2.85))
lines((ix-200)*10/365, I2.8[ix]*max(I2.95)/max(I2.8))
