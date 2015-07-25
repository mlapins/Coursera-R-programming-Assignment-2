## ****************************************************************************
# Overview

# The benefits of lexical scoping/scoping rules is that functions can be written  to avoid repeatedly 
# computing the same data element(s). It creates efficiencies in the code, but also on system performance.

# The following pair of functions aim to do this setting an inverse of a matrix and checking
# if the inverse has been set each time the code is run. If it has, then retrieve the inversed matrix from
# cache rather than computing it again.


x <- matrix(rnorm(16, 20, 1), 4) # Create 4 x4 square matrix with random numbers
                                 # With mean 20 and one standard deviation
                                 # Pass this into the function makeCacheMatrix()

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
    
    
    #Declaration of functions to make them availabe to other functions
    #The first element is the method name that is used to access the function
    list(setmatrix=set, getmatrix=get, setinverse=setinverse, getinverse=getinverse)
}





cacheSolve <- function(x, ...) {
   
}

rm(list = ls())

