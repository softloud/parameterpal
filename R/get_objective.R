#' Objective function
#'
#' Function that takes desrired mean, distance, and probability, and outputs
#'  another function to be optimized. Adapted into [beta_pal].
#'
#' This solution coded by by this most helpful
#' [gist](https://gist.github.com/daob/1422e978ff98bdf466fbcb4d9bf3e53e).
#'
#'
#' @param desired_mean expected_value.
#' @param desired_dist within.
#' @param desired_mass this_much.
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
