#' Print 
#'
#' print the name of test taker and EAP value of theta
#' 
#' @param raschObj
#' @param theta 
#'
#' @return print the name of test taker and EAP value of theta
#' @author Lim
#' 
#' @rdname print
#' @export
setMethod ("print","Rasch",   #using signature to create print function for Rasch
            function(x,...){
              print(list(name=x@name,eap=EAP()))
              
              }
            )

