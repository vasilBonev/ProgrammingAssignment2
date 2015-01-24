## Functions below are used to calculate the inverse of a given matrix x.
## Since matrix inversion is seen as costly computation there are benefits in caching the results
## instead of doing the calculation each and every time. The following two functions are used to calculate
## the inverse of a matrix
## makeCacheMatrix function should be called first prior to cacheSolve function

## This function is used to create a list of functino in order to do:
## 1. Initialize a variable m to store the inverse of matrix latter
## 2. Provide function get () to retrieve the raw matrix
## 3. Provides funntinos getinverse and setinverse which are used in order 
##    set the value of m to x (inverse of the matrix) and get the computed inverse of matrix x

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) m <<- inverse
  getinverse <- function() m
  # returns a R object which is a list of functions
  list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}


##  This function returns the inverse of the matrix. It first check if the inverse
## has already been calculated. If so it get the result and prints it, if not it computes
## it and sets the inverse in the cache

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse()
  if(!is.null(m)) {
    message("Cached matrix found.")
    return(inv)
  }
  else {
    message("No cached matrix found. Calculating inverse matrix...")
  data <- x$get()
  m <- solve(data)
  x$setinverse(m)
  m
}
}

