#' calculating prior value for Bayesian framework
#'
#' return the height of the specified normal curve evaluated at ??_j
#' 
#' @param theta A proposed value of ??_j
#'
#' @return A single numeric value that is return the height of the specified normal curve evaluated at ??_j
#' @author Lim
#' 
#' @rdname Prior
#' @export
setGeneric(name = "Prior",
           def = function(theta=1) {
             standardGeneric("Prior")
           })
#' @export
setMethod(f="Prior",
          def=function(theta){
            height<-dnorm(theta, mean = 0, sd = 3)
            return(height)}
          )
