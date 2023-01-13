


rhatBmu = function(a, FoI, h, r=1/200, d=0, deltaW=0, Sw=0.05/365, D=20, liver=6, N=10000){
  W = Wda(a,FoI,h,r,d,deltaW)
  alpha = rhatx(a,FoI,h,r,d,alphamin=liver+1, N)
  xpB = Bmu(alpha, W, Sw, liver+1)
  rB = rlogB(N, xpB)
  list(alpha=alpha, Bm=xpB, B=rB) 
}

Wda = function(a, FoI, h=5/365,r=1/200,d=0, deltaW=0){
  ff = function(s, a, FoI, h, r, d, deltaW)  Xda(a-s,FoI,h,r,d)*exp(-deltaW*(a-s))
  integrate(ff,0,a,a=a,FoI=FoI,h=h,r=r,d=d,deltaW=deltaW)$value
}

sWda = function(a, FoI, h=5/365,r=1/200,d=0, deltaW=0){
  sapply(a, Wda, FoI=FoI,h=h,r=r,d=d,deltaW=deltaW)
}

Bmu = function(alpha, W=0, Sw =.05/365, D=20, liver=6, hatb=10.5, hatl=2, Sa = .005){
  B = hatl + pmax(0,(hatb-hatl)*exp(-(Sa*(alpha-D)+Sw*W))) 
  ix = which(alpha<=D)
  if(length(ix>0)) B[ix] = hatb*alpha[ix]/D *exp(-Sw*W)
  ix = which(alpha<=liver)
  if(length(ix>0)) B[ix] = sqrt(-1)
  B
}

sBmu = function(alpha, W=0, Sw =.05/365, D=20, liver=6, hatb=10.5, hatl=2, Sa = .005){
  sapply(alpha, Bmu, W=W, Sw=Sw, D=D,liver=liver,hatB=hatB, hatl=hatl, Sa=Sa)
} 

Balpha = function(a, FoI, h=5/365, r=1/200, d=0, deltaW=0, Sw =.05/365, D=20, liver=6, L=300){
  W = Wda(a,FoI,h,r,d,deltaW)
  Bmesh = seq(0,13, length.out=L)
  Ba = Bmesh*0
  alpha = (liver+1):a
  #pdf = sPDFx(alpha, a, FoI,h,r,d)
  cdf = sCDFx(alpha,a,FoI,h,r,d)
  cdf = cdf/sum(cdf)
  pdf = diff(c(0,cdf))
  Bm = Bmu(alpha, W, Sw=Sw, D=D, liver=liver)
  for(i in 1:length(alpha)){
    Ba = Ba + pdf[i]*dlogB(Bmesh,Bm[i])
  } 
  list(alpha=alpha, Bm=Bm, Bv=Bmesh, pdfB = Ba/sum(Ba), cdfB = cumsum(Ba)/sum(Ba)) 
}


verifyBmu = function(a, FoI, h, r=1/200, d=0, deltaW=0, Sw=0.05/365, D=20, liver=6, N=10000){
  
  rhbmu <- rhatBmu(a, FoI, h, r, d, deltaW, Sw, D, liver, N)
  
  Ba <- Balpha(a, FoI, h, r, d, deltaW, Sw, D, liver)
  hist(rhbmu$B, probability=T, breaks=bb, xlim = c(0,13))-> out
  lines(Ba$Bv, Ba$pdfB/max(Ba$pdfB)*max(out$density), col = "red") 
  
  plot(ecdf(rhbmu$B), xlim = c(0,13))
  lines(Ba$Bv, Ba$cdfB, col = "red", lwd=2, lty=2)
  plot(Ba$alpha, Ba$Bm, type = "l") 
}
par(mfrow = c(2,2))
verifyBmu(730, FoI3, 5/365)
