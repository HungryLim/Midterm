#' Rasch model class
#' 
#' Object of class Rasch is from the input of the Rasch model
#' 
#' An object of the class `Rasch' has the following slots:
#' \itemize{
#' \item \code{name} The name of the test taker
#' \item \code{a} A vector of question-item parameters. Difficulty parameters
#' \item \code{y} A vector of answers for the respondent. Observed person's answers 
#' }
#'
#' @author Lim
#' @aliases Rasch-class initialize, Rasch model
#' @rdname Rasch
#' @export
setClass(Class="Rasch", 
         representation = representation(
           name = "character",
           a = "numeric",
           y = "numeric"
           
         ),
         prototype = prototype(
           name = c(),
           a =  c(),
           y =  c()
           
         )
)

#' @export
setMethod("initialize", "Rasch", 
          function(.Object,...){
            value=callNextMethod()
            return(value)
          }
) 

#' @export
setValidity("Rasch", function(object){
  test1<-(is.character(object@name))
  test2<-is.numeric(object@a)
  test3<-is.numeric(object@y)
  if(!test1 || !test2 || !test3){return("@Rasch is not a valid value")}
} )