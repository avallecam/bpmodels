##' Density of the Borel distribution
##'
##' @param x vector of integers.
##' @param mu mu parameter.
##' @param log logical; if TRUE, probabilities p are given as log(p).
##' @return probability mass.
##' @author Sebastian Funk
dborel <- function(x, mu, log = FALSE) {
  if (x < 1) stop("'x' must be greater than 0")
  ld <- -mu * x + (x - 1) * log(mu * x) - lgamma(x + 1)
  if (!log) ld <- exp(ld)
  return(ld)
}

##' Generate random numbers from the Borel distribution
##'
##' Random numbers are generated by simulating from a Poisson branching process
##' @param n number of random variates to generate.
##' @param mu mu parameter.
##' @param infinite any number to treat as infinite; simulations will be stopped
##'     if this number is reached
##' @return vector of random numbers
##' @author Sebastian Funk
rborel <- function(n, mu, infinite = Inf) {
  chain_sim(n, "pois", "size", infinite = infinite, lambda = mu)
}
