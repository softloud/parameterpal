#' Beta parameters from interpretable conditions
#'
#' Rather than knowing intrinsically what parameters are required for a
#' distribution, scientists tend to have a sense of what value they
#' *expect* a measure to take, *how much* they expect observations to fall
#' *within* a certain distance of that value.
#'
#' Visualise the distribution with [beta_plot].
#' See `vignette("beta_pal")` for derivations and more information.
#'
#' @param expected_value Expected value of beta distrbution from \[0,1\].
#' @param this_much What proportion falls `within` the specified interval.
#' @param within Specify distance `this_much` falls within.
#'
#' @return List of parameters appropriate for [rbeta] family of functions.
#'
#' @export

beta_pal <- function(expected_value, this_much, within) {

  # check inputs
  assertthat::assert_that(expected_value > 0 &
                             expected_value < 1,
                           msg = "expected_value must be from (0,1)")
  assertthat::assert_that(within > 0 &
                             within < 1,
                           msg = "within must be from (0,1)")
  assertthat::assert_that(
    this_much > 0 & this_much < 1,
    msg = "within expected_valuest be a value from [0,1].")


  # calculate beta distribution parameters
  gamma <- (1 - this_much)^-1

  shape1 <- expected_value * (
    (
      expected_value^2 * (1 / expected_value - 1)
    ) / (
      within^2 * (1 - this_much)
    ) - 1
  )

  shape2 <- shape1 / expected_value - shape1

  # return list of parameters
  return(list(shape1 = shape1,
              shape2 = shape2))
}
