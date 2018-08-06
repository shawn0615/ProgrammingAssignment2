## This function creates a special "matrix" object that can cache its inverse.
## functions do

## This is a pair of functions that cache the inverse of a matrix.

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setInv <- function(inverse) i <<- inverse
  getInv <- function() i
  list(set = set, get = get,
       setinv = setInv,
       getInv = getInv)

}


## his function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
##If the inverse has already been calculated (and the matrix has not changed), then the 
##cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
   i <- x$getInv()
   if(!is.null(i)) {
      message("getting cached data")
      return(i)
  }
      data <- x$get()
      i <- solve(data, ...)
      x$setInv(i)
      return(i)
}
