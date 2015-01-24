## Script Name: cachematrix.R
## Description: 
## The script takes a square invertible matrix as its argument. It checks to see 
## if the inverse of the matrix has already been calculated. If so, it gets the
## inverse matrix from the cache and skips the calculation. Otherwise, it 
## calculates the inverse of the matrix and sets the value of the inverse in
## the cache.


## The first function (makeCacheMatrix) makes an object that sets the value
## of the matrix, gets the value of the matrix, sets the value of and gets the value of 
## the inverse of the matrix passed in the argument of this first function.

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y){
    x<<-y
    m<<- NULL
  }
 get <- function() x
 setsolve <- function(solve) m <<- solve
 getsolve <- function(solve) m
 list(set = set, get = get, 
      setsolve = setsolve,
      getsolve = getsolve)

}

## The second function (cacheSolve) checks to see if the inverse has 
## already been calculated. If so, it gets the inverse matrix from the cache 
## from the first function above. Otherwise, it uses the solve function in R 
## to calculate the inverse of the matrix and sets the value of the inverse
## to the cache in the first function.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
     m <- x$getsolve()
     if(!is.null(m)){
       message("getting cached data")
       return(m)
     }
     data <- x$get()
     m <- solve(data, ...)
     x$setsolve(m)
     m
}