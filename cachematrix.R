## The function below is split into a main function(makeCacheMatrix) makes the cache function and 
##and a cache function(Cachesolve) that gets the data from makeCacheMatrix to test for cache
##and solve for the inverse

## main function to define getters and setters - assigning to function env

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y)
  {
    x <<- y
    m <<- NULL
    
  }
  get <- function() x
  setinverse <- function(inverse) m <<- inverse
  getinverse <- function () m
  list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
  
  
}


## Calling the getters and setters to test cache and calc inverse

cacheSolve <- function(x, ...) {
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
  m
}