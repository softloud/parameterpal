expected_value <- 0.3
this_much <- 0.9
within <- 0.2

# should this be an S3 method

test_that("beta plot makes a plot", {
  expect_s3_class(beta_plot(expected_value, this_much, within))
})
