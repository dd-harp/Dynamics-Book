
xiF.0 = function(x, k1=.1){ 
  diff(pbeta(c(0:9)/9, 1-exp(-k1*x), exp(-k1*x))) 
}

par(mfrow = c(3,3))
for(i in 1:9)
  plot(xiF.0(3*i), type = "l")

alpha = 0.2
v1=v2=0
vt1=vt2=c()
mu1=0.01
mu2=0.01
tt= 1:3000
for(i in tt){
  v1 = mu1*alpha + (1-mu1)*v1
  v2 = mu2*alpha + (1-mu2)*v2
  vt1 = c(vt1, v1)
  vt2 = c(vt2, v2)
}
vXa1 = initCumV_1066.0(alpha, ageWeights, mu1)
#vXa2 = initCumV_1066.0(.2, ageWeights, .01)

plot(ages, vXa1, type = "l", xlim = c(0,15))
lines(tt/36.5, vt1)
lines(tt/36.5, vt1*0 + alpha)

plot(tt/36.5, vt1/v2, type = "l", ylim = c(0,1), xlim = c(0,10))
lines(tt/36.5, vt2/v2, col = "red")

plot(tt/36.5, vt1/vt2, col = "purple", type = "l")

plot(tt/365, vt1/alpha, type = "l")


plot(ages, vXa/alpha, type = "l", xlim = c(0,10)) 
lines(tt/36.5, vt2/alpha)
lines(tt/36.5, vt1/alpha)

