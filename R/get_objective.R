#' Objective function
#'
#' Function that takes desrired mean, distance, and probability, and outputs
#'  another function to be optimized.
#'
#' This function is called by [beta_pal] internally.

get_objective <- function(desired_mean, desired_dist, desired_mass) {
  # Return a function that can be passed to optim()
  function(shape1) {
    # Enforce desired mean:
    shape2 <- shape1 * ((1 / desired_mean) - 1)

    # Use R internals to get the definite integral:
    current_mass <- pbeta(q = desired_mean + desired_dist,
                          shape1 = shape1, shape2 = shape2) -
      pbeta(q = desired_mean - desired_dist,
            shape1 = shape1, shape2 = shape2)

    # Loss is squared difference between desired and obtained measure:
    (current_mass - desired_mass)^2
  }
}
