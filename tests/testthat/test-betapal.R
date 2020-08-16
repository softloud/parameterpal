expected_value <- 0.3
this_much <- 0.9
within <- 0.2

test_that("betapal produces list", {
  expect_type(beta_pal(expected_value, this_much, within), "list")
})


test_that("betapal gets correct answers", {
  betapars <- beta_pal(expected_value, this_much, within)

  approx_mean <- rbeta(1e5, betapars[[1]], betapars[[2]]) %>% mean()

  approx_mass <- pbeta(q = 0.5, betapars[[1]], betapars[[2]]) - pbeta(q = 0.1, betapars[[1]], betapars[[2]])

  expect_true(
    abs(approx_mean - expected_value) < 0.2
    )

  expect_true(
    abs(approx_mass - this_much) < 0.2
    )


  })
