expected_value <- 0.3
this_much <- 0.9
within <- 0.2

test_that("betapal produces list", {
  expect_type(beta_pal(expected_value, this_much, within), "list")
})
