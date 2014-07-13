## makeCacheMatrix is a function which creates a special 'matrix' object that can cache its inverse.  
## It creates a list of items that are of the new class 'makeCacheMatrix
## cacheSolve computes the inverse of the matrix from makeCacheMatrix and returns it to you.
## If the matrix has already been computed it accesses it from the cache.



makeCacheMatrix <- function(x = matrix()) {   ## x should be a matrix as default
  m <- NULL  
  set <- function(y) {
    x <<- y
    m <<- NULL                  ## sets m back to null, just in case you had already used these functions
  }                           ##  Sets x, but outside of just the function
  get <- function() x
  setmatrix <- function(matrix) m <<- matrix   ## sets m instead of NUll
  getmatrix <- function() m               
  list(set = set, get = get,
       setmatrix = setmatrix,
       getmatrix = getmatrix)
}         ## the vector you create isn't a vector, its a list of 4 things, of the class 'makeMatrix' or whatever




cacheSolve <- function(x, ...) {    
  m <- x$getmatrix()
  if(!is.null(m)) {
    message("getting cached inversed matrix")
    return(m)
  }
  data <- x$get()                  ## gets the data from the first function
  m <- solve(data, ...)             ## figures out the inverse of that matrix   
  x$setmatrix(m)                     ## stores the inverted matrix in the global environment
  m                               ##prints the inverted matrix
}