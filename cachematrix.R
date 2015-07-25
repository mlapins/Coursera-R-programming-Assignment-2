## ****************************************************************************
# Overview

# The benefits of lexical scoping/scoping rules is that functions can be written  to avoid repeatedly 
# computing the same data element(s). It creates efficiencies in the code, but also on system performance.

# The following pair of functions aim to do this setting an inverse of a matrix and checking
# if the inverse has been set each time the code is run. If it has, then retrieve the inversed matrix from
# cache rather than computing it again.


## Example data:

## x <- matrix(rnorm(16, 20, 1), 4)

## mc = makeCacheMatrix(x)

## mc$getgematrix()
##      [,1]     [,2]     [,3]     [,4]
## [1,] 19.54580 17.85507 21.75519 20.85551
## [2,] 20.44570 19.93038 20.12877 19.24436
## [3,] 18.67498 20.55098 20.19559 19.19340
## [4,] 19.73979 21.79584 20.73578 20.27783

## Cache not set when first running the function
## cacheSolve(mc)
##      [,1]       [,2]       [,3]       [,4]
## [1,] -0.1394439  0.9388163  0.1902846 -0.9687553
## [2,]  0.4198475 -7.2236340  0.5476559  6.2129511
## [3,]  0.6615009  5.6598126 -1.0219199 -5.2412085
## [4,] -0.8981584  0.3854057  0.3031381  0.2215028

## Retrieving from the cache
## cacheSolve(mc)
## ...getting cached data.
## [,1]       [,2]       [,3]       [,4]
## [1,] -0.1394439  0.9388163  0.1902846 -0.9687553
## [2,]  0.4198475 -7.2236340  0.5476559  6.2129511
## [3,]  0.6615009  5.6598126 -1.0219199 -5.2412085
## [4,] -0.8981584  0.3854057  0.3031381  0.2215028


## *****************************************************************************
## This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
    
    mtrx <- NULL #Set as null so can be used within function later
    
    # Take the matrix passed into makeCacheMatrix and assign a value to an object in an environment
    # that is different from the current environment through the <<- operator
    # This object will be referenced in the cacheSolve function below through the functions defined further below
    
    set <- function(y) {
        x <<- y
        mtrx <<- NULL
    }
    
    # The three functions below enables us to get the value of the matrix passed as an argument above
    # or provide the code to set and get the inverse values
    get <- function() x
    
    setinverse <- function(inverse) mtrx <<- inverse
    
    getinverse <- function() mtrx
    
    
    #Declaration of functions to make them availabe in cacheSolve()
    #The first element is the method name that is used to access the function
    list(setmatrix=set, getmatrix=get, setinverse=setinverse, getinverse=getinverse)
}



## ******************************************************************************
# The following function is where the computations are performed to check whether
# the matrix was inversed. If so, get it from cache, otherwise invert it.

cacheSolve <- function(x, ...) {
    
    mtrx <- x$getinverse()
    
    # Check if matrix was previously inversed and return if not null
    if(!is.null(mtrx)) {
        
        message("...getting cached data.")
        
        return(mtrx)
    }
    
    # If matrix not inversed, get the matrix
    data <- x$getmatrix()
    
    # Invert the matrix via Solve
    mtrx <- solve(data)
    
    # Call setinvese from makeCacheMatrix
    x$setinverse(mtrx)
    
    # Return the result to the console
    mtrx
}



