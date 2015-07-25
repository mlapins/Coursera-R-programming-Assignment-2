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

makeCacheMatrix <- function(x = matrix()) {
   
}




cacheSolve <- function(x, ...) {
   
}

rm(list = ls())

