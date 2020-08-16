#' Beta parameters from interpretable conditions
#'
#' Rather than knowing intrinsically what parameters are required for a
#' distribution, scientists tend to have a sense of what value they
#' *expect* a measure to take, *how much* they expect observations to fall
#' *within* a certain distance of that value.
#'
#' This solution coded by by this most helpful
#' [gist](https://gist.github.com/daob/1422e978ff98bdf466fbcb4d9bf3e53e).
#'
#' Visualise the distribution with [beta_plot].
#' See `vignette("beta_pal")` for derivations and more information.
#'
#' @param expected_value Expected value of beta distrbution from \[0,1\].
#' @param within Specify distance `this_much` falls within.
#' @param this_much What proportion falls `within` the specified interval.
#'
#' @return List of parameters appropriate for [rbeta] family of functions.
#'
#' @export

beta_pal <- function(expected_value,
                     within,
                     this_much) {
  # check inputs
  assertthat::assert_that(expected_value > 0 &
                            expected_value < 1,
                          msg = "expected_value must be from (0,1)")
  assertthat::assert_that(within > 0 &
                            within < 1,
                          msg = "within must be from (0,1)")
  assertthat::assert_that(this_much > 0 & this_much < 1,
                          msg =
                            "this_much must be a value from [0,1].")

  # Function that takes desrired mean, distance, and probability, and outputs
  #   another function to be optimized.
  my_objective <-
    get_objective(
      desired_mean = expected_value,
      desired_dist = within,
      desired_mass = this_much
    )

  res <-
    optim(1,
          my_objective,
          method = "Brent",
          lower = 1e-3,
          upper = 10)

  shape1_est <- res$par
  shape2_est <- shape1_est * ((1 / expected_value) - 1)

  list(shape1_est = shape1_est, shape2_est = shape2_est)
}
