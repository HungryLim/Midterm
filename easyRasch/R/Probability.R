#' calculating Probability of getting right and wrong by Rasch model
#'
#' return A vector of length n that represents Pij for each question and
#' A vector of length n that represents Pij.
#'
#' @param raschObj A numeric value of Rasch values including a and y.
#' @param theta A numeric vector containing my poisson data
#'
#' @return  A vector of length n that represents Pij for each question and
#'          A vector of length n that represents Pij
#' @author Lim
#' 
#' @rdname Probability
#' @export
setGeneric(name = "Probability",
           def = function(raschObj=new("Rasch", name=c("Lim"),a=c(sample(1:10,100,replace = T)), 
                                       y=c(sample(0:1,100,replace = T))), theta=1) {
             standardGeneric("Probability")
           })
#' @export
setMethod(f="Probability",
          def=function(raschObj,theta){

            a<-raschObj@a
            y<-raschObj@y
            
            p<-matrix(NA,nrow=length(y))
            q<-matrix(NA,nrow=length(y))
            pq<-matrix(NA,nrow=length(y))
            for (i in 1:length(y)){
              p[i]<-exp(theta-a[i])/(1+exp(theta-a[i]))
              q[i]<-1-p[i] 
            }
            for (i in 1:length(y)){
              if(y[i]==1){
                pq[i]<-p[i]}
              else{pq[i]<-q[i]}
            }
            
            output <- list(p, pq)
            names(output) <- c("n", "PQ")
            return(output)})
