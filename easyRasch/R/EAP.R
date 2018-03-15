#' Calculate the expected a posteriori value for ??j
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
setGeneric(name = "EAP",
           def = function(raschObj=new("Rasch", name=c("Lim"),a=c(sample(1:10,100,replace = T)), 
                          y=c(sample(0:1,100,replace = T))),
                          lower=-6,upper=6,theta=1) {
             standardGeneric("EAP")
           })
#' @export
setMethod(f="EAP",
          def=function(raschObj,lower=-6,upper=6,theta=1) {

        
            f<-function(alt_theta) {Likelihood(raschObj,theta=alt_theta)*Prior(theta=alt_theta)}
            g<-function(alt_theta) {theta*Likelihood(raschObj,theta=alt_theta)*Prior(theta=alt_theta)}
         
            denom<-integrate(f,upper=upper, lower=lower)$value
            nom<-integrate(g,upper=upper, lower=lower)$value
            thetahat<-nom/denom
            return(thetahat)})

