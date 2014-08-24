## R Code for Programming Assignment 2 in 
## Coursera R Programming course

## These functions are supposed to manage a matrix and allow
## the inversion of the matrix to be cached and subsequently
## retrieved (if the matrix has not been modified since the cache)

## makeCacheMatrix: create a matrix-like object that
## supports various getters and setters as well caching the inversion
## Like the sample vector code, makeCacheMatrix returns a list of functions that
## 1. set the value of the matrix
## 2. get the value of the matrix
## 3. set the value of the inverse 
## 4. get the value of the inverse
makeCacheMatrix <- function(x = matrix()) {
  
  ## the cache for the inverse
  inv <- NULL
  
  ## a setter for the matrix, so unset the inverse cache
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  
  ## simple getter of the underlying matrix
  get <- function() x
  
  ## set the cached inverse; should only be used by cacheSolve
  setinv <- function(inverse) inv <<- inverse
  
  ## getter for the cached inverse; 
  getinv <- function() inv
  
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)
}


## cacheSolve: given a matrix, return the inverse utilizing the
## cache if it exists; or compute (and cache) if it doesn't exist
## ASSUME: given matrix x is a cacheMatrix

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  if ( is.null(x$get()) ){
    NULL
  } else if ( !is.null(x$getinv()) ){
    x$getinv()
  } else {
    x$setinv(solve(x$get())) # cache the solution
    x$getinv()
  }
}
