## There is a functionality to be able to cache potentially time-consuming computations using R functions

## This function creates a special "matrix" object that can cache its inverse
##  makeCacheMatrix creates a special "vector", which is really a list containing a function to
##      set the value of the numeric matrix
##      get the value of the numeric matrix
##      set the inverse of the matrix
##      get the inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {

        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setInverse <- function(Inverse) m <<- Inverse
        getInverse <- function() m
        list(set = set, get = get,
             setInverse = setInverse,
             getInverse = getInverse)
        
}


## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
## If the inverse has already been calculated (and the matrix has not changed), 
## then the cachesolve should retrieve the inverse from the cache

## The following function calculates the inverse of the special "vector" created with the above function. 
## However, it first checks to see if the inverse has already been calculated. If so, it gets the inverse from the cache
## and skips the computation. Otherwise, it calculates the inverse of the data and sets the value of the inverse in the 
## cache via the setInverse function.

cacheSolve <- function(x, ...) 
        {
        
        m <- x$getInverse()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setInverse(m)
        m
        
        }
