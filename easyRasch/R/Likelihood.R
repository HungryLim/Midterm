#' calculate what is called the likelihood of a proposed value of theta
#'
#' return the likelihood from Equation
#' 
#' @param raschObj Rasche value
#' @param theta given theta, student's ability
#'
#' @return A single numeric value that is return the likelihood
#' @author Lim
#' 
#' @rdname Likelihood
#' @export
setGeneric(name = "Likelihood",  #I set default value in here
           def = function(raschObj=new("Rasch", name=c("Lim"),a=c(sample(1:10,100,replace = T)), 
                                       y=c(sample(0:1,100,replace = T))),theta=1) {
             standardGeneric("Likelihood")
           })
#' @export
setMethod(f="Likelihood",
          def=function(raschObj,theta){
           out<-Probability(raschObj,theta) 
           pq<-out$PQ
           likelihood<-prod(pq)
 
            return(likelihood) 
          })