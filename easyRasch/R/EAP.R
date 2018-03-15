#' Calculate the expected a posteriori value for theta
#'
#' return the esimtated value of theta
#' 
#' @param theta 
#' @param lower the lower limit of integration
#' @param upper the upper limit of integration
#' 
#' @return A single numeric value that is the negative LL
#' @author Lim
#' 
#' @rdname EAP
#' @export
setGeneric(name = "EAP",  #I set default value in here
           def = function(raschObj=new("Rasch", name=c("Lim"),a=c(sample(1:10,100,replace = T)), 
                          y=c(sample(0:1,100,replace = T))),
                          lower=-6,upper=6,theta=1) {
             standardGeneric("EAP")
           })
#' @export
setMethod(f="EAP",
          def=function(raschObj,lower=-6,upper=6,theta=1) {

            #making function f and g to put in integrate function later
            #In here, theta and alt_theta is different because theta is the value that we have and want
            #to find EAP and alt_theta is other potential thetas. We change alt_theta in here to find
            #distribution of theta from possible resampling. (my understanding is very limited...)
            f<-function(alt_theta) {Likelihood(raschObj,theta=alt_theta)*Prior(theta=alt_theta)}
            g<-function(alt_theta) {theta*Likelihood(raschObj,theta=alt_theta)*Prior(theta=alt_theta)}
            
            #Feed f and g inside of integrate.
            denom<-integrate(f,upper=upper, lower=lower)$value
            nom<-integrate(g,upper=upper, lower=lower)$value
            thetahat<-nom/denom  #find theta hat
            return(thetahat)})

