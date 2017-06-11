library(deSolve)

#logistic model for seeing population changes over time

LogisticGrowth = function(t,y,parms) {
  N = y;
  dN = parms[1]*N*(1-N/parms[2]);
  return(list(dN));
}

x0 = 10; #initial condition
r = 1; #growth rate
k = 100; #carrying capacity
times = seq(0,10, by = .1) #vector of time values

out = lsoda(x0, times, LogisticGrowth, parms = c(r,k))

#predator prey model

LotkaVolteraPredPrey = function (t,y,parms){
  h = y[1]; p = y[2]
  dh = parms[1]*h = parms[2]*h*p
  dp = -parms[3]*p + parms[4]*h*p
  return(list(c(dh,dp)))
}

#Exercise 1.1
# 1.1 a) 

x0 = c(2,2)
h = 2
p = 2
r = 1
c = 1
m = 5
a = 0.5

LotkaVolteraPredPrey = function (t,y,parms){
  h = y[1]; p = y[2]
  #r = parms[1] - .1*t #population decline through time by .1
  #r = parms[1] + .1*sin(t)  sin = eg. seasonal oscillation between -1 and 1
  dh = parms[1]*h - parms[2]*h*p
  dp = -parms[3]*p + parms[4]*h*p
  return(list(c(dh,dp)))
}

out2 = lsoda(x0, times, LotkaVolteraPredPrey, parms = c(r, c, m, a))

out2

# 1.1 b)
out2[ ,3]
plt_pred = plot(out2[ ,3], type = "l", col="red")

#1.1 c) 
out2[ ,2]
plt_prey = plot(out2[ ,2], type = "l", col="blue")

plt_pred

#plot prey and predator pop
par(mar = c(5,5,2,5)) #create plotting frame
plot(out2[,1],out2[,3], type = "l",col = "red",bty="U",ylab="Predator",xlab="Time") #create first plot
par(new = T) #stop graph from overwriting itself
plot(out2[,1],out2[,2], type ="l",col="blue",axes=F,ylab=NA,xlab=NA)
axis(side=4) #put axis of second plot on right side
mtext(side=4,cex=0.7,line=3, "Prey")

#can also do this using line function ploting pop size of prey and predator on same axis 0 - 30