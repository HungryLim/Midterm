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

########################################################
#basic function #after run package.skeleton, delete this part including package.skeleton()
poisson.lik<-function(lambda,y){
  n<-length(y)
  logl<-sum(y)*log(lambda)-n*lambda
  return(-logl)
}
package.skeleton()
################################delete above here after run skeleton

#an example
y<-c(3,3,3,3,2)
lambda<-3
poisson.lik(y=y,lambda = lambda)
new("Poisson")
