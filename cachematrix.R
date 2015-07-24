#GENERAL USE INSTRUCTIONS"
#How to use this code: a) define and assign a matrix to a variable ´t
# b) Create object ´a´ this way:  a<-makeCacheMatrix(´t)
# c) invoke c<-cacheSolve(a)
# d) See result: print c and you´ll get it
# e) If you invoke again c<-cacheSolve(a), since the result is already in the cache,
#   you will get a message telling you so (hence the mean won´t be recalculated. The)
#   existing result will be used


#DETAILED CODE EXPLANATION"
# To use code an object must be created by invoking the makeCacheMatrix function.
# For example, "a<- makeCacheMatrix(x)" creates an 'a' object, which will be ready
# to use the subfunctions of the main function makeCacheMatrix.
# Then, let´s create the main function, makeCacheMatrix:
makeCacheMatrix <- function(x = matrix()) {
# The following "Set" function is used to load a new input matrix. 'y' is the input matrix,
# that substitutes the matrix x as input in the main main function. The process
#also includes setting an older inverted matrix "m" to Null.
   m<-NULL
  set<-function(y){
  x<<-y
  m<<-NULL
}
# The following "get" function is used to load new data (i.e. a new input matrix)
# into the created "a" object.  
get<-function() x
# 'setmatrix' and 'getmatrix' are subfunctions that store the value of the input
# in an 'm' variable within the main function (setmatrix) and return it (getmatrix)
setmatrix<-function(solve) m<<- solve
getmatrix<-function() m
# The upcoming 'list' stores the four abovementioned functions together, so that
# an object like the example 'a' mentioned will inherit all these four functions:
# set, get, setmatrix, getmatrix
list(set=set, get=get,
   setmatrix=setmatrix,
   getmatrix=getmatrix)
}

# The cacheSolve function should be invoked with the object created with the 
# main function ('makeCacheMatrix') as input.
cacheSolve <- function(x=matrix(), ...){
  # Following code retrieves 'm' with the getmatrix function of the main function
  #to see if there already exists a value for it. If this query is true, it will
  #indicate so with a message and will return the value already stored in the
  #memory, without recalculating it.
    m<-x$getmatrix()
    if(!is.null(m)){
      message("getting cached data")
      return(m)
    }
  #"Should the previous conditional test fail, the input matrix is obtained, inverted,  
  # and stored in setmatrix.
    datos<-x$get()
    m<-solve(datos, ...)
    x$setmatrix(m)
    m
}


