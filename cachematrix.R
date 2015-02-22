## The first function creates a special "matrix" object that can cache its inverse.
## The second function computes the inverse of the special "matrix" returned by makeCacheMatrix.
## but if the inverse has already been calculated (and the matrix has not changed.), 
##the cachSolve function should retrieve the inverse from the cache  

## This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = numeric) {
  i <- NULL
  
  set <- function(y) {    ## set the value of the matrix
 
    x <- diag
    x <<- data.matrix(x)
    i <<- NULL
  }
  
  get <- function() x
  
  setinv <- function(solve) i <<- solve(x)
  getinv <- function() i
  
 
}

## This function computes the inverse of the special "matrix" returned by makeCacheMatrix.

cacheSolve <- function(x, ...) {
## Return a matrix that is the inverse of 'x'
  m <- getinv()
  
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }

  data <- get()
   
  m <- solve(x, ...)
  
  setinv(m)
  
  m
    
}
