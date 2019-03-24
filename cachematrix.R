# We first set the function makeCacheMatrix, then we create the function
#cacheSolve.
#
#


# 1 set the value of the vector
# 2 get the value of the vector
# 3 set the value of the mean
# 4 get the value of the mean

makeCacheMatrix <- function(x = matrix()) {
  invmatrix <- NULL
  set <- function(y) {
    x <<- y
    invmatrix <<- NULL
  }
  get <- function() x
  setinverse <- function(solve) invmatrix <<- solve
  getinverse <- function() invmatrix
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


##CacheSolve returns the inverse of a matrix that is the inverse of "x"
#First, we check if the inverse has already been calculated. If so, we take the 
# the inverse of the cache and skips the computation. 
#Otherwise, it computates the inverse (invmatrix) of the 
# the data, and sets the value of the mean in the cache by using setmean

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    
    invmatrix <- x$getinverse()
    if(!is.null(invmatrix)) {
      message("getting cached data")
      return(invmatrix)
    }
    data <- x$get()
    invmatrix <- solve(data)
    x$setinverse(invmatrix)
    invmatrix
  }

