#' calculate what is called the likelihood of a proposed value of ??_j
#'
#' return the likelihood from Equation
#' 
#' @param raschObj
#' @param theta 
#'
#' @return print the name of test taker and EAP value of theta
#' @author Lim
#' 
#' @rdname print
#' @export

#' @export
setMethod ("print","Rasch",
            function(x,...){
              print(list(x@name))
              
              
              }
            )
getClass ("Rasch")
