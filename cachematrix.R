## Hello, the following functions allow you to access and calculate 
## the inverse of a user-defined matrix.

## this function allows you to store or access a matrix (invertible); 
## as well as accessing its inverse, if it has been calculated.

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setinver <- function(inver) m <<- inver
        getinver <- function() m
        list(set = set, get = get,
             setinver = setinver,
             getinver = getinver)
}


## The following function allows to calculate or access the inverse of a
## matrix (invertible) stored in the previous function.

cacheSolve <- function(x, ...) {
        m <- x$getinver()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setinver(m)
        m
}
