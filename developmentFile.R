###
rm(list=ls())
library(devtools)
library(roxygen2)

#BUILD AND  check out the package
setwd("C:/Users/dell/Documents/GitHub/Midterm/")

dir()
current.code<-as.package("easyRasch")
load_all(current.code)
document(current.code)

check(current.code)
#install(pkg=current.code, local=TRUE)
#build(current.code, path=getwd())

# examples #test my functions
data<-new("Rasch", name=c("Lim"),a=c(sample(1:10,100,replace = T)), 
          y=c(sample(0:1,100,replace = T)))
theta=1

Probability(data,theta)
Likelihood(data,theta)
Prior(theta)
EAP(raschObj=data,lower=-6,upper=6)
print(data)

